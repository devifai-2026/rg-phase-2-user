import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';

import '../api/session_api.dart' show RtcToken;

/// Agora helper for a VIEWER in a live broadcast. Joins as AUDIENCE (subscribe
/// only — no camera/mic publish) in a live-broadcasting profile, and exposes the
/// broadcaster's uid so the UI can render their video.
///
/// No-op (returns false) when Agora runs in App-ID-only/mock mode with no app
/// id, so the room can still show a placeholder + the comments/poll/gift UI.
class AgoraAudience {
  RtcEngine? _engine;
  bool _joined = false;
  bool get joined => _joined;
  RtcEngine? get engine => _engine;

  /// The broadcaster's uid once they're publishing (null until then).
  final ValueNotifier<int?> broadcasterUid = ValueNotifier(null);
  final ValueNotifier<String?> errorNotifier = ValueNotifier(null);

  Future<bool> joinAsAudience(RtcToken token) async {
    if (token.appId.isEmpty) return false;

    final engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(
      appId: token.appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    _engine = engine;

    engine.registerEventHandler(RtcEngineEventHandler(
      onUserJoined: (conn, uid, elapsed) {
        // The broadcaster started publishing — render their stream.
        broadcasterUid.value = uid;
        try { engine.muteRemoteAudioStream(uid: uid, mute: false); } catch (_) {}
        try { engine.muteRemoteVideoStream(uid: uid, mute: false); } catch (_) {}
      },
      onUserOffline: (conn, uid, reason) {
        if (broadcasterUid.value == uid) broadcasterUid.value = null;
      },
      onJoinChannelSuccess: (conn, elapsed) {
        _joined = true;
        debugPrint('[AgoraAudience] joined ${conn.channelId} as audience');
      },
      onError: (err, msg) {
        debugPrint('[AgoraAudience] ERROR $err: $msg');
        if (err == ErrorCodeType.errTokenExpired ||
            err == ErrorCodeType.errInvalidToken ||
            err == ErrorCodeType.errInvalidAppId) {
          errorNotifier.value = 'Live media failed ($err).';
        }
      },
    ));

    await engine.enableVideo();
    await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
    await engine.joinChannel(
      token: token.token,
      channelId: token.channelName,
      uid: token.uid,
      options: const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleAudience,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        // Audience subscribes only; never publishes.
        publishMicrophoneTrack: false,
        publishCameraTrack: false,
        autoSubscribeAudio: true,
        autoSubscribeVideo: true,
      ),
    );
    try { await engine.setEnableSpeakerphone(true); } catch (_) {}
    return true;
  }

  Future<void> leave() async {
    try { await _engine?.leaveChannel(); await _engine?.release(); } catch (_) {}
    _engine = null;
    _joined = false;
    broadcasterUid.value = null;
  }

  void dispose() {
    broadcasterUid.dispose();
    errorNotifier.dispose();
  }
}
