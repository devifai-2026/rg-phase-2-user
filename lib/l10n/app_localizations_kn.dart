// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class L10nKn extends L10n {
  L10nKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'ಆಸ್ಟ್ರೋ ಅಪ್ಲಿಕೇಶನ್';

  @override
  String get tagline => 'ಜ್ಯೋತಿಷ್ಯ ಮತ್ತು ಯೋಗಕ್ಷೇಮ';

  @override
  String get splashBlessing =>
      'ಸ್ಪಷ್ಟತೆಯತ್ತ ನಿಮ್ಮ ಪ್ರಯಾಣ ಇಲ್ಲಿಂದ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ.';

  @override
  String get authWelcomeTitle => 'ಸ್ವಾಗತ';

  @override
  String get authWelcomeSubtitle =>
      'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆಯೊಂದಿಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ ಅಥವಾ ನಿಮ್ಮ ಖಾತೆಯನ್ನು ರಚಿಸಿ';

  @override
  String get phoneLabel => 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ';

  @override
  String get phoneHint => '10-ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'ಮುಂದುವರಿಸಿ';

  @override
  String get sendOtpButton => 'ಒಟಿಪಿ ಕಳುಹಿಸಿ';

  @override
  String get otpTitle => 'ನಿಮ್ಮ ಸಂಖ್ಯೆಯನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String otpSubtitle(String phone) {
    return '$phone ಗೆ ಕಳುಹಿಸಲಾದ 6-ಅಂಕಿಯ ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ';
  }

  @override
  String get otpLabel => 'ಒಟಿಪಿ';

  @override
  String get verifyButton => 'ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮುಂದುವರಿಸಿ';

  @override
  String get resendOtp => 'ಕೋಡ್ ಅನ್ನು ಮತ್ತೆ ಕಳುಹಿಸಿ';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds ಗಳಲ್ಲಿ ಪುನಃ ಕಳುಹಿಸಿ';
  }

  @override
  String get changeNumber => 'ಸಂಖ್ಯೆಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get termsNotice =>
      'ಮುಂದುವರಿಯುವ ಮೂಲಕ ನೀವು ನಮ್ಮ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಸಮ್ಮತಿಸುತ್ತೀರಿ.';

  @override
  String get acceptPrefix => 'ನಾನು ಒಪ್ಪುತ್ತೇನೆ';

  @override
  String get acceptAnd => 'ಮತ್ತು';

  @override
  String get termsOfService => 'ಸೇವಾ ನಿಯಮಗಳು';

  @override
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get errInvalidPhone => 'ಮಾನ್ಯವಾದ 10-ಅಂಕಿಯ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get errInvalidOtp => '6-ಅಂಕಿಯ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get errGeneric => 'ಏನೋ ತಪ್ಪಾಗಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errNetwork =>
      'ಸಂಪರ್ಕವಿಲ್ಲ. ನಿಮ್ಮ ಇಂಟರ್ನೆಟ್ ಪರಿಶೀಲಿಸಿ ಹಾಗೂ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get otpSent => 'OTP ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get loginSuccess => 'ಸೈನ್ ಇನ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get themeSystem => 'ವ್ಯವಸ್ಥೆ';

  @override
  String get themeLight => 'ಬೆಳಕು';

  @override
  String get themeDark => 'ಕತ್ತಲೆ';

  @override
  String homeWelcome(String name) {
    return 'ನಮಸ್ತೆ, $name';
  }

  @override
  String get logout => 'ಲಾಗ್ ಔಟ್ ಮಾಡಿ';

  @override
  String get onbTitle => 'ನಿಮ್ಮ ಬಗ್ಗೆ ನಮಗೆ ತಿಳಿಸಿ';

  @override
  String get onbSubtitle =>
      'ಇದು ನಿಮ್ಮ ಓದುವಿಕೆಯನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು ನಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ. ಇದರಲ್ಲಿ ಯಾವುದೂ ಅಗತ್ಯವಿಲ್ಲ — ನೀವು ನಂತರ ಬಿಟ್ಟು ಮುಗಿಸಬಹುದು.';

  @override
  String get onbName => 'ನಿಮ್ಮ ಹೆಸರು';

  @override
  String get onbAddPhoto => 'ಫೋಟೋ ಸೇರಿಸಿ';

  @override
  String get onbChangePhoto => 'ಫೋಟೋ ಬದಲಾಯಿಸಿ';

  @override
  String get onbGender => 'ಲಿಂಗ';

  @override
  String get genderMale => 'ಗಂಡು';

  @override
  String get genderFemale => 'ಹೆಣ್ಣು';

  @override
  String get genderOther => 'ಇತರೆ';

  @override
  String get onbDob => 'ಹುಟ್ಟಿದ ದಿನಾಂಕ';

  @override
  String get onbTob => 'ಹುಟ್ಟಿದ ಸಮಯ';

  @override
  String get onbDontKnowTime => 'ನನ್ನ ಜನ್ಮ ಸಮಯ ನನಗೆ ತಿಳಿದಿಲ್ಲ.';

  @override
  String get onbPob => 'ಹುಟ್ಟಿದ ಸ್ಥಳ';

  @override
  String get onbPobHint => 'ನಿಮ್ಮ ಜನ್ಮಸ್ಥಳವನ್ನು ಹುಡುಕಿ';

  @override
  String get onbLanguage => 'ಆದ್ಯತೆಯ ಭಾಷೆ';

  @override
  String get onbSelectDate => 'ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get onbSelectTime => 'ಸಮಯವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get onbSkip => 'ಇದೀಗ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get onbFinish => 'ಮುಗಿಸಿ';

  @override
  String get onbSaved => 'ಪ್ರೊಫೈಲ್ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get completeProfile => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get completeProfileCta => 'ಸೆಟಪ್ ಮುಗಿಸಿ';

  @override
  String get permTitle => 'ಕೆಲವು ಅನುಮತಿಗಳು';

  @override
  String get permSubtitle =>
      'ಕರೆಗಳು, ಎಚ್ಚರಿಕೆಗಳು ಮತ್ತು ಫೋಟೋಗಳು ಸರಾಗವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸಲು ನಮಗೆ ಇವುಗಳು ಬೇಕಾಗುತ್ತವೆ. ನೀವು ಅವುಗಳನ್ನು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಬದಲಾಯಿಸಬಹುದು.';

  @override
  String get permNotifications => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get permNotificationsDesc =>
      'ಸಮಾಲೋಚನೆ ಎಚ್ಚರಿಕೆಗಳು, ಆದೇಶ ನವೀಕರಣಗಳು ಮತ್ತು ಜ್ಞಾಪನೆಗಳು';

  @override
  String get permMic => 'ಮೈಕ್ರೊಫೋನ್';

  @override
  String get permMicDesc => 'ಜ್ಯೋತಿಷಿಗಳೊಂದಿಗೆ ಧ್ವನಿ ಕರೆಗಳಿಗಾಗಿ';

  @override
  String get permCamera => 'ಕ್ಯಾಮೆರಾ';

  @override
  String get permCameraDesc => 'ವೀಡಿಯೊ ಕರೆಗಳು ಮತ್ತು ಫೋಟೋಗಳನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಲು';

  @override
  String get permPhotos => 'ಫೋಟೋಗಳು';

  @override
  String get permPhotosDesc => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಚಿತ್ರವನ್ನು ಹೊಂದಿಸಲು';

  @override
  String get permAllow => 'ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get permContinue => 'ಮುಂದುವರಿಸಿ';

  @override
  String get permLocation => 'ಸ್ಥಳ';

  @override
  String get permLocationDesc => 'ನಿಮ್ಮ ಹತ್ತಿರದ ಜ್ಯೋತಿಷಿಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get secFeatured => 'ವೈಶಿಷ್ಟ್ಯಪೂರ್ಣ ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String get secNearby => 'ಹತ್ತಿರದ ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String get secCallChat => 'ಕರೆ ಮಾಡಿ ಮತ್ತು ಚಾಟ್ ಮಾಡಿ';

  @override
  String get secAiAstro => 'ಎ.ಐ. ಅಸ್ಟ್ರೋಲಾಜರ್ಸ್';

  @override
  String get secProducts => 'ಉತ್ಪನ್ನಗಳು';

  @override
  String get secVideos => 'ವೀಡಿಯೊಗಳು';

  @override
  String get secLessons => 'ಜ್ಯೋತಿಷ್ಯ ಪಾಠಗಳು';

  @override
  String get secOthers => 'ಇತರರು';

  @override
  String get secHistory => 'ನಿಮ್ಮ ಸಮಾಲೋಚನೆಗಳು';

  @override
  String get seeAll => 'ಎಲ್ಲವನ್ನೂ ನೋಡಿ';

  @override
  String get basedOnLocation => 'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ಆಧರಿಸಿ';

  @override
  String get shareApp => 'ಸ್ನೇಹಿತರೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get startReadingHint =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಮಾಲೋಚನೆಗಳಿಲ್ಲ. ನಿಮ್ಮ ಮೊದಲ ಓದುವಿಕೆಯನ್ನು ಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get startBtn => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get namaste => 'ನಮಸ್ತೆ';

  @override
  String get kFreeKundli => 'ಉಚಿತ ಕುಂಡಲಿ';

  @override
  String get kMatching => 'ಹೊಂದಾಣಿಕೆ';

  @override
  String get kBrihat => 'ಬೃಹತ್ ಕುಂಡಲಿ';

  @override
  String get kKundliAi => 'ಕುಂಡಲಿ AI+';

  @override
  String get tCareer => 'ವೃತ್ತಿಜೀವನ';

  @override
  String get tMarriage => 'ಮದುವೆ';

  @override
  String get tFinance => 'ಹಣಕಾಸು';

  @override
  String get tHealth => 'ಆರೋಗ್ಯ';

  @override
  String get tEducation => 'ವಿದ್ಯಾಭ್ಯಾಸ';

  @override
  String get tTravel => 'ಪ್ರಯಾಣ';

  @override
  String get statusOnline => 'ಆನ್‌ಲೈನ್';

  @override
  String get statusBusy => 'ಕಾರ್ಯನಿರತ';

  @override
  String get statusOffline => 'ಆಫ್‌ಲೈನ್';

  @override
  String get retry => 'ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get chatNow => 'ಈಗಲೇ ಮಾತನಾಡಿ';

  @override
  String get notifyMe => 'ನನಗೆ ಸೂಚಿಸಿ';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return '$name $reason ಆದಾಗ ನಾವು ನಿಮಗೆ ತಿಳಿಸುತ್ತೇವೆ.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'ಈ ಜ್ಯೋತಿಷಿ ಇನ್ನೂ ಸಮಾಲೋಚಿಸಲು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'ಒಂದು ನಿಮಿಷಕ್ಕೆ ನಿಮಗೆ ಕನಿಷ್ಠ ₹$ratePerMin ಅಗತ್ಯವಿದೆ. ದಯವಿಟ್ಟು ರೀಚಾರ್ಜ್ ಮಾಡಿ.';
  }

  @override
  String get completeYourProfile => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get addYourDateTimePlaceOf =>
      'ನಿಮ್ಮ ದಿನಾಂಕ, ಸಮಯ ಮತ್ತು ಜನ್ಮ ಸ್ಥಳವನ್ನು ಸೇರಿಸಿ ಇದರಿಂದ ಜ್ಯೋತಿಷಿಯು ನಿಮಗೆ ಸ್ಪಷ್ಟವಾದ ಓದುವಿಕೆಯನ್ನು ನೀಡಬಹುದು.';

  @override
  String get completeProfile2 => 'ಪ್ರೊಫೈಲ್ ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get skipForNow => 'ಇದೀಗ ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String unfollowWidgetName(Object name) {
    return '$name ಅನ್ನು ಅನುಸರಿಸಬೇಡಿ?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'ಏಕೆ ಎಂದು ನಮಗೆ ತಿಳಿಸಿ (ಐಚ್ಛಿಕ) — ಇದು ನಮಗೆ ಸುಧಾರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get reasonOptional => 'ಕಾರಣ (ಐಚ್ಛಿಕ)';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get unfollow => 'ಅನುಸರಿಸಬೇಡಿ';

  @override
  String get s21kReviews => '(2.1k ವಿಮರ್ಶೆಗಳು)';

  @override
  String followersFollowers(Object followers) {
    return '$followers ಅನುಯಾಯಿಗಳು';
  }

  @override
  String get gift => 'ಉಡುಗೊರೆ';

  @override
  String get store => 'ಅಂಗಡಿ';

  @override
  String get joinLiveSession => 'ಲೈವ್ ಸೆಷನ್‌ಗೆ ಸೇರಿ';

  @override
  String get youLlBeNotified => 'ನಿಮಗೆ ಸೂಚಿಸಲಾಗುತ್ತದೆ';

  @override
  String get thisStoreHasNoItemsYet =>
      'ಈ ಅಂಗಡಿಯಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ವಸ್ತುಗಳು ಇಲ್ಲ.';

  @override
  String get filters => 'ಶೋಧಕಗಳು';

  @override
  String get reset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get onlineNowOnly => 'ಈಗ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಮಾತ್ರ';

  @override
  String get applyFilters => 'ಫಿಲ್ಟರ್‌ಗಳನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'ಈ ಜ್ಯೋತಿಷಿಗೆ ಉಡುಗೊರೆ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String needTotalcostYourBalanceIsWallet(Object totalCost, Object balance) {
    return '₹$totalCost ಬೇಕು — ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್ ₹$balance ಇದೆ. ದಯವಿಟ್ಟು ರೀಚಾರ್ಜ್ ಮಾಡಿ.';
  }

  @override
  String sentQtyGiftNameToWidget(
      Object _qty, Object name, Object astrologerName) {
    return '$_qty $name ಅನ್ನು $astrologerName 🎁 ಗೆ ಕಳುಹಿಸಲಾಗಿದೆ';
  }

  @override
  String sendAGiftToWidgetAstrologername(Object astrologerName) {
    return '$astrologerName ಗೆ ಉಡುಗೊರೆ ಕಳುಹಿಸಿ';
  }

  @override
  String balanceContextWatchWalletproviderBalance(Object balance) {
    return 'ಬಾಕಿ: ₹$balance';
  }

  @override
  String get recharge => 'ರೀಚಾರ್ಜ್ ಮಾಡಿ';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost ಧನ್ಯವಾದಗಳು';
  }

  @override
  String get quantity => 'ಪ್ರಮಾಣ';

  @override
  String get min1Max100 => 'ಕನಿಷ್ಠ 1 · ಗರಿಷ್ಠ 100';

  @override
  String get comingSoon => 'ಶೀಘ್ರದಲ್ಲೇ ಬರಲಿದೆ';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return '$astrologerName ರಿಂದ ಸಾರಾಂಶ';
  }

  @override
  String get remindersSetForYou => 'ನಿಮಗಾಗಿ ಜ್ಞಾಪನೆಗಳನ್ನು ಹೊಂದಿಸಲಾಗಿದೆ';

  @override
  String get suggestedForYou => 'ನಿಮಗಾಗಿ ಸೂಚಿಸಲಾಗಿದೆ';

  @override
  String get couldNotSendImage => 'ಚಿತ್ರವನ್ನು ಕಳುಹಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get endConsultation => 'ಸಮಾಲೋಚನೆಯನ್ನು ಕೊನೆಗೊಳಿಸುವುದೇ?';

  @override
  String get thisWillEndTheChatAnd =>
      'ಇದು ಚಾಟ್ ಅನ್ನು ಕೊನೆಗೊಳಿಸುತ್ತದೆ ಮತ್ತು ಬಿಲ್ಲಿಂಗ್ ಅನ್ನು ನಿಲ್ಲಿಸುತ್ತದೆ.';

  @override
  String get keepChatting => 'ಚಾಟ್ ಮಾಡುತ್ತಲೇ ಇರಿ';

  @override
  String get end => 'ಅಂತ್ಯ';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return '$toUpperCase$substring ಗೆ ಬದಲಾಯಿಸುವುದೇ?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'ನಿಮ್ಮ ಚಾಟ್ ಕೊನೆಗೊಳ್ಳುತ್ತದೆ ಮತ್ತು ಹೊಸ $type ಸಮಾಲೋಚನೆ $type2 ದರದಲ್ಲಿ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ.';
  }

  @override
  String get switchLabel => 'ಬದಲಿಸಿ';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'ಬದಲಾಯಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $toString';
  }

  @override
  String get switchToAudioCall => 'ಆಡಿಯೋ ಕರೆಗೆ ಬದಲಿಸಿ';

  @override
  String get switchToVideoCall => 'ವೀಡಿಯೊ ಕರೆಗೆ ಬದಲಿಸಿ';

  @override
  String get endConsultation2 => 'ಸಮಾಲೋಚನೆಯನ್ನು ಕೊನೆಗೊಳಿಸಿ';

  @override
  String get sendAGift => 'ಉಡುಗೊರೆ ಕಳುಹಿಸಿ';

  @override
  String get sayHello => 'ನಮಸ್ಕಾರ ಹೇಳಿ 🙏';

  @override
  String get typeAMessage => 'ಸಂದೇಶವನ್ನು ಟೈಪ್ ಮಾಡಿ...';

  @override
  String get recommendedProduct => 'ಶಿಫಾರಸು ಮಾಡಿದ ಉತ್ಪನ್ನ';

  @override
  String get view => 'ವೀಕ್ಷಿಸಿ';

  @override
  String get connecting => 'ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get myConsultations => 'ನನ್ನ ಸಮಾಲೋಚನೆಗಳು';

  @override
  String get noConsultationsYet => 'ಇನ್ನೂ ಯಾವುದೇ ಸಮಾಲೋಚನೆಗಳಿಲ್ಲ.';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type ಸಮಾಲೋಚನೆ';
  }

  @override
  String get viewChat => 'ಚಾಟ್ ವೀಕ್ಷಿಸಿ';

  @override
  String get historyExpired => 'ಇತಿಹಾಸ ಅವಧಿ ಮುಗಿದಿದೆ';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'ನಿಮ್ಮ $type ಸಮಾಲೋಚನೆಯನ್ನು ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ…';
  }

  @override
  String get ringingTheAstrologer => 'ಜ್ಯೋತಿಷಿಗೆ ಕರೆ ಮಾಡುವುದು';

  @override
  String get cancelRequest => 'ವಿನಂತಿಯನ್ನು ರದ್ದುಮಾಡಿ';

  @override
  String get notNow => 'ಈಗಲ್ಲ';

  @override
  String get thanksForYourFeedback => 'ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆಗೆ ಧನ್ಯವಾದಗಳು!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'ಸಲ್ಲಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get consultationEnded => 'ಸಮಾಲೋಚನೆ ಕೊನೆಗೊಂಡಿದೆ';

  @override
  String get hopeYouGotTheClarityYou =>
      'ನೀವು ಬಯಸಿದ ಸ್ಪಷ್ಟತೆ ಸಿಕ್ಕಿದೆ ಎಂದು ಭಾವಿಸುತ್ತೇನೆ.';

  @override
  String get shareYourExperienceOptional =>
      'ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಳ್ಳಿ (ಐಚ್ಛಿಕ)';

  @override
  String get howWasTheCallQuality => 'ಕರೆಯ ಗುಣಮಟ್ಟ ಹೇಗಿತ್ತು?';

  @override
  String get skip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get submit => 'ಸಲ್ಲಿಸಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String get viewProfile => 'ಪ್ರೊಫೈಲ್ ವೀಕ್ಷಿಸಿ';

  @override
  String vAppversion(Object _appVersion) {
    return 'ವಿ$_appVersion';
  }

  @override
  String get madeBy => 'ಮಾಡಿದವರು';

  @override
  String get devifai => 'ಡೆವಿಫೈಎಐ';

  @override
  String get withLabel => '❤️ ಜೊತೆ';

  @override
  String get leavingSoSoon => 'ಇಷ್ಟು ಬೇಗ ಹೊರಟು ಹೋಗುತ್ತಿದ್ದೀರಾ?';

  @override
  String get stayLoggedIn => 'ಲಾಗಿನ್ ಆಗಿರಿ';

  @override
  String get logOutAnyway => 'ಹೇಗಾದರೂ ಲಾಗ್ ಔಟ್ ಮಾಡಿ';

  @override
  String get noNearbyAstrologersYet =>
      'ಹತ್ತಿರದಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ಜ್ಯೋತಿಷಿಗಳು ಇಲ್ಲ.';

  @override
  String get bookAPooja => 'ಪೂಜೆ ಬುಕ್ ಮಾಡಿ';

  @override
  String get panditLedPoojasAtYourChosen =>
      'ನೀವು ಆಯ್ಕೆ ಮಾಡಿದ ದಿನಾಂಕದಂದು ಪಂಡಿತರ ನೇತೃತ್ವದ ಪೂಜೆಗಳು';

  @override
  String get back => 'ಹಿಂದೆ';

  @override
  String get connectingToLive => 'ಲೈವ್‌ಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get live => 'ಲೈವ್';

  @override
  String get thisLiveHasEnded => 'ಈ ಲೈವ್ ಕೊನೆಗೊಂಡಿದೆ.';

  @override
  String get backToLive => 'ಲೈವ್‌ಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get sayHelloBeTheFirstTo =>
      'ನಮಸ್ಕಾರ ಹೇಳಿ 👋 ಕಾಮೆಂಟ್ ಮಾಡುವ ಮೊದಲಿಗರಾಗಿರಿ';

  @override
  String get aiPollLive => 'AI ಪೋಲ್ · ಲೈವ್';

  @override
  String totalVotes(Object total) {
    return '$total ಮತಗಳು';
  }

  @override
  String get addAComment => 'ಕಾಮೆಂಟ್ ಸೇರಿಸಿ...';

  @override
  String get send => 'ಕಳುಹಿಸಿ';

  @override
  String get liveNow => 'ಈಗ ಲೈವ್';

  @override
  String get searchByAstrologerName => 'ಜ್ಯೋತಿಷಿ ಹೆಸರಿನಿಂದ ಹುಡುಕಿ';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return '“$trim” ಹೆಸರಿನ ಯಾವುದೇ ಜೀವಂತ ಜ್ಯೋತಿಷಿ ಇಲ್ಲ.';
  }

  @override
  String get refresh => 'ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get join => 'ಸೇರಿ';

  @override
  String get clearAllNotifications => 'ಎಲ್ಲಾ ಅಧಿಸೂಚನೆಗಳನ್ನು ತೆರವುಗೊಳಿಸುವುದೇ?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'ಇದು ನಿಮ್ಮ ಎಲ್ಲಾ ಅಧಿಸೂಚನೆಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸುತ್ತದೆ.';

  @override
  String get clearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get notifications => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get markAllRead => 'ಎಲ್ಲವನ್ನೂ ಓದಲಾಗಿದೆ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get noNotifications => 'ಯಾವುದೇ ಅಧಿಸೂಚನೆಗಳಿಲ್ಲ';

  @override
  String get youReAllCaughtUp => 'ನೀವು ಎಲ್ಲವನ್ನೂ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ.';

  @override
  String get nameIsRequired => 'ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String get enterAValidPhone => 'ಮಾನ್ಯವಾದ ಫೋನ್ ನಮೂದಿಸಿ';

  @override
  String get bookingConfirmed => 'ಬುಕಿಂಗ್ ದೃಢೀಕರಿಸಲಾಗಿದೆ 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'ಬುಕಿಂಗ್ ವಿಫಲವಾಗಿದೆ, ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get addMoneyToContinue => 'ಮುಂದುವರಿಯಲು ಹಣವನ್ನು ಸೇರಿಸಿ';

  @override
  String get addMoney => 'ಹಣವನ್ನು ಸೇರಿಸಿ';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'ಪುಸ್ತಕ $name';
  }

  @override
  String get name => 'ಹೆಸರು';

  @override
  String get phone => 'ದೂರವಾಣಿ';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'ಈ ಪೂಜೆಯನ್ನು ($_maxPersons ವರೆಗೆ) ಮಾಡುವ ಜನರನ್ನು ಸೇರಿಸಿ. ಮುಂದಿನದನ್ನು ಸೇರಿಸುವ ಮೊದಲು ಒಂದನ್ನು ಭರ್ತಿ ಮಾಡಿ.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'ಸದಸ್ಯರ ಹೆಸರು $key';
  }

  @override
  String get specialInstructionsOptional => 'ವಿಶೇಷ ಸೂಚನೆಗಳು (ಐಚ್ಛಿಕ)';

  @override
  String get poojaDetails => 'ಪೂಜಾ ವಿವರಗಳು';

  @override
  String get price => 'ಬೆಲೆ';

  @override
  String get bookNow => 'ಈಗ ಪುಸ್ತಕ ಮಾಡಿ';

  @override
  String get aboutThisPooja => 'ಈ ಪೂಜೆಯ ಬಗ್ಗೆ';

  @override
  String get ourPanditWillCallYou => 'ನಮ್ಮ ಪಂಡಿತರು ನಿಮಗೆ ಕರೆ ಮಾಡುತ್ತಾರೆ.';

  @override
  String get beforeThePoojaToConfirmThe =>
      'ಪೂಜೆಗೆ ಮುನ್ನ, ಸಮಯ ಮತ್ತು ನಿಮ್ಮ ಸಂಕಲ್ಪ ವಿವರಗಳನ್ನು ಖಚಿತಪಡಿಸಲು.';

  @override
  String get howItWorks => 'ಇದು ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ';

  @override
  String get filterPoojas => 'ಪೂಜೆಗಳನ್ನು ಫಿಲ್ಟರ್ ಮಾಡಿ';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'ಗರಿಷ್ಠ ಬಜೆಟ್ · ₹$round';
  }

  @override
  String get minPersonsSupported => 'ಕನಿಷ್ಠ ಬೆಂಬಲಿತ ವ್ಯಕ್ತಿಗಳು';

  @override
  String get apply => 'ಅನ್ವಯಿಸು';

  @override
  String get searchPoojas => 'ಪೂಜೆಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get myProfile => 'ನನ್ನ ಪ್ರೊಫೈಲ್';

  @override
  String get referEarn => 'ಉಲ್ಲೇಖಿಸಿ ಮತ್ತು ಗಳಿಸಿ';

  @override
  String get couldNotLoadTryAgain =>
      'ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String shareEarnIReward(Object reward) {
    return 'ಹಂಚಿಕೊಳ್ಳಿ ಮತ್ತು ₹$reward ಗಳಿಸಿ';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'ನಿಮ್ಮ ಸ್ನೇಹಿತರ ಮೊದಲ ರೀಚಾರ್ಜ್‌ನಲ್ಲಿ ನೀವು ₹$reward ಪಡೆಯುತ್ತೀರಿ — ಮತ್ತು ಅವರಿಗೂ ₹$reward2 ಸಿಗುತ್ತದೆ.';
  }

  @override
  String get yourReferralCode => 'ನಿಮ್ಮ ಉಲ್ಲೇಖ ಕೋಡ್';

  @override
  String get codeCopied => 'ಕೋಡ್ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get shareEarn => 'ಹಂಚಿಕೊಳ್ಳಿ ಮತ್ತು ಗಳಿಸಿ';

  @override
  String get haveAFriendSCode => 'ಸ್ನೇಹಿತರ ಕೋಡ್ ಇದೆಯೇ?';

  @override
  String get enterReferralCode => 'ಉಲ್ಲೇಖ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get aReferralCodeIsAppliedTo =>
      'ನಿಮ್ಮ ಖಾತೆಗೆ ಉಲ್ಲೇಖ ಕೋಡ್ ಅನ್ನು ಅನ್ವಯಿಸಲಾಗಿದೆ.';

  @override
  String get feedbackSubmitted => 'ಪ್ರತಿಕ್ರಿಯೆ ಸಲ್ಲಿಸಲಾಗಿದೆ';

  @override
  String get feedback => 'ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get applicationSubmitted => 'ಅರ್ಜಿ ಸಲ್ಲಿಸಲಾಗಿದೆ';

  @override
  String get astrologerRegistration => 'ಜ್ಯೋತಿಷಿ ನೋಂದಣಿ';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return 'ಜ್ಯೋತಿಷಿಯಾಗಿ $appName ಸೇರಿ';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'ನಿಮ್ಮ ಬಗ್ಗೆ ನಮಗೆ ತಿಳಿಸಿ - ನಮ್ಮ ತಂಡವು ಪರಿಶೀಲಿಸಿ ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ.';

  @override
  String get aboutUs => 'ನಮ್ಮ ಬಗ್ಗೆ';

  @override
  String rudraganga(String appName) {
    return '$appName $appName';
  }

  @override
  String get astrologyWellness => 'ಜ್ಯೋತಿಷ್ಯ ಮತ್ತು ಯೋಗಕ್ಷೇಮ';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · ಭಕ್ತಿಯಿಂದ ರಚಿಸಲಾಗಿದೆ';

  @override
  String get thanksForYourRating => 'ನಿಮ್ಮ ರೇಟಿಂಗ್‌ಗೆ ಧನ್ಯವಾದಗಳು!';

  @override
  String rateRudraganga(String appName) {
    return 'ದರ $appName';
  }

  @override
  String get howIsYourExperience => 'ನಿಮ್ಮ ಅನುಭವ ಹೇಗಿದೆ?';

  @override
  String get writeAReviewOptional => 'ವಿಮರ್ಶೆ ಬರೆಯಿರಿ (ಐಚ್ಛಿಕ)';

  @override
  String get saved => 'ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get notificationSetting => 'ಅಧಿಸೂಚನೆ ಸೆಟ್ಟಿಂಗ್';

  @override
  String get howOften => 'ಎಷ್ಟು ಬಾರಿ?';

  @override
  String get topicsYouCareAbout => 'ನೀವು ಕಾಳಜಿ ವಹಿಸುವ ವಿಷಯಗಳು';

  @override
  String get ok => 'ಸರಿ';

  @override
  String get allSet => 'ಎಲ್ಲವೂ ಸಿದ್ಧವಾಗಿದೆ ✨';

  @override
  String get setPreferences => 'ಆದ್ಯತೆಗಳನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get bundlesCombos => 'ಬಂಡಲ್‌ಗಳು ಮತ್ತು ಸಂಯೋಜನೆಗಳು';

  @override
  String get noCombosRightNow => 'ಇದೀಗ ಯಾವುದೇ ಸಂಯೋಜನೆಗಳಿಲ್ಲ';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'ಕಾಂಬೊ ಸೇರಿಸಿ · ₹$bundlePrice';
  }

  @override
  String get cart => 'ಕಾರ್ಟ್';

  @override
  String get clear => 'ಸ್ಪಷ್ಟ';

  @override
  String get yourCartIsEmpty => 'ನಿಮ್ಮ ಕಾರ್ಟ್ ಖಾಲಿಯಾಗಿದೆ.';

  @override
  String get browseProductsAndAddThemHere =>
      'ಉತ್ಪನ್ನಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ ಮತ್ತು ಅವುಗಳನ್ನು ಇಲ್ಲಿ ಸೇರಿಸಿ';

  @override
  String walletBalanceAddTotalBalanceTo(Object balance, Object balance2) {
    return 'ವಾಲೆಟ್ ₹$balance · ಚೆಕ್ಔಟ್ ಮಾಡಲು ₹$balance2 ಸೇರಿಸಿ';
  }

  @override
  String walletBalance(Object balance) {
    return 'ವಾಲೆಟ್: ₹$balance';
  }

  @override
  String couponTrimmedAppliedResDiscountOff(Object trimmed, Object discount) {
    return 'ಕೂಪನ್ $trimmed ಅನ್ವಯಿಸಲಾಗಿದೆ · ₹$discount ರಿಯಾಯಿತಿ';
  }

  @override
  String get pleaseAddADeliveryAddress => 'ದಯವಿಟ್ಟು ವಿತರಣಾ ವಿಳಾಸವನ್ನು ಸೇರಿಸಿ.';

  @override
  String get checkout => 'ಚೆಕ್ಔಟ್';

  @override
  String get addNewAddress => 'ಹೊಸ ವಿಳಾಸವನ್ನು ಸೇರಿಸಿ';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code ಅನ್ವಯಿಸಲಾಗಿದೆ · ₹$discount ರಿಯಾಯಿತಿ';
  }

  @override
  String get remove => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String get enterCouponCode => 'ಕೂಪನ್ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String viewAllCouponsLength(Object length) {
    return 'ಎಲ್ಲವನ್ನೂ ವೀಕ್ಷಿಸಿ ($length)';
  }

  @override
  String get availableOffers => 'ಲಭ್ಯವಿರುವ ಕೊಡುಗೆಗಳು';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'ಕನಿಷ್ಠ ಆರ್ಡರ್ ₹$minOrderValue';
  }

  @override
  String get applied => 'ಅನ್ವಯಿಸಲಾಗಿದೆ';

  @override
  String get nothingToCheckout => 'ಚೆಕ್ಔಟ್ ಮಾಡಲು ಏನೂ ಇಲ್ಲ';

  @override
  String get orderPlaced => 'ಆರ್ಡರ್ ಮಾಡಲಾಗಿದೆ!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return 'ನಿಮ್ಮ ವ್ಯಾಲೆಟ್‌ನಿಂದ ₹$total ಪಾವತಿಸಲಾಗಿದೆ. ನಿಮ್ಮ ಆರ್ಡರ್ ದೃಢೀಕರಿಸಲ್ಪಟ್ಟಿದೆ ಮತ್ತು ಶೀಘ್ರದಲ್ಲೇ ಬರಲಿದೆ.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'ಆರ್ಡರ್ #$orderId';
  }

  @override
  String get continueShopping => 'ಶಾಪಿಂಗ್ ಮುಂದುವರಿಸಿ';

  @override
  String get yourOrders => 'ನಿಮ್ಮ ಆರ್ಡರ್‌ಗಳು';

  @override
  String get noOrdersYet => 'ಇನ್ನೂ ಯಾವುದೇ ಆರ್ಡರ್‌ಗಳಿಲ್ಲ';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'ನೀವು ಅಂಗಡಿಯಿಂದ ಏನನ್ನಾದರೂ ಖರೀದಿಸಿದ ನಂತರ ನಿಮ್ಮ ಆರ್ಡರ್‌ಗಳು ಇಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ.';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'ಇನ್‌ವಾಯ್ಸ್ ಇನ್ನೂ ರಚನೆಯಾಗುತ್ತಿದೆ. ಸ್ವಲ್ಪ ಸಮಯದಲ್ಲೇ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get couldNotOpenTheInvoice => 'ಇನ್‌ವಾಯ್ಸ್ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get thanksOurTeamWillReachOut =>
      'ಧನ್ಯವಾದಗಳು! ನಮ್ಮ ತಂಡವು ಈ ಆದೇಶದ ಕುರಿತು ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ.';

  @override
  String get orderDetails => 'ಆರ್ಡರ್ ವಿವರಗಳು';

  @override
  String get needHelp => 'ಸಹಾಯ ಬೇಕು';

  @override
  String get needHelpWithThisOrder => 'ಈ ಆರ್ಡರ್‌ಗೆ ಸಹಾಯ ಬೇಕೇ?';

  @override
  String placedOnDate(Object date) {
    return '$date ರಂದು ಇರಿಸಲಾಗಿದೆ';
  }

  @override
  String get invoice => 'ಸರಕುಪಟ್ಟಿ';

  @override
  String get download => 'ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get needHelp2 => 'ಸಹಾಯ ಬೇಕು';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'ಆರ್ಡರ್ #$orderNo';
  }

  @override
  String get whatWentWrong => 'ಏನು ತಪ್ಪಾಯಿತು?';

  @override
  String get describeTheIssue => 'ಸಮಸ್ಯೆಯನ್ನು ವಿವರಿಸಿ';

  @override
  String get tellUsWhatHappenedSoWe =>
      'ಏನಾಯಿತು ಎಂದು ನಮಗೆ ತಿಳಿಸಿ ಇದರಿಂದ ನಾವು ಸಹಾಯ ಮಾಡಬಹುದು...';

  @override
  String get submitRequest => 'ವಿನಂತಿಯನ್ನು ಸಲ್ಲಿಸಿ';

  @override
  String get addedToCart => 'ಕಾರ್ಟ್‌ಗೆ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get productUnavailable => 'ಉತ್ಪನ್ನ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String pDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% ರಿಯಾಯಿತಿ';
  }

  @override
  String pReviewcountReviews(Object reviewCount) {
    return '$reviewCount ವಿಮರ್ಶೆಗಳು';
  }

  @override
  String pDiscountpercentOff2(Object discountPercent) {
    return '$discountPercent% ರಿಯಾಯಿತಿ';
  }

  @override
  String get fewItemsLeft => 'ಕೆಲವು ವಸ್ತುಗಳು ಉಳಿದಿವೆ';

  @override
  String get description => 'ವಿವರಣೆ';

  @override
  String get frequentlyBoughtTogether => 'ಆಗಾಗ್ಗೆ ಒಟ್ಟಿಗೆ ಖರೀದಿಸಲಾಗುತ್ತದೆ';

  @override
  String get viewAll => 'ಎಲ್ಲವನ್ನೂ ವೀಕ್ಷಿಸಿ';

  @override
  String get addToCart => 'ಕಾರ್ಟ್‌ಗೆ ಸೇರಿಸಿ';

  @override
  String get buyNow => 'ಈಗ ಖರೀದಿಸಿ';

  @override
  String get searchProducts => 'ಉತ್ಪನ್ನಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get noProductsFound => 'ಯಾವುದೇ ಉತ್ಪನ್ನಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get priceRange => 'ಬೆಲೆ ಶ್ರೇಣಿ (₹)';

  @override
  String get min => 'ಕನಿಷ್ಠ';

  @override
  String get max => 'ಗರಿಷ್ಠ';

  @override
  String get inStockOnly => 'ಸ್ಟಾಕ್‌ನಲ್ಲಿ ಮಾತ್ರ';

  @override
  String get sortBy => 'ವಿಂಗಡಿಸಿ';

  @override
  String get addDeliveryAddress => 'ವಿತರಣಾ ವಿಳಾಸವನ್ನು ಸೇರಿಸಿ';

  @override
  String get setAsDefaultAddress => 'ಡೀಫಾಲ್ಟ್ ವಿಳಾಸವಾಗಿ ಹೊಂದಿಸಿ';

  @override
  String get saveAddress => 'ವಿಳಾಸವನ್ನು ಉಳಿಸಿ';

  @override
  String codeCouponCode(Object code) {
    return 'ಕೋಡ್ $code';
  }

  @override
  String saveBundleYousave(Object youSave) {
    return '₹$youSave ಉಳಿಸಿ';
  }

  @override
  String bundleProductsLengthItemsCombo(Object length) {
    return '$length ಐಟಂಗಳ ಸಂಯೋಜನೆ';
  }

  @override
  String bundleDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% ರಿಯಾಯಿತಿ';
  }

  @override
  String get fewLeft => 'ಕೆಲವೇ ಉಳಿದಿವೆ';

  @override
  String savePSaveamount(Object saveAmount) {
    return '₹$saveAmount ಉಳಿಸಿ';
  }

  @override
  String get freeDelivery => 'ಉಚಿತ ವಿತರಣೆ';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'ಹುಡುಕಿ $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'ಇಲ್ಲಿ ಇನ್ನೂ ಏನೂ ಇಲ್ಲ';

  @override
  String get loadingSecurePayment =>
      'ಸುರಕ್ಷಿತ ಪಾವತಿಯನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get couldNotStartRecharge => 'ರೀಚಾರ್ಜ್ ಪ್ರಾರಂಭಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get paymentSuccessful => 'ಪಾವತಿ ಯಶಸ್ವಿಯಾಗಿದೆ 🎉';

  @override
  String get paymentWasNotCompleted => 'ಪಾವತಿ ಪೂರ್ಣಗೊಂಡಿಲ್ಲ.';

  @override
  String get couldNotStartRechargeTryAgain =>
      'ರೀಚಾರ್ಜ್ ಪ್ರಾರಂಭಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get wallet => 'ವಾಲೆಟ್';

  @override
  String get availableBalance => 'ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get useItForPoojasConsultations =>
      'ಪೂಜೆಗಳು ಮತ್ತು ಸಮಾಲೋಚನೆಗಳಿಗಾಗಿ ಇದನ್ನು ಬಳಸಿ';

  @override
  String get instantTopUp => 'ತ್ವರಿತ ಟಾಪ್-ಅಪ್';

  @override
  String get noRechargePacksAvailableRightNow =>
      'ಇದೀಗ ಯಾವುದೇ ರೀಚಾರ್ಜ್ ಪ್ಯಾಕ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get transactions => 'ವಹಿವಾಟುಗಳು';

  @override
  String get endOfTransactions => '— ವಹಿವಾಟಿನ ಅಂತ್ಯ —';

  @override
  String get youGet => 'ನೀವು ಪಡೆಯುತ್ತೀರಿ';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus ಬೋನಸ್';
  }

  @override
  String payPackAmount(Object amount) {
    return '₹$amount ಪಾವತಿಸಿ';
  }

  @override
  String get rudra => 'ಆಸ್ಟ್ರೋ';

  @override
  String get ganga => 'ಅಪ್ಲಿಕೇಶನ್';

  @override
  String get about => 'ನಮ್ಮ ಬಗ್ಗೆ';

  @override
  String get astrologer => 'ಜ್ಯೋತಿಷಿ';

  @override
  String get seeker => 'ಅನ್ವೇಷಕ';

  @override
  String get free => 'ಉಚಿತ';

  @override
  String get jan => 'ಜನವರಿ';

  @override
  String get feb => 'ಫೆಬ್ರವರಿ';

  @override
  String get mar => 'ಮಾರ್ಚ್';

  @override
  String get apr => 'ಏಪ್ರಿಲ್';

  @override
  String get may => 'ಮೇ';

  @override
  String get jun => 'ಜೂನ್';

  @override
  String get jul => 'ಜುಲೈ';

  @override
  String get aug => 'ಆಗಸ್ಟ್';

  @override
  String get sep => 'ಸೆಪ್ಟೆಂಬರ್';

  @override
  String get oct => 'ಅಕ್ಟೋಬರ್';

  @override
  String get nov => 'ನವೆಂಬರ್';

  @override
  String get dec => 'ಡಿಸೆಂಬರ್';

  @override
  String get english => 'ಇಂಗ್ಲೀಷ್';

  @override
  String get all => 'ಎಲ್ಲವೂ';

  @override
  String get vedic => 'ವೈದಿಕ';

  @override
  String get tarot => 'ಟ್ಯಾರೋ';

  @override
  String get numerology => 'ಸಂಖ್ಯಾಶಾಸ್ತ್ರ';

  @override
  String get vastu => 'ವಾಸ್ತು';

  @override
  String get palmistry => 'ಹಸ್ತಸಾಮುದ್ರಿಕೆ';

  @override
  String get kp => 'ಕೆ.ಪಿ.';

  @override
  String get love => 'ಪ್ರೀತಿ';

  @override
  String get taraAi => 'ತಾರಾ AI';

  @override
  String get instantVedicAnswers247 => 'ತತ್ಕ್ಷಣದ ವೇದ ಉತ್ತರಗಳು • 24×7';

  @override
  String get allLanguages => 'ಎಲ್ಲಾ ಭಾಷೆಗಳು';

  @override
  String get jyotiAi => 'ಜ್ಯೋತಿ ಎಐ';

  @override
  String get loveCareerGuidance => 'ಪ್ರೀತಿ ಮತ್ತು ವೃತ್ತಿ ಮಾರ್ಗದರ್ಶನ';

  @override
  String get hindiEnglish => 'ಹಿಂದಿ, ಇಂಗ್ಲಿಷ್';

  @override
  String get veduAi => 'ವೇದು AI';

  @override
  String get remediesPredictions => 'ಪರಿಹಾರಗಳು ಮತ್ತು ಭವಿಷ್ಯವಾಣಿಗಳು';

  @override
  String get couldNotLoadAstrologers =>
      'ಜ್ಯೋತಿಷಿಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get aiAstrologers => 'ಎ.ಐ. ಅಸ್ಟ್ರೋಲಾಜರ್ಸ್';

  @override
  String get featuredAstrologers => 'ವೈಶಿಷ್ಟ್ಯಪೂರ್ಣ ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String get astrologers => 'ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String get searchAiAstrologers => 'AI ಜ್ಯೋತಿಷಿಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get searchAstrologersByName => 'ಹೆಸರಿನಿಂದ ಜ್ಯೋತಿಷಿಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get aiChat => 'AI ಚಾಟ್';

  @override
  String get noAstrologersMatch => 'ಯಾವುದೇ ಜ್ಯೋತಿಷಿಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get noAstrologersYet => 'ಇನ್ನೂ ಯಾವುದೇ ಜ್ಯೋತಿಷಿಗಳಿಲ್ಲ';

  @override
  String get couldnTSetTheReminderPlease =>
      'ಜ್ಞಾಪನೆಯನ್ನು ಹೊಂದಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get ai => 'ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ';

  @override
  String get live2 => 'ಲೈವ್';

  @override
  String get online => 'ಆನ್‌ಲೈನ್';

  @override
  String get busy => 'ಕಾರ್ಯನಿರತ';

  @override
  String get offline => 'ಆಫ್‌ಲೈನ್';

  @override
  String get chat => 'ಚಾಟ್ ಮಾಡಿ';

  @override
  String get call => 'ಕರೆ ಮಾಡಿ';

  @override
  String get video => 'ವೀಡಿಯೊ';

  @override
  String get notEnoughBalanceToStartPlease =>
      'ಪ್ರಾರಂಭಿಸಲು ಸಾಕಷ್ಟು ಬ್ಯಾಲೆನ್ಸ್ ಇಲ್ಲ. ದಯವಿಟ್ಟು ರೀಚಾರ್ಜ್ ಮಾಡಿ.';

  @override
  String get couldNotStartTheConsultationPlease =>
      'ಸಮಾಲೋಚನೆಯನ್ನು ಪ್ರಾರಂಭಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get share => 'ಹಂಚಿ';

  @override
  String get follow => 'ಅನುಸರಿಸಿ';

  @override
  String get chats => 'ಚಾಟ್‌ಗಳು';

  @override
  String get calls => 'ಕರೆಗಳು';

  @override
  String get videos => 'ವೀಡಿಯೊಗಳು';

  @override
  String get gifts => 'ಉಡುಗೊರೆಗಳು';

  @override
  String get languages => 'ಭಾಷೆಗಳು';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'ಅವರು ಸಾವಿರಾರು ಅನ್ವೇಷಕರಿಗೆ ವೃತ್ತಿ, ಮದುವೆ, ಹಣಕಾಸು ಮತ್ತು ಜೀವನ-ಮಾರ್ಗದ ಪ್ರಶ್ನೆಗಳ ಮೂಲಕ ಮಾರ್ಗದರ್ಶನ ನೀಡಿದ್ದಾರೆ.';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'ಅವರ ವಾಚನಗಳು ಶಾಸ್ತ್ರೀಯ ವೈದಿಕ ತತ್ವಗಳನ್ನು ಪ್ರಾಯೋಗಿಕ, ಸಹಾನುಭೂತಿಯ ಮಾರ್ಗದರ್ಶನದೊಂದಿಗೆ ಬೆರೆಸುತ್ತವೆ - ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತವೆ.';

  @override
  String get findClarityAndActionableRemediesFor =>
      'ಮುಂದಿನ ಹಾದಿಗೆ ಸ್ಪಷ್ಟತೆ ಮತ್ತು ಕಾರ್ಯಸಾಧ್ಯ ಪರಿಹಾರಗಳನ್ನು ಕಂಡುಕೊಳ್ಳಿ.';

  @override
  String get giftsReceived => 'ಸ್ವೀಕರಿಸಿದ ಉಡುಗೊರೆಗಳು';

  @override
  String get reviews => 'ವಿಮರ್ಶೆಗಳು';

  @override
  String get weLlNotifyYouTheMoment =>
      'ಅವರು ಮುಕ್ತರಾದ ತಕ್ಷಣ ನಾವು ನಿಮಗೆ ತಿಳಿಸುತ್ತೇವೆ.';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'ಅವರು ಆನ್‌ಲೈನ್‌ಗೆ ಬಂದ ಕೂಡಲೇ ನಾವು ನಿಮಗೆ ತಿಳಿಸುತ್ತೇವೆ.';

  @override
  String get getAHeadsUpTheMoment => 'ಅವು ಲಭ್ಯವಾದ ತಕ್ಷಣ ಎಚ್ಚರಿಕೆ ಪಡೆಯಿರಿ.';

  @override
  String get couldNotLoadThisStore => 'ಈ ಅಂಗಡಿಯನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get products => 'ಉತ್ಪನ್ನಗಳು';

  @override
  String get poojas => 'ಪೂಜೆಗಳು';

  @override
  String get book => 'ಪುಸ್ತಕ';

  @override
  String get buy => 'ಖರೀದಿಸಿ';

  @override
  String get lalKitab => 'ಲಾಲ್ ಕಿತಾಬ್';

  @override
  String get hindi => 'ಹಿಂದಿ';

  @override
  String get bengali => 'ಬಂಗಾಳಿ';

  @override
  String get tamil => 'ತಮಿಳು';

  @override
  String get marathi => 'ಮರಾಠಿ';

  @override
  String get punjabi => 'ಪಂಜಾಬಿ';

  @override
  String get telugu => 'ತೆಲುಗು';

  @override
  String get expertise => 'ಪರಿಣಿತಿ';

  @override
  String get couldNotLoadGifts => 'ಉಡುಗೊರೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'ಸಾಕಷ್ಟು ಬ್ಯಾಲೆನ್ಸ್ ಇಲ್ಲ. ಉಡುಗೊರೆಗಳನ್ನು ಕಳುಹಿಸಲು ಹಣವನ್ನು ಸೇರಿಸಿ.';

  @override
  String get couldNotSendTheGiftPlease =>
      'ಉಡುಗೊರೆಯನ್ನು ಕಳುಹಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get connecting2 => 'ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get couldNotLoadThisChatHistory =>
      'ಈ ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get thisChatHistoryIsNoLonger =>
      'ಈ ಚಾಟ್ ಇತಿಹಾಸ ಇನ್ನು ಮುಂದೆ ಲಭ್ಯವಿಲ್ಲ\n(ಚಾಟ್‌ಗಳನ್ನು 7 ದಿನಗಳವರೆಗೆ ಇರಿಸಲಾಗುತ್ತದೆ).';

  @override
  String get dailyFor14Days => 'ಪ್ರತಿದಿನ · 14 ದಿನಗಳವರೆಗೆ';

  @override
  String get dailyMantra => 'ದೈನಂದಿನ ಮಂತ್ರ';

  @override
  String get reminder => 'ಜ್ಞಾಪನೆ';

  @override
  String get audio => 'ಆಡಿಯೋ';

  @override
  String get couldNotLoadYourConsultations =>
      'ನಿಮ್ಮ ಸಮಾಲೋಚನೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get missed => 'ತಪ್ಪಿಸಿಕೊಂಡಿದೆ';

  @override
  String get declined => 'ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get cancelled => 'ರದ್ದುಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get lowBalance => 'ಕಡಿಮೆ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'ನಿಮ್ಮ ಸಮಾಲೋಚನೆಯನ್ನು ಮುಂದುವರಿಸಲು ಈಗಲೇ ರೀಚಾರ್ಜ್ ಮಾಡಿ. ನೀವು ಪಾವತಿಸುವಾಗ ನಿಮ್ಮ ಚಾಟ್ ತೆರೆದಿರುತ್ತದೆ.';

  @override
  String get sessionEndedLowBalance =>
      'ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್ ಖಾಲಿಯಾಗಿದೆ, ಆದ್ದರಿಂದ ಸಮಾಲೋಚನೆ ಕೊನೆಗೊಂಡಿದೆ. ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಮುಂದುವರಿಸಲು ರೀಚಾರ್ಜ್ ಮಾಡಿ.';

  @override
  String get couldNotLoadHoroscope =>
      'ಜಾತಕವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get chooseSign => 'ಬದಲಾವಣೆ ಚಿಹ್ನೆ';

  @override
  String get yesterday => 'ನಿನ್ನೆ';

  @override
  String get today => 'ಇಂದು';

  @override
  String get tomorrow => 'ನಾಳೆ';

  @override
  String get totalScore => 'ಒಟ್ಟಾರೆ ಅಂಕ';

  @override
  String get luckyColor => 'ಅದೃಷ್ಟದ ಬಣ್ಣ';

  @override
  String get luckyNumber => 'ಅದೃಷ್ಟ ಸಂಖ್ಯೆ';

  @override
  String get lifeAreas => 'ಜೀವನ ಪ್ರದೇಶಗಳು';

  @override
  String get todaysReading => 'ಇಂದಿನ ಓದುವಿಕೆ';

  @override
  String get career => 'ವೃತ್ತಿಜೀವನ';

  @override
  String get finances => 'ಹಣಕಾಸು';

  @override
  String get health => 'ಆರೋಗ್ಯ';

  @override
  String get relationship => 'ಸಂಬಂಧ';

  @override
  String get family => 'ಕುಟುಂಬ';

  @override
  String get friends => 'ಸ್ನೇಹಿತರು';

  @override
  String get travel => 'ಪ್ರಯಾಣ';

  @override
  String get physique => 'ಮೈಕಟ್ಟು';

  @override
  String get statusLabel => 'ಸ್ಥಿತಿ';

  @override
  String get signAries => 'ಮೇಷ ರಾಶಿ';

  @override
  String get signTaurus => 'ವೃಷಭ ರಾಶಿ';

  @override
  String get signGemini => 'ಮಿಥುನ ರಾಶಿ';

  @override
  String get signCancer => 'ಕ್ಯಾನ್ಸರ್';

  @override
  String get signLeo => 'ಸಿಂಹ ರಾಶಿ';

  @override
  String get signVirgo => 'ಕನ್ಯಾರಾಶಿ';

  @override
  String get signLibra => 'ತುಲಾ ರಾಶಿ';

  @override
  String get signScorpio => 'ವೃಶ್ಚಿಕ ರಾಶಿ';

  @override
  String get signSagittarius => 'ಧನು ರಾಶಿ';

  @override
  String get signCapricorn => 'ಮಕರ ಸಂಕ್ರಾಂತಿ';

  @override
  String get signAquarius => 'ಕುಂಭ ರಾಶಿ';

  @override
  String get signPisces => 'ಮೀನ ರಾಶಿ';

  @override
  String get couldNotLoadPanchang =>
      'ಪಂಚಾಂಗವನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get tithi => 'ತಿಥಿ';

  @override
  String get nakshatra => 'ನಕ್ಷತ್ರ';

  @override
  String get yoga => 'ಯೋಗ';

  @override
  String get karana => 'ಕರಣ';

  @override
  String get weekday => 'ವಾರದ ದಿನ';

  @override
  String get inauspiciousTimes => 'ಅಶುಭ ಸಮಯಗಳು';

  @override
  String get rahuKaal => 'ರಾಹು ಕಾಲ';

  @override
  String get gulikaKaal => 'ಗುಳಿಕಾ ಕಾಲ್';

  @override
  String get yamaganda => 'ಯಮಗಂಡ';

  @override
  String get duration => 'ಅವಧಿ';

  @override
  String get coinsUsed => 'ಬಳಸಿದ ನಾಣ್ಯಗಳು';

  @override
  String get guest => 'ಅತಿಥಿ';

  @override
  String get changeLanguage => 'ಭಾಷೆಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get chooseYourKundli => 'ನಿಮ್ಮ ಕುಂಡಲಿಯನ್ನು ಆರಿಸಿ';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'ನಿಮ್ಮ ಕೈಚೀಲ, ಓದುವಿಕೆಗಳು ಮತ್ತು ಉಳಿಸಿದ ವಿವರಗಳು ಸುರಕ್ಷಿತವಾಗಿವೆ - ಆದರೆ ಲಾಗ್ ಔಟ್ ಆಗುವುದು ಎಂದರೆ ನಿಮ್ಮ ದೈನಂದಿನ ಜಾತಕ, ಕೊಡುಗೆಗಳು ಮತ್ತು ಜ್ಞಾಪನೆಗಳನ್ನು ಕಳೆದುಕೊಳ್ಳುವುದು. ನಕ್ಷತ್ರಗಳೊಂದಿಗೆ ಸಂಪರ್ಕದಲ್ಲಿರಿ? ✨';

  @override
  String get offers => 'ಕೊಡುಗೆಗಳು';

  @override
  String get dailyPanchang => 'ದೈನಂದಿನ ಪಂಚಾಂಗ';

  @override
  String get talkToAstrologer => 'ಜ್ಯೋತಿಷಿಯೊಂದಿಗೆ ಮಾತನಾಡಿ';

  @override
  String get brihatKundli => 'ಬೃಹತ್ ಕುಂಡಲಿ';

  @override
  String get dailyNotes => 'ದೈನಂದಿನ ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get askAQuestion => 'ಒಂದು ಪ್ರಶ್ನೆ ಕೇಳಿ';

  @override
  String get free50Pages => 'ಉಚಿತ 50+ ಪುಟಗಳು';

  @override
  String get freeReport => 'ಉಚಿತ ವರದಿ';

  @override
  String get freeMatrimony => 'ಉಚಿತ ಮದುವೆ';

  @override
  String get matrimony => 'ದಾಂಪತ್ಯ';

  @override
  String get loveMatch => 'ಲವ್ ಮ್ಯಾಚ್';

  @override
  String get horoscope => 'ಜಾತಕ';

  @override
  String get dailyHoroscope => 'ದೈನಂದಿನ ಜಾತಕ';

  @override
  String get vedicAstrology => 'ವೈದಿಕ ಜ್ಯೋತಿಷ್ಯ';

  @override
  String get acharyaVeda => 'ಆಚಾರ್ಯ ವೇದ';

  @override
  String get panditRohan => 'ಪಂಡಿತ್ ರೋಹನ್';

  @override
  String get guruMaya => 'ಗುರು ಮಾಯಾ';

  @override
  String get jayaShastri => 'ಜಯ ಶಾಸ್ತ್ರಿ';

  @override
  String get devSharma => 'ದೇವ್ ಶರ್ಮಾ';

  @override
  String get sureshG => 'ಸುರೇಶ್ ಜಿ.';

  @override
  String get lataP => 'ಲತಾ ಪಿ.';

  @override
  String get kiranB => 'ಕಿರಣ್ ಬಿ.';

  @override
  String get mohanT => 'ಮೋಹನ್ ಟಿ.';

  @override
  String get anilJoshi => 'ಅನಿಲ್ ಜೋಶಿ';

  @override
  String get meeraDevi => 'ಮೀರಾ ದೇವಿ';

  @override
  String get raviKumar => 'ರವಿ ಕುಮಾರ್';

  @override
  String get sunitaRao => 'ಸುನೀತಾ ರಾವ್';

  @override
  String get bengaluruKarnataka => 'ಬೆಂಗಳೂರು, ಕರ್ನಾಟಕ';

  @override
  String get locating => 'ಪತ್ತೆ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get festivalOffer => 'ಹಬ್ಬದ ಕೊಡುಗೆ';

  @override
  String get upTo30OffOnGemstones => 'ರತ್ನದ ಕಲ್ಲುಗಳ ಮೇಲೆ 30% ವರೆಗೆ ರಿಯಾಯಿತಿ';

  @override
  String get talkToTopAstrologers => 'ಪ್ರಮುಖ ಜ್ಯೋತಿಷಿಗಳೊಂದಿಗೆ ಮಾತನಾಡಿ';

  @override
  String get firstConsultationSpecial => 'ಮೊದಲ ಸಮಾಲೋಚನೆ ವಿಶೇಷ';

  @override
  String get rudrakshaCollection => 'ರುದ್ರಾಕ್ಷ ಸಂಗ್ರಹ';

  @override
  String get authenticEnergised => 'ಅಧಿಕೃತ ಮತ್ತು ಉತ್ಸಾಹಭರಿತ';

  @override
  String get resumeSession => 'ಸೆಶನ್ ಪುನರಾರಂಭಿಸಿ';

  @override
  String get home => 'ಮರಳಿ ಪ್ರಥಮ ಪುಟಕ್ಕೆ';

  @override
  String get aiAstro => 'ಎಐ ಆಸ್ಟ್ರೋ';

  @override
  String get ask => 'ಕೇಳಿ';

  @override
  String get history => 'ಇತಿಹಾಸ';

  @override
  String get seeAll2 => 'ಎಲ್ಲವನ್ನೂ ನೋಡಿ';

  @override
  String get s1AcceptanceOfTheseTerms => '1. ಈ ನಿಯಮಗಳ ಸ್ವೀಕಾರ';

  @override
  String get termsOfService2 => 'ಸೇವಾ ನಿಯಮಗಳು';

  @override
  String get lastUpdated26June2026 => 'ಕೊನೆಯದಾಗಿ ನವೀಕರಿಸಿದ್ದು: 26 ಜೂನ್ 2026';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appName ಮಾರ್ಗದರ್ಶನ ಮತ್ತು ವೈಯಕ್ತಿಕಕ್ಕಾಗಿ ಜ್ಯೋತಿಷ್ಯ, ಆಧ್ಯಾತ್ಮಿಕ ಮತ್ತು ಕ್ಷೇಮ ಸಮಾಲೋಚನೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ.';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'ಚಿಂತನೆ ಮಾತ್ರ. ನಮ್ಮ ಸೇವೆಗಳು ವೃತ್ತಿಪರ ವೈದ್ಯಕೀಯ, ಕಾನೂನು, ಹಣಕಾಸು,';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'ಅಥವಾ ಮಾನಸಿಕ ಸಲಹೆ. ಅಪ್ಲಿಕೇಶನ್ ಬಳಸಲು ನೀವು 18 ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ವಯಸ್ಸಿನವರಾಗಿರಬೇಕು.';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'ಖಾತೆಯನ್ನು ರಚಿಸುವ ಮೂಲಕ ಅಥವಾ $appName ಮೊಬೈಲ್ ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು ಸಂಬಂಧಿತ ಸೇವೆಗಳನ್ನು ಬಳಸುವ ಮೂಲಕ (ದಿ';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '\"ಸೇವೆಗಳು\"), ನೀವು ಈ ಸೇವಾ ನಿಯಮಗಳು ಮತ್ತು ನಮ್ಮ ಗೌಪ್ಯತಾ ನೀತಿ ಮತ್ತು ಮರುಪಾವತಿಗೆ ಬದ್ಧರಾಗಿರಲು ಒಪ್ಪುತ್ತೀರಿ';

  @override
  String get policyIfYouDoNotAgree =>
      'ನೀತಿ. ನೀವು ಒಪ್ಪದಿದ್ದರೆ, ದಯವಿಟ್ಟು ಸೇವೆಗಳನ್ನು ಬಳಸಬೇಡಿ.';

  @override
  String get s2EligibilityYourAccount => '2. ಅರ್ಹತೆ ಮತ್ತು ನಿಮ್ಮ ಖಾತೆ';

  @override
  String get youMustBeAtLeast18 =>
      'ನೀವು ಕನಿಷ್ಠ 18 ವರ್ಷ ವಯಸ್ಸಿನವರಾಗಿರಬೇಕು ಮತ್ತು ಕಾನೂನುಬದ್ಧವಾಗಿ ಒಪ್ಪಂದ ಮಾಡಿಕೊಳ್ಳಲು ಸಮರ್ಥರಾಗಿರಬೇಕು.';

  @override
  String get youRegisterWithAPhoneNumber =>
      'ನೀವು ಒಂದು ಬಾರಿಯ ಪಾಸ್‌ವರ್ಡ್ (OTP) ಮೂಲಕ ಪರಿಶೀಲಿಸಿದ ಫೋನ್ ಸಂಖ್ಯೆಯೊಂದಿಗೆ ನೋಂದಾಯಿಸಿಕೊಳ್ಳುತ್ತೀರಿ. ಆ ಸಂಖ್ಯೆ ಮತ್ತು ಸಾಧನಕ್ಕೆ ಪ್ರವೇಶವನ್ನು ಸುರಕ್ಷಿತವಾಗಿರಿಸಿಕೊಳ್ಳುವುದು ನಿಮ್ಮ ಜವಾಬ್ದಾರಿಯಾಗಿದೆ.';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'ಜನನ ವಿವರಗಳನ್ನು ಒಳಗೊಂಡಂತೆ ನಿಖರವಾದ ಮಾಹಿತಿಯನ್ನು ಒದಗಿಸಲು ನೀವು ಒಪ್ಪುತ್ತೀರಿ, ಅಲ್ಲಿ ನೀವು ಅವುಗಳನ್ನು ಓದುವಿಕೆಗಾಗಿ ಹಂಚಿಕೊಳ್ಳಲು ಆಯ್ಕೆ ಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ. ನಿಮ್ಮ ಖಾತೆಯ ಅಡಿಯಲ್ಲಿರುವ ಎಲ್ಲಾ ಚಟುವಟಿಕೆಗಳಿಗೆ ನೀವು ಜವಾಬ್ದಾರರಾಗಿರುತ್ತೀರಿ.';

  @override
  String get s3TheServicesWeOffer => '3. ನಾವು ನೀಡುವ ಸೇವೆಗಳು';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appName ಆಡಿಯೋ ಕರೆ, ವಿಡಿಯೋ ಕರೆ ಮೂಲಕ ಸಮಾಲೋಚನೆಗಾಗಿ ಪರಿಶೀಲಿಸಿದ ಜ್ಯೋತಿಷಿಗಳೊಂದಿಗೆ ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ,';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'ಮತ್ತು ಚಾಟ್, ಮತ್ತು ಕುಂಡಲಿ ಉತ್ಪಾದನೆ ಮತ್ತು ಹೊಂದಾಣಿಕೆಯಂತಹ ಸಂಬಂಧಿತ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ನೀಡುತ್ತದೆ, AI ಜ್ಯೋತಿಷಿ,';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'ದೈನಂದಿನ ಜಾತಕಗಳು, ಪೂಜಾ ಬುಕಿಂಗ್‌ಗಳು, ಆಧ್ಯಾತ್ಮಿಕ ಉತ್ಪನ್ನಗಳ ಅಂಗಡಿ, ಉಡುಗೊರೆಗಳು ಮತ್ತು ವೈವಾಹಿಕ ಹೊಂದಾಣಿಕೆ.';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'ಯಾವುದೇ ವೈಶಿಷ್ಟ್ಯ ಅಥವಾ ಜ್ಯೋತಿಷಿಯ ಲಭ್ಯತೆ ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಬದಲಾಗಬಹುದು.';

  @override
  String get s4WalletPricingBilling =>
      '4. ವ್ಯಾಲೆಟ್, ಬೆಲೆ ನಿಗದಿ ಮತ್ತು ಬಿಲ್ಲಿಂಗ್';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'ಸಮಾಲೋಚನೆಗಳು ಪೂರ್ವಪಾವತಿಯಾಗಿವೆ. ನೀವು ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿರುವ ವ್ಯಾಲೆಟ್‌ಗೆ ಹಣವನ್ನು ಸೇರಿಸುತ್ತೀರಿ ಮತ್ತು ಸಂಪರ್ಕಿಸುವ ಮೊದಲು ಜ್ಯೋತಿಷಿ ಮತ್ತು ಸೇವೆಗೆ ತೋರಿಸಿರುವ ದರದಲ್ಲಿ ನಿಮಿಷಕ್ಕೆ ಪಾವತಿಸುತ್ತೀರಿ.';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'ಜ್ಯೋತಿಷಿ ಒಪ್ಪಿಕೊಂಡು ಅಧಿವೇಶನ ಸಂಪರ್ಕಗೊಂಡಾಗ ಬಿಲ್ಲಿಂಗ್ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ. ಸಂಪರ್ಕಗೊಂಡಾಗ ಮೊದಲ ನಿಮಿಷಕ್ಕೆ ಶುಲ್ಕ ವಿಧಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ಪ್ರತಿ ಮುಂದಿನ ನಿಮಿಷಕ್ಕೂ ಅದರ ಪ್ರಾರಂಭದಲ್ಲಿ ಶುಲ್ಕ ವಿಧಿಸಲಾಗುತ್ತದೆ. ಅಧಿವೇಶನದ ಸಮಯದಲ್ಲಿ ಲೈವ್ ಮೀಟರ್ ಅನ್ನು ತೋರಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ನಿಮ್ಮ ಬ್ಯಾಲೆನ್ಸ್ ಕಡಿಮೆಯಾದರೆ ಅಧಿವೇಶನವು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕೊನೆಗೊಳ್ಳುತ್ತದೆ.';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'ಪಾವತಿಗಳನ್ನು ನಮ್ಮ ಪಾವತಿ ಪಾಲುದಾರರು (PayU) ಪ್ರಕ್ರಿಯೆಗೊಳಿಸುತ್ತಾರೆ. ನಾವು ಪೂರ್ಣ ಕಾರ್ಡ್ ವಿವರಗಳನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ.';

  @override
  String get walletBalancesAreForUseWithin =>
      'ವ್ಯಾಲೆಟ್ ಬ್ಯಾಲೆನ್ಸ್‌ಗಳನ್ನು ಸೇವೆಗಳಲ್ಲಿ ಬಳಸಬಹುದು. ಅನ್ವಯವಾಗುವಲ್ಲಿ ಮರುಪಾವತಿಗಳನ್ನು ನಮ್ಮ ಮರುಪಾವತಿ ನೀತಿಯಿಂದ ನಿಯಂತ್ರಿಸಲಾಗುತ್ತದೆ.';

  @override
  String get pricesAreInIndianRupeesInr =>
      'ಬೆಲೆಗಳು ಭಾರತೀಯ ರೂಪಾಯಿಗಳಲ್ಲಿ (INR) ಇದ್ದು, ಅನ್ವಯವಾಗುವ ತೆರಿಗೆಗಳನ್ನು ಒಳಗೊಂಡಿರಬಹುದು.';

  @override
  String get s5AcceptableUse => '5. ಸ್ವೀಕಾರಾರ್ಹ ಬಳಕೆ';

  @override
  String get youAgreeNotTo => 'ನೀವು ಒಪ್ಪುವುದಿಲ್ಲ:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'ಜ್ಯೋತಿಷಿಗಳು ಅಥವಾ ಸಿಬ್ಬಂದಿಗೆ ಕಿರುಕುಳ, ನಿಂದನೆ, ಬೆದರಿಕೆ ಅಥವಾ ಲೈಂಗಿಕವಾಗಿ ಸ್ಪಷ್ಟವಾದ ಅಥವಾ ಕಾನೂನುಬಾಹಿರ ವಿಷಯವನ್ನು ಹಂಚಿಕೊಳ್ಳುವುದು.';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'ಯಾವುದೇ ವ್ಯಕ್ತಿಯಂತೆ ಸೋಗು ಹಾಕುವುದು, ಅಥವಾ ಸೇವೆ ಅಥವಾ ಮರುಪಾವತಿ ಪಡೆಯಲು ಸುಳ್ಳು ಮಾಹಿತಿಯನ್ನು ಒದಗಿಸುವುದು.';

  @override
  String get attemptToTakeAConsultationOff =>
      'ಶುಲ್ಕವನ್ನು ತಪ್ಪಿಸಲು ವೇದಿಕೆಯ ಹೊರಗೆ ಸಮಾಲೋಚನೆ ನಡೆಸಲು ಪ್ರಯತ್ನಿಸಿ, ಅಥವಾ ವೈಯಕ್ತಿಕ ಸಂಪರ್ಕ ವಿವರಗಳನ್ನು ಕೇಳಿ.';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'ಸೇವೆಗಳಲ್ಲಿ ಅಥವಾ ಅವುಗಳ ಸುರಕ್ಷತೆಯಲ್ಲಿ ಹಸ್ತಕ್ಷೇಪ ಮಾಡುವುದು, ಕೆರೆದು ಹಾಕುವುದು ಅಥವಾ ಅಡ್ಡಿಪಡಿಸಲು ಪ್ರಯತ್ನಿಸುವುದು.';

  @override
  String get s6AstrologersOnThePlatform => '6. ವೇದಿಕೆಯಲ್ಲಿ ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'ಜ್ಯೋತಿಷಿಗಳು ಸ್ವತಂತ್ರ ವೈದ್ಯರು, ಅವರು ಗುರುತನ್ನು ಪರಿಶೀಲಿಸುತ್ತಾರೆ ಮತ್ತು $appName ನಿಂದ ಅನುಮೋದಿಸುತ್ತಾರೆ.';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'ಅವರು ಸಮಾಲೋಚನೆಗಳನ್ನು ನೀಡುವ ಮೊದಲು. ನಾವು ವ್ಯಾಖ್ಯಾನಿಸುವ ಮಿತಿಯೊಳಗೆ ಅವರು ತಮ್ಮದೇ ಆದ ಪ್ರತಿ ನಿಮಿಷದ ದರಗಳನ್ನು ನಿಗದಿಪಡಿಸುತ್ತಾರೆ.';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'ಸಮಾಲೋಚನೆಯ ಸಮಯದಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳಲಾದ ಅಭಿಪ್ರಾಯಗಳು ಮತ್ತು ಮಾರ್ಗದರ್ಶನಗಳು ವೈಯಕ್ತಿಕ ಜ್ಯೋತಿಷಿಯದ್ದಾಗಿರುತ್ತವೆ ಮತ್ತು';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return '$appName. ಸಮಾಲೋಚನೆಯ ಆಧಾರದ ಮೇಲೆ ನೀವು ತೆಗೆದುಕೊಳ್ಳುವ ಯಾವುದೇ ನಿರ್ಧಾರಕ್ಕೆ ನಾವು ಜವಾಬ್ದಾರರಲ್ಲ.';
  }

  @override
  String get s7RecordingsContent => '7. ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು ಮತ್ತು ವಿಷಯ';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'ಗುಣಮಟ್ಟ, ಸುರಕ್ಷತೆ ಮತ್ತು ವಿವಾದ ಪರಿಹಾರಕ್ಕಾಗಿ, ಆಡಿಯೋ ಮತ್ತು ವಿಡಿಯೋ ಸಮಾಲೋಚನೆಗಳನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಬಹುದು. ನೀವು';

  @override
  String get consentToSuchRecordingByStarting =>
      'ಸೆಷನ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸುವ ಮೂಲಕ ಅಂತಹ ರೆಕಾರ್ಡಿಂಗ್‌ಗೆ ಸಮ್ಮತಿ ನೀಡಿ. ಚಾಟ್ ಸಂಭಾಷಣೆಗಳನ್ನು ಸಂಗ್ರಹಿಸಲಾಗಿದೆ ಆದ್ದರಿಂದ ನೀವು ಮತ್ತೆ ಭೇಟಿ ಮಾಡಬಹುದು';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'ಅವುಗಳನ್ನು ನಿರ್ವಹಿಸಬಹುದು. ಈ ಡೇಟಾವನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸಲಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ತಿಳಿಯಲು ನಮ್ಮ ಗೌಪ್ಯತಾ ನೀತಿಯನ್ನು ನೋಡಿ.';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. ಹಕ್ಕು ನಿರಾಕರಣೆ ಮತ್ತು ಹೊಣೆಗಾರಿಕೆಯ ಮಿತಿ';

  @override
  String get theServicesAreProvidedAsIs =>
      'ಮಾರ್ಗದರ್ಶನ ಮತ್ತು ಮನರಂಜನೆಯ ಪಕ್ಕದಲ್ಲಿರುವ ವೈಯಕ್ತಿಕ ಪ್ರತಿಬಿಂಬಕ್ಕಾಗಿ ಸೇವೆಗಳನ್ನು \"ಇರುವಂತೆಯೇ\" ಒದಗಿಸಲಾಗುತ್ತದೆ.';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return 'ಯಾವುದೇ ಭವಿಷ್ಯವಾಣಿ ಅಥವಾ ಪರಿಹಾರದ ನಿಖರತೆಯ ಬಗ್ಗೆ $appName ಯಾವುದೇ ಗ್ಯಾರಂಟಿ ನೀಡುವುದಿಲ್ಲ. ಗರಿಷ್ಠ ಮಟ್ಟಿಗೆ';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'ಕಾನೂನಿನಿಂದ ಅನುಮತಿಸಲಾದ, ಸೇವೆಗಳ ನಿಮ್ಮ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ $appName ನ ಒಟ್ಟು ಹೊಣೆಗಾರಿಕೆಯು ಸೀಮಿತವಾಗಿದೆ';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'ಈವೆಂಟ್‌ಗೆ 30 ದಿನಗಳ ಮೊದಲು ನೀವು ನಿಮ್ಮ ವ್ಯಾಲೆಟ್‌ಗೆ ಪಾವತಿಸಿದ ಮೊತ್ತವು ಕ್ಲೈಮ್‌ಗೆ ಕಾರಣವಾಗುತ್ತದೆ. ನಾವು';

  @override
  String get areNotLiableForIndirectOr =>
      'ಪರೋಕ್ಷ ಅಥವಾ ಪರಿಣಾಮಕಾರಿ ನಷ್ಟಗಳಿಗೆ ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.';

  @override
  String get s9SuspensionTermination => '9. ಅಮಾನತು ಮತ್ತು ಮುಕ್ತಾಯ';

  @override
  String get weMaySuspendOrTerminateYour =>
      'ನೀವು ಈ ನಿಯಮಗಳನ್ನು ಉಲ್ಲಂಘಿಸಿದರೆ, ವಂಚನೆ ಮಾಡಲು ಪ್ರಯತ್ನಿಸಿದರೆ ಅಥವಾ ದುರುಪಯೋಗಪಡಿಸಿಕೊಂಡರೆ ನಾವು ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಅಮಾನತುಗೊಳಿಸಬಹುದು ಅಥವಾ ಕೊನೆಗೊಳಿಸಬಹುದು';

  @override
  String get servicesYouMayStopUsingThe =>
      'ಸೇವೆಗಳು. ನೀವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಸೇವೆಗಳನ್ನು ಬಳಸುವುದನ್ನು ನಿಲ್ಲಿಸಬಹುದು. ಕೆಲವು ನಿಬಂಧನೆಗಳು (ಪಾವತಿ ಬಾಧ್ಯತೆಗಳು,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'ಹಕ್ಕು ನಿರಾಕರಣೆಗಳು ಮತ್ತು ಹೊಣೆಗಾರಿಕೆಯ ಮಿತಿಗಳು) ಮುಕ್ತಾಯದಿಂದ ಬದುಕುಳಿಯುತ್ತವೆ.';

  @override
  String get s10ChangesToTheseTerms => '10. ಈ ನಿಯಮಗಳಿಗೆ ಬದಲಾವಣೆಗಳು';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'ನಾವು ಈ ನಿಯಮಗಳನ್ನು ಕಾಲಕಾಲಕ್ಕೆ ನವೀಕರಿಸಬಹುದು. ಗಮನಾರ್ಹ ಬದಲಾವಣೆಗಳನ್ನು ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಅಥವಾ ಮೂಲಕ ತಿಳಿಸಲಾಗುತ್ತದೆ';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'ಮೇಲಿನ \"ಕೊನೆಯದಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ\" ದಿನಾಂಕವನ್ನು ನವೀಕರಿಸುವುದು. ಬದಲಾವಣೆಗಳ ನಂತರ ನಿರಂತರ ಬಳಕೆ ಎಂದರೆ ನೀವು ಅವುಗಳನ್ನು ಸ್ವೀಕರಿಸುತ್ತೀರಿ ಎಂದರ್ಥ.';

  @override
  String get s11ContactUs => '11. ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'ಈ ನಿಯಮಗಳ ಕುರಿತು ಪ್ರಶ್ನೆಗಳಿವೆಯೇ? ನಮ್ಮ ವೆಬ್‌ಸೈಟ್‌ನಲ್ಲಿರುವ ಸಂಪರ್ಕ ಫಾರ್ಮ್ ಮೂಲಕ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿರುವ ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get helpSupportSection => 'ಸಹಾಯ ಮತ್ತು ಬೆಂಬಲ ವಿಭಾಗ.';

  @override
  String get privacyPolicy2 => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'ನಿಮ್ಮ ಜನನ ವಿವರಗಳು, ಸಮಾಲೋಚನೆಗಳು ಮತ್ತು ಚಾಟ್‌ಗಳು ನಿಮಗೆ ವೈಯಕ್ತಿಕವಾಗಿವೆ. ಈ ನೀತಿಯು ನಾವು ಏನು ಮಾಡುತ್ತೇವೆ ಎಂಬುದನ್ನು ವಿವರಿಸುತ್ತದೆ';

  @override
  String get collectWhyAndTheControlYou =>
      'ಸಂಗ್ರಹಿಸಿ, ಏಕೆ, ಮತ್ತು ಅದರ ಮೇಲೆ ನೀವು ಹೊಂದಿರುವ ನಿಯಂತ್ರಣ.';

  @override
  String get s1InformationWeCollect => '1. ನಾವು ಸಂಗ್ರಹಿಸುವ ಮಾಹಿತಿ';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'ಖಾತೆ ಮಾಹಿತಿ: ನಿಮ್ಮ ಹೆಸರು, ಫೋನ್ ಸಂಖ್ಯೆ (OTP ಮೂಲಕ ಪರಿಶೀಲಿಸಲಾಗಿದೆ), ಮತ್ತು ಇಮೇಲ್ ಒದಗಿಸಿದ್ದರೆ.';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'ಜನ್ಮ ವಿವರಗಳು: ಕುಂಡಲಿ ಮತ್ತು ವಾಚನಗಳಿಗಾಗಿ ನೀವು ಹಂಚಿಕೊಳ್ಳಲು ಆಯ್ಕೆ ಮಾಡಿದ ದಿನಾಂಕ, ಸಮಯ ಮತ್ತು ಜನ್ಮ ಸ್ಥಳ.';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'ಸಮಾಲೋಚನೆ ಡೇಟಾ: ಚಾಟ್ ಸಂದೇಶಗಳು ಮತ್ತು ಅನ್ವಯವಾಗುವಲ್ಲಿ ಆಡಿಯೋ/ವಿಡಿಯೋ ಕರೆ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು.';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'ಪಾವತಿ ಡೇಟಾ: ವ್ಯಾಲೆಟ್ ವಹಿವಾಟುಗಳು ಮತ್ತು ಪಾವತಿ ಉಲ್ಲೇಖಗಳು. ಕಾರ್ಡ್ ವಿವರಗಳನ್ನು ನಮ್ಮ ಪಾವತಿ ಪಾಲುದಾರರು (PayU) ನಿರ್ವಹಿಸುತ್ತಾರೆ; ನಾವು ಪೂರ್ಣ ಕಾರ್ಡ್ ಸಂಖ್ಯೆಗಳನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ.';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'ಸಾಧನ ಮತ್ತು ಬಳಕೆಯ ಡೇಟಾ: ಸಾಧನದ ಪ್ರಕಾರ, ಆಪರೇಟಿಂಗ್ ಸಿಸ್ಟಮ್, ನಿಮ್ಮ ಐಪಿ ವಿಳಾಸದಿಂದ ಪಡೆದ ಅಂದಾಜು ಸ್ಥಳ, ಭೇಟಿ ನೀಡಿದ ಪುಟಗಳು ಮತ್ತು ಸೇವೆಗಳನ್ನು ನಿರ್ವಹಿಸಲು ಮತ್ತು ಸುಧಾರಿಸಲು ಬಳಸುವ ಸಂವಹನಗಳು.';

  @override
  String get s2HowWeUseIt => '2. ನಾವು ಅದನ್ನು ಹೇಗೆ ಬಳಸುತ್ತೇವೆ';

  @override
  String get toCreateAndSecureYourAccount =>
      'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ರಚಿಸಲು ಮತ್ತು ಸುರಕ್ಷಿತಗೊಳಿಸಲು ಮತ್ತು ನಿಮ್ಮ ಗುರುತನ್ನು ಪರಿಶೀಲಿಸಲು.';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'ನಿಮ್ಮನ್ನು ಜ್ಯೋತಿಷಿಗಳೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಮತ್ತು ಸಮಾಲೋಚನೆಗಳು, ಕುಂಡಲಿ, ಜಾತಕ ಮತ್ತು ಇತರ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ನೀಡಲು.';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'ವ್ಯಾಲೆಟ್ ರೀಚಾರ್ಜ್‌ಗಳು, ಪ್ರತಿ ನಿಮಿಷದ ಬಿಲ್ಲಿಂಗ್, ಪಾವತಿಗಳು ಮತ್ತು ಆರ್ಡರ್ ಪೂರೈಸುವಿಕೆಯನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲು.';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'ಬೆಂಬಲ ನೀಡಲು, ವಂಚನೆ ಮತ್ತು ದುರುಪಯೋಗವನ್ನು ತಡೆಯಲು ಮತ್ತು ಕಾನೂನು ಬಾಧ್ಯತೆಗಳನ್ನು ಪೂರೈಸಲು.';

  @override
  String get toUnderstandAndImproveHowThe =>
      'ಅಪ್ಲಿಕೇಶನ್ ಮತ್ತು ವೆಬ್‌ಸೈಟ್ ಅನ್ನು ಹೇಗೆ ಬಳಸಲಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಮತ್ತು ಸುಧಾರಿಸಲು.';

  @override
  String get s3WhenWeShareInformation => '3. ನಾವು ಮಾಹಿತಿಯನ್ನು ಹಂಚಿಕೊಂಡಾಗ';

  @override
  String get weDoNotSellYourPersonal =>
      'ನಾವು ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ಮಾರಾಟ ಮಾಡುವುದಿಲ್ಲ. ನಾವು ಅದನ್ನು ಮಾತ್ರ ಹಂಚಿಕೊಳ್ಳುತ್ತೇವೆ:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'ನೀವು ಸಮಾಲೋಚಿಸುವ ಜ್ಯೋತಿಷಿಯೊಂದಿಗೆ, ಓದುವಿಕೆಗೆ ಅಗತ್ಯವಿರುವಷ್ಟು ಸೀಮಿತಗೊಳಿಸಿ (ಉದಾ. ನಿಮ್ಮ ಜನ್ಮ ವಿವರಗಳು ಮತ್ತು ಚಾಟ್).';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'ಗೌಪ್ಯತೆಯ ಬಾಧ್ಯತೆಗಳ ಅಡಿಯಲ್ಲಿ - ಪಾವತಿ ಪ್ರಕ್ರಿಯೆ (PayU), ಕ್ಲೌಡ್ ಹೋಸ್ಟಿಂಗ್ ಮತ್ತು ಸಂಗ್ರಹಣೆ, ಸಂವಹನಗಳು (OTP ಗಾಗಿ WhatsApp/SMS), ಮತ್ತು ಅಧಿಸೂಚನೆಗಳು - ನಮಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸಲು ಸಹಾಯ ಮಾಡುವ ಸೇವಾ ಪೂರೈಕೆದಾರರೊಂದಿಗೆ.';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'ಕಾನೂನಿನಿಂದ ಅಗತ್ಯವಿದ್ದಾಗ, ಅಥವಾ ಬಳಕೆದಾರರ ಹಕ್ಕುಗಳು, ಸುರಕ್ಷತೆ ಮತ್ತು ಆಸ್ತಿಯನ್ನು ರಕ್ಷಿಸಲು ಮತ್ತು $appName.';
  }

  @override
  String get s4ConsultationRecordingsChats =>
      '4. ಸಮಾಲೋಚನೆ ರೆಕಾರ್ಡಿಂಗ್‌ಗಳು ಮತ್ತು ಚಾಟ್‌ಗಳು';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'ಗುಣಮಟ್ಟ, ಸುರಕ್ಷತೆಗಾಗಿ ಆಡಿಯೋ ಮತ್ತು ವಿಡಿಯೋ ಸಮಾಲೋಚನೆಗಳನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಬಹುದು ಮತ್ತು ಚಾಟ್‌ಗಳನ್ನು ಸಂಗ್ರಹಿಸಬಹುದು ಮತ್ತು';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'ವಿವಾದ ಪರಿಹಾರ. ನೀವು ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ಪರಿಶೀಲಿಸಬಹುದು. ರೆಕಾರ್ಡಿಂಗ್‌ಗಳನ್ನು ಹೀಗೆ ಉಳಿಸಿಕೊಳ್ಳಲಾಗುತ್ತದೆ';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'ಕೆಳಗೆ ವಿವರಿಸಲಾಗಿದೆ ಮತ್ತು ಬೆಂಬಲ, ಸುರಕ್ಷತೆ ಅಥವಾ ಕಾನೂನು ಕಾರಣಗಳಿಗಾಗಿ ಅಗತ್ಯವಿದ್ದಾಗ ಮಾತ್ರ ಪ್ರವೇಶಿಸಬಹುದು.';

  @override
  String get s5AnalyticsCookies => '5. ವಿಶ್ಲೇಷಣೆಗಳು ಮತ್ತು ಕುಕೀಸ್';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'ನಮ್ಮ ವೆಬ್‌ಸೈಟ್ ರಿಟರ್ನ್ ಭೇಟಿಗಳನ್ನು ಗುರುತಿಸಲು, ಹೇಗೆ ಎಂಬುದನ್ನು ಅಳೆಯಲು ಮೊದಲ-ಪಕ್ಷದ ಕುಕೀ/ಗುರುತಿಸುವಿಕೆಯನ್ನು ಬಳಸುತ್ತದೆ';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'ಲ್ಯಾಂಡಿಂಗ್ ಪುಟವು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ (ಉದಾಹರಣೆಗೆ ಯಾವ ವಿಭಾಗಗಳನ್ನು ಕ್ಲಿಕ್ ಮಾಡಲಾಗಿದೆ), ಮತ್ತು ಸೈನ್-ಅಪ್‌ಗಳನ್ನು ಮಾರ್ಕೆಟಿಂಗ್‌ಗೆ ಆರೋಪಿಸುತ್ತದೆ';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'ಅಭಿಯಾನಗಳು. ಅನುಭವವನ್ನು ಸುಧಾರಿಸಲು ಇದನ್ನು ಒಟ್ಟಾರೆಯಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ. ನಾವು ಅಂದಾಜು ನಗರ/ಪ್ರದೇಶವನ್ನು ಪಡೆಯುತ್ತೇವೆ';

  @override
  String get fromYourIpAddressWeDo =>
      'ನಿಮ್ಮ IP ವಿಳಾಸದಿಂದ; ನಾವು ವಿಶ್ಲೇಷಣೆಗಾಗಿ ನಿಖರವಾದ GPS ಸ್ಥಳವನ್ನು ಬಳಸುವುದಿಲ್ಲ.';

  @override
  String get s6DataRetention => '6. ಡೇಟಾ ಧಾರಣ';

  @override
  String get weKeepYourInformationForAs =>
      'ನಿಮ್ಮ ಖಾತೆ ಸಕ್ರಿಯವಾಗಿರುವವರೆಗೆ ಮತ್ತು ಒದಗಿಸಲು ಅಗತ್ಯವಿರುವವರೆಗೆ ನಾವು ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ಇರಿಸಿಕೊಳ್ಳುತ್ತೇವೆ';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'ಸೇವೆಗಳು, ಕಾನೂನು ಬಾಧ್ಯತೆಗಳನ್ನು ಅನುಸರಿಸುವುದು, ವಿವಾದಗಳನ್ನು ಪರಿಹರಿಸುವುದು ಮತ್ತು ನಮ್ಮ ಒಪ್ಪಂದಗಳನ್ನು ಜಾರಿಗೊಳಿಸುವುದು. ನೀವು';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'ಕಾನೂನುಬದ್ಧ ಧಾರಣಕ್ಕೆ ಒಳಪಟ್ಟು, ನಿಮ್ಮ ಖಾತೆ ಮತ್ತು ಸಂಬಂಧಿತ ವೈಯಕ್ತಿಕ ಡೇಟಾವನ್ನು ಅಳಿಸಲು ವಿನಂತಿಸಿ.';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'ಅವಶ್ಯಕತೆಗಳು (ಉದಾಹರಣೆಗೆ, ಲೆಕ್ಕಪತ್ರ ನಿರ್ವಹಣೆ ಮತ್ತು ತೆರಿಗೆಗಾಗಿ ನಾವು ಇಟ್ಟುಕೊಳ್ಳಬೇಕಾದ ವಹಿವಾಟು ದಾಖಲೆಗಳು).';

  @override
  String get s7Security => '7. ಭದ್ರತೆ';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'ನಾವು ಉದ್ಯಮ-ಪ್ರಮಾಣಿತ ಕ್ರಮಗಳನ್ನು ಬಳಸುತ್ತೇವೆ - ಸಾಗಣೆಯಲ್ಲಿ ಎನ್‌ಕ್ರಿಪ್ಶನ್, ಪ್ರವೇಶ ನಿಯಂತ್ರಣಗಳು ಮತ್ತು ಸುರಕ್ಷಿತ';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'ಮೂಲಸೌಕರ್ಯ - ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ರಕ್ಷಿಸಲು. ಯಾವುದೇ ಪ್ರಸರಣ ಅಥವಾ ಸಂಗ್ರಹಣೆ ವಿಧಾನವು ಸಂಪೂರ್ಣವಾಗಿ ಅಲ್ಲ';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'ಸುರಕ್ಷಿತ, ಆದ್ದರಿಂದ ನಾವು ಸಂಪೂರ್ಣ ಭದ್ರತೆಯನ್ನು ಖಾತರಿಪಡಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get s8YourRightsChoices => '8. ನಿಮ್ಮ ಹಕ್ಕುಗಳು ಮತ್ತು ಆಯ್ಕೆಗಳು';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಮತ್ತು ಜನನ ವಿವರಗಳನ್ನು ಪ್ರವೇಶಿಸಿ, ಸರಿಪಡಿಸಿ ಅಥವಾ ನವೀಕರಿಸಿ.';

  @override
  String get requestACopyOrDeletionOf =>
      'ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುವ ಮೂಲಕ ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಡೇಟಾದ ನಕಲು ಅಥವಾ ಅಳಿಸುವಿಕೆಯನ್ನು ವಿನಂತಿಸಿ.';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'ನಿಮ್ಮ ಸಾಧನ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಪ್ರಚಾರದ ಅಧಿಸೂಚನೆಗಳಿಂದ ಹೊರಗುಳಿಯಿರಿ.';

  @override
  String get s9Children => '9. ಮಕ್ಕಳು';

  @override
  String get theServicesAreIntendedForUsers =>
      'ಈ ಸೇವೆಗಳು 18 ವರ್ಷ ಮತ್ತು ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ವಯಸ್ಸಿನ ಬಳಕೆದಾರರಿಗಾಗಿ ಉದ್ದೇಶಿಸಲಾಗಿದೆ. ನಾವು ಉದ್ದೇಶಪೂರ್ವಕವಾಗಿ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '18 ವರ್ಷದೊಳಗಿನ ಯಾರಾದರೂ. ಅಪ್ರಾಪ್ತ ವಯಸ್ಕರು ಸೇವೆಗಳನ್ನು ಬಳಸಿದ್ದಾರೆಂದು ನೀವು ಭಾವಿಸಿದರೆ, ದಯವಿಟ್ಟು ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ ಇದರಿಂದ ನಾವು ಅದನ್ನು ತೆಗೆದುಹಾಕಬಹುದು.';

  @override
  String get s10ChangesToThisPolicy => '10. ಈ ನೀತಿಯಲ್ಲಿನ ಬದಲಾವಣೆಗಳು';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'ನಾವು ಈ ನೀತಿಯನ್ನು ನವೀಕರಿಸಬಹುದು. ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಅಥವಾ ನವೀಕರಿಸುವ ಮೂಲಕ ವಸ್ತು ಬದಲಾವಣೆಗಳನ್ನು ತಿಳಿಸಲಾಗುತ್ತದೆ';

  @override
  String get lastUpdatedDateAbove => 'ಮೇಲೆ \"ಕೊನೆಯದಾಗಿ ನವೀಕರಿಸಿದ\" ದಿನಾಂಕ.';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'ಗೌಪ್ಯತೆ ಪ್ರಶ್ನೆಗಳು ಅಥವಾ ಡೇಟಾ ವಿನಂತಿಗಳಿಗಾಗಿ, ನಮ್ಮ ವೆಬ್‌ಸೈಟ್‌ನಲ್ಲಿರುವ ಸಂಪರ್ಕ ಫಾರ್ಮ್ ಮೂಲಕ ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ ಅಥವಾ';

  @override
  String get appSHelpSupportSection =>
      'ಅಪ್ಲಿಕೇಶನ್‌ನ ಸಹಾಯ ಮತ್ತು ಬೆಂಬಲ ವಿಭಾಗವನ್ನು ಕ್ಲಿಕ್ ಮಾಡಿ.';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return '© 2026 $appName 18+ 1· ಮಾರ್ಗದರ್ಶನ ಮತ್ತು ಯೋಗಕ್ಷೇಮಕ್ಕಾಗಿ - ವೃತ್ತಿಪರ ಸಲಹೆಗೆ ಪರ್ಯಾಯವಲ್ಲ.';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'ಅಗಲ=ಸಾಧನ-ಅಗಲ, ಆರಂಭಿಕ-ಸ್ಕೇಲ್=1, ಗರಿಷ್ಠ-ಸ್ಕೇಲ್=1';

  @override
  String get segoeUi => 'ಸೆಗೋ ಯುಐ';

  @override
  String get vote => 'ಮತ ಚಲಾಯಿಸಿ';

  @override
  String get couldnTLoadLiveSessions =>
      'ಲೈವ್ ಸೆಷನ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get noOneIsLiveRightNow => 'ಈಗ ಯಾರೂ ಲೈವ್ ಆಗಿಲ್ಲ.';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'ಜ್ಯೋತಿಷಿಯೊಬ್ಬರು ನೇರ ಪ್ರಸಾರವಾದಾಗ, ಅವರು ಇಲ್ಲಿ ಕಾಣಿಸಿಕೊಳ್ಳುತ್ತಾರೆ. ರಿಫ್ರೆಶ್ ಮಾಡಲು ಕೆಳಗೆ ಎಳೆಯಿರಿ - ಅಥವಾ ಅಧಿಸೂಚನೆಗಾಗಿ ನೋಡಿ.';

  @override
  String get justNow => 'ಇದೀಗ';

  @override
  String get couldNotLoad => 'ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get continueLabel => 'ಮುಂದುವರಿಸಿ';

  @override
  String get openSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get somePermissionsAreBlockedTapA =>
      'ಕೆಲವು ಅನುಮತಿಗಳನ್ನು ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ. ನಿರ್ಬಂಧಿಸಲಾದ ಐಟಂ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ (ಅಥವಾ \"ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ\") ಮತ್ತು ಅದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ, ನಂತರ ಇಲ್ಲಿಗೆ ಹಿಂತಿರುಗಿ.';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return '$appName ಬಳಸಲು ಈ ಅನುಮತಿಗಳು ಅಗತ್ಯವಿದೆ. ಅದನ್ನು ನೀಡಲು ಯಾವುದೇ ಬಾಕಿ ಇರುವ ಐಟಂ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';
  }

  @override
  String get settings2 => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get allow => 'ಅನುಮತಿಸಿ';

  @override
  String get blockedEnableItInSettings =>
      'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ — ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get allowsUpTo => 'ವರೆಗೆ ಅನುಮತಿಸುತ್ತದೆ';

  @override
  String get bookingFailed => 'ಬುಕಿಂಗ್ ವಿಫಲವಾಗಿದೆ';

  @override
  String get yourDetails => 'ನಿಮ್ಮ ವಿವರಗಳು';

  @override
  String get fromYourProfile => 'ನಿಮ್ಮ ಪ್ರೊಫೈಲ್‌ನಿಂದ';

  @override
  String get familyMembers => 'ಕುಟುಂಬ ಸದಸ್ಯರು';

  @override
  String get addMember => 'ಸದಸ್ಯರನ್ನು ಸೇರಿಸಿ';

  @override
  String get addAnother => 'ಇನ್ನೊಂದನ್ನು ಸೇರಿಸಿ';

  @override
  String get preferredDateOptional => 'ಆದ್ಯತೆಯ ದಿನಾಂಕ (ಐಚ್ಛಿಕ)';

  @override
  String get anyDate => 'ಯಾವುದೇ ದಿನಾಂಕ';

  @override
  String get bookNowFree => 'ಈಗಲೇ ಬುಕ್ ಮಾಡಿ (ಉಚಿತ)';

  @override
  String get couldNotLoadThisPooja => 'ಈ ಪೂಜೆಯನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get forLabel => 'ಫಾರ್';

  @override
  String get s1Person => '1 ವ್ಯಕ್ತಿ';

  @override
  String get bookShareDetails => 'ವಿವರಗಳನ್ನು ಬುಕ್ ಮಾಡಿ ಮತ್ತು ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get confirmYourBookingWithTheNames =>
      'ಪೂಜೆ ನಡೆಯುವ ಹೆಸರುಗಳೊಂದಿಗೆ ನಿಮ್ಮ ಬುಕಿಂಗ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ.';

  @override
  String get panditCoordinates => 'ಪಂಡಿತ್ ನಿರ್ದೇಶಾಂಕಗಳು';

  @override
  String get aVerifiedPanditCallsToFix =>
      'ಒಬ್ಬ ದೃಢೀಕೃತ ಪಂಡಿತರು ಸಮಯವನ್ನು ನಿಗದಿಪಡಿಸಲು ಮತ್ತು ಸಮಗ್ರಿಯನ್ನು ವ್ಯವಸ್ಥೆ ಮಾಡಲು ಕರೆ ಮಾಡುತ್ತಾರೆ.';

  @override
  String get poojaPerformed => 'ಪೂಜಾ ನೆರವೇರಿಸಿದರು';

  @override
  String get sankalpIsTakenInYourFamily =>
      'ಸಂಕಲ್ಪವನ್ನು ನಿಮ್ಮ ಕುಟುಂಬದ ಹೆಸರಿನಲ್ಲಿ ತೆಗೆದುಕೊಳ್ಳಲಾಗುತ್ತದೆ, ಮತ್ತು ನಂತರ ಅನ್ವಯವಾಗುವ ಕಡೆ ಪ್ರಸಾದವನ್ನು ಹಂಚಿಕೊಳ್ಳಲಾಗುತ್ತದೆ.';

  @override
  String get couldNotLoadPoojas => 'ಪೂಜೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get any => 'ಯಾವುದೇ';

  @override
  String get noPoojasHere => 'ಇಲ್ಲಿ ಪೂಜೆಗಳಿಲ್ಲ.';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'ಪ್ರಸ್ತುತ ಫಿಲ್ಟರ್‌ಗಳಿಗೆ ಯಾವುದೂ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ.';

  @override
  String get noPoojasAvailableYet => 'ಇನ್ನೂ ಯಾವುದೇ ಪೂಜೆಗಳು ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get showAllPoojas => 'ಎಲ್ಲಾ ಪೂಜೆಗಳನ್ನು ತೋರಿಸಿ';

  @override
  String get tapToViewDetailsBook =>
      'ವಿವರಗಳನ್ನು ವೀಕ್ಷಿಸಲು ಮತ್ತು ಬುಕ್ ಮಾಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get appliedYouBothEarnOnYour =>
      'ಅನ್ವಯಿಸಲಾಗಿದೆ! ನಿಮ್ಮ ಮೊದಲ ರೀಚಾರ್ಜ್‌ನಲ್ಲಿ ನೀವಿಬ್ಬರೂ ಗಳಿಸುತ್ತೀರಿ.';

  @override
  String get shareYourCode => 'ನಿಮ್ಮ ಕೋಡ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get sendYourCodeToFriendsVia =>
      'ನಿಮ್ಮ ಕೋಡ್ ಅನ್ನು ಸ್ನೇಹಿತರಿಗೆ WhatsApp, SMS ಮೂಲಕ ಎಲ್ಲಿ ಬೇಕಾದರೂ ಕಳುಹಿಸಿ.';

  @override
  String get friendSignsUp => 'ಸ್ನೇಹಿತ ಸೈನ್ ಅಪ್ ಮಾಡುತ್ತಾನೆ';

  @override
  String get theyEnterYourCodeInRefer =>
      'ಸೈನ್ ಅಪ್ ಮಾಡಿದ ನಂತರ ಅವರು ನಿಮ್ಮ ಕೋಡ್ ಅನ್ನು Refer & Earn ನಲ್ಲಿ ನಮೂದಿಸುತ್ತಾರೆ.';

  @override
  String get feedbackReceived => 'ಪ್ರತಿಕ್ರಿಯೆ ಸ್ವೀಕರಿಸಲಾಗಿದೆ ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'ಧನ್ಯವಾದಗಳು — ನಮ್ಮ ತಂಡವು ಇದನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ.';

  @override
  String get fullName => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get email => 'ಇಮೇಲ್';

  @override
  String get phoneNumber => 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ';

  @override
  String get message => 'ಸಂದೇಶ';

  @override
  String get requiredLabel => 'ಅಗತ್ಯವಿದೆ';

  @override
  String get applicationReceived => 'ಅರ್ಜಿ ಸ್ವೀಕರಿಸಲಾಗಿದೆ ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'ನಮ್ಮ ತಂಡವು ನಿಮ್ಮ ಜ್ಯೋತಿಷಿ ಪ್ರೊಫೈಲ್ ಬಗ್ಗೆ ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ.';

  @override
  String get enter10Digits => '10 ಅಂಕೆಗಳನ್ನು ನಮೂದಿಸಿ';

  @override
  String get aboutYouBioExpertiseExperience =>
      'ನಿಮ್ಮ ಬಗ್ಗೆ (ಜೀವನ ಚರಿತ್ರೆ, ಪರಿಣತಿ, ಅನುಭವ)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appName ವೃತ್ತಿಜೀವನದ ಮಾರ್ಗದರ್ಶನಕ್ಕಾಗಿ ನಿಮ್ಮನ್ನು ವಿಶ್ವಾಸಾರ್ಹ ವೈದಿಕ ಜ್ಯೋತಿಷಿಗಳೊಂದಿಗೆ ಸಂಪರ್ಕಿಸುತ್ತದೆ,';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'ಮದುವೆ, ಹಣಕಾಸು, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವನದ ದೊಡ್ಡ ಪ್ರಶ್ನೆಗಳು - ಚಾಟ್, ಕರೆ ಮತ್ತು ವೀಡಿಯೊ ಮೂಲಕ.';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'ನಿಮ್ಮ ಉಚಿತ ಕುಂಡಲಿ, ದೈನಂದಿನ ಜಾತಕ, ಮದುವೆ, ಪೂಜೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳನ್ನು ಒಂದೇ ಸ್ಥಳದಲ್ಲಿ ಪಡೆಯಿರಿ.\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'ನಮ್ಮ ಧ್ಯೇಯವೆಂದರೆ ಅಧಿಕೃತ, ಸಹಾನುಭೂತಿಯ ಆಧ್ಯಾತ್ಮಿಕ ಮಾರ್ಗದರ್ಶನವನ್ನು ಎಲ್ಲರಿಗೂ ಲಭ್ಯವಾಗುವಂತೆ ಮಾಡುವುದು,';

  @override
  String get inYourOwnLanguage => 'ನಿಮ್ಮ ಸ್ವಂತ ಭಾಷೆಯಲ್ಲಿ.';

  @override
  String get verifiedExperiencedAstrologers => 'ಪರಿಶೀಲಿಸಿದ, ಅನುಭವಿ ಜ್ಯೋತಿಷಿಗಳು';

  @override
  String get privateSecureConsultations => 'ಖಾಸಗಿ ಮತ್ತು ಸುರಕ್ಷಿತ ಸಮಾಲೋಚನೆಗಳು';

  @override
  String get availableIn6IndianLanguages => '6 ಭಾರತೀಯ ಭಾಷೆಗಳಲ್ಲಿ ಲಭ್ಯವಿದೆ';

  @override
  String get thanksForRatingUs => 'ನಮಗೆ ರೇಟಿಂಗ್ ನೀಡಿದ್ದಕ್ಕಾಗಿ ಧನ್ಯವಾದಗಳು ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆ $appName ಬೆಳೆಯಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';
  }

  @override
  String get onceInADay => 'ದಿನಕ್ಕೆ ಒಮ್ಮೆ';

  @override
  String get twiceInADay => 'ದಿನಕ್ಕೆ ಎರಡು ಬಾರಿ';

  @override
  String get asManyTimesAsItComes => 'ಎಷ್ಟು ಬಾರಿ ಬಂದರೂ';

  @override
  String get never => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String get cricket => 'ಕ್ರಿಕೆಟ್';

  @override
  String get shareMarket => 'ಷೇರು ಮಾರುಕಟ್ಟೆ';

  @override
  String get bollywood => 'ಬಾಲಿವುಡ್';

  @override
  String get newMagazine => 'ಹೊಸ ಪತ್ರಿಕೆ';

  @override
  String get festivals => 'ಹಬ್ಬಗಳು';

  @override
  String get notificationsUpdated => 'ಅಧಿಸೂಚನೆಗಳನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ ✓';

  @override
  String get youLlHearFromUsBased =>
      'ನಿಮ್ಮ ಆಯ್ಕೆಗಳ ಆಧಾರದ ಮೇಲೆ ನೀವು ನಮ್ಮಿಂದ ಕೇಳುತ್ತೀರಿ.';

  @override
  String get yourChartsWillNowFollowYour =>
      'ನಿಮ್ಮ ಚಾರ್ಟ್‌ಗಳು ಈಗ ನೀವು ಆಯ್ಕೆ ಮಾಡಿದ ಶೈಲಿಯನ್ನು ಅನುಸರಿಸುತ್ತವೆ.';

  @override
  String get chartStyle => 'ಚಾರ್ಟ್ ಶೈಲಿ';

  @override
  String get northIndian => 'ಉತ್ತರ ಭಾರತೀಯ';

  @override
  String get southIndian => 'ದಕ್ಷಿಣ ಭಾರತೀಯ';

  @override
  String get monthSystem => 'ತಿಂಗಳ ವ್ಯವಸ್ಥೆ';

  @override
  String get amanta => 'ಅಮಂತ';

  @override
  String get purnimanta => 'ಪೂರ್ಣಿಮಂತ';

  @override
  String get darkMode => 'ಕತ್ತಲೆ ಮೋಡ್';

  @override
  String get off => 'ಆಫ್';

  @override
  String get onLabel => 'ಆನ್';

  @override
  String get useDeviceSettings => 'ಸಾಧನ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಬಳಸಿ';

  @override
  String get ayanamsa => 'ಅಯನಾಂಶ';

  @override
  String get nCLahiri => 'ಎನ್.ಸಿ. ಲಹಿರಿ';

  @override
  String get kpNew => 'ಕೆಪಿ ನ್ಯೂ';

  @override
  String get kpOld => 'ಕೆ.ಪಿ. ಓಲ್ಡ್';

  @override
  String get raman => 'ರಾಮನ್';

  @override
  String get kpKhullar => 'ಕೆ.ಪಿ. ಖುಲ್ಲರ್';

  @override
  String get subtotal => 'ಉಪಮೊತ್ತ';

  @override
  String get youSave => 'ನೀವು ಉಳಿಸಿ';

  @override
  String get total => 'ಒಟ್ಟು';

  @override
  String get deliveryAddress => 'ತಲುಪಿಸುವ ವಿಳಾಸ';

  @override
  String get orderSummary => 'ಆರ್ಡರ್ ಸಾರಾಂಶ';

  @override
  String get couponsOffers => 'ಕೂಪನ್‌ಗಳು ಮತ್ತು ಕೊಡುಗೆಗಳು';

  @override
  String get billDetails => 'ಬಿಲ್ ವಿವರಗಳು';

  @override
  String get address => 'ವಿಳಾಸ';

  @override
  String get productDiscount => 'ಉತ್ಪನ್ನ ರಿಯಾಯಿತಿ';

  @override
  String get itemsSubtotal => 'ಐಟಂಗಳ ಉಪಮೊತ್ತ';

  @override
  String get delivery => 'ವಿತರಣೆ';

  @override
  String get free2 => 'ಉಚಿತ';

  @override
  String get toPay => 'ಪಾವತಿಸಲು';

  @override
  String get dMmmYyyyHMmA => 'd ತಿಮ್ಮಮ್ಮ ವವವವ, ಗಂ:ತಿಮ್ಮ a';

  @override
  String get couldNotDownloadInvoice =>
      'ಇನ್‌ವಾಯ್ಸ್ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get orderNotFound => 'ಆರ್ಡರ್ ಕಂಡುಬಂದಿಲ್ಲ.';

  @override
  String get activityTimeline => 'ಚಟುವಟಿಕೆಯ ಕಾಲರೇಖೆ';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM ವವವ · ಗಂ:ನಿಮಿ a';

  @override
  String get totalPaid => 'ಒಟ್ಟು ಪಾವತಿಸಲಾಗಿದೆ';

  @override
  String get orderPlaced2 => 'ಆರ್ಡರ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get dMmmHMmA => 'd MMM, ಗಂ:mm a';

  @override
  String get generating => 'ಉತ್ಪಾದಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get pleaseDescribeTheIssue => 'ದಯವಿಟ್ಟು ಸಮಸ್ಯೆಯನ್ನು ವಿವರಿಸಿ.';

  @override
  String get couldNotLoadProducts => 'ಉತ್ಪನ್ನಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ.';

  @override
  String get newest => 'ಹೊಸತು';

  @override
  String get priceLowHigh => 'ಬೆಲೆ: ಕಡಿಮೆ → ಹೆಚ್ಚು';

  @override
  String get priceHighLow => 'ಬೆಲೆ: ಹೆಚ್ಚು → ಕಡಿಮೆ';

  @override
  String get topRated => 'ಅತ್ಯುತ್ತಮ ರೇಟಿಂಗ್ ಪಡೆದಿರುವುದು';

  @override
  String get s6DigitPin => '6-ಅಂಕಿಯ ಪಿನ್';

  @override
  String get addressLine1 => 'ವಿಳಾಸ ಸಾಲು 1 *';

  @override
  String get addressLine2 => 'ವಿಳಾಸ ಸಾಲು 2';

  @override
  String get city => 'ನಗರ *';

  @override
  String get state => 'ರಾಜ್ಯ *';

  @override
  String get pinCode => 'ಪಿನ್ ಕೋಡ್ *';

  @override
  String get payment => 'ಪಾವತಿ';

  @override
  String get pooja => 'ಪೂಜಾ';

  @override
  String get shop => 'ಅಂಗಡಿ';

  @override
  String get securePayment => 'ಸುರಕ್ಷಿತ ಪಾವತಿ';

  @override
  String get noTransactionsMatchTheseFilters =>
      'ಈ ಫಿಲ್ಟರ್‌ಗಳಿಗೆ ಹೊಂದಿಕೆಯಾಗುವ ಯಾವುದೇ ವಹಿವಾಟುಗಳಿಲ್ಲ.';

  @override
  String get noTransactionsYet => 'ಇನ್ನೂ ಯಾವುದೇ ವಹಿವಾಟುಗಳಿಲ್ಲ';

  @override
  String get moneyAdded => 'ಹಣ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get poojaBooking => 'ಪೂಜಾ ಬುಕಿಂಗ್';

  @override
  String get videoCall => 'ವೀಡಿಯೊ ಕರೆ';

  @override
  String get shopOrder => 'ಅಂಗಡಿ ಆದೇಶ';

  @override
  String get refund => 'ಮರುಪಾವತಿ';

  @override
  String get bonus => 'ಬೋನಸ್';

  @override
  String get credited => 'ಕ್ರೆಡಿಟ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get debited => 'ಡೆಬಿಟ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get rg => 'ಅ';

  @override
  String aExperienceyearsYrsExp(Object experienceYears) {
    return '$experienceYears ವರ್ಷಗಳ ಅವಧಿ';
  }

  @override
  String weLlLetYouKnowWhen2(Object name, Object reason) {
    return '$name $reason ಆದಾಗ ನಾವು ನಿಮಗೆ ತಿಳಿಸುತ್ತೇವೆ.';
  }

  @override
  String priceMin(Object price) {
    return '₹$price/ನಿಮಿಷ';
  }

  @override
  String n1000000Tostringasfixed1M(Object toStringAsFixed) {
    return '$toStringAsFixedಮಿ';
  }

  @override
  String n1000Tostringasfixed1K(Object toStringAsFixed) {
    return '$toStringAsFixedಸಾ';
  }

  @override
  String nameIsATrustedAstrologerWith(Object name, Object desc) {
    return '$name ಅವರು $desc ನಲ್ಲಿ ಆಳವಾದ ಪರಿಣತಿಯನ್ನು ಹೊಂದಿರುವ ವಿಶ್ವಾಸಾರ್ಹ ಜ್ಯೋತಿಷಿ. ವೇದಿಕೆಯಲ್ಲಿ ವರ್ಷಗಳ ಅಭ್ಯಾಸದಿಂದ,';
  }

  @override
  String chatMin(Object chat) {
    return '₹$chat/ನಿಮಿಷ';
  }

  @override
  String callMin(Object call) {
    return '₹$call/ನಿಮಿಷ';
  }

  @override
  String videoMin(Object video) {
    return '₹$video/ನಿಮಿಷ';
  }

  @override
  String widgetNameIsLive(Object name) {
    return '$name ಲೈವ್ ಆಗಿದೆ';
  }

  @override
  String widgetNameIsInASession(Object name) {
    return '$name ಇದೀಗ ಸೆಷನ್‌ನಲ್ಲಿದೆ.';
  }

  @override
  String widgetNameIsOfflineRightNow(Object name) {
    return '$name ಇದೀಗ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದೆ.';
  }

  @override
  String storeFollowers1000Tostringasfixed1K(Object toStringAsFixed) {
    return '$toStringAsFixedಸಾ';
  }

  @override
  String maxPriceMaxpriceRoundMin(Object round) {
    return 'ಗರಿಷ್ಠ ಬೆಲೆ · ₹$round/ನಿಮಿಷ';
  }

  @override
  String sendTotalTokens(Object total) {
    return 'ಕಳುಹಿಸಿ · $total ಟೋಕನ್‌ಗಳು';
  }

  @override
  String sTypeTouppercaseLive(Object toUpperCase) {
    return '$toUpperCase · ಲೈವ್';
  }

  @override
  String widgetAstrologernameChatHistory(Object astrologerName) {
    return '$astrologerName · ಚಾಟ್ ಇತಿಹಾಸ';
  }

  @override
  String dailyAtRTimeofdayFor14(Object timeOfDay) {
    return 'ಪ್ರತಿದಿನ $timeOfDay ಕ್ಕೆ · 14 ದಿನಗಳವರೆಗೆ';
  }

  @override
  String onRDate(Object date) {
    return '$date ರಂದು';
  }

  @override
  String durSDurationsecSTotalamountCoins(
      Object durationSec, Object totalAmount) {
    return '$durationSec · $totalAmount ನಾಣ್ಯಗಳು';
  }

  @override
  String aboutMinutesleftMinLeft(Object minutesLeft) {
    return 'ಸುಮಾರು $minutesLeft ನಿಮಿಷ ಉಳಿದಿದೆ';
  }

  @override
  String nearbyPermissionPerm(Object perm) {
    return '[ಹತ್ತಿರ] ಅನುಮತಿ = $perm';
  }

  @override
  String nearbyGetcurrentpositionFailedETryingLast(Object e) {
    return '[ಹತ್ತಿರದಲ್ಲಿ] getCurrentPosition ವಿಫಲವಾಗಿದೆ: $e — ಕೊನೆಯದಾಗಿ ತಿಳಿದಿರುವ ಪ್ರಯತ್ನ';
  }

  @override
  String nearbyPositionPosLatitudePosLongitude(
      Object latitude, Object longitude) {
    return '[ಹತ್ತಿರದ] ಸ್ಥಾನ = $latitude, $longitude';
  }

  @override
  String nearbyReversegeocodeCityCity(Object city) {
    return '[ಹತ್ತಿರ] ರಿವರ್ಸ್ ಜಿಯೋಕೋಡ್ ನಗರ = \"$city\"';
  }

  @override
  String nearbyResolveErrorE(Object e) {
    return '[ಹತ್ತಿರದಲ್ಲಿ] ಪರಿಹಾರ ದೋಷ: $e';
  }

  @override
  String resumeSessionClock(Object clock) {
    return 'ರೆಸ್ಯೂಮ್ · $clock';
  }

  @override
  String rateperminMin(Object ratePerMin) {
    return '₹$ratePerMin/ನಿಮಿಷ';
  }

  @override
  String checkYourConnectionAndTryAgain(Object error) {
    return 'ನಿಮ್ಮ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಹಾಗೂ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.\n($error)';
  }

  @override
  String diffInminutesMAgo(Object inMinutes) {
    return '$inMinutesನಿ ಹಿಂದೆ';
  }

  @override
  String diffInhoursHAgo(Object inHours) {
    return '$inHoursಗಂ ಹಿಂದೆ';
  }

  @override
  String diffIndaysDAgo(Object inDays) {
    return '$inDaysದಿ ಹಿಂದೆ';
  }

  @override
  String thisPoojaCostsWidgetPoojaBaseprice(Object basePrice) {
    return 'ಈ ಪೂಜೆಗೆ ₹$basePrice ವೆಚ್ಚವಾಗುತ್ತದೆ. ನಿಮ್ಮ ವ್ಯಾಲೆಟ್‌ನಲ್ಲಿ ಸಾಕಷ್ಟು ಬ್ಯಾಲೆನ್ಸ್ ಇಲ್ಲ — ಹಣವನ್ನು ಸೇರಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';
  }

  @override
  String payWidgetPoojaBasepriceBook(Object basePrice) {
    return '₹$basePrice ಪಾವತಿಸಿ ಬುಕ್ ಮಾಡಿ';
  }

  @override
  String upToPMaxpersons(Object maxPersons) {
    return '$maxPersons ವರೆಗೆ';
  }

  @override
  String aSacredPNamePerformedBy(Object name) {
    return 'ಅನುಭವಿ ಪಂಡಿತರು ನಿರ್ವಹಿಸುವ ಪವಿತ್ರ $name. ಸ್ಲಾಟ್ ಬುಕ್ ಮಾಡಿ, ನಮ್ಮ ತಂಡವು ವಿವರಗಳು ಮತ್ತು ಸಮಯವನ್ನು ಸಂಯೋಜಿಸಲು ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುತ್ತದೆ.';
  }

  @override
  String upToPoojaMaxpersons(Object maxPersons) {
    return '$maxPersons ವರೆಗೆ';
  }

  @override
  String earnIRewardOnRudraganga(Object reward, String appName) {
    return '$appName ನಲ್ಲಿ ₹$reward ಗಳಿಸಿ';
  }

  @override
  String bothEarnIReward(Object reward) {
    return 'ಇಬ್ಬರೂ ₹$reward ಗಳಿಸುತ್ತಾರೆ';
  }

  @override
  String onTheirFirstWalletRechargeYou(Object reward) {
    return 'ಅವರ ಮೊದಲ ವ್ಯಾಲೆಟ್ ರೀಚಾರ್ಜ್‌ನಲ್ಲಿ, ನೀವಿಬ್ಬರೂ ತಕ್ಷಣ ₹$reward ಪಡೆಯುತ್ತೀರಿ.';
  }

  @override
  String rechargeTotalBalance(Object balance) {
    return '₹$balance ರೀಚಾರ್ಜ್ ಮಾಡಿ';
  }

  @override
  String itemTotalMrpQtycount(Object qtyCount) {
    return 'ಒಟ್ಟು ಐಟಂ (MRP) · $qtyCount';
  }

  @override
  String couponAppliedCode(Object code) {
    return 'ಕೂಪನ್ ($code)';
  }

  @override
  String placeOrderTotal(Object total) {
    return 'ಪ್ಲೇಸ್ ಆರ್ಡರ್ · ₹$total';
  }

  @override
  String pPriceWasPMrp(Object price, Object mrp) {
    return '₹$price (₹$mrp ಆಗಿತ್ತು)';
  }

  @override
  String pNamePricelineUrl(Object name, Object priceLine, Object url) {
    return '$name â $priceLine\n$url';
  }

  @override
  String ytWebviewErrorEErrorcodeE(Object errorCode, Object description) {
    return 'YT ವೆಬ್‌ವೀಕ್ಷಣೆ ದೋಷ: $errorCode $description';
  }

  @override
  String rgpayHttpErrorEResponseStatuscode(Object statusCode) {
    return 'RGPAY http ದೋಷ: $statusCode';
  }

  @override
  String rgpayResourceErrorEErrorcodeE(Object errorCode, Object description) {
    return 'RGPAY ಸಂಪನ್ಮೂಲ ದೋಷ: $errorCode $description';
  }
}
