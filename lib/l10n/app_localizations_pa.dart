// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class L10nPa extends L10n {
  L10nPa([String locale = 'pa']) : super(locale);

  @override
  String get appName => 'Astro App';

  @override
  String get tagline => 'ਜੋਤਿਸ਼ ਅਤੇ ਤੰਦਰੁਸਤੀ';

  @override
  String get splashBlessing => 'ਸਪਸ਼ਟਤਾ ਵੱਲ ਤੁਹਾਡਾ ਸਫ਼ਰ ਇੱਥੋਂ ਸ਼ੁਰੂ ਹੁੰਦਾ ਹੈ';

  @override
  String get authWelcomeTitle => 'ਜੀ ਆਇਆਂ ਨੂੰ';

  @override
  String get authWelcomeSubtitle =>
      'ਆਪਣੇ ਫ਼ੋਨ ਨੰਬਰ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰੋ ਜਾਂ ਖਾਤਾ ਬਣਾਓ';

  @override
  String get phoneLabel => 'ਫ਼ੋਨ ਨੰਬਰ';

  @override
  String get phoneHint => '10 ਅੰਕਾਂ ਦਾ ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'ਅੱਗੇ ਵਧੋ';

  @override
  String get sendOtpButton => 'OTP ਭੇਜੋ';

  @override
  String get otpTitle => 'ਆਪਣਾ ਨੰਬਰ ਤਸਦੀਕ ਕਰੋ';

  @override
  String otpSubtitle(String phone) {
    return '$phone \'ਤੇ ਭੇਜਿਆ 6 ਅੰਕਾਂ ਦਾ ਕੋਡ ਦਰਜ ਕਰੋ';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'ਤਸਦੀਕ ਕਰੋ ਅਤੇ ਅੱਗੇ ਵਧੋ';

  @override
  String get resendOtp => 'ਕੋਡ ਮੁੜ ਭੇਜੋ';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds ਸਕਿੰਟਾਂ ਵਿੱਚ ਮੁੜ ਭੇਜੋ';
  }

  @override
  String get changeNumber => 'ਨੰਬਰ ਬਦਲੋ';

  @override
  String get termsNotice =>
      'ਅੱਗੇ ਵਧਣ \'ਤੇ ਤੁਸੀਂ ਸਾਡੀਆਂ ਸ਼ਰਤਾਂ ਅਤੇ ਪਰਦੇਦਾਰੀ ਨੀਤੀ ਨਾਲ ਸਹਿਮਤ ਹੋ';

  @override
  String get acceptPrefix => 'ਮੈਂ ਸਹਿਮਤ ਹਾਂ';

  @override
  String get acceptAnd => 'ਅਤੇ';

  @override
  String get termsOfService => 'ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get privacyPolicy => 'ਪਰਦੇਦਾਰੀ ਨੀਤੀ';

  @override
  String get errInvalidPhone => 'ਇੱਕ ਵੈਧ 10 ਅੰਕਾਂ ਦਾ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get errInvalidOtp => '6 ਅੰਕਾਂ ਦਾ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get errGeneric => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errNetwork =>
      'ਕੋਈ ਕੁਨੈਕਸ਼ਨ ਨਹੀਂ। ਆਪਣਾ ਇੰਟਰਨੈੱਟ ਜਾਂਚੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get otpSent => 'OTP ਭੇਜਿਆ ਗਿਆ';

  @override
  String get loginSuccess => 'ਸਾਈਨ ਇਨ ਹੋ ਗਏ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get themeSystem => 'ਸਿਸਟਮ';

  @override
  String get themeLight => 'ਲਾਈਟ';

  @override
  String get themeDark => 'ਡਾਰਕ';

  @override
  String homeWelcome(String name) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ, $name';
  }

  @override
  String get logout => 'ਲੌਗ ਆਊਟ';

  @override
  String get onbTitle => 'ਸਾਨੂੰ ਆਪਣੇ ਬਾਰੇ ਦੱਸੋ';

  @override
  String get onbSubtitle =>
      'ਇਸ ਨਾਲ ਅਸੀਂ ਤੁਹਾਡੇ ਲਈ ਬਿਹਤਰ ਭਵਿੱਖਬਾਣੀ ਕਰ ਸਕਦੇ ਹਾਂ। ਕੁਝ ਵੀ ਲਾਜ਼ਮੀ ਨਹੀਂ — ਤੁਸੀਂ ਬਾਅਦ ਵਿੱਚ ਵੀ ਪੂਰਾ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get onbName => 'ਤੁਹਾਡਾ ਨਾਮ';

  @override
  String get onbAddPhoto => 'ਫੋਟੋ ਜੋੜੋ';

  @override
  String get onbChangePhoto => 'ਫੋਟੋ ਬਦਲੋ';

  @override
  String get onbGender => 'ਲਿੰਗ';

  @override
  String get genderMale => 'ਪੁਰਸ਼';

  @override
  String get genderFemale => 'ਔਰਤ';

  @override
  String get genderOther => 'ਹੋਰ';

  @override
  String get onbDob => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get onbTob => 'ਜਨਮ ਸਮਾਂ';

  @override
  String get onbDontKnowTime => 'ਮੈਨੂੰ ਆਪਣਾ ਜਨਮ ਸਮਾਂ ਨਹੀਂ ਪਤਾ';

  @override
  String get onbPob => 'ਜਨਮ ਸਥਾਨ';

  @override
  String get onbPobHint => 'ਆਪਣਾ ਜਨਮ ਸ਼ਹਿਰ ਖੋਜੋ';

  @override
  String get onbLanguage => 'ਪਸੰਦੀਦਾ ਭਾਸ਼ਾ';

  @override
  String get onbSelectDate => 'ਮਿਤੀ ਚੁਣੋ';

  @override
  String get onbSelectTime => 'ਸਮਾਂ ਚੁਣੋ';

  @override
  String get onbSkip => 'ਹੁਣੇ ਛੱਡੋ';

  @override
  String get onbFinish => 'ਪੂਰਾ ਕਰੋ';

  @override
  String get onbSaved => 'ਪ੍ਰੋਫਾਈਲ ਸੰਭਾਲੀ ਗਈ';

  @override
  String get completeProfile => 'ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਪੂਰੀ ਕਰੋ';

  @override
  String get completeProfileCta => 'ਸੈੱਟਅੱਪ ਪੂਰਾ ਕਰੋ';

  @override
  String get permTitle => 'ਕੁਝ ਇਜਾਜ਼ਤਾਂ';

  @override
  String get permSubtitle =>
      'ਤਾਂ ਜੋ ਕਾਲਾਂ, ਸੂਚਨਾਵਾਂ ਅਤੇ ਫੋਟੋਆਂ ਠੀਕ ਚੱਲਣ। ਤੁਸੀਂ ਕਦੇ ਵੀ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹੋ।';

  @override
  String get permNotifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get permNotificationsDesc => 'ਸਲਾਹ ਅਲਰਟ, ਆਰਡਰ ਅੱਪਡੇਟ ਅਤੇ ਯਾਦ-ਪੱਤਰ';

  @override
  String get permMic => 'ਮਾਈਕ੍ਰੋਫੋਨ';

  @override
  String get permMicDesc => 'ਜੋਤਸ਼ੀਆਂ ਨਾਲ ਵੌਇਸ ਕਾਲਾਂ ਲਈ';

  @override
  String get permCamera => 'ਕੈਮਰਾ';

  @override
  String get permCameraDesc => 'ਵੀਡੀਓ ਕਾਲਾਂ ਅਤੇ ਫੋਟੋ ਅੱਪਲੋਡ ਲਈ';

  @override
  String get permPhotos => 'ਫੋਟੋਆਂ';

  @override
  String get permPhotosDesc => 'ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਤਸਵੀਰ ਸੈੱਟ ਕਰਨ ਲਈ';

  @override
  String get permAllow => 'ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get permContinue => 'ਅੱਗੇ ਵਧੋ';

  @override
  String get permLocation => 'ਟਿਕਾਣਾ';

  @override
  String get permLocationDesc => 'ਤੁਹਾਡੇ ਨੇੜੇ ਦੇ ਜੋਤਸ਼ੀ ਲੱਭੋ';

  @override
  String get secFeatured => 'ਵਿਸ਼ੇਸ਼ ਜੋਤਸ਼ੀ';

  @override
  String get secNearby => 'ਨੇੜਲੇ ਜੋਤਸ਼ੀ';

  @override
  String get secCallChat => 'ਕਾਲ ਤੇ ਚੈਟ';

  @override
  String get secAiAstro => 'AI ਜੋਤਸ਼ੀ';

  @override
  String get secProducts => 'ਉਤਪਾਦ';

  @override
  String get secVideos => 'ਵੀਡੀਓ';

  @override
  String get secLessons => 'ਜੋਤਿਸ਼ ਪਾਠ';

  @override
  String get secOthers => 'ਹੋਰ';

  @override
  String get secHistory => 'ਤੁਹਾਡੀਆਂ ਸਲਾਹਾਂ';

  @override
  String get seeAll => 'ਸਭ ਵੇਖੋ';

  @override
  String get basedOnLocation => 'ਤੁਹਾਡੇ ਟਿਕਾਣੇ ਅਨੁਸਾਰ';

  @override
  String get shareApp => 'ਦੋਸਤਾਂ ਨਾਲ ਐਪ ਸਾਂਝੀ ਕਰੋ';

  @override
  String get startReadingHint =>
      'ਹਾਲੇ ਕੋਈ ਸਲਾਹ ਨਹੀਂ। ਆਪਣੀ ਪਹਿਲੀ ਰੀਡਿੰਗ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get startBtn => 'ਸ਼ੁਰੂ';

  @override
  String get namaste => 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ';

  @override
  String get kFreeKundli => 'ਮੁਫ਼ਤ ਕੁੰਡਲੀ';

  @override
  String get kMatching => 'ਮੇਲ';

  @override
  String get kBrihat => 'ਬ੍ਰਿਹਤ ਕੁੰਡਲੀ';

  @override
  String get kKundliAi => 'ਕੁੰਡਲੀ AI+';

  @override
  String get tCareer => 'ਕਰੀਅਰ';

  @override
  String get tMarriage => 'ਵਿਆਹ';

  @override
  String get tFinance => 'ਵਿੱਤ';

  @override
  String get tHealth => 'ਸਿਹਤ';

  @override
  String get tEducation => 'ਸਿੱਖਿਆ';

  @override
  String get tTravel => 'ਯਾਤਰਾ';

  @override
  String get statusOnline => 'ਆਨਲਾਈਨ';

  @override
  String get statusBusy => 'ਰੁੱਝੇ';

  @override
  String get statusOffline => 'ਆਫਲਾਈਨ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get chatNow => 'ਹੁਣੇ ਚੈਟ ਕਰੋ';

  @override
  String get notifyMe => 'ਮੈਨੂੰ ਸੂਚਿਤ ਕਰੋ';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'ਇਹ ਜੋਤਸ਼ੀ ਅਜੇ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਕਰਨ ਲਈ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'ਆਪਣਾ ਪ੍ਰੋਫਾਈਲ ਪੂਰਾ ਕਰੋ';

  @override
  String get addYourDateTimePlaceOf =>
      'ਆਪਣੀ ਜਨਮ ਮਿਤੀ, ਸਮਾਂ ਅਤੇ ਸਥਾਨ ਸ਼ਾਮਲ ਕਰੋ ਤਾਂ ਜੋ ਜੋਤਸ਼ੀ ਤੁਹਾਨੂੰ ਸਪਸ਼ਟ ਪਾਠ ਦੇ ਸਕੇ।';

  @override
  String get completeProfile2 => 'ਪੂਰਾ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get skipForNow => 'ਹੁਣ ਲਈ ਛੱਡੋ';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'ਸਾਨੂੰ ਦੱਸੋ ਕਿਉਂ (ਵਿਕਲਪਿਕ) — ਇਹ ਸਾਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।';

  @override
  String get reasonOptional => 'ਕਾਰਨ (ਵਿਕਲਪਿਕ)';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get unfollow => 'ਅਨਫਾਲੋ ਕਰੋ';

  @override
  String get s21kReviews => '(2.1 ਹਜ਼ਾਰ ਸਮੀਖਿਆਵਾਂ)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'ਤੋਹਫ਼ਾ';

  @override
  String get store => 'ਸਟੋਰ';

  @override
  String get joinLiveSession => 'ਲਾਈਵ ਸੈਸ਼ਨ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get youLlBeNotified => 'ਤੁਹਾਨੂੰ ਸੂਚਿਤ ਕੀਤਾ ਜਾਵੇਗਾ।';

  @override
  String get thisStoreHasNoItemsYet => 'ਇਸ ਸਟੋਰ ਵਿੱਚ ਅਜੇ ਕੋਈ ਆਈਟਮ ਨਹੀਂ ਹੈ।';

  @override
  String get filters => 'ਫਿਲਟਰ';

  @override
  String get reset => 'ਰੀਸੈੱਟ';

  @override
  String get onlineNowOnly => 'ਹੁਣ ਸਿਰਫ਼ ਔਨਲਾਈਨ';

  @override
  String get applyFilters => 'ਫਿਲਟਰ ਲਾਗੂ ਕਰੋ';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'ਇਸ ਜੋਤਸ਼ੀ ਲਈ ਤੋਹਫ਼ੇ ਉਪਲਬਧ ਨਹੀਂ ਹਨ।';

  @override
  String needTotalcostYourBalanceIsWallet(Object totalCost, Object balance) {
    return 'Need ₹$totalCost — your balance is ₹$balance. Please recharge.';
  }

  @override
  String sentQtyGiftNameToWidget(
      Object _qty, Object name, Object astrologerName) {
    return 'Sent $_qty $name to $astrologerName 🎁';
  }

  @override
  String sendAGiftToWidgetAstrologername(Object astrologerName) {
    return 'Send a gift to $astrologerName';
  }

  @override
  String balanceContextWatchWalletproviderBalance(Object balance) {
    return 'Balance: ₹$balance';
  }

  @override
  String get recharge => 'ਰੀਚਾਰਜ ਕਰੋ';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'ਮਾਤਰਾ';

  @override
  String get min1Max100 => 'ਘੱਟੋ-ਘੱਟ 1 ਵੱਧ ਤੋਂ ਵੱਧ 100';

  @override
  String get comingSoon => 'ਆਨ ਵਾਲੀ';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'ਤੁਹਾਡੇ ਲਈ ਰੀਮਾਈਂਡਰ ਸੈੱਟ ਕੀਤੇ ਗਏ ਹਨ';

  @override
  String get suggestedForYou => 'ਤੁਹਾਡੇ ਲਈ ਸੁਝਾਇਆ ਗਿਆ';

  @override
  String get couldNotSendImage => 'ਚਿੱਤਰ ਨਹੀਂ ਭੇਜਿਆ ਜਾ ਸਕਿਆ';

  @override
  String get endConsultation => 'ਸਲਾਹ-ਮਸ਼ਵਰਾ ਖਤਮ ਕਰੀਏ?';

  @override
  String get thisWillEndTheChatAnd =>
      'ਇਸ ਨਾਲ ਚੈਟ ਖਤਮ ਹੋ ਜਾਵੇਗੀ ਅਤੇ ਬਿਲਿੰਗ ਬੰਦ ਹੋ ਜਾਵੇਗੀ।';

  @override
  String get keepChatting => 'ਗੱਲਬਾਤ ਕਰਦੇ ਰਹੋ';

  @override
  String get end => 'ਅੰਤ';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'ਸਵਿੱਚ ਕਰੋ';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'ਆਡੀਓ ਕਾਲ \'ਤੇ ਜਾਓ';

  @override
  String get switchToVideoCall => 'ਵੀਡੀਓ ਕਾਲ \'ਤੇ ਜਾਓ';

  @override
  String get endConsultation2 => 'ਸਲਾਹ-ਮਸ਼ਵਰਾ ਖਤਮ ਕਰੋ';

  @override
  String get sendAGift => 'ਤੋਹਫ਼ਾ ਭੇਜੋ';

  @override
  String get sayHello => 'ਹੈਲੋ ਕਹੋ 🙏';

  @override
  String get typeAMessage => 'ਸੁਨੇਹਾ ਟਾਈਪ ਕਰੋ...';

  @override
  String get recommendedProduct => 'ਸਿਫਾਰਸ਼ੀ ਉਤਪਾਦ';

  @override
  String get view => 'ਵੇਖੋ';

  @override
  String get connecting => 'ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get myConsultations => 'ਮੇਰੀਆਂ ਸਲਾਹ-ਮਸ਼ਵਰੇ';

  @override
  String get noConsultationsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਨਹੀਂ';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'ਚੈਟ ਵੇਖੋ';

  @override
  String get historyExpired => 'ਇਤਿਹਾਸ ਦੀ ਮਿਆਦ ਸਮਾਪਤ ਹੋ ਗਈ';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'ਜੋਤਸ਼ੀ ਨੂੰ ਫ਼ੋਨ ਕਰਨਾ';

  @override
  String get cancelRequest => 'ਬੇਨਤੀ ਰੱਦ ਕਰੋ';

  @override
  String get notNow => 'ਹਾਲੇ ਨਹੀਂ';

  @override
  String get thanksForYourFeedback => 'ਤੁਹਾਡੇ ਫੀਡਬੈਕ ਲਈ ਧੰਨਵਾਦ!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'ਸਪੁਰਦ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get consultationEnded => 'ਸਲਾਹ-ਮਸ਼ਵਰਾ ਖਤਮ ਹੋਇਆ';

  @override
  String get hopeYouGotTheClarityYou =>
      'ਉਮੀਦ ਹੈ ਕਿ ਤੁਹਾਨੂੰ ਉਹ ਸਪਸ਼ਟਤਾ ਮਿਲੀ ਹੈ ਜਿਸਦੀ ਤੁਸੀਂ ਭਾਲ ਕਰ ਰਹੇ ਸੀ।';

  @override
  String get shareYourExperienceOptional => 'ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰੋ (ਵਿਕਲਪਿਕ)';

  @override
  String get howWasTheCallQuality => 'ਕਾਲ ਦੀ ਗੁਣਵੱਤਾ ਕਿਵੇਂ ਸੀ?';

  @override
  String get skip => 'ਛੱਡੋ';

  @override
  String get submit => 'ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get viewProfile => 'ਪ੍ਰੋਫਾਈਲ ਵੇਖੋ';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'ਦੁਆਰਾ ਬਣਾਇਆ ਗਿਆ';

  @override
  String get devifai => 'ਡੇਵੀਫਏਆਈ';

  @override
  String get withLabel => '❤️ ਨਾਲ';

  @override
  String get leavingSoSoon => 'ਇੰਨੀ ਜਲਦੀ ਜਾ ਰਹੇ ਹੋ?';

  @override
  String get stayLoggedIn => 'ਲਾਗਇਨ ਰਹੋ';

  @override
  String get logOutAnyway => 'ਫਿਰ ਵੀ ਲੌਗ ਆਊਟ ਕਰੋ';

  @override
  String get noNearbyAstrologersYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਨੇੜੇ-ਤੇੜੇ ਜੋਤਸ਼ੀ ਨਹੀਂ ਹਨ।';

  @override
  String get bookAPooja => 'ਪੂਜਾ ਬੁੱਕ ਕਰੋ';

  @override
  String get panditLedPoojasAtYourChosen =>
      'ਤੁਹਾਡੀ ਚੁਣੀ ਹੋਈ ਮਿਤੀ \'ਤੇ ਪੰਡਿਤ ਦੀ ਅਗਵਾਈ ਹੇਠ ਪੂਜਾ';

  @override
  String get back => 'ਪਿੱਛੇ';

  @override
  String get connectingToLive => 'ਲਾਈਵ ਨਾਲ ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get live => 'ਲਾਈਵ';

  @override
  String get thisLiveHasEnded => 'ਇਹ ਲਾਈਵ ਖਤਮ ਹੋ ਗਿਆ ਹੈ।';

  @override
  String get backToLive => 'ਲਾਈਵ \'ਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get sayHelloBeTheFirstTo => 'ਹੈਲੋ ਕਹੋ 👋 ਟਿੱਪਣੀ ਕਰਨ ਵਾਲੇ ਪਹਿਲੇ ਬਣੋ';

  @override
  String get aiPollLive => 'ਏਆਈ ਪੋਲ · ਲਾਈਵ';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'ਇੱਕ ਟਿੱਪਣੀ ਸ਼ਾਮਲ ਕਰੋ…';

  @override
  String get send => 'ਭੇਜੋ';

  @override
  String get liveNow => 'ਹੁਣੇ ਲਾਈਵ';

  @override
  String get searchByAstrologerName => 'ਜੋਤਸ਼ੀ ਦੇ ਨਾਮ ਨਾਲ ਖੋਜ ਕਰੋ';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get join => 'ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get clearAllNotifications => 'ਸਾਰੀਆਂ ਸੂਚਨਾਵਾਂ ਕਲੀਅਰ ਕਰੀਏ?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'ਇਹ ਤੁਹਾਡੀਆਂ ਸਾਰੀਆਂ ਸੂਚਨਾਵਾਂ ਨੂੰ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦੇਵੇਗਾ।';

  @override
  String get clearAll => 'ਸਭ ਸਾਫ਼ ਕਰੋ';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get markAllRead => 'ਸਾਰੇ ਪੜ੍ਹੇ ਹੋਏ ਵਜੋਂ ਨਿਸ਼ਾਨਦੇਹੀ ਕਰੋ';

  @override
  String get noNotifications => 'ਕੋਈ ਸੂਚਨਾਵਾਂ ਨਹੀਂ';

  @override
  String get youReAllCaughtUp => 'ਤੁਸੀਂ ਸਭ ਕੁਝ ਸਮਝ ਲਿਆ ਹੈ।';

  @override
  String get nameIsRequired => 'ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get enterAValidPhone => 'ਇੱਕ ਵੈਧ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get bookingConfirmed => 'ਬੁਕਿੰਗ ਦੀ ਪੁਸ਼ਟੀ ਹੋ ਗਈ 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'ਬੁਕਿੰਗ ਅਸਫਲ ਰਹੀ, ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get addMoneyToContinue => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਪੈਸੇ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get addMoney => 'ਪੈਸੇ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'Book $name';
  }

  @override
  String get name => 'ਨਾਮ';

  @override
  String get phone => 'ਫ਼ੋਨ';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'Add the people this pooja is performed for (up to $_maxPersons). Fill one before adding the next.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'Member $key name';
  }

  @override
  String get specialInstructionsOptional => 'ਖਾਸ ਹਦਾਇਤਾਂ (ਵਿਕਲਪਿਕ)';

  @override
  String get poojaDetails => 'ਪੂਜਾ ਦੇ ਵੇਰਵੇ';

  @override
  String get price => 'ਕੀਮਤ';

  @override
  String get bookNow => 'ਹੁਣੇ ਬੁੱਕ ਕਰੋ';

  @override
  String get aboutThisPooja => 'ਇਸ ਪੂਜਾ ਬਾਰੇ';

  @override
  String get ourPanditWillCallYou => 'ਸਾਡਾ ਪੰਡਿਤ ਤੁਹਾਨੂੰ ਫ਼ੋਨ ਕਰੇਗਾ।';

  @override
  String get beforeThePoojaToConfirmThe =>
      'ਪੂਜਾ ਤੋਂ ਪਹਿਲਾਂ, ਸਮੇਂ ਅਤੇ ਆਪਣੇ ਸੰਕਲਪ ਵੇਰਵਿਆਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ।';

  @override
  String get howItWorks => 'ਇਹ ਕਿਵੇਂ ਕੰਮ ਕਰਦਾ ਹੈ';

  @override
  String get filterPoojas => 'ਪੂਜਾ ਫਿਲਟਰ ਕਰੋ';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'ਘੱਟੋ-ਘੱਟ ਸਮਰਥਿਤ ਵਿਅਕਤੀ';

  @override
  String get apply => 'ਲਾਗੂ ਕਰੋ';

  @override
  String get searchPoojas => 'ਪੂਜਾ ਖੋਜੋ...';

  @override
  String get myProfile => 'ਮੇਰੀ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get referEarn => 'ਹਵਾਲਾ ਦਿਓ ਅਤੇ ਕਮਾਓ';

  @override
  String get couldNotLoadTryAgain =>
      'ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'ਤੁਹਾਡਾ ਰੈਫਰਲ ਕੋਡ';

  @override
  String get codeCopied => 'ਕੋਡ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get shareEarn => 'ਸਾਂਝਾ ਕਰੋ ਅਤੇ ਕਮਾਓ';

  @override
  String get haveAFriendSCode => 'ਕੀ ਤੁਹਾਡੇ ਕੋਲ ਕਿਸੇ ਦੋਸਤ ਦਾ ਕੋਡ ਹੈ?';

  @override
  String get enterReferralCode => 'ਰੈਫਰਲ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get aReferralCodeIsAppliedTo =>
      'ਤੁਹਾਡੇ ਖਾਤੇ \'ਤੇ ਇੱਕ ਰੈਫਰਲ ਕੋਡ ਲਾਗੂ ਹੁੰਦਾ ਹੈ।';

  @override
  String get feedbackSubmitted => 'ਫੀਡਬੈਕ ਸਪੁਰਦ ਕੀਤਾ ਗਿਆ';

  @override
  String get feedback => 'ਫੀਡਬੈਕ';

  @override
  String get applicationSubmitted => 'ਅਰਜ਼ੀ ਜਮ੍ਹਾਂ ਕਰਵਾਈ ਗਈ';

  @override
  String get astrologerRegistration => 'ਜੋਤਸ਼ੀ ਰਜਿਸਟ੍ਰੇਸ਼ਨ';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return '$appName ਵਿੱਚ ਇੱਕ ਜੋਤਸ਼ੀ ਵਜੋਂ ਸ਼ਾਮਲ ਹੋਵੋ';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'ਸਾਨੂੰ ਆਪਣੇ ਬਾਰੇ ਦੱਸੋ — ਸਾਡੀ ਟੀਮ ਸਮੀਖਿਆ ਕਰੇਗੀ ਅਤੇ ਸੰਪਰਕ ਕਰੇਗੀ।';

  @override
  String get aboutUs => 'ਸਾਡੇ ਬਾਰੇ';

  @override
  String rudraganga(String appName) {
    return '$appName';
  }

  @override
  String get astrologyWellness => 'ਜੋਤਿਸ਼ ਅਤੇ ਤੰਦਰੁਸਤੀ';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · ਸ਼ਰਧਾ ਨਾਲ ਬਣਾਇਆ ਗਿਆ';

  @override
  String get thanksForYourRating => 'ਤੁਹਾਡੀ ਰੇਟਿੰਗ ਲਈ ਧੰਨਵਾਦ!';

  @override
  String rateRudraganga(String appName) {
    return '$appName ਨੂੰ ਦਰਸਾਓ';
  }

  @override
  String get howIsYourExperience => 'ਤੁਹਾਡਾ ਅਨੁਭਵ ਕਿਵੇਂ ਰਿਹਾ?';

  @override
  String get writeAReviewOptional => 'ਇੱਕ ਸਮੀਖਿਆ ਲਿਖੋ (ਵਿਕਲਪਿਕ)';

  @override
  String get saved => 'ਸੰਭਾਲਿਆ ਗਿਆ';

  @override
  String get notificationSetting => 'ਸੂਚਨਾ ਸੈਟਿੰਗ';

  @override
  String get howOften => 'ਕਿੰਨੀ ਵਾਰੀ?';

  @override
  String get topicsYouCareAbout => 'ਤੁਹਾਡੇ ਲਈ ਮਹੱਤਵਪੂਰਨ ਵਿਸ਼ੇ';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get allSet => 'ਸਭ ਤਿਆਰ ਹੈ ✨';

  @override
  String get setPreferences => 'ਪਸੰਦਾਂ ਸੈੱਟ ਕਰੋ';

  @override
  String get save => 'ਸੇਵ ਕਰੋ';

  @override
  String get bundlesCombos => 'ਬੰਡਲ ਅਤੇ ਕੰਬੋਜ਼';

  @override
  String get noCombosRightNow => 'ਇਸ ਵੇਲੇ ਕੋਈ ਕੰਬੋ ਨਹੀਂ';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'ਕਾਰਟ';

  @override
  String get clear => 'ਸਾਫ਼';

  @override
  String get yourCartIsEmpty => 'ਤੁਹਾਡਾ ਕਾਰਟ ਖਾਲੀ ਹੈ।';

  @override
  String get browseProductsAndAddThemHere =>
      'ਉਤਪਾਦਾਂ ਨੂੰ ਬ੍ਰਾਊਜ਼ ਕਰੋ ਅਤੇ ਉਹਨਾਂ ਨੂੰ ਇੱਥੇ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String walletBalanceAddTotalBalanceTo(Object balance, Object balance2) {
    return 'Wallet ₹$balance · add ₹$balance2 to checkout';
  }

  @override
  String walletBalance(Object balance) {
    return 'Wallet: ₹$balance';
  }

  @override
  String couponTrimmedAppliedResDiscountOff(Object trimmed, Object discount) {
    return 'Coupon $trimmed applied · ₹$discount off';
  }

  @override
  String get pleaseAddADeliveryAddress => 'ਕਿਰਪਾ ਕਰਕੇ ਡਿਲੀਵਰੀ ਪਤਾ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get checkout => 'ਕਮਰਾ ਛੱਡ ਦਿਓ';

  @override
  String get addNewAddress => 'ਨਵਾਂ ਪਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'ਹਟਾਓ';

  @override
  String get enterCouponCode => 'ਕੂਪਨ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'ਉਪਲਬਧ ਪੇਸ਼ਕਸ਼ਾਂ';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'ਲਾਗੂ ਕੀਤਾ';

  @override
  String get nothingToCheckout => 'ਚੈੱਕਆਉਟ ਕਰਨ ਲਈ ਕੁਝ ਨਹੀਂ ਹੈ';

  @override
  String get orderPlaced => 'ਆਰਡਰ ਦਿੱਤਾ ਗਿਆ!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'ਖਰੀਦਦਾਰੀ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get yourOrders => 'ਤੁਹਾਡੇ ਆਰਡਰ';

  @override
  String get noOrdersYet => 'ਹਾਲੇ ਕੋਈ ਆਰਡਰ ਨਹੀਂ ਹਨ';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'ਜਦੋਂ ਤੁਸੀਂ ਸਟੋਰ ਤੋਂ ਕੁਝ ਖਰੀਦੋਗੇ ਤਾਂ ਤੁਹਾਡੇ ਆਰਡਰ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ।';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'ਇਨਵੌਇਸ ਅਜੇ ਵੀ ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ। ਥੋੜ੍ਹੀ ਦੇਰ ਵਿੱਚ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get couldNotOpenTheInvoice => 'ਇਨਵੌਇਸ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ';

  @override
  String get thanksOurTeamWillReachOut =>
      'ਧੰਨਵਾਦ! ਸਾਡੀ ਟੀਮ ਇਸ ਆਰਡਰ ਬਾਰੇ ਤੁਹਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੇਗੀ।';

  @override
  String get orderDetails => 'ਆਰਡਰ ਵੇਰਵੇ';

  @override
  String get needHelp => 'ਮਦਦ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get needHelpWithThisOrder => 'ਇਸ ਆਰਡਰ ਵਿੱਚ ਮਦਦ ਦੀ ਲੋੜ ਹੈ?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'ਇਨਵੌਇਸ';

  @override
  String get download => 'ਡਾਊਨਲੋਡ';

  @override
  String get needHelp2 => 'ਮਦਦ ਦੀ ਲੋੜ ਹੈ';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'ਕੀ ਗਲਤ ਹੋਇਆ?';

  @override
  String get describeTheIssue => 'ਸਮੱਸਿਆ ਦਾ ਵਰਣਨ ਕਰੋ';

  @override
  String get tellUsWhatHappenedSoWe =>
      'ਸਾਨੂੰ ਦੱਸੋ ਕਿ ਕੀ ਹੋਇਆ ਤਾਂ ਜੋ ਅਸੀਂ ਮਦਦ ਕਰ ਸਕੀਏ...';

  @override
  String get submitRequest => 'ਬੇਨਤੀ ਸਪੁਰਦ ਕਰੋ';

  @override
  String get addedToCart => 'ਕਾਰਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';

  @override
  String get productUnavailable => 'ਉਤਪਾਦ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String pDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% OFF';
  }

  @override
  String pReviewcountReviews(Object reviewCount) {
    return '$reviewCount reviews';
  }

  @override
  String pDiscountpercentOff2(Object discountPercent) {
    return '$discountPercent% off';
  }

  @override
  String get fewItemsLeft => 'ਕੁਝ ਚੀਜ਼ਾਂ ਬਾਕੀ ਹਨ';

  @override
  String get description => 'ਵੇਰਵਾ';

  @override
  String get frequentlyBoughtTogether => 'ਅਕਸਰ ਇਕੱਠੇ ਖਰੀਦੇ ਜਾਂਦੇ';

  @override
  String get viewAll => 'ਸਾਰੇ ਵੇਖੋ';

  @override
  String get addToCart => 'ਠੇਲ੍ਹੇ ਵਿੱਚ ਪਾਓ';

  @override
  String get buyNow => 'ਹੁਣੇ ਖਰੀਦੋ';

  @override
  String get searchProducts => 'ਉਤਪਾਦ ਖੋਜੋ…';

  @override
  String get noProductsFound => 'ਕੋਈ ਉਤਪਾਦ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get priceRange => 'ਕੀਮਤ ਸੀਮਾ (₹)';

  @override
  String get min => 'ਘੱਟੋ-ਘੱਟ';

  @override
  String get max => 'ਵੱਧ ਤੋਂ ਵੱਧ';

  @override
  String get inStockOnly => 'ਸਿਰਫ਼ ਸਟਾਕ ਵਿੱਚ';

  @override
  String get sortBy => 'ਦੇ ਨਾਲ ਕ੍ਰਮਬੱਧ';

  @override
  String get addDeliveryAddress => 'ਡਿਲੀਵਰੀ ਪਤਾ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get setAsDefaultAddress => 'ਡਿਫੌਲਟ ਪਤੇ ਵਜੋਂ ਸੈੱਟ ਕਰੋ';

  @override
  String get saveAddress => 'ਪਤਾ ਰੱਖਿਅਤ ਕਰੋ';

  @override
  String codeCouponCode(Object code) {
    return 'Code $code';
  }

  @override
  String saveBundleYousave(Object youSave) {
    return 'SAVE ₹$youSave';
  }

  @override
  String bundleProductsLengthItemsCombo(Object length) {
    return '$length items combo';
  }

  @override
  String bundleDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% off';
  }

  @override
  String get fewLeft => 'ਕੁਝ ਬਚੇ ਹਨ';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'ਮੁਫ਼ਤ ਡਿਲੀਵਰੀ';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'ਇੱਥੇ ਅਜੇ ਕੁਝ ਨਹੀਂ ਹੈ';

  @override
  String get loadingSecurePayment => 'ਸੁਰੱਖਿਅਤ ਭੁਗਤਾਨ ਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get couldNotStartRecharge => 'ਰੀਚਾਰਜ ਸ਼ੁਰੂ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get paymentSuccessful => 'ਭੁਗਤਾਨ ਸਫਲ 🎉';

  @override
  String get paymentWasNotCompleted => 'ਭੁਗਤਾਨ ਪੂਰਾ ਨਹੀਂ ਹੋਇਆ।';

  @override
  String get couldNotStartRechargeTryAgain =>
      'ਰੀਚਾਰਜ ਸ਼ੁਰੂ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ, ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get wallet => 'ਬਟੂਆ';

  @override
  String get availableBalance => 'ਉਪਲਬਧ ਬਕਾਇਆ';

  @override
  String get useItForPoojasConsultations =>
      'ਪੂਜਾ ਅਤੇ ਸਲਾਹ-ਮਸ਼ਵਰੇ ਲਈ ਇਸਦੀ ਵਰਤੋਂ ਕਰੋ।';

  @override
  String get instantTopUp => 'ਤੁਰੰਤ ਟਾਪ-ਅੱਪ';

  @override
  String get noRechargePacksAvailableRightNow =>
      'ਇਸ ਵੇਲੇ ਕੋਈ ਰੀਚਾਰਜ ਪੈਕ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get transactions => 'ਲੈਣ-ਦੇਣ';

  @override
  String get endOfTransactions => '— ਲੈਣ-ਦੇਣ ਦਾ ਅੰਤ —';

  @override
  String get youGet => 'ਤੁਹਾਨੂੰ ਮਿਲਦਾ ਹੈ';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus bonus';
  }

  @override
  String payPackAmount(Object amount) {
    return 'Pay ₹$amount';
  }

  @override
  String get rudra => 'Astro';

  @override
  String get ganga => 'App';

  @override
  String get about => 'ਬਾਰੇ';

  @override
  String get astrologer => 'ਜੋਤਸ਼ੀ';

  @override
  String get seeker => 'ਖੋਜਕਰਤਾ';

  @override
  String get free => 'ਮੁਫ਼ਤ';

  @override
  String get jan => 'ਜਨਵਰੀ';

  @override
  String get feb => 'ਫਰਵਰੀ';

  @override
  String get mar => 'ਮਾਰਚ';

  @override
  String get apr => 'ਅਪ੍ਰੈਲ';

  @override
  String get may => 'ਮਈ';

  @override
  String get jun => 'ਜੂਨ';

  @override
  String get jul => 'ਜੁਲਾਈ';

  @override
  String get aug => 'ਅਗਸਤ';

  @override
  String get sep => 'ਸਤੰਬਰ';

  @override
  String get oct => 'ਅਕਤੂਬਰ';

  @override
  String get nov => 'ਨਵੰਬਰ';

  @override
  String get dec => 'ਦਸੰਬਰ';

  @override
  String get english => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get all => 'ਸਾਰੇ';

  @override
  String get vedic => 'ਵੈਦਿਕ';

  @override
  String get tarot => 'ਟੈਰੋ';

  @override
  String get numerology => 'ਅੰਕ ਵਿਗਿਆਨ';

  @override
  String get vastu => 'ਵਿਰੁੱਧ';

  @override
  String get palmistry => 'ਹੱਥ-ਵਿਗਿਆਨ';

  @override
  String get kp => 'ਕੇਪੀ';

  @override
  String get love => 'ਪਿਆਰ';

  @override
  String get taraAi => 'ਦੇਸ਼ ਏ.ਆਈ.';

  @override
  String get instantVedicAnswers247 => 'ਤੁਰੰਤ ਵੈਦਿਕ ਉੱਤਰ • 24×7';

  @override
  String get allLanguages => 'ਸਾਰੀਆਂ ਭਾਸ਼ਾਵਾਂ';

  @override
  String get jyotiAi => 'ਜੋਤੀ ਏ.ਆਈ.';

  @override
  String get loveCareerGuidance => 'ਪਿਆਰ ਅਤੇ ਕਰੀਅਰ ਮਾਰਗਦਰਸ਼ਨ';

  @override
  String get hindiEnglish => 'ਹਿੰਦੀ, ਅੰਗਰੇਜ਼ੀ';

  @override
  String get veduAi => 'ਵੇਦੂ ਏਆਈ';

  @override
  String get remediesPredictions => 'ਉਪਾਅ ਅਤੇ ਭਵਿੱਖਬਾਣੀਆਂ';

  @override
  String get couldNotLoadAstrologers => 'ਜੋਤਸ਼ੀ ਲੋਡ ਨਹੀਂ ਕਰ ਸਕੇ।';

  @override
  String get aiAstrologers => 'ਏਆਈ ਜੋਤਸ਼ੀ';

  @override
  String get featuredAstrologers => 'ਵਿਸ਼ੇਸ਼ ਜੋਤਸ਼ੀ';

  @override
  String get astrologers => 'ਜੋਤਸ਼ੀ';

  @override
  String get searchAiAstrologers => 'ਏਆਈ ਜੋਤਸ਼ੀ ਖੋਜੋ...';

  @override
  String get searchAstrologersByName => 'ਜੋਤਸ਼ੀਆਂ ਨੂੰ ਨਾਮ ਨਾਲ ਖੋਜੋ...';

  @override
  String get aiChat => 'ਏਆਈ ਚੈਟ';

  @override
  String get noAstrologersMatch => 'ਕੋਈ ਜੋਤਸ਼ੀ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ।';

  @override
  String get noAstrologersYet => 'ਅਜੇ ਤੱਕ ਕੋਈ ਜੋਤਸ਼ੀ ਨਹੀਂ';

  @override
  String get couldnTSetTheReminderPlease =>
      'ਰਿਮਾਈਂਡਰ ਸੈੱਟ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get ai => 'ਏ.ਆਈ.';

  @override
  String get live2 => 'ਲਾਈਵ';

  @override
  String get online => 'ਔਨਲਾਈਨ';

  @override
  String get busy => 'ਵਿਅਸਤ';

  @override
  String get offline => 'ਆਫ਼ਲਾਈਨ';

  @override
  String get chat => 'ਚੈਟ';

  @override
  String get call => 'ਕਾਲ';

  @override
  String get video => 'ਵੀਡੀਓ';

  @override
  String get notEnoughBalanceToStartPlease =>
      'ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਕਾਫ਼ੀ ਬਕਾਇਆ ਨਹੀਂ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਰੀਚਾਰਜ ਕਰੋ।';

  @override
  String get couldNotStartTheConsultationPlease =>
      'ਸਲਾਹ-ਮਸ਼ਵਰਾ ਸ਼ੁਰੂ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get share => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get follow => 'ਫਾਲੋ ਕਰੋ';

  @override
  String get chats => 'ਗੱਲਬਾਤ';

  @override
  String get calls => 'ਕਾਲਾਂ';

  @override
  String get videos => 'ਵੀਡੀਓਜ਼';

  @override
  String get gifts => 'ਤੋਹਫ਼ੇ';

  @override
  String get languages => 'ਬੋਲੀਆਂ';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'ਉਨ੍ਹਾਂ ਨੇ ਹਜ਼ਾਰਾਂ ਖੋਜੀਆਂ ਨੂੰ ਕਰੀਅਰ, ਵਿਆਹ, ਵਿੱਤ ਅਤੇ ਜੀਵਨ-ਮਾਰਗ ਦੇ ਸਵਾਲਾਂ ਰਾਹੀਂ ਮਾਰਗਦਰਸ਼ਨ ਕੀਤਾ ਹੈ।';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'ਉਨ੍ਹਾਂ ਦੇ ਪਾਠ ਸ਼ਾਸਤਰੀ ਵੈਦਿਕ ਸਿਧਾਂਤਾਂ ਨੂੰ ਵਿਹਾਰਕ, ਹਮਦਰਦੀ ਭਰੇ ਮਾਰਗਦਰਸ਼ਨ ਨਾਲ ਮਿਲਾਉਂਦੇ ਹਨ - ਤੁਹਾਡੀ ਮਦਦ ਕਰਦੇ ਹਨ';

  @override
  String get findClarityAndActionableRemediesFor =>
      'ਅੱਗੇ ਦੇ ਰਸਤੇ ਲਈ ਸਪੱਸ਼ਟਤਾ ਅਤੇ ਕਾਰਵਾਈਯੋਗ ਉਪਾਅ ਲੱਭੋ।';

  @override
  String get giftsReceived => 'ਪ੍ਰਾਪਤ ਹੋਏ ਤੋਹਫ਼ੇ';

  @override
  String get reviews => 'ਸਮੀਖਿਆਵਾਂ';

  @override
  String get weLlNotifyYouTheMoment =>
      'ਜਦੋਂ ਵੀ ਉਹ ਖਾਲੀ ਹੋਣਗੇ, ਅਸੀਂ ਤੁਹਾਨੂੰ ਸੂਚਿਤ ਕਰਾਂਗੇ।';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'ਜਦੋਂ ਵੀ ਉਹ ਔਨਲਾਈਨ ਹੋਣਗੇ, ਅਸੀਂ ਤੁਹਾਨੂੰ ਸੂਚਿਤ ਕਰਾਂਗੇ।';

  @override
  String get getAHeadsUpTheMoment => 'ਜਦੋਂ ਹੀ ਉਹ ਉਪਲਬਧ ਹੋਣ ਤਾਂ ਸੁਚੇਤ ਰਹੋ।';

  @override
  String get couldNotLoadThisStore => 'ਇਸ ਸਟੋਰ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get products => 'ਉਤਪਾਦ';

  @override
  String get poojas => 'ਪੂਜਾ ਵਿੱਚ';

  @override
  String get book => 'ਕਿਤਾਬ';

  @override
  String get buy => 'ਖਰੀਦੋ';

  @override
  String get lalKitab => 'ਲਾਲ ਕਿਤਾਬ';

  @override
  String get hindi => 'ਨਹੀਂ';

  @override
  String get bengali => 'ਬੰਗਾਲੀ';

  @override
  String get tamil => 'ਤਾਮਿਲ';

  @override
  String get marathi => 'ਮਰਾਠੀ';

  @override
  String get punjabi => 'ਪੰਜਾਬੀ';

  @override
  String get telugu => 'ਤੇਲਗੂ';

  @override
  String get expertise => 'ਮੁਹਾਰਤ';

  @override
  String get couldNotLoadGifts => 'ਤੋਹਫ਼ੇ ਲੋਡ ਨਹੀਂ ਕੀਤੇ ਜਾ ਸਕੇ';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'ਕਾਫ਼ੀ ਬਕਾਇਆ ਨਹੀਂ ਹੈ। ਤੋਹਫ਼ੇ ਭੇਜਣ ਲਈ ਪੈਸੇ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get couldNotSendTheGiftPlease =>
      'ਤੋਹਫ਼ਾ ਨਹੀਂ ਭੇਜਿਆ ਜਾ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get connecting2 => 'ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get couldNotLoadThisChatHistory =>
      'ਇਸ ਚੈਟ ਇਤਿਹਾਸ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get thisChatHistoryIsNoLonger =>
      'ਇਹ ਚੈਟ ਇਤਿਹਾਸ ਹੁਣ ਉਪਲਬਧ ਨਹੀਂ ਹੈ\n(ਚੈਟਾਂ 7 ਦਿਨਾਂ ਲਈ ਰੱਖੀਆਂ ਜਾਂਦੀਆਂ ਹਨ)।';

  @override
  String get dailyFor14Days => 'ਰੋਜ਼ਾਨਾ · 14 ਦਿਨਾਂ ਲਈ';

  @override
  String get dailyMantra => 'ਰੋਜ਼ਾਨਾ ਮੰਤਰ';

  @override
  String get reminder => 'ਰੀਮਾਈਂਡਰ';

  @override
  String get audio => 'ਆਡੀਓ';

  @override
  String get couldNotLoadYourConsultations =>
      'ਤੁਹਾਡੀਆਂ ਸਲਾਹ-ਮਸ਼ਵਰੇ ਲੋਡ ਨਹੀਂ ਕੀਤੀਆਂ ਜਾ ਸਕੀਆਂ';

  @override
  String get missed => 'ਖੁੰਝ ਗਿਆ';

  @override
  String get declined => 'ਅਸਵੀਕਾਰ ਕੀਤਾ ਗਿਆ';

  @override
  String get cancelled => 'ਰੱਦ ਕੀਤਾ ਗਿਆ';

  @override
  String get lowBalance => 'ਘੱਟ ਬਕਾਇਆ';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'ਆਪਣੀ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਜਾਰੀ ਰੱਖਣ ਲਈ ਹੁਣੇ ਰੀਚਾਰਜ ਕਰੋ। ਭੁਗਤਾਨ ਕਰਨ ਦੌਰਾਨ ਤੁਹਾਡੀ ਚੈਟ ਖੁੱਲ੍ਹੀ ਰਹਿੰਦੀ ਹੈ।';

  @override
  String get sessionEndedLowBalance =>
      'ਤੁਹਾਡਾ ਬਕਾਇਆ ਖ਼ਤਮ ਹੋ ਗਿਆ, ਇਸ ਲਈ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਖ਼ਤਮ ਹੋ ਗਿਆ। ਕਿਸੇ ਵੀ ਸਮੇਂ ਰੀਚਾਰਜ ਕਰਕੇ ਦੁਬਾਰਾ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get couldNotLoadHoroscope =>
      'ਰਾਸ਼ੀਫਲ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get chooseSign => 'ਰਾਸ਼ੀ ਬਦਲੋ';

  @override
  String get yesterday => 'ਕੱਲ੍ਹ';

  @override
  String get today => 'ਅੱਜ';

  @override
  String get tomorrow => 'ਭਲਕੇ';

  @override
  String get totalScore => 'ਕੁੱਲ ਸਕੋਰ';

  @override
  String get luckyColor => 'ਸ਼ੁਭ ਰੰਗ';

  @override
  String get luckyNumber => 'ਸ਼ੁਭ ਅੰਕ';

  @override
  String get lifeAreas => 'ਜੀਵਨ ਦੇ ਖੇਤਰ';

  @override
  String get todaysReading => 'ਅੱਜ ਦਾ ਰਾਸ਼ੀਫਲ';

  @override
  String get career => 'ਕਰੀਅਰ';

  @override
  String get finances => 'ਵਿੱਤ';

  @override
  String get health => 'ਸਿਹਤ';

  @override
  String get relationship => 'ਰਿਸ਼ਤਾ';

  @override
  String get family => 'ਪਰਿਵਾਰ';

  @override
  String get friends => 'ਦੋਸਤ';

  @override
  String get travel => 'ਯਾਤਰਾ';

  @override
  String get physique => 'ਸਰੀਰ';

  @override
  String get statusLabel => 'ਸਥਿਤੀ';

  @override
  String get signAries => 'ਮੇਖ';

  @override
  String get signTaurus => 'ਬ੍ਰਿਖ';

  @override
  String get signGemini => 'ਮਿਥੁਨ';

  @override
  String get signCancer => 'ਕਰਕ';

  @override
  String get signLeo => 'ਸਿੰਘ';

  @override
  String get signVirgo => 'ਕੰਨਿਆ';

  @override
  String get signLibra => 'ਤੁਲਾ';

  @override
  String get signScorpio => 'ਬ੍ਰਿਸ਼ਚਕ';

  @override
  String get signSagittarius => 'ਧਨੁ';

  @override
  String get signCapricorn => 'ਮਕਰ';

  @override
  String get signAquarius => 'ਕੁੰਭ';

  @override
  String get signPisces => 'ਮੀਨ';

  @override
  String get couldNotLoadPanchang =>
      'ਪੰਚਾਂਗ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get tithi => 'ਤਿਥੀ';

  @override
  String get nakshatra => 'ਨਕਸ਼ਤਰ';

  @override
  String get yoga => 'ਯੋਗ';

  @override
  String get karana => 'ਕਰਣ';

  @override
  String get weekday => 'ਵਾਰ';

  @override
  String get inauspiciousTimes => 'ਅਸ਼ੁਭ ਸਮਾਂ';

  @override
  String get rahuKaal => 'ਰਾਹੂ ਕਾਲ';

  @override
  String get gulikaKaal => 'ਗੁਲਿਕ ਕਾਲ';

  @override
  String get yamaganda => 'ਯਮਗੰਡ';

  @override
  String get duration => 'ਮਿਆਦ';

  @override
  String get coinsUsed => 'ਵਰਤੇ ਗਏ ਸਿੱਕੇ';

  @override
  String get guest => 'ਮਹਿਮਾਨ';

  @override
  String get changeLanguage => 'ਭਾਸ਼ਾ ਬਦਲੋ';

  @override
  String get chooseYourKundli => 'ਆਪਣੀ ਕੁੰਡਲੀ ਚੁਣੋ';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'ਤੁਹਾਡਾ ਬਟੂਆ, ਰੀਡਿੰਗ ਅਤੇ ਸੇਵ ਕੀਤੇ ਵੇਰਵੇ ਸੁਰੱਖਿਅਤ ਰਹਿੰਦੇ ਹਨ — ਪਰ ਲੌਗ ਆਊਟ ਕਰਨ ਦਾ ਮਤਲਬ ਹੈ ਆਪਣੀ ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀ, ਪੇਸ਼ਕਸ਼ਾਂ ਅਤੇ ਰੀਮਾਈਂਡਰ ਗੁਆਉਣਾ। ਸਿਤਾਰਿਆਂ ਨਾਲ ਜੁੜੇ ਰਹੋ? ✨';

  @override
  String get offers => 'ਪੇਸ਼ਕਸ਼ਾਂ';

  @override
  String get dailyPanchang => 'ਰੋਜ਼ਾਨਾ ਪੰਚਾਂਗ';

  @override
  String get talkToAstrologer => 'ਜੋਤਸ਼ੀ ਨਾਲ ਗੱਲ ਕਰੋ';

  @override
  String get brihatKundli => 'ਬ੍ਰਿਹਤ ਕੁੰਡਲੀ';

  @override
  String get dailyNotes => 'ਰੋਜ਼ਾਨਾ ਨੋਟਸ';

  @override
  String get askAQuestion => 'ਕੋਈ ਸਵਾਲ ਪੁੱਛੋ';

  @override
  String get free50Pages => 'ਮੁਫ਼ਤ 50+ ਪੰਨੇ';

  @override
  String get freeReport => 'ਮੁਫ਼ਤ ਰਿਪੋਰਟ';

  @override
  String get freeMatrimony => 'ਮੁਫ਼ਤ ਵਿਆਹ';

  @override
  String get matrimony => 'ਵਿਆਹ';

  @override
  String get loveMatch => 'ਪਿਆਰ ਦਾ ਮੈਚ';

  @override
  String get horoscope => 'ਕੁੰਡਲੀ';

  @override
  String get dailyHoroscope => 'ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀ';

  @override
  String get vedicAstrology => 'ਵੈਦਿਕ ਜੋਤਿਸ਼';

  @override
  String get acharyaVeda => 'ਆਚਾਰੀਆ ਵੇਦ';

  @override
  String get panditRohan => 'ਪੰਡਿਤ ਰੋਹਨ';

  @override
  String get guruMaya => 'ਵਰਚੁਅਲ ਅਧਿਆਪਕ';

  @override
  String get jayaShastri => 'ਜਯਾ ਸ਼ਾਸਤਰੀ';

  @override
  String get devSharma => 'ਦੇਵ ਸ਼ਰਮਾ';

  @override
  String get sureshG => 'ਸੁਰੇਸ਼ ਜੀ.';

  @override
  String get lataP => 'ਪੀ. ਸਾਲ';

  @override
  String get kiranB => 'ਕਿਰਨ ਬੀ.';

  @override
  String get mohanT => 'ਮੋਹਨ ਟੀ.';

  @override
  String get anilJoshi => 'ਅਨਿਲ ਜੋਸ਼ੀ';

  @override
  String get meeraDevi => 'ਮੀਰਾ ਦੇਵੀ';

  @override
  String get raviKumar => 'ਰਵੀ ਕੁਮਾਰ';

  @override
  String get sunitaRao => 'ਸੁਨੀਤਾ ਰਾਓ';

  @override
  String get bengaluruKarnataka => 'ਬੰਗਲੁਰੂ, ਕਰਨਾਟਕ';

  @override
  String get locating => 'ਪਤਾ ਲਗਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get festivalOffer => 'ਤਿਉਹਾਰ ਦੀ ਪੇਸ਼ਕਸ਼';

  @override
  String get upTo30OffOnGemstones => 'ਰਤਨ ਪੱਥਰਾਂ \'ਤੇ 30% ਤੱਕ ਦੀ ਛੋਟ';

  @override
  String get talkToTopAstrologers => 'ਚੋਟੀ ਦੇ ਜੋਤਸ਼ੀਆਂ ਨਾਲ ਗੱਲ ਕਰੋ';

  @override
  String get firstConsultationSpecial => 'ਪਹਿਲੀ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਵਿਸ਼ੇਸ਼';

  @override
  String get rudrakshaCollection => 'ਰੁਦਰਾਕਸ਼ ਸੰਗ੍ਰਹਿ';

  @override
  String get authenticEnergised => 'ਅਸਲੀ ਅਤੇ ਊਰਜਾਵਾਨ';

  @override
  String get resumeSession => 'ਸੈਸ਼ਨ ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get home => 'ਮੁੱਖ ਪੇਜ';

  @override
  String get aiAstro => 'ਏਆਈ ਐਸਟ੍ਰੋ';

  @override
  String get ask => 'ਪੁੱਛੋ';

  @override
  String get history => 'ਇਤਿਹਾਸ';

  @override
  String get seeAll2 => 'ਸਾਰੇ ਵੇਖੋ';

  @override
  String get s1AcceptanceOfTheseTerms => '1. ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਦੀ ਸਵੀਕ੍ਰਿਤੀ';

  @override
  String get termsOfService2 => 'ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get lastUpdated26June2026 => 'ਆਖਰੀ ਵਾਰ ਅੱਪਡੇਟ ਕੀਤਾ ਗਿਆ: 26 ਜੂਨ 2026';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appName ਮਾਰਗਦਰਸ਼ਨ ਅਤੇ ਨਿੱਜੀ ਲਈ ਜੋਤਿਸ਼, ਅਧਿਆਤਮਿਕ ਅਤੇ ਤੰਦਰੁਸਤੀ ਸਲਾਹ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'ਸਿਰਫ਼ ਪ੍ਰਤੀਬਿੰਬ। ਸਾਡੀਆਂ ਸੇਵਾਵਾਂ ਪੇਸ਼ੇਵਰ ਡਾਕਟਰੀ, ਕਾਨੂੰਨੀ, ਵਿੱਤੀ,';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'ਜਾਂ ਮਨੋਵਿਗਿਆਨਕ ਸਲਾਹ। ਐਪ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਤੁਹਾਡੀ ਉਮਰ 18 ਸਾਲ ਜਾਂ ਇਸ ਤੋਂ ਵੱਧ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'ਖਾਤਾ ਬਣਾ ਕੇ ਜਾਂ $appName ਮੋਬਾਈਲ ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਸੰਬੰਧਿਤ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ (ਦ';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '\"ਸੇਵਾਵਾਂ\"), ਤੁਸੀਂ ਇਹਨਾਂ ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ ਅਤੇ ਸਾਡੀ ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਅਤੇ ਰਿਫੰਡ ਦੁਆਰਾ ਬੰਨ੍ਹੇ ਹੋਣ ਲਈ ਸਹਿਮਤ ਹੁੰਦੇ ਹੋ';

  @override
  String get policyIfYouDoNotAgree =>
      'ਨੀਤੀ। ਜੇਕਰ ਤੁਸੀਂ ਸਹਿਮਤ ਨਹੀਂ ਹੋ, ਤਾਂ ਕਿਰਪਾ ਕਰਕੇ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਨਾ ਕਰੋ।';

  @override
  String get s2EligibilityYourAccount => '2. ਯੋਗਤਾ ਅਤੇ ਤੁਹਾਡਾ ਖਾਤਾ';

  @override
  String get youMustBeAtLeast18 =>
      'ਤੁਹਾਡੀ ਉਮਰ ਘੱਟੋ-ਘੱਟ 18 ਸਾਲ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ ਅਤੇ ਕਾਨੂੰਨੀ ਤੌਰ \'ਤੇ ਇਕਰਾਰਨਾਮਾ ਕਰਨ ਦੇ ਯੋਗ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get youRegisterWithAPhoneNumber =>
      'ਤੁਸੀਂ ਇੱਕ ਵਾਰ ਦੇ ਪਾਸਵਰਡ (OTP) ਦੁਆਰਾ ਪ੍ਰਮਾਣਿਤ ਫ਼ੋਨ ਨੰਬਰ ਨਾਲ ਰਜਿਸਟਰ ਕਰਦੇ ਹੋ। ਉਸ ਨੰਬਰ ਅਤੇ ਡਿਵਾਈਸ ਤੱਕ ਪਹੁੰਚ ਨੂੰ ਸੁਰੱਖਿਅਤ ਰੱਖਣ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਤੁਹਾਡੀ ਹੈ।';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'ਤੁਸੀਂ ਸਹੀ ਜਾਣਕਾਰੀ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ਸਹਿਮਤ ਹੁੰਦੇ ਹੋ, ਜਿਸ ਵਿੱਚ ਜਨਮ ਵੇਰਵੇ ਵੀ ਸ਼ਾਮਲ ਹਨ ਜਿੱਥੇ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਪੜ੍ਹਨ ਲਈ ਸਾਂਝਾ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ। ਤੁਸੀਂ ਆਪਣੇ ਖਾਤੇ ਅਧੀਨ ਸਾਰੀ ਗਤੀਵਿਧੀ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਹੋ।';

  @override
  String get s3TheServicesWeOffer =>
      '3. ਸਾਡੇ ਵੱਲੋਂ ਪੇਸ਼ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਸੇਵਾਵਾਂ';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appName ਤੁਹਾਨੂੰ ਆਡੀਓ ਕਾਲ, ਵੀਡੀਓ ਕਾਲ ਰਾਹੀਂ ਸਲਾਹ-ਮਸ਼ਵਰੇ ਲਈ ਪ੍ਰਮਾਣਿਤ ਜੋਤਸ਼ੀਆਂ ਨਾਲ ਜੋੜਦੀ ਹੈ,';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'ਅਤੇ ਚੈਟ, ਅਤੇ ਕੁੰਡਲੀ ਜਨਰੇਸ਼ਨ ਅਤੇ ਮੈਚਿੰਗ ਵਰਗੀਆਂ ਸੰਬੰਧਿਤ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਪੇਸ਼ਕਸ਼ ਕਰਦਾ ਹੈ, ਇੱਕ ਏਆਈ ਜੋਤਸ਼ੀ,';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀਆਂ, ਪੂਜਾ ਬੁਕਿੰਗ, ਅਧਿਆਤਮਿਕ ਉਤਪਾਦਾਂ ਲਈ ਇੱਕ ਸਟੋਰ, ਤੋਹਫ਼ੇ, ਅਤੇ ਵਿਆਹ ਮੇਲ।';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'ਕਿਸੇ ਵੀ ਵਿਸ਼ੇਸ਼ਤਾ ਜਾਂ ਜੋਤਸ਼ੀ ਦੀ ਉਪਲਬਧਤਾ ਕਿਸੇ ਵੀ ਸਮੇਂ ਬਦਲ ਸਕਦੀ ਹੈ।';

  @override
  String get s4WalletPricingBilling => '4. ਵਾਲਿਟ, ਕੀਮਤ ਅਤੇ ਬਿਲਿੰਗ';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'ਸਲਾਹ-ਮਸ਼ਵਰੇ ਪ੍ਰੀਪੇਡ ਹਨ। ਤੁਸੀਂ ਇੱਕ ਇਨ-ਐਪ ਵਾਲਿਟ ਵਿੱਚ ਫੰਡ ਜੋੜਦੇ ਹੋ ਅਤੇ ਜੁੜਨ ਤੋਂ ਪਹਿਲਾਂ ਜੋਤਸ਼ੀ ਅਤੇ ਸੇਵਾ ਲਈ ਦਰਸਾਏ ਗਏ ਰੇਟ \'ਤੇ ਪ੍ਰਤੀ ਮਿੰਟ ਭੁਗਤਾਨ ਕਰਦੇ ਹੋ।';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'ਬਿਲਿੰਗ ਉਦੋਂ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ ਜਦੋਂ ਜੋਤਸ਼ੀ ਸਵੀਕਾਰ ਕਰਦਾ ਹੈ ਅਤੇ ਸੈਸ਼ਨ ਜੁੜਦਾ ਹੈ। ਪਹਿਲੇ ਮਿੰਟ ਦਾ ਖਰਚਾ ਕਨੈਕਟ \'ਤੇ ਲਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਹਰੇਕ ਅਗਲੇ ਮਿੰਟ ਦਾ ਖਰਚਾ ਇਸਦੀ ਸ਼ੁਰੂਆਤ \'ਤੇ ਲਿਆ ਜਾਂਦਾ ਹੈ। ਸੈਸ਼ਨ ਦੌਰਾਨ ਇੱਕ ਲਾਈਵ ਮੀਟਰ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਜੇਕਰ ਤੁਹਾਡਾ ਬਕਾਇਆ ਘੱਟ ਜਾਂਦਾ ਹੈ ਤਾਂ ਸੈਸ਼ਨ ਆਪਣੇ ਆਪ ਖਤਮ ਹੋ ਜਾਂਦਾ ਹੈ।';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'ਭੁਗਤਾਨ ਸਾਡੇ ਭੁਗਤਾਨ ਸਾਥੀ (PayU) ਦੁਆਰਾ ਪ੍ਰਕਿਰਿਆ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਅਸੀਂ ਪੂਰੇ ਕਾਰਡ ਵੇਰਵੇ ਸਟੋਰ ਨਹੀਂ ਕਰਦੇ ਹਾਂ।';

  @override
  String get walletBalancesAreForUseWithin =>
      'ਵਾਲਿਟ ਬੈਲੇਂਸ ਸੇਵਾਵਾਂ ਦੇ ਅੰਦਰ ਵਰਤੋਂ ਲਈ ਹਨ। ਰਿਫੰਡ, ਜਿੱਥੇ ਲਾਗੂ ਹੁੰਦਾ ਹੈ, ਸਾਡੀ ਰਿਫੰਡ ਨੀਤੀ ਦੁਆਰਾ ਨਿਯੰਤਰਿਤ ਕੀਤੇ ਜਾਂਦੇ ਹਨ।';

  @override
  String get pricesAreInIndianRupeesInr =>
      'ਕੀਮਤਾਂ ਭਾਰਤੀ ਰੁਪਏ (INR) ਵਿੱਚ ਹਨ ਅਤੇ ਇਹਨਾਂ ਵਿੱਚ ਲਾਗੂ ਟੈਕਸ ਸ਼ਾਮਲ ਹੋ ਸਕਦੇ ਹਨ।';

  @override
  String get s5AcceptableUse => '5. ਸਵੀਕਾਰਯੋਗ ਵਰਤੋਂ';

  @override
  String get youAgreeNotTo => 'ਤੁਸੀਂ ਇਸ ਗੱਲ ਨਾਲ ਸਹਿਮਤ ਹੋ ਕਿ:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'ਜੋਤਸ਼ੀਆਂ ਜਾਂ ਸਟਾਫ਼ ਨਾਲ ਜਿਨਸੀ ਤੌਰ \'ਤੇ ਸਪੱਸ਼ਟ ਜਾਂ ਗੈਰ-ਕਾਨੂੰਨੀ ਸਮੱਗਰੀ ਨੂੰ ਪਰੇਸ਼ਾਨ ਕਰਨਾ, ਦੁਰਵਿਵਹਾਰ ਕਰਨਾ, ਧਮਕੀ ਦੇਣਾ, ਜਾਂ ਸਾਂਝਾ ਕਰਨਾ।';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'ਕਿਸੇ ਵੀ ਵਿਅਕਤੀ ਦਾ ਰੂਪ ਧਾਰਨ ਕਰਨਾ, ਜਾਂ ਸੇਵਾ ਜਾਂ ਰਿਫੰਡ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਗਲਤ ਜਾਣਕਾਰੀ ਪ੍ਰਦਾਨ ਕਰਨਾ।';

  @override
  String get attemptToTakeAConsultationOff =>
      'ਫੀਸਾਂ ਤੋਂ ਬਚਣ ਲਈ ਪਲੇਟਫਾਰਮ ਤੋਂ ਬਾਹਰ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਜਾਂ ਨਿੱਜੀ ਸੰਪਰਕ ਵੇਰਵਿਆਂ ਦੀ ਮੰਗ ਕਰੋ।';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'ਸੇਵਾਵਾਂ ਜਾਂ ਉਹਨਾਂ ਦੀ ਸੁਰੱਖਿਆ ਵਿੱਚ ਦਖਲ ਦੇਣਾ, ਖਰਾਬ ਕਰਨਾ, ਜਾਂ ਵਿਘਨ ਪਾਉਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਨਾ।';

  @override
  String get s6AstrologersOnThePlatform => '6. ਪਲੇਟਫਾਰਮ \'ਤੇ ਜੋਤਸ਼ੀ';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'ਜੋਤਸ਼ੀ ਸੁਤੰਤਰ ਅਭਿਆਸੀ ਹੁੰਦੇ ਹਨ ਜਿਨ੍ਹਾਂ ਦੀ ਪਛਾਣ-ਪ੍ਰਮਾਣਿਤ ਅਤੇ $appName ਦੁਆਰਾ ਪ੍ਰਵਾਨਿਤ ਹੁੰਦੀ ਹੈ।';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'ਇਸ ਤੋਂ ਪਹਿਲਾਂ ਕਿ ਉਹ ਸਲਾਹ-ਮਸ਼ਵਰਾ ਕਰ ਸਕਣ। ਉਹ ਸਾਡੇ ਦੁਆਰਾ ਨਿਰਧਾਰਤ ਸੀਮਾਵਾਂ ਦੇ ਅੰਦਰ ਆਪਣੇ ਪ੍ਰਤੀ ਮਿੰਟ ਕਿਰਾਏ ਨਿਰਧਾਰਤ ਕਰਦੇ ਹਨ।';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'ਸਲਾਹ-ਮਸ਼ਵਰੇ ਦੌਰਾਨ ਸਾਂਝੇ ਕੀਤੇ ਗਏ ਵਿਚਾਰ ਅਤੇ ਮਾਰਗਦਰਸ਼ਨ ਵਿਅਕਤੀਗਤ ਜੋਤਸ਼ੀ ਦੇ ਹੁੰਦੇ ਹਨ ਨਾ ਕਿ';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return '$appName ਦਾ। ਸਲਾਹ-ਮਸ਼ਵਰੇ ਦੇ ਆਧਾਰ \'ਤੇ ਤੁਹਾਡੇ ਦੁਆਰਾ ਲਏ ਗਏ ਕਿਸੇ ਵੀ ਫੈਸਲੇ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।';
  }

  @override
  String get s7RecordingsContent => '7. ਰਿਕਾਰਡਿੰਗਾਂ ਅਤੇ ਸਮੱਗਰੀ';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'ਗੁਣਵੱਤਾ, ਸੁਰੱਖਿਆ ਅਤੇ ਵਿਵਾਦ ਦੇ ਹੱਲ ਲਈ, ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸਲਾਹ-ਮਸ਼ਵਰੇ ਰਿਕਾਰਡ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ। ਤੁਸੀਂ';

  @override
  String get consentToSuchRecordingByStarting =>
      'ਇੱਕ ਸੈਸ਼ਨ ਸ਼ੁਰੂ ਕਰਕੇ ਅਜਿਹੀ ਰਿਕਾਰਡਿੰਗ ਲਈ ਸਹਿਮਤੀ ਦਿਓ। ਚੈਟ ਗੱਲਬਾਤਾਂ ਨੂੰ ਸਟੋਰ ਕੀਤਾ ਜਾਂਦਾ ਹੈ ਤਾਂ ਜੋ ਤੁਸੀਂ ਦੁਬਾਰਾ ਜਾ ਸਕੋ';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'ਉਹਨਾਂ ਲਈ। ਇਸ ਡੇਟਾ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਿਆ ਜਾਂਦਾ ਹੈ, ਇਸ ਲਈ ਸਾਡੀ ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਵੇਖੋ।';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. ਦੇਣਦਾਰੀ ਦੀ ਬੇਦਾਅਵਾ ਅਤੇ ਸੀਮਾ';

  @override
  String get theServicesAreProvidedAsIs =>
      'ਸੇਵਾਵਾਂ \"ਜਿਵੇਂ ਹਨ\" ਮਾਰਗਦਰਸ਼ਨ ਅਤੇ ਮਨੋਰੰਜਨ ਨਾਲ ਲੱਗਦੇ ਨਿੱਜੀ ਪ੍ਰਤੀਬਿੰਬ ਲਈ ਪ੍ਰਦਾਨ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return '$appName ਕਿਸੇ ਵੀ ਭਵਿੱਖਬਾਣੀ ਜਾਂ ਉਪਾਅ ਦੀ ਸ਼ੁੱਧਤਾ ਦੀ ਕੋਈ ਗਰੰਟੀ ਨਹੀਂ ਦਿੰਦੀ। ਵੱਧ ਤੋਂ ਵੱਧ ਹੱਦ ਤੱਕ';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'ਕਾਨੂੰਨ ਦੁਆਰਾ ਆਗਿਆ ਦਿੱਤੀ ਗਈ ਹੈ, ਸੇਵਾਵਾਂ ਦੀ ਤੁਹਾਡੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀ $appName ਦੀ ਕੁੱਲ ਦੇਣਦਾਰੀ ਸੀਮਿਤ ਹੈ';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'ਘਟਨਾ ਤੋਂ 30 ਦਿਨਾਂ ਪਹਿਲਾਂ ਤੁਹਾਡੇ ਬਟੂਏ ਵਿੱਚ ਜਮ੍ਹਾਂ ਕੀਤੀ ਗਈ ਰਕਮ ਜਿਸ ਨਾਲ ਦਾਅਵਾ ਪੈਦਾ ਹੁੰਦਾ ਹੈ। ਅਸੀਂ';

  @override
  String get areNotLiableForIndirectOr =>
      'ਅਸਿੱਧੇ ਜਾਂ ਪਰਿਣਾਮੀ ਨੁਕਸਾਨਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਨ।';

  @override
  String get s9SuspensionTermination => '9. ਮੁਅੱਤਲੀ ਅਤੇ ਸਮਾਪਤੀ';

  @override
  String get weMaySuspendOrTerminateYour =>
      'ਜੇਕਰ ਤੁਸੀਂ ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਦੀ ਉਲੰਘਣਾ ਕਰਦੇ ਹੋ, ਧੋਖਾਧੜੀ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹੋ, ਜਾਂ ਦੁਰਵਰਤੋਂ ਕਰਦੇ ਹੋ ਤਾਂ ਅਸੀਂ ਤੁਹਾਡੇ ਖਾਤੇ ਨੂੰ ਮੁਅੱਤਲ ਜਾਂ ਖਤਮ ਕਰ ਸਕਦੇ ਹਾਂ';

  @override
  String get servicesYouMayStopUsingThe =>
      'ਸੇਵਾਵਾਂ। ਤੁਸੀਂ ਕਿਸੇ ਵੀ ਸਮੇਂ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਬੰਦ ਕਰ ਸਕਦੇ ਹੋ। ਕੁਝ ਪ੍ਰਬੰਧ (ਭੁਗਤਾਨ ਦੀਆਂ ਜ਼ਿੰਮੇਵਾਰੀਆਂ,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      '(ਬੇਦਾਅਵਾ, ਅਤੇ ਦੇਣਦਾਰੀ ਦੀਆਂ ਸੀਮਾਵਾਂ) ਸਮਾਪਤੀ ਤੋਂ ਬਚ ਜਾਂਦੇ ਹਨ।';

  @override
  String get s10ChangesToTheseTerms => '10. ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਵਿੱਚ ਬਦਲਾਅ';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'ਅਸੀਂ ਸਮੇਂ-ਸਮੇਂ \'ਤੇ ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਨੂੰ ਅਪਡੇਟ ਕਰ ਸਕਦੇ ਹਾਂ। ਸਮੱਗਰੀ ਵਿੱਚ ਬਦਲਾਅ ਐਪ ਵਿੱਚ ਜਾਂ ਦੁਆਰਾ ਸੂਚਿਤ ਕੀਤੇ ਜਾਣਗੇ';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'ਉੱਪਰ \"ਆਖਰੀ ਵਾਰ ਅੱਪਡੇਟ\" ਮਿਤੀ ਨੂੰ ਅੱਪਡੇਟ ਕਰਨਾ। ਤਬਦੀਲੀਆਂ ਤੋਂ ਬਾਅਦ ਲਗਾਤਾਰ ਵਰਤੋਂ ਦਾ ਮਤਲਬ ਹੈ ਕਿ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਸਵੀਕਾਰ ਕਰਦੇ ਹੋ।';

  @override
  String get s11ContactUs => '11. ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'ਇਹਨਾਂ ਸ਼ਰਤਾਂ ਬਾਰੇ ਕੋਈ ਸਵਾਲ ਹਨ? ਸਾਡੀ ਵੈੱਬਸਾਈਟ \'ਤੇ ਜਾਂ ਐਪ ਦੇ ਸੰਪਰਕ ਫਾਰਮ ਰਾਹੀਂ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get helpSupportSection => 'ਮਦਦ ਅਤੇ ਸਹਾਇਤਾ ਭਾਗ।';

  @override
  String get privacyPolicy2 => 'ਪਰਾਈਵੇਟ ਨੀਤੀ';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'ਤੁਹਾਡੇ ਜਨਮ ਵੇਰਵੇ, ਸਲਾਹ-ਮਸ਼ਵਰੇ ਅਤੇ ਗੱਲਬਾਤ ਤੁਹਾਡੇ ਲਈ ਨਿੱਜੀ ਹਨ। ਇਹ ਨੀਤੀ ਦੱਸਦੀ ਹੈ ਕਿ ਅਸੀਂ ਕੀ';

  @override
  String get collectWhyAndTheControlYou =>
      'ਇਕੱਠਾ ਕਰੋ, ਕਿਉਂ, ਅਤੇ ਇਸ ਉੱਤੇ ਤੁਹਾਡਾ ਕਿੰਨਾ ਕੰਟਰੋਲ ਹੈ।';

  @override
  String get s1InformationWeCollect =>
      '1. ਸਾਡੇ ਵੱਲੋਂ ਇਕੱਠੀ ਕੀਤੀ ਜਾਣ ਵਾਲੀ ਜਾਣਕਾਰੀ';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'ਖਾਤੇ ਦੀ ਜਾਣਕਾਰੀ: ਤੁਹਾਡਾ ਨਾਮ, ਫ਼ੋਨ ਨੰਬਰ (OTP ਦੁਆਰਾ ਤਸਦੀਕ ਕੀਤਾ ਗਿਆ), ਅਤੇ ਜੇਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ ਤਾਂ ਈਮੇਲ।';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'ਜਨਮ ਵੇਰਵੇ: ਮਿਤੀ, ਸਮਾਂ ਅਤੇ ਜਨਮ ਸਥਾਨ ਜੋ ਤੁਸੀਂ ਕੁੰਡਲੀ ਅਤੇ ਪਾਠਾਂ ਲਈ ਸਾਂਝਾ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ।';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'ਸਲਾਹ-ਮਸ਼ਵਰਾ ਡੇਟਾ: ਚੈਟ ਸੁਨੇਹੇ, ਅਤੇ ਆਡੀਓ/ਵੀਡੀਓ ਕਾਲ ਰਿਕਾਰਡਿੰਗ ਜਿੱਥੇ ਲਾਗੂ ਹੋਵੇ।';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'ਭੁਗਤਾਨ ਡੇਟਾ: ਵਾਲਿਟ ਲੈਣ-ਦੇਣ ਅਤੇ ਭੁਗਤਾਨ ਹਵਾਲੇ। ਕਾਰਡ ਵੇਰਵੇ ਸਾਡੇ ਭੁਗਤਾਨ ਸਾਥੀ (PayU) ਦੁਆਰਾ ਸੰਭਾਲੇ ਜਾਂਦੇ ਹਨ; ਅਸੀਂ ਪੂਰੇ ਕਾਰਡ ਨੰਬਰ ਸਟੋਰ ਨਹੀਂ ਕਰਦੇ ਹਾਂ।';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'ਡਿਵਾਈਸ ਅਤੇ ਵਰਤੋਂ ਡੇਟਾ: ਡਿਵਾਈਸ ਦੀ ਕਿਸਮ, ਓਪਰੇਟਿੰਗ ਸਿਸਟਮ, ਤੁਹਾਡੇ IP ਪਤੇ ਤੋਂ ਪ੍ਰਾਪਤ ਅਨੁਮਾਨਿਤ ਸਥਾਨ, ਦੇਖੇ ਗਏ ਪੰਨੇ, ਅਤੇ ਸੇਵਾਵਾਂ ਨੂੰ ਚਲਾਉਣ ਅਤੇ ਬਿਹਤਰ ਬਣਾਉਣ ਲਈ ਵਰਤੇ ਗਏ ਪਰਸਪਰ ਪ੍ਰਭਾਵ।';

  @override
  String get s2HowWeUseIt => '2. ਅਸੀਂ ਇਸਨੂੰ ਕਿਵੇਂ ਵਰਤਦੇ ਹਾਂ';

  @override
  String get toCreateAndSecureYourAccount =>
      'ਆਪਣਾ ਖਾਤਾ ਬਣਾਉਣ ਅਤੇ ਸੁਰੱਖਿਅਤ ਕਰਨ ਅਤੇ ਆਪਣੀ ਪਛਾਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ।';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'ਤੁਹਾਨੂੰ ਜੋਤਸ਼ੀਆਂ ਨਾਲ ਜੋੜਨ ਅਤੇ ਸਲਾਹ-ਮਸ਼ਵਰੇ, ਕੁੰਡਲੀ, ਕੁੰਡਲੀਆਂ ਅਤੇ ਹੋਰ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ।';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'ਵਾਲਿਟ ਰੀਚਾਰਜ, ਪ੍ਰਤੀ ਮਿੰਟ ਬਿਲਿੰਗ, ਭੁਗਤਾਨ, ਅਤੇ ਆਰਡਰ ਪੂਰਤੀ ਦੀ ਪ੍ਰਕਿਰਿਆ ਕਰਨ ਲਈ।';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'ਸਹਾਇਤਾ ਪ੍ਰਦਾਨ ਕਰਨ, ਧੋਖਾਧੜੀ ਅਤੇ ਦੁਰਵਰਤੋਂ ਨੂੰ ਰੋਕਣ ਅਤੇ ਕਾਨੂੰਨੀ ਜ਼ਿੰਮੇਵਾਰੀਆਂ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ।';

  @override
  String get toUnderstandAndImproveHowThe =>
      'ਐਪ ਅਤੇ ਵੈੱਬਸਾਈਟ ਦੀ ਵਰਤੋਂ ਨੂੰ ਸਮਝਣ ਅਤੇ ਬਿਹਤਰ ਬਣਾਉਣ ਲਈ।';

  @override
  String get s3WhenWeShareInformation => '3. ਜਦੋਂ ਅਸੀਂ ਜਾਣਕਾਰੀ ਸਾਂਝੀ ਕਰਦੇ ਹਾਂ';

  @override
  String get weDoNotSellYourPersonal =>
      'ਅਸੀਂ ਤੁਹਾਡੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਨਹੀਂ ਵੇਚਦੇ। ਅਸੀਂ ਇਸਨੂੰ ਸਿਰਫ਼ ਇਹਨਾਂ ਨਾਲ ਸਾਂਝਾ ਕਰਦੇ ਹਾਂ:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'ਜਿਸ ਜੋਤਸ਼ੀ ਨਾਲ ਤੁਸੀਂ ਸਲਾਹ ਕਰਦੇ ਹੋ, ਉਸ ਨਾਲ ਸਿਰਫ਼ ਪੜ੍ਹਨ ਲਈ ਲੋੜੀਂਦੀ ਜਾਣਕਾਰੀ ਤੱਕ ਸੀਮਤ ਰਹੋ (ਜਿਵੇਂ ਕਿ ਤੁਹਾਡੇ ਜਨਮ ਵੇਰਵੇ ਅਤੇ ਗੱਲਬਾਤ)।';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'ਸੇਵਾ ਪ੍ਰਦਾਤਾਵਾਂ ਦੇ ਨਾਲ ਜੋ ਸਾਨੂੰ ਗੁਪਤਤਾ ਦੀਆਂ ਜ਼ਿੰਮੇਵਾਰੀਆਂ ਦੇ ਤਹਿਤ — ਭੁਗਤਾਨ ਪ੍ਰਕਿਰਿਆ (PayU), ਕਲਾਉਡ ਹੋਸਟਿੰਗ ਅਤੇ ਸਟੋਰੇਜ, ਸੰਚਾਰ (OTP ਲਈ WhatsApp/SMS), ਅਤੇ ਸੂਚਨਾਵਾਂ — ਚਲਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ।';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'ਜਦੋਂ ਕਾਨੂੰਨ ਦੁਆਰਾ ਲੋੜੀਂਦਾ ਹੋਵੇ, ਜਾਂ ਉਪਭੋਗਤਾਵਾਂ ਅਤੇ $appName ਦੇ ਅਧਿਕਾਰਾਂ, ਸੁਰੱਖਿਆ ਅਤੇ ਜਾਇਦਾਦ ਦੀ ਰੱਖਿਆ ਲਈ।';
  }

  @override
  String get s4ConsultationRecordingsChats =>
      '4. ਸਲਾਹ-ਮਸ਼ਵਰਾ ਰਿਕਾਰਡਿੰਗ ਅਤੇ ਗੱਲਬਾਤ';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'ਆਡੀਓ ਅਤੇ ਵੀਡੀਓ ਸਲਾਹ-ਮਸ਼ਵਰੇ ਰਿਕਾਰਡ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ, ਅਤੇ ਚੈਟਾਂ ਨੂੰ ਸਟੋਰ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਗੁਣਵੱਤਾ, ਸੁਰੱਖਿਆ, ਅਤੇ';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'ਵਿਵਾਦ ਦਾ ਹੱਲ। ਤੁਸੀਂ ਐਪ ਵਿੱਚ ਆਪਣੇ ਚੈਟ ਇਤਿਹਾਸ ਦੀ ਸਮੀਖਿਆ ਕਰ ਸਕਦੇ ਹੋ। ਰਿਕਾਰਡਿੰਗਾਂ ਨੂੰ ਇਸ ਤਰ੍ਹਾਂ ਰੱਖਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'ਹੇਠਾਂ ਦੱਸਿਆ ਗਿਆ ਹੈ ਅਤੇ ਸਿਰਫ਼ ਸਹਾਇਤਾ, ਸੁਰੱਖਿਆ, ਜਾਂ ਕਾਨੂੰਨੀ ਕਾਰਨਾਂ ਕਰਕੇ ਲੋੜ ਪੈਣ \'ਤੇ ਹੀ ਪਹੁੰਚ ਕੀਤੀ ਜਾਂਦੀ ਹੈ।';

  @override
  String get s5AnalyticsCookies => '5. ਵਿਸ਼ਲੇਸ਼ਣ ਅਤੇ ਕੂਕੀਜ਼';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'ਸਾਡੀ ਵੈੱਬਸਾਈਟ ਵਾਪਸੀ ਮੁਲਾਕਾਤਾਂ ਦੀ ਪਛਾਣ ਕਰਨ ਲਈ ਇੱਕ ਪਹਿਲੀ-ਧਿਰ ਕੂਕੀ/ਪਛਾਣਕਰਤਾ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ, ਇਹ ਮਾਪਦੀ ਹੈ ਕਿ ਕਿਵੇਂ';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'ਲੈਂਡਿੰਗ ਪੰਨਾ ਪ੍ਰਦਰਸ਼ਨ ਕਰਦਾ ਹੈ (ਜਿਵੇਂ ਕਿ ਕਿਹੜੇ ਭਾਗਾਂ \'ਤੇ ਕਲਿੱਕ ਕੀਤਾ ਜਾਂਦਾ ਹੈ), ਅਤੇ ਮਾਰਕੀਟਿੰਗ ਲਈ ਸਾਈਨ-ਅੱਪ ਵਿਸ਼ੇਸ਼ਤਾ ਦਿੰਦਾ ਹੈ';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'ਮੁਹਿੰਮਾਂ। ਇਸਦੀ ਵਰਤੋਂ ਅਨੁਭਵ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਲਈ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਲਗਭਗ ਸ਼ਹਿਰ/ਖੇਤਰ ਪ੍ਰਾਪਤ ਕਰਦੇ ਹਾਂ';

  @override
  String get fromYourIpAddressWeDo =>
      'ਤੁਹਾਡੇ IP ਪਤੇ ਤੋਂ; ਅਸੀਂ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ ਸਹੀ GPS ਸਥਾਨ ਦੀ ਵਰਤੋਂ ਨਹੀਂ ਕਰਦੇ।';

  @override
  String get s6DataRetention => '6. ਡਾਟਾ ਰੀਟੈਂਸ਼ਨ';

  @override
  String get weKeepYourInformationForAs =>
      'ਅਸੀਂ ਤੁਹਾਡੀ ਜਾਣਕਾਰੀ ਨੂੰ ਉਦੋਂ ਤੱਕ ਰੱਖਦੇ ਹਾਂ ਜਿੰਨਾ ਚਿਰ ਤੁਹਾਡਾ ਖਾਤਾ ਕਿਰਿਆਸ਼ੀਲ ਹੈ ਅਤੇ ਲੋੜ ਅਨੁਸਾਰ ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'ਸੇਵਾਵਾਂ, ਕਾਨੂੰਨੀ ਜ਼ਿੰਮੇਵਾਰੀਆਂ ਦੀ ਪਾਲਣਾ, ਵਿਵਾਦਾਂ ਨੂੰ ਹੱਲ ਕਰਨ, ਅਤੇ ਸਾਡੇ ਸਮਝੌਤਿਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨ। ਤੁਸੀਂ ਕਰ ਸਕਦੇ ਹੋ';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'ਤੁਹਾਡੇ ਖਾਤੇ ਅਤੇ ਸੰਬੰਧਿਤ ਨਿੱਜੀ ਡੇਟਾ ਨੂੰ ਮਿਟਾਉਣ ਦੀ ਬੇਨਤੀ, ਕਾਨੂੰਨੀ ਤੌਰ \'ਤੇ ਬਰਕਰਾਰ ਰੱਖਣ ਦੇ ਅਧੀਨ';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'ਜ਼ਰੂਰਤਾਂ (ਉਦਾਹਰਣ ਵਜੋਂ, ਲੈਣ-ਦੇਣ ਦੇ ਰਿਕਾਰਡ ਜੋ ਸਾਨੂੰ ਲੇਖਾ ਅਤੇ ਟੈਕਸ ਲਈ ਰੱਖਣੇ ਚਾਹੀਦੇ ਹਨ)।';

  @override
  String get s7Security => '7. ਸੁਰੱਖਿਆ';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'ਅਸੀਂ ਉਦਯੋਗ-ਮਿਆਰੀ ਉਪਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਾਂ — ਆਵਾਜਾਈ ਵਿੱਚ ਇਨਕ੍ਰਿਪਸ਼ਨ, ਪਹੁੰਚ ਨਿਯੰਤਰਣ, ਅਤੇ ਸੁਰੱਖਿਅਤ';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'ਬੁਨਿਆਦੀ ਢਾਂਚਾ — ਤੁਹਾਡੀ ਜਾਣਕਾਰੀ ਦੀ ਰੱਖਿਆ ਲਈ। ਸੰਚਾਰ ਜਾਂ ਸਟੋਰੇਜ ਦਾ ਕੋਈ ਵੀ ਤਰੀਕਾ ਪੂਰੀ ਤਰ੍ਹਾਂ ਨਹੀਂ ਹੈ';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'ਸੁਰੱਖਿਅਤ, ਇਸ ਲਈ ਅਸੀਂ ਪੂਰਨ ਸੁਰੱਖਿਆ ਦੀ ਗਰੰਟੀ ਨਹੀਂ ਦੇ ਸਕਦੇ।';

  @override
  String get s8YourRightsChoices => '8. ਤੁਹਾਡੇ ਹੱਕ ਅਤੇ ਚੋਣਾਂ';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'ਐਪ ਵਿੱਚ ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਅਤੇ ਜਨਮ ਵੇਰਵਿਆਂ ਤੱਕ ਪਹੁੰਚ ਕਰੋ, ਸਹੀ ਕਰੋ ਜਾਂ ਅਪਡੇਟ ਕਰੋ।';

  @override
  String get requestACopyOrDeletionOf =>
      'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰਕੇ ਆਪਣੇ ਨਿੱਜੀ ਡੇਟਾ ਦੀ ਇੱਕ ਕਾਪੀ ਜਾਂ ਮਿਟਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ।';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'ਆਪਣੀ ਡਿਵਾਈਸ ਜਾਂ ਐਪ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਪ੍ਰਚਾਰ ਸੰਬੰਧੀ ਸੂਚਨਾਵਾਂ ਤੋਂ ਹਟਣ ਦੀ ਚੋਣ ਕਰੋ।';

  @override
  String get s9Children => '9. ਬੱਚੇ';

  @override
  String get theServicesAreIntendedForUsers =>
      'ਇਹ ਸੇਵਾਵਾਂ 18 ਸਾਲ ਅਤੇ ਇਸ ਤੋਂ ਵੱਧ ਉਮਰ ਦੇ ਉਪਭੋਗਤਾਵਾਂ ਲਈ ਹਨ। ਅਸੀਂ ਜਾਣਬੁੱਝ ਕੇ ਇਹਨਾਂ ਤੋਂ ਡੇਟਾ ਇਕੱਠਾ ਨਹੀਂ ਕਰਦੇ ਹਾਂ';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '18 ਸਾਲ ਤੋਂ ਘੱਟ ਉਮਰ ਦਾ ਕੋਈ ਵੀ ਵਿਅਕਤੀ। ਜੇਕਰ ਤੁਹਾਨੂੰ ਲੱਗਦਾ ਹੈ ਕਿ ਕਿਸੇ ਨਾਬਾਲਗ ਨੇ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕੀਤੀ ਹੈ, ਤਾਂ ਕਿਰਪਾ ਕਰਕੇ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ ਤਾਂ ਜੋ ਅਸੀਂ ਇਸਨੂੰ ਹਟਾ ਸਕੀਏ।';

  @override
  String get s10ChangesToThisPolicy => '10. ਇਸ ਨੀਤੀ ਵਿੱਚ ਬਦਲਾਅ';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'ਅਸੀਂ ਇਸ ਨੀਤੀ ਨੂੰ ਅੱਪਡੇਟ ਕਰ ਸਕਦੇ ਹਾਂ। ਸਮੱਗਰੀ ਵਿੱਚ ਬਦਲਾਅ ਐਪ ਵਿੱਚ ਜਾਂ ਅੱਪਡੇਟ ਕਰਕੇ ਸੂਚਿਤ ਕੀਤੇ ਜਾਣਗੇ';

  @override
  String get lastUpdatedDateAbove => 'ਉੱਪਰ \"ਆਖਰੀ ਵਾਰ ਅੱਪਡੇਟ\" ਮਿਤੀ।';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'ਗੋਪਨੀਯਤਾ ਸੰਬੰਧੀ ਸਵਾਲਾਂ ਜਾਂ ਡੇਟਾ ਬੇਨਤੀਆਂ ਲਈ, ਸਾਡੀ ਵੈੱਬਸਾਈਟ \'ਤੇ ਸੰਪਰਕ ਫਾਰਮ ਰਾਹੀਂ ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ ਜਾਂ';

  @override
  String get appSHelpSupportSection => 'ਐਪ ਦਾ ਮਦਦ ਅਤੇ ਸਹਾਇਤਾ ਭਾਗ।';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return 'Â© 2026 $appName Â· 18+ Â· ਮਾਰਗਦਰਸ਼ਨ ਅਤੇ ਤੰਦਰੁਸਤੀ ਲਈ - ਪੇਸ਼ੇਵਰ ਸਲਾਹ ਦਾ ਬਦਲ ਨਹੀਂ।';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'ਚੌੜਾਈ=ਡਿਵਾਈਸ-ਚੌੜਾਈ, ਸ਼ੁਰੂਆਤੀ-ਸਕੇਲ=1, ਵੱਧ ਤੋਂ ਵੱਧ-ਸਕੇਲ=1';

  @override
  String get segoeUi => 'ਸੇਗੋਈ ਯੂਆਈ';

  @override
  String get vote => 'ਵੋਟ ਦਿਓ';

  @override
  String get couldnTLoadLiveSessions => 'ਲਾਈਵ ਸੈਸ਼ਨ ਲੋਡ ਨਹੀਂ ਕੀਤੇ ਜਾ ਸਕੇ';

  @override
  String get noOneIsLiveRightNow => 'ਇਸ ਵੇਲੇ ਕੋਈ ਵੀ ਲਾਈਵ ਨਹੀਂ ਹੈ।';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'ਜਦੋਂ ਕੋਈ ਜੋਤਸ਼ੀ ਲਾਈਵ ਹੁੰਦਾ ਹੈ, ਤਾਂ ਉਹ ਇੱਥੇ ਦਿਖਾਈ ਦੇਣਗੇ। ਰਿਫ੍ਰੈਸ਼ ਕਰਨ ਲਈ ਹੇਠਾਂ ਖਿੱਚੋ — ਜਾਂ ਸੂਚਨਾ ਲਈ ਦੇਖੋ।';

  @override
  String get justNow => 'ਹੁਣੇ';

  @override
  String get couldNotLoad => 'ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get continueLabel => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get openSettings => 'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String get somePermissionsAreBlockedTapA =>
      'ਕੁਝ ਇਜਾਜ਼ਤਾਂ ਬਲੌਕ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ। ਕਿਸੇ ਬਲੌਕ ਕੀਤੀ ਆਈਟਮ (ਜਾਂ \"ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ\") \'ਤੇ ਟੈਪ ਕਰੋ ਅਤੇ ਇਸਨੂੰ ਚਾਲੂ ਕਰੋ, ਫਿਰ ਇੱਥੇ ਵਾਪਸ ਆਓ।';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return '$appName ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਇਹ ਇਜਾਜ਼ਤਾਂ ਲੋੜੀਂਦੀਆਂ ਹਨ। ਕਿਸੇ ਵੀ ਲੰਬਿਤ ਆਈਟਮ ਨੂੰ ਮਨਜ਼ੂਰੀ ਦੇਣ ਲਈ ਉਸ \'ਤੇ ਟੈਪ ਕਰੋ।';
  }

  @override
  String get settings2 => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get allow => 'ਆਗਿਆ ਦਿਓ';

  @override
  String get blockedEnableItInSettings =>
      'ਬਲੌਕ ਕੀਤਾ ਗਿਆ — ਇਸਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰੋ';

  @override
  String get allowsUpTo => 'ਤੱਕ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ';

  @override
  String get bookingFailed => 'ਬੁਕਿੰਗ ਅਸਫਲ ਰਹੀ';

  @override
  String get yourDetails => 'ਤੁਹਾਡੇ ਵੇਰਵੇ';

  @override
  String get fromYourProfile => 'ਤੁਹਾਡੀ ਪ੍ਰੋਫਾਈਲ ਤੋਂ';

  @override
  String get familyMembers => 'ਪਰਿਵਾਰਕ ਮੈਂਬਰ';

  @override
  String get addMember => 'ਮੈਂਬਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get addAnother => 'ਇੱਕ ਹੋਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get preferredDateOptional => 'ਪਸੰਦੀਦਾ ਤਾਰੀਖ (ਵਿਕਲਪਿਕ)';

  @override
  String get anyDate => 'ਕੋਈ ਵੀ ਤਾਰੀਖ਼';

  @override
  String get bookNowFree => 'ਹੁਣੇ ਬੁੱਕ ਕਰੋ (ਮੁਫ਼ਤ)';

  @override
  String get couldNotLoadThisPooja => 'ਇਸ ਪੂਜਾ ਨੂੰ ਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ।';

  @override
  String get forLabel => 'ਲਈ';

  @override
  String get s1Person => '1 ਵਿਅਕਤੀ';

  @override
  String get bookShareDetails => 'ਬੁੱਕ ਕਰੋ ਅਤੇ ਵੇਰਵੇ ਸਾਂਝੇ ਕਰੋ';

  @override
  String get confirmYourBookingWithTheNames =>
      'ਪੂਜਾ ਜਿਨ੍ਹਾਂ ਨਾਵਾਂ ਲਈ ਕੀਤੀ ਜਾਂਦੀ ਹੈ, ਉਨ੍ਹਾਂ ਨਾਲ ਆਪਣੀ ਬੁਕਿੰਗ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ।';

  @override
  String get panditCoordinates => 'ਪੰਡਿਤ ਕੋਆਰਡੀਨੇਟ';

  @override
  String get aVerifiedPanditCallsToFix =>
      'ਇੱਕ ਪ੍ਰਮਾਣਿਤ ਪੰਡਿਤ ਸਮਾਂ ਤੈਅ ਕਰਨ ਅਤੇ ਸਮੱਗਰੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰਨ ਲਈ ਫ਼ੋਨ ਕਰਦਾ ਹੈ।';

  @override
  String get poojaPerformed => 'ਪੂਜਾ ਕੀਤੀ।';

  @override
  String get sankalpIsTakenInYourFamily =>
      'ਸੰਕਲਪ ਤੁਹਾਡੇ ਪਰਿਵਾਰ ਦੇ ਨਾਮ \'ਤੇ ਲਿਆ ਜਾਂਦਾ ਹੈ, ਅਤੇ ਪ੍ਰਸ਼ਾਦ ਬਾਅਦ ਵਿੱਚ ਜਿੱਥੇ ਲਾਗੂ ਹੁੰਦਾ ਹੈ ਸਾਂਝਾ ਕੀਤਾ ਜਾਂਦਾ ਹੈ।';

  @override
  String get couldNotLoadPoojas => 'ਪੂਜਾ ਲੋਡ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ।';

  @override
  String get any => 'ਕੋਈ ਵੀ';

  @override
  String get noPoojasHere => 'ਇੱਥੇ ਕੋਈ ਪੂਜਾ ਨਹੀਂ ਹੈ।';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'ਮੌਜੂਦਾ ਫਿਲਟਰਾਂ ਨਾਲ ਕੁਝ ਵੀ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ।';

  @override
  String get noPoojasAvailableYet => 'ਅਜੇ ਕੋਈ ਪੂਜਾ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get showAllPoojas => 'ਸਾਰੀਆਂ ਪੂਜਾਵਾਂ ਦਿਖਾਓ';

  @override
  String get tapToViewDetailsBook => 'ਵੇਰਵੇ ਦੇਖਣ ਅਤੇ ਬੁੱਕ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get appliedYouBothEarnOnYour =>
      'ਲਾਗੂ ਕੀਤਾ! ਤੁਸੀਂ ਦੋਵੇਂ ਆਪਣੇ ਪਹਿਲੇ ਰੀਚਾਰਜ \'ਤੇ ਪੈਸੇ ਕਮਾਓਗੇ।';

  @override
  String get shareYourCode => 'ਆਪਣਾ ਕੋਡ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get sendYourCodeToFriendsVia =>
      'ਆਪਣਾ ਕੋਡ ਦੋਸਤਾਂ ਨੂੰ WhatsApp, SMS, ਕਿਤੇ ਵੀ ਭੇਜੋ।';

  @override
  String get friendSignsUp => 'ਦੋਸਤ ਸਾਈਨ ਅੱਪ ਕਰਦਾ ਹੈ';

  @override
  String get theyEnterYourCodeInRefer =>
      'ਸਾਈਨ ਅੱਪ ਕਰਨ ਤੋਂ ਬਾਅਦ ਉਹ ਤੁਹਾਡਾ ਕੋਡ Refer & Earn ਵਿੱਚ ਦਰਜ ਕਰਦੇ ਹਨ।';

  @override
  String get feedbackReceived => 'ਫੀਡਬੈਕ ਪ੍ਰਾਪਤ ਹੋਇਆ ✓';

  @override
  String get thanksOurTeamWillLookInto => 'ਧੰਨਵਾਦ — ਸਾਡੀ ਟੀਮ ਇਸ ਦੀ ਜਾਂਚ ਕਰੇਗੀ।';

  @override
  String get fullName => 'ਪੂਰਾ ਨਾਂਮ';

  @override
  String get email => 'ਈਮੇਲ';

  @override
  String get phoneNumber => 'ਫੋਨ ਨੰਬਰ';

  @override
  String get message => 'ਸੁਨੇਹਾ';

  @override
  String get requiredLabel => 'ਲੋੜੀਂਦਾ';

  @override
  String get applicationReceived => 'ਅਰਜ਼ੀ ਪ੍ਰਾਪਤ ਹੋਈ ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'ਸਾਡੀ ਟੀਮ ਤੁਹਾਡੇ ਜੋਤਸ਼ੀ ਪ੍ਰੋਫਾਈਲ ਬਾਰੇ ਤੁਹਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੇਗੀ।';

  @override
  String get enter10Digits => '10 ਅੰਕ ਦਰਜ ਕਰੋ';

  @override
  String get aboutYouBioExpertiseExperience =>
      'ਤੁਹਾਡੇ ਬਾਰੇ (ਜੀਵ, ਮੁਹਾਰਤ, ਅਨੁਭਵ)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appName ਤੁਹਾਨੂੰ ਕਰੀਅਰ ਬਾਰੇ ਮਾਰਗਦਰਸ਼ਨ ਲਈ ਭਰੋਸੇਯੋਗ ਵੈਦਿਕ ਜੋਤਸ਼ੀਆਂ ਨਾਲ ਜੋੜਦੀ ਹੈ,';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'ਵਿਆਹ, ਵਿੱਤ, ਸਿਹਤ ਅਤੇ ਜ਼ਿੰਦਗੀ ਦੇ ਵੱਡੇ ਸਵਾਲ - ਚੈਟ, ਕਾਲ ਅਤੇ ਵੀਡੀਓ ਰਾਹੀਂ।';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'ਆਪਣੀ ਕੁੰਡਲੀ, ਰੋਜ਼ਾਨਾ ਕੁੰਡਲੀ, ਮੈਚਮੇਕਿੰਗ, ਪੂਜਾ ਅਤੇ ਉਪਚਾਰ, ਸਭ ਕੁਝ ਇੱਕੋ ਥਾਂ \'ਤੇ ਮੁਫ਼ਤ ਪ੍ਰਾਪਤ ਕਰੋ।\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'ਸਾਡਾ ਮਿਸ਼ਨ ਪ੍ਰਮਾਣਿਕ, ਹਮਦਰਦ ਅਧਿਆਤਮਿਕ ਮਾਰਗਦਰਸ਼ਨ ਨੂੰ ਹਰ ਕਿਸੇ ਲਈ ਪਹੁੰਚਯੋਗ ਬਣਾਉਣਾ ਹੈ,';

  @override
  String get inYourOwnLanguage => 'ਤੁਹਾਡੀ ਆਪਣੀ ਭਾਸ਼ਾ ਵਿੱਚ।';

  @override
  String get verifiedExperiencedAstrologers => 'ਪ੍ਰਮਾਣਿਤ, ਤਜਰਬੇਕਾਰ ਜੋਤਸ਼ੀ';

  @override
  String get privateSecureConsultations => 'ਨਿੱਜੀ ਅਤੇ ਸੁਰੱਖਿਅਤ ਸਲਾਹ-ਮਸ਼ਵਰੇ';

  @override
  String get availableIn6IndianLanguages => '6 ਭਾਰਤੀ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ ਉਪਲਬਧ';

  @override
  String get thanksForRatingUs => 'ਸਾਨੂੰ ਰੇਟਿੰਗ ਦੇਣ ਲਈ ਧੰਨਵਾਦ ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'ਤੁਹਾਡਾ ਫੀਡਬੈਕ $appName ਨੂੰ ਵਧਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।';
  }

  @override
  String get onceInADay => 'ਦਿਨ ਵਿੱਚ ਇੱਕ ਵਾਰ';

  @override
  String get twiceInADay => 'ਦਿਨ ਵਿੱਚ ਦੋ ਵਾਰ';

  @override
  String get asManyTimesAsItComes => 'ਜਿੰਨੀ ਵਾਰ ਆਉਂਦਾ ਹੈ';

  @override
  String get never => 'ਕਦੇ ਨਹੀਂ';

  @override
  String get cricket => 'ਕ੍ਰਿਕਟ';

  @override
  String get shareMarket => 'ਸ਼ੇਅਰ ਬਾਜ਼ਾਰ';

  @override
  String get bollywood => 'ਬਾਲੀਵੁੱਡ';

  @override
  String get newMagazine => 'ਨਵਾਂ ਰਸਾਲਾ';

  @override
  String get festivals => 'ਤਿਉਹਾਰ';

  @override
  String get notificationsUpdated => 'ਸੂਚਨਾਵਾਂ ਅੱਪਡੇਟ ਕੀਤੀਆਂ ਗਈਆਂ ✓';

  @override
  String get youLlHearFromUsBased =>
      'ਤੁਸੀਂ ਆਪਣੀਆਂ ਚੋਣਾਂ ਦੇ ਆਧਾਰ \'ਤੇ ਸਾਡੇ ਤੋਂ ਸੁਣੋਗੇ।';

  @override
  String get yourChartsWillNowFollowYour =>
      'ਤੁਹਾਡੇ ਚਾਰਟ ਹੁਣ ਤੁਹਾਡੀ ਚੁਣੀ ਹੋਈ ਸ਼ੈਲੀ ਦੀ ਪਾਲਣਾ ਕਰਨਗੇ।';

  @override
  String get chartStyle => 'ਚਾਰਟ ਸ਼ੈਲੀ';

  @override
  String get northIndian => 'ਉੱਤਰੀ ਭਾਰਤੀ';

  @override
  String get southIndian => 'ਦੱਖਣੀ ਭਾਰਤੀ';

  @override
  String get monthSystem => 'ਮਹੀਨਾ ਪ੍ਰਣਾਲੀ';

  @override
  String get amanta => 'ਮਾਲਕਣ';

  @override
  String get purnimanta => 'ਪੂਰਨਿਮੰਤਾ';

  @override
  String get darkMode => 'ਡਾਰਕ ਮੋਡ';

  @override
  String get off => 'ਬੰਦ';

  @override
  String get onLabel => 'ਚਾਲੂ';

  @override
  String get useDeviceSettings => 'ਡਿਵਾਈਸ ਸੈਟਿੰਗਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get ayanamsa => 'ਅਯਾਨਮਸਾ';

  @override
  String get nCLahiri => 'ਐਨ.ਸੀ. ਲਹਿਰੀ';

  @override
  String get kpNew => 'ਕੇਪੀ ਨਿਊ';

  @override
  String get kpOld => 'ਕੇਪੀ ਪੁਰਾਣਾ';

  @override
  String get raman => 'ਰਮਨ';

  @override
  String get kpKhullar => 'ਕੇਪੀ ਖੁੱਲਰ';

  @override
  String get subtotal => 'ਉਪ-ਕੁੱਲ';

  @override
  String get youSave => 'ਤੁਸੀਂਂਂ ਬਚਾਓ';

  @override
  String get total => 'ਕੁੱਲ';

  @override
  String get deliveryAddress => 'ਡਿਲੀਵਰੀ ਪਤਾ';

  @override
  String get orderSummary => 'ਆਰਡਰ ਸਾਰਾਂਸ਼';

  @override
  String get couponsOffers => 'ਕੂਪਨ ਅਤੇ ਪੇਸ਼ਕਸ਼ਾਂ';

  @override
  String get billDetails => 'ਬਿੱਲ ਵੇਰਵੇ';

  @override
  String get address => 'ਪਤਾ';

  @override
  String get productDiscount => 'ਉਤਪਾਦ ਛੋਟ';

  @override
  String get itemsSubtotal => 'ਆਈਟਮਾਂ ਦਾ ਉਪ-ਜੋੜ';

  @override
  String get delivery => 'ਡਿਲਿਵਰੀ';

  @override
  String get free2 => 'ਮੁਫ਼ਤ';

  @override
  String get toPay => 'ਭੁਗਤਾਨ ਕਰਨਾ';

  @override
  String get dMmmYyyyHMmA => 'd ਮਮਮ ਸਾਲ, ਹ:ਮਮ a';

  @override
  String get couldNotDownloadInvoice => 'ਇਨਵੌਇਸ ਡਾਊਨਲੋਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get orderNotFound => 'ਆਰਡਰ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get activityTimeline => 'ਗਤੀਵਿਧੀ ਸਮਾਂਰੇਖਾ';

  @override
  String get eeeDMmmYyyyHMm => 'ਈਈਈ, ਦਿਨ ਮਮਮ ਸਾਲ · ਘੰਟਾ:ਮਮ a';

  @override
  String get totalPaid => 'ਕੁੱਲ ਭੁਗਤਾਨ ਕੀਤਾ ਗਿਆ';

  @override
  String get orderPlaced2 => 'ਆਰਡਰ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get dMmmHMmA => 'd ਮਮਮ, ਹ:ਮਮ a';

  @override
  String get generating => 'ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get pleaseDescribeTheIssue => 'ਕਿਰਪਾ ਕਰਕੇ ਸਮੱਸਿਆ ਦਾ ਵਰਣਨ ਕਰੋ।';

  @override
  String get couldNotLoadProducts => 'ਉਤਪਾਦ ਲੋਡ ਨਹੀਂ ਕੀਤੇ ਜਾ ਸਕੇ';

  @override
  String get newest => 'ਸਭ ਤੋਂ ਨਵਾਂ';

  @override
  String get priceLowHigh => 'ਕੀਮਤ: ਘੱਟ → ਵੱਧ';

  @override
  String get priceHighLow => 'ਕੀਮਤ: ਵੱਧ → ਘੱਟ';

  @override
  String get topRated => 'ਸਭ ਤੋਂ ਵੱਧ ਦਰਜਾ ਪ੍ਰਾਪਤ';

  @override
  String get s6DigitPin => '6-ਅੰਕਾਂ ਵਾਲਾ ਪਿੰਨ';

  @override
  String get addressLine1 => 'ਪਤਾ ਲਾਈਨ 1 *';

  @override
  String get addressLine2 => 'ਪਤਾ ਲਾਈਨ 2';

  @override
  String get city => 'ਸ਼ਹਿਰ *';

  @override
  String get state => 'ਰਾਜ *';

  @override
  String get pinCode => 'ਪਿੰਨ ਕੋਡ *';

  @override
  String get payment => 'ਭੁਗਤਾਨ';

  @override
  String get pooja => 'ਪੂਜਾ';

  @override
  String get shop => 'ਦੁਕਾਨ';

  @override
  String get securePayment => 'ਸੁਰੱਖਿਅਤ ਭੁਗਤਾਨ';

  @override
  String get noTransactionsMatchTheseFilters =>
      'ਇਹਨਾਂ ਫਿਲਟਰਾਂ ਨਾਲ ਕੋਈ ਲੈਣ-ਦੇਣ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ।';

  @override
  String get noTransactionsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਹੈ';

  @override
  String get moneyAdded => 'ਪੈਸੇ ਜੋੜੇ ਗਏ';

  @override
  String get poojaBooking => 'ਪੂਜਾ ਬੁਕਿੰਗ';

  @override
  String get videoCall => 'ਵੀਡੀਓ ਕਾਲ';

  @override
  String get shopOrder => 'ਦੁਕਾਨ ਦਾ ਆਰਡਰ';

  @override
  String get refund => 'ਰਿਫੰਡ';

  @override
  String get bonus => 'ਬੋਨਸ';

  @override
  String get credited => 'ਕ੍ਰੈਡਿਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get debited => 'ਡੈਬਿਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get rg => 'A';

  @override
  String aExperienceyearsYrsExp(Object experienceYears) {
    return '$experienceYears yrs exp';
  }

  @override
  String weLlLetYouKnowWhen2(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String priceMin(Object price) {
    return '₹$price/min';
  }

  @override
  String n1000000Tostringasfixed1M(Object toStringAsFixed) {
    return '${toStringAsFixed}M';
  }

  @override
  String n1000Tostringasfixed1K(Object toStringAsFixed) {
    return '${toStringAsFixed}k';
  }

  @override
  String nameIsATrustedAstrologerWith(Object name, Object desc) {
    return '$name is a trusted astrologer with deep expertise in $desc. Over years of practice on the platform, ';
  }

  @override
  String chatMin(Object chat) {
    return '₹$chat/min';
  }

  @override
  String callMin(Object call) {
    return '₹$call/min';
  }

  @override
  String videoMin(Object video) {
    return '₹$video/min';
  }

  @override
  String widgetNameIsLive(Object name) {
    return '$name is live';
  }

  @override
  String widgetNameIsInASession(Object name) {
    return '$name is in a session right now';
  }

  @override
  String widgetNameIsOfflineRightNow(Object name) {
    return '$name is offline right now';
  }

  @override
  String storeFollowers1000Tostringasfixed1K(Object toStringAsFixed) {
    return '${toStringAsFixed}k';
  }

  @override
  String maxPriceMaxpriceRoundMin(Object round) {
    return 'Max price · ₹$round/min';
  }

  @override
  String sendTotalTokens(Object total) {
    return 'Send · $total tokens';
  }

  @override
  String sTypeTouppercaseLive(Object toUpperCase) {
    return '$toUpperCase · LIVE';
  }

  @override
  String widgetAstrologernameChatHistory(Object astrologerName) {
    return '$astrologerName · chat history';
  }

  @override
  String dailyAtRTimeofdayFor14(Object timeOfDay) {
    return 'Daily at $timeOfDay · for 14 days';
  }

  @override
  String onRDate(Object date) {
    return 'On $date';
  }

  @override
  String durSDurationsecSTotalamountCoins(
      Object durationSec, Object totalAmount) {
    return '$durationSec · $totalAmount coins';
  }

  @override
  String aboutMinutesleftMinLeft(Object minutesLeft) {
    return 'About $minutesLeft min left';
  }

  @override
  String nearbyPermissionPerm(Object perm) {
    return '[nearby] permission = $perm';
  }

  @override
  String nearbyGetcurrentpositionFailedETryingLast(Object e) {
    return '[nearby] getCurrentPosition failed: $e — trying last known';
  }

  @override
  String nearbyPositionPosLatitudePosLongitude(
      Object latitude, Object longitude) {
    return '[nearby] position = $latitude, $longitude';
  }

  @override
  String nearbyReversegeocodeCityCity(Object city) {
    return '[nearby] reverseGeocode city = \"$city\"';
  }

  @override
  String nearbyResolveErrorE(Object e) {
    return '[nearby] resolve error: $e';
  }

  @override
  String resumeSessionClock(Object clock) {
    return 'Resume · $clock';
  }

  @override
  String rateperminMin(Object ratePerMin) {
    return '₹$ratePerMin/min';
  }

  @override
  String checkYourConnectionAndTryAgain(Object error) {
    return 'Check your connection and try again.\n($error)';
  }

  @override
  String diffInminutesMAgo(Object inMinutes) {
    return '${inMinutes}m ago';
  }

  @override
  String diffInhoursHAgo(Object inHours) {
    return '${inHours}h ago';
  }

  @override
  String diffIndaysDAgo(Object inDays) {
    return '${inDays}d ago';
  }

  @override
  String thisPoojaCostsWidgetPoojaBaseprice(Object basePrice) {
    return 'This pooja costs ₹$basePrice. Your wallet doesn’t have enough balance — add money and try again.';
  }

  @override
  String payWidgetPoojaBasepriceBook(Object basePrice) {
    return 'Pay ₹$basePrice & Book';
  }

  @override
  String upToPMaxpersons(Object maxPersons) {
    return 'Up to $maxPersons';
  }

  @override
  String aSacredPNamePerformedBy(Object name) {
    return 'A sacred $name performed by experienced pandits. Book a slot and our team will reach out to coordinate the details and timing.';
  }

  @override
  String upToPoojaMaxpersons(Object maxPersons) {
    return 'up to $maxPersons';
  }

  @override
  String earnIRewardOnRudraganga(Object reward, String appName) {
    return 'Earn ₹$reward on $appName';
  }

  @override
  String bothEarnIReward(Object reward) {
    return 'Both earn ₹$reward';
  }

  @override
  String onTheirFirstWalletRechargeYou(Object reward) {
    return 'On their first wallet recharge, you both get ₹$reward instantly.';
  }

  @override
  String rechargeTotalBalance(Object balance) {
    return 'Recharge ₹$balance';
  }

  @override
  String itemTotalMrpQtycount(Object qtyCount) {
    return 'Item total (MRP) · $qtyCount';
  }

  @override
  String couponAppliedCode(Object code) {
    return 'Coupon ($code)';
  }

  @override
  String placeOrderTotal(Object total) {
    return 'Place Order · ₹$total';
  }

  @override
  String pPriceWasPMrp(Object price, Object mrp) {
    return '₹$price (was ₹$mrp)';
  }

  @override
  String pNamePricelineUrl(Object name, Object priceLine, Object url) {
    return '$name â $priceLine\n$url';
  }

  @override
  String ytWebviewErrorEErrorcodeE(Object errorCode, Object description) {
    return 'YT webview error: $errorCode $description';
  }

  @override
  String rgpayHttpErrorEResponseStatuscode(Object statusCode) {
    return 'RGPAY http error: $statusCode';
  }

  @override
  String rgpayResourceErrorEErrorcodeE(Object errorCode, Object description) {
    return 'RGPAY resource error: $errorCode $description';
  }
}
