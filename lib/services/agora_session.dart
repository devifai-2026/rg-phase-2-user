import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api/session_api.dart';

/// Thin wrapper around the Agora RTC engine for a single call/video session.
///
/// Recording is NOT a client concern — the backend's recordingService starts
/// Agora Cloud Recording on accept and stops it on end, saving the URL to the
/// session. This helper only joins/leaves the channel and exposes remote-user
/// + connection state for the UI.
///
/// If the backend runs Agora in MOCK mode (no app id/token), [join] is a no-op
/// and the session still works as a timed consultation (just no live media).
class AgoraSession {
  RtcEngine? _engine;
  bool _joined = false;
  bool get joined => _joined;

  int? remoteUid;
  bool muted = false;
  bool cameraOff = false;
  bool speakerOn = true; // audio routes to loudspeaker by default; toggle to earpiece

  final ValueNotifier<int?> remoteUidNotifier = ValueNotifier(null);
  final ValueNotifier<bool> connectedNotifier = ValueNotifier(false);
  // Surfaces a real, fatal Agora error (e.g. token rejected = err 110/109 when
  // the project is in Secured mode but we sent an empty token). The UI/caller
  // can show this instead of silently falling back to a media-less "mock" call.
  final ValueNotifier<String?> errorNotifier = ValueNotifier(null);

  RtcEngine? get engine => _engine;

  /// Initialise the engine, request perms, and join the channel. [video] enables
  /// the camera/video pipeline. Returns false if joining was skipped (mock mode).
  Future<bool> join(RtcToken token, {required bool video}) async {
    // Need at least an App ID to join. The token may be EMPTY when the Agora
    // project runs in "App ID only" mode — that's valid, we pass null as token.
    if (token.appId.isEmpty) return false;
    await [Permission.microphone, if (video) Permission.camera].request();

    final engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(
      appId: token.appId,
      // Communication profile: 1:1 consult where BOTH sides publish + subscribe.
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));
    _engine = engine;

    engine.registerEventHandler(RtcEngineEventHandler(
      onUserJoined: (conn, uid, elapsed) {
        remoteUid = uid;
        remoteUidNotifier.value = uid;
        debugPrint('[Agora] remote user joined uid=$uid');
        // Be explicit about subscribing to the peer (auto-subscribe is on, but
        // this guards against a project default that leaves us unsubscribed so
        // the timer runs yet no audio/video ever arrives).
        try { engine.muteRemoteAudioStream(uid: uid, mute: false); } catch (_) {}
        if (video) {
          try { engine.muteRemoteVideoStream(uid: uid, mute: false); } catch (_) {}
        }
      },
      onUserOffline: (conn, uid, reason) {
        if (remoteUid == uid) {
          remoteUid = null;
          remoteUidNotifier.value = null;
        }
      },
      onJoinChannelSuccess: (conn, elapsed) {
        _joined = true;
        connectedNotifier.value = true;
        debugPrint('[Agora] joined channel ${conn.channelId} as uid ${conn.localUid}');
      },
      // Surface failures so they're diagnosable AND visible. Token errors
      // (110 invalid, 109 expired, 8 invalid app/option) mean the join will
      // never carry media — record them so the call screen can warn the user
      // rather than silently showing a connected-but-silent call.
      onError: (err, msg) {
        debugPrint('[Agora] ERROR $err: $msg');
        if (err == ErrorCodeType.errTokenExpired ||
            err == ErrorCodeType.errInvalidToken ||
            err == ErrorCodeType.errInvalidAppId ||
            err == ErrorCodeType.errInvalidChannelName) {
          errorNotifier.value = 'Media connection failed ($err). '
              'Check the Agora App Certificate / security mode.';
        }
      },
      onConnectionStateChanged: (conn, state, reason) {
        debugPrint('[Agora] connection state=$state reason=$reason');
        // A token-driven failed connection is the silent killer of media.
        if (state == ConnectionStateType.connectionStateFailed &&
            reason == ConnectionChangedReasonType.connectionChangedInvalidToken) {
          errorNotifier.value = 'Media connection failed: invalid token. '
              'Check the Agora App Certificate / security mode.';
        }
      },
    ));

    await engine.enableAudio();
    // Optimise for a two-way voice/AV chat (default profile + scenario).
    try {
      await engine.setAudioProfile(
        profile: AudioProfileType.audioProfileDefault,
        scenario: AudioScenarioType.audioScenarioChatroom,
      );
    } catch (_) {}
    // setDefaultAudioRouteToSpeakerphone is safe pre-join; it just sets the
    // default route applied once we're in the channel.
    try { await engine.setDefaultAudioRouteToSpeakerphone(true); } catch (_) {}
    if (video) {
      await engine.enableVideo();
      await engine.startPreview();
    }
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.joinChannel(
      // Pass null (not '') in App-ID-only mode so the SDK doesn't treat an empty
      // string as a malformed token. A signed token is passed through as-is.
      token: token.token.isEmpty ? '' : token.token,
      channelId: token.channelName,
      uid: token.uid,
      // Explicitly PUBLISH mic (+ camera for video) and AUTO-SUBSCRIBE to the
      // other party's audio/video. Without these the peer joins but no media
      // flows (you hear/see nothing).
      options: ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
        channelProfile: ChannelProfileType.channelProfileCommunication,
        publishMicrophoneTrack: true,
        publishCameraTrack: video,
        autoSubscribeAudio: true,
        autoSubscribeVideo: video,
      ),
    );
    // Make sure we're not globally muting inbound streams (some builds default
    // these on), and crank inbound volume — belt-and-braces for "no voice".
    try { await engine.muteAllRemoteAudioStreams(false); } catch (_) {}
    if (video) { try { await engine.muteAllRemoteVideoStreams(false); } catch (_) {} }
    // setEnableSpeakerphone REQUIRES being in a channel — calling it before
    // joinChannel throws AgoraRtcException(-3) and aborts the whole join (which
    // was why no audio ever connected). Do it after join, and never let it abort.
    try { await engine.setEnableSpeakerphone(true); } catch (_) {}
    return true;
  }

  Future<void> toggleMute() async {
    muted = !muted;
    await _engine?.muteLocalAudioStream(muted);
  }

  Future<void> toggleCamera() async {
    cameraOff = !cameraOff;
    await _engine?.muteLocalVideoStream(cameraOff);
  }

  Future<void> switchCamera() async {
    try { await _engine?.switchCamera(); } catch (_) {}
  }

  /// Toggle between loudspeaker and earpiece (audio calls).
  Future<void> toggleSpeaker() async {
    speakerOn = !speakerOn;
    try { await _engine?.setEnableSpeakerphone(speakerOn); } catch (_) {}
  }

  Future<void> leave() async {
    try {
      await _engine?.leaveChannel();
      await _engine?.release();
    } catch (_) {}
    _engine = null;
    _joined = false;
    connectedNotifier.value = false;
    remoteUidNotifier.value = null;
  }

  void dispose() {
    remoteUidNotifier.dispose();
    connectedNotifier.dispose();
    errorNotifier.dispose();
  }
}
