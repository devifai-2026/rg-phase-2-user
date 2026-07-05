// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class L10nTa extends L10n {
  L10nTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'ஆஸ்ட்ரோ செயலி';

  @override
  String get tagline => 'ஜோதிடம் மற்றும் நல்வாழ்வு';

  @override
  String get splashBlessing =>
      'தெளிவை நோக்கிய உங்கள் பயணம் இங்கிருந்து தொடங்குகிறது.';

  @override
  String get authWelcomeTitle => 'வரவேற்கிறோம்';

  @override
  String get authWelcomeSubtitle =>
      'உங்கள் தொலைபேசி எண்ணைப் பயன்படுத்தி உள்நுழையுங்கள் அல்லது உங்கள் கணக்கை உருவாக்குங்கள்.';

  @override
  String get phoneLabel => 'தொலைபேசி எண்';

  @override
  String get phoneHint => '10 இலக்க மொபைல் எண்';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'தொடரவும்';

  @override
  String get sendOtpButton => 'OTP அனுப்பு';

  @override
  String get otpTitle => 'உங்கள் எண்ணைச் சரிபார்க்கவும்';

  @override
  String otpSubtitle(String phone) {
    return '$phone க்கு அனுப்பப்பட்ட 6-இலக்க குறியீட்டை உள்ளிடவும்';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'சரிபார்த்துத் தொடரவும்';

  @override
  String get resendOtp => 'மீண்டும் அனுப்பும் குறியீடு';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds வினாடிகளில் மீண்டும் அனுப்பவும்';
  }

  @override
  String get changeNumber => 'எண்ணை மாற்றவும்';

  @override
  String get termsNotice =>
      'தொடர்வதன் மூலம் எங்கள் விதிமுறைகள் மற்றும் தனியுரிமைக் கொள்கையை நீங்கள் ஏற்றுக்கொள்கிறீர்கள்.';

  @override
  String get acceptPrefix => 'நான் ஒப்புக்கொள்கிறேன்';

  @override
  String get acceptAnd => 'மற்றும்';

  @override
  String get termsOfService => 'சேவை விதிமுறைகள்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get errInvalidPhone => 'சரியான 10 இலக்க தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get errInvalidOtp => '6 இலக்கக் குறியீட்டை உள்ளிடவும்';

  @override
  String get errGeneric =>
      'ஏதோ தவறு நிகழ்ந்துவிட்டது. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get errNetwork =>
      'இணைப்பு இல்லை. உங்கள் இணைய இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get otpSent => 'OTP அனுப்பப்பட்டது';

  @override
  String get loginSuccess => 'உள்நுழைந்தார்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get language => 'மொழி';

  @override
  String get theme => 'தீம்';

  @override
  String get themeSystem => 'அமைப்பு';

  @override
  String get themeLight => 'ஒளி';

  @override
  String get themeDark => 'இருள்';

  @override
  String homeWelcome(String name) {
    return 'நமஸ்காரம், $name';
  }

  @override
  String get logout => 'வெளியேறு';

  @override
  String get onbTitle => 'உங்களைப் பற்றி எங்களிடம் கூறுங்கள்';

  @override
  String get onbSubtitle =>
      'இது உங்கள் வாசிப்புகளைத் தனிப்பயனாக்க எங்களுக்கு உதவுகிறது. இவற்றில் எதுவும் கட்டாயமில்லை — நீங்கள் இதைத் தவிர்த்துவிட்டுப் பின்னர் முடிக்கலாம்.';

  @override
  String get onbName => 'உங்கள் பெயர்';

  @override
  String get onbAddPhoto => 'புகைப்படத்தைச் சேர்க்கவும்';

  @override
  String get onbChangePhoto => 'புகைப்படத்தை மாற்றவும்';

  @override
  String get onbGender => 'பாலினம்';

  @override
  String get genderMale => 'ஆண்';

  @override
  String get genderFemale => 'திருமணம்';

  @override
  String get genderOther => 'மற்றவை';

  @override
  String get onbDob => 'பிறந்த தேதி';

  @override
  String get onbTob => 'பிறந்த நேரம்';

  @override
  String get onbDontKnowTime => 'என் பிறந்த நேரம் எனக்குத் தெரியாது.';

  @override
  String get onbPob => 'பிறந்த இடம்';

  @override
  String get onbPobHint => 'உங்கள் பிறந்த நகரத்தைத் தேடுங்கள்';

  @override
  String get onbLanguage => 'விருப்பமான மொழி';

  @override
  String get onbSelectDate => 'தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get onbSelectTime => 'நேரத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get onbSkip => 'இப்போதைக்கு தவிர்க்கவும்';

  @override
  String get onbFinish => 'முடிவு';

  @override
  String get onbSaved => 'சுயவிவரம் மதிப்பிடப்பட்டது';

  @override
  String get completeProfile => 'உங்கள் சுயவிவரத்தை முழுமையாக்குங்கள்';

  @override
  String get completeProfileCta => 'அமைப்பை முடிக்கவும்';

  @override
  String get permTitle => 'சில அனுமதிகள்';

  @override
  String get permSubtitle =>
      'அழைப்புகள், அறிவிப்புகள் மற்றும் புகைப்படங்கள் தடையின்றி செயல்பட இவை தேவைப்படுகின்றன. நீங்கள் அமைப்புகளில் இவற்றை எப்போது வேண்டுமானாலும் மாற்றிக்கொள்ளலாம்.';

  @override
  String get permNotifications => 'அறிவிப்புகள்';

  @override
  String get permNotificationsDesc =>
      'ஆலோசனை அறிவிப்புகள், ஆர்டர் புதுப்பிப்புகள் மற்றும் நினைவூட்டல்கள்';

  @override
  String get permMic => 'மைக்ரோஃபோன்';

  @override
  String get permMicDesc => 'ஜோதிடர்களுடனான குரல் அழைப்புகளுக்கு';

  @override
  String get permCamera => 'கேமரா';

  @override
  String get permCameraDesc =>
      'வீடியோ அழைப்புகள் மற்றும் புகைப்படங்களைப் பதிவேற்றுவதற்கு';

  @override
  String get permPhotos => 'புகைப்படங்கள்';

  @override
  String get permPhotosDesc => 'உங்கள் சுயவிவரப் படத்தை அமைக்க';

  @override
  String get permAllow => 'அணுகலை அனுமதிக்கவும்';

  @override
  String get permContinue => 'தொடரவும்';

  @override
  String get permLocation => 'இடம்';

  @override
  String get permLocationDesc =>
      'உங்களுக்கு அருகிலுள்ள ஜோதிடர்களைக் கண்டறியுங்கள்';

  @override
  String get secFeatured => 'சிறப்பு ஜோதிடர்கள்';

  @override
  String get secNearby => 'அருகிலுள்ள ஜோதிடர்கள்';

  @override
  String get secCallChat => 'அழைத்து உரையாடுங்கள்';

  @override
  String get secAiAstro => 'AI ஜோதிடர்கள்';

  @override
  String get secProducts => 'தயாரிப்புகள்';

  @override
  String get secVideos => 'வீடியோக்கள்';

  @override
  String get secLessons => 'ஜோதிடப் பாடங்கள்';

  @override
  String get secOthers => 'மற்றவர்கள்';

  @override
  String get secHistory => 'உங்கள் ஆலோசனைகள்';

  @override
  String get seeAll => 'அனைத்தையும் காண்க';

  @override
  String get basedOnLocation => 'உங்கள் இருப்பிடத்தின் அடிப்படையில்';

  @override
  String get shareApp => 'நண்பர்களுடன் செயலியைப் பகிரவும்';

  @override
  String get startReadingHint =>
      'இன்னும் கலந்தாய்வுகள் இல்லை. உங்கள் முதல் வாசிப்பைத் தொடங்குங்கள்.';

  @override
  String get startBtn => 'தொடங்கு';

  @override
  String get namaste => 'நமஸ்காரம்';

  @override
  String get kFreeKundli => 'இலவச குண்டலி';

  @override
  String get kMatching => 'பொருத்தம்';

  @override
  String get kBrihat => 'பிருஹத் குண்டலி';

  @override
  String get kKundliAi => 'குண்டலி AI+';

  @override
  String get tCareer => 'தொழில்';

  @override
  String get tMarriage => 'திருமணம்';

  @override
  String get tFinance => 'நிதி';

  @override
  String get tHealth => 'ஆரோக்கியம்';

  @override
  String get tEducation => 'கல்வி';

  @override
  String get tTravel => 'பயணம்';

  @override
  String get statusOnline => 'ஆன்லைன்';

  @override
  String get statusBusy => 'பிஸியாக';

  @override
  String get statusOffline => 'ஆஃப்லைன்';

  @override
  String get retry => 'மீண்டும் முயற்சி';

  @override
  String get chatNow => 'இப்போது அரட்டையடிக்கவும்';

  @override
  String get notifyMe => 'எனக்குத் தெரிவிக்கவும்';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return '$name, $reason ஆகும்போது உங்களுக்குத் தெரிவிப்போம்.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'இந்த ஜோதிடரை இன்னும் கலந்தாலோசிக்க முடியாது.';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'உங்களுக்கு ஒரு நிமிடத்திற்கு குறைந்தபட்சம் ₹$ratePerMin தேவை. தயவுசெய்து ரீசார்ஜ் செய்யவும்.';
  }

  @override
  String get completeYourProfile => 'உங்கள் சுயவிவரத்தை முழுமையாக்குங்கள்';

  @override
  String get addYourDateTimePlaceOf =>
      'ஜோதிடர் உங்களுக்கு மேலும் தெளிவான பலனை அளிக்க, உங்கள் பிறந்த தேதி, நேரம் மற்றும் இடத்தைக் குறிப்பிடவும்.';

  @override
  String get completeProfile2 => 'முழுமையான சுயவிவரம்';

  @override
  String get skipForNow => 'இப்போதைக்கு தவிர்க்கவும்';

  @override
  String unfollowWidgetName(Object name) {
    return 'பின்தொடர்வதை நிறுத்தவா $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'காரணத்தைக் கூறுங்கள் (விருப்பப்பட்டால்) — அது எங்களை மேம்படுத்த உதவும்.';

  @override
  String get reasonOptional => 'காரணம் (விருப்பத்திற்குரியது)';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get unfollow => 'பின்தொடர்வதை நிறுத்து';

  @override
  String get s21kReviews => '(2.1k மதிப்புரைகள்)';

  @override
  String followersFollowers(Object followers) {
    return '$followers பின்தொடர்பவர்கள்';
  }

  @override
  String get gift => 'பரிசு';

  @override
  String get store => 'கடை';

  @override
  String get joinLiveSession => 'நேரலை அமர்வில் இணையுங்கள்';

  @override
  String get youLlBeNotified => 'உங்களுக்கு அறிவிக்கப்படும்';

  @override
  String get thisStoreHasNoItemsYet =>
      'இந்தக் கடையில் இன்னும் பொருட்கள் எதுவும் இல்லை.';

  @override
  String get filters => 'வடிப்பான்கள்';

  @override
  String get reset => 'மீட்டமை';

  @override
  String get onlineNowOnly => 'இப்போது ஆன்லைனில் மட்டும்';

  @override
  String get applyFilters => 'வடிப்பான்களைப் பயன்படுத்துங்கள்';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'இந்த ஜோதிடருக்குப் பரிசளிக்கும் வசதி இல்லை.';

  @override
  String needTotalcostYourBalanceIsWallet(Object totalCost, Object balance) {
    return 'தேவை ₹$totalCost — உங்கள் இருப்பு ₹$balance. தயவுசெய்து ரீசார்ஜ் செய்யவும்.';
  }

  @override
  String sentQtyGiftNameToWidget(
      Object _qty, Object name, Object astrologerName) {
    return '$_qty $name இலிருந்து $astrologerName க்கு அனுப்பப்பட்டது 🎁';
  }

  @override
  String sendAGiftToWidgetAstrologername(Object astrologerName) {
    return '$astrologerName க்கு ஒரு பரிசை அனுப்பவும்';
  }

  @override
  String balanceContextWatchWalletproviderBalance(Object balance) {
    return 'இருப்பு: ₹$balance';
  }

  @override
  String get recharge => 'ரீசார்ஜ்';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'அளவு';

  @override
  String get min1Max100 => 'குறைந்தபட்சம் 1 · அதிகபட்சம் 100';

  @override
  String get comingSoon => 'விரைவில் வருகிறது';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return '$astrologerName இலிருந்து சுருக்கம்';
  }

  @override
  String get remindersSetForYou => 'உங்களுக்காக அமைக்கப்பட்ட நினைவூட்டல்கள்';

  @override
  String get suggestedForYou => 'உங்களுக்காகப் பரிந்துரைக்கப்பட்டது';

  @override
  String get couldNotSendImage => 'படத்தை அனுப்ப முடியவில்லை';

  @override
  String get endConsultation => 'ஆலோசனையை முடிக்கவா?';

  @override
  String get thisWillEndTheChatAnd =>
      'இது உரையாடலை முடித்து, கட்டணம் வசூலிப்பதையும் நிறுத்திவிடும்.';

  @override
  String get keepChatting => 'தொடர்ந்து உரையாடுங்கள்';

  @override
  String get end => 'முடிவு';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return '$toUpperCase$substring க்கு மாறவா?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'உங்கள் உரையாடல் முடிவடைந்து, புதிய $type கலந்தாய்வு $type2 கட்டணத்தில் தொடங்கும்.';
  }

  @override
  String get switchLabel => 'சுவிட்ச்';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'மாற்ற முடியவில்லை: $toString';
  }

  @override
  String get switchToAudioCall => 'ஆடியோ அழைப்பிற்கு மாறவும்';

  @override
  String get switchToVideoCall => 'வீடியோ அழைப்பிற்கு மாறவும்';

  @override
  String get endConsultation2 => 'ஆலோசனையை முடிக்கவும்';

  @override
  String get sendAGift => 'பரிசு அனுப்புங்கள்';

  @override
  String get sayHello => 'வணக்கம் சொல்லுங்கள் 🙏';

  @override
  String get typeAMessage => 'ஒரு செய்தியைத் தட்டச்சு செய்யவும்…';

  @override
  String get recommendedProduct => 'பரிந்துரைக்கப்பட்ட தயாரிப்பு';

  @override
  String get view => 'பார்வை';

  @override
  String get connecting => 'இணைக்கிறது…';

  @override
  String get myConsultations => 'எனது ஆலோசனைகள்';

  @override
  String get noConsultationsYet => 'இன்னும் ஆலோசனைகள் எதுவும் இல்லை';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type ஆலோசனை';
  }

  @override
  String get viewChat => 'அரட்டையைக் காண்க';

  @override
  String get historyExpired => 'வரலாறு காலாவதியானது';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'உங்கள் $type ஆலோசனையை இணைக்கிறது…';
  }

  @override
  String get ringingTheAstrologer => 'ஜோதிடரை அழைப்பது';

  @override
  String get cancelRequest => 'கோரிக்கையை ரத்துசெய்';

  @override
  String get notNow => 'இப்போது இல்லை';

  @override
  String get thanksForYourFeedback => 'உங்கள் கருத்துகளுக்கு நன்றி!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'சமர்ப்பிக்க முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get consultationEnded => 'ஆலோசனை நிறைவடைந்தது';

  @override
  String get hopeYouGotTheClarityYou =>
      'நீங்கள் தேடிய தெளிவு கிடைத்திருக்கும் என நம்புகிறேன்.';

  @override
  String get shareYourExperienceOptional =>
      'உங்கள் அனுபவத்தைப் பகிரவும் (விருப்பப்பட்டால்)';

  @override
  String get howWasTheCallQuality => 'அழைப்பின் தரம் எப்படி இருந்தது?';

  @override
  String get skip => 'தவிர்க்கவும்';

  @override
  String get submit => 'சமர்ப்பிக்கவும்';

  @override
  String get close => 'அருகில்';

  @override
  String get viewProfile => 'சுயவிவரத்தைப் பார்க்கவும்';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'உருவாக்கியவர்';

  @override
  String get devifai => 'டெவிஃபை';

  @override
  String get withLabel => 'அன்புடன் ❤️';

  @override
  String get leavingSoSoon => 'இவ்வளவு சீக்கிரமாகப் புறப்படுகிறீர்களா?';

  @override
  String get stayLoggedIn => 'உள்நுழைந்தே இருங்கள்';

  @override
  String get logOutAnyway => 'இருப்பினும் வெளியேறவும்';

  @override
  String get noNearbyAstrologersYet => 'இன்னும் அருகில் ஜோதிடர்கள் இல்லை';

  @override
  String get bookAPooja => 'பூஜை முன்பதிவு செய்யுங்கள்';

  @override
  String get panditLedPoojasAtYourChosen =>
      'நீங்கள் தேர்ந்தெடுத்த தேதியில் பண்டிதர் நடத்தும் பூஜைகள்';

  @override
  String get back => 'திரும்பி';

  @override
  String get connectingToLive => 'நேரலையுடன் இணைதல்…';

  @override
  String get live => 'நேரலை';

  @override
  String get thisLiveHasEnded => 'இந்த நேரலை முடிந்துவிட்டது.';

  @override
  String get backToLive => 'மீண்டும் நேரலைக்கு';

  @override
  String get sayHelloBeTheFirstTo =>
      'வணக்கம் சொல்லுங்கள் 👋 முதல் ஆளாகக் கருத்து தெரிவியுங்கள்';

  @override
  String get aiPollLive => 'AI வாக்கெடுப்பு · நேரலை';

  @override
  String totalVotes(Object total) {
    return '$total வாக்குகள்';
  }

  @override
  String get addAComment => 'ஒரு கருத்தைச் சேர்க்கவும்…';

  @override
  String get send => 'அனுப்பு';

  @override
  String get liveNow => 'இப்போது நேரலையில்';

  @override
  String get searchByAstrologerName => 'ஜோதிடர் பெயர் மூலம் தேடவும்';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return '“$trim” என்ற பெயரில் நேரலை ஜோதிடர் இல்லை';
  }

  @override
  String get refresh => 'புதுப்பிக்கவும்';

  @override
  String get join => 'சேருங்கள்';

  @override
  String get clearAllNotifications => 'அனைத்து அறிவிப்புகளையும் நீக்கவா?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'இது உங்கள் அறிவிப்புகள் அனைத்தையும் நிரந்தரமாக நீக்கிவிடும்.';

  @override
  String get clearAll => 'அனைத்தையும் அழி';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get markAllRead => 'அனைத்தையும் படித்ததாகக் குறிக்கவும்';

  @override
  String get noNotifications => 'அறிவிப்புகள் இல்லை';

  @override
  String get youReAllCaughtUp => 'நீங்கள் அனைத்தையும் தெரிந்துகொண்டீர்கள்.';

  @override
  String get nameIsRequired => 'பெயர் தேவை';

  @override
  String get enterAValidPhone => 'சரியான தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get bookingConfirmed => 'முன்பதிவு உறுதிசெய்யப்பட்டது 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'முன்பதிவு தோல்வியடைந்தது, மீண்டும் முயற்சிக்கவும்.';

  @override
  String get addMoneyToContinue => 'தொடர பணம் சேர்க்கவும்';

  @override
  String get addMoney => 'பணத்தைச் சேர்க்கவும்';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'புத்தகம் $name';
  }

  @override
  String get name => 'பெயர்';

  @override
  String get phone => 'தொலைபேசி';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'இந்தப் பூஜை யாருக்காகச் செய்யப்படுகிறதோ அந்த நபர்களைச் சேர்க்கவும் ($_maxPersons வரை). அடுத்தவரைச் சேர்ப்பதற்கு முன் ஒருவரை நிரப்பவும்.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'உறுப்பினர் $key பெயர்';
  }

  @override
  String get specialInstructionsOptional =>
      'சிறப்பு அறிவுறுத்தல்கள் (விருப்பத்திற்குரியது)';

  @override
  String get poojaDetails => 'பூஜை விவரங்கள்';

  @override
  String get price => 'விலை';

  @override
  String get bookNow => 'இப்போதே முன்பதிவு செய்யுங்கள்';

  @override
  String get aboutThisPooja => 'இந்த பூஜை பற்றி';

  @override
  String get ourPanditWillCallYou => 'எங்கள் பண்டிதர் உங்களை அழைப்பார்.';

  @override
  String get beforeThePoojaToConfirmThe =>
      'பூஜைக்கு முன், நேரத்தையும் உங்கள் சங்கல்ப விவரங்களையும் உறுதிப்படுத்திக் கொள்ளுங்கள்.';

  @override
  String get howItWorks => 'இது எப்படி வேலை செய்கிறது';

  @override
  String get filterPoojas => 'பூஜைகளை வடிகட்டவும்';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'அதிகபட்ச பட்ஜெட் · ₹$round';
  }

  @override
  String get minPersonsSupported => 'குறைந்தபட்ச நபர்கள் ஆதரிக்கப்பட்டனர்';

  @override
  String get apply => 'விண்ணப்பிக்கவும்';

  @override
  String get searchPoojas => 'பூஜைகளைத் தேடுங்கள்…';

  @override
  String get myProfile => 'எனது சுயவிவரம்';

  @override
  String get referEarn => 'பரிந்துரைத்து சம்பாதிக்கவும்';

  @override
  String get couldNotLoadTryAgain =>
      'ஏற்ற முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String shareEarnIReward(Object reward) {
    return 'பகிர்ந்து ₹⟦0 சம்பாதியுங்கள்⟧';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'உங்கள் நண்பரின் முதல் ரீசார்ஜில் உங்களுக்கு ₹$reward கிடைக்கும் — அவருக்கும் ₹$reward2 கிடைக்கும்.';
  }

  @override
  String get yourReferralCode => 'உங்கள் பரிந்துரைக் குறியீடு';

  @override
  String get codeCopied => 'குறியீடு நகலெடுக்கப்பட்டது';

  @override
  String get shareEarn => 'பகிர்ந்து சம்பாதியுங்கள்';

  @override
  String get haveAFriendSCode => 'நண்பரின் குறியீடு உங்களிடம் உள்ளதா?';

  @override
  String get enterReferralCode => 'பரிந்துரைக் குறியீட்டை உள்ளிடவும்';

  @override
  String get aReferralCodeIsAppliedTo =>
      'உங்கள் கணக்கில் ஒரு பரிந்துரைக் குறியீடு சேர்க்கப்பட்டுள்ளது.';

  @override
  String get feedbackSubmitted => 'கருத்து சமர்ப்பிக்கப்பட்டது';

  @override
  String get feedback => 'பின்னூட்டம்';

  @override
  String get applicationSubmitted => 'விண்ணப்பம் சமர்ப்பிக்கப்பட்டது';

  @override
  String get astrologerRegistration => 'ஜோதிடர் பதிவு';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return '$appName இல் ஜோதிடராக இணையுங்கள்';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'உங்களைப் பற்றி எங்களிடம் கூறுங்கள் — எங்கள் குழு அதை மதிப்பாய்வு செய்து உங்களைத் தொடர்புகொள்ளும்.';

  @override
  String get aboutUs => 'எங்களைப் பற்றி';

  @override
  String rudraganga(String appName) {
    return '$appName';
  }

  @override
  String get astrologyWellness => 'ஜோதிடம் மற்றும் நல்வாழ்வு';

  @override
  String get v100MadeWithDevotion =>
      'பதிப்பு 1.0.0 · அர்ப்பணிப்புடன் உருவாக்கப்பட்டது';

  @override
  String get thanksForYourRating => 'உங்கள் மதிப்பீட்டிற்கு நன்றி!';

  @override
  String rateRudraganga(String appName) {
    return 'விகிதம் $appName';
  }

  @override
  String get howIsYourExperience => 'உங்கள் அனுபவம் எப்படி இருக்கிறது?';

  @override
  String get writeAReviewOptional => 'விமர்சனம் எழுதுங்கள் (விருப்பப்பட்டால்)';

  @override
  String get saved => 'சேமிக்கப்பட்டது';

  @override
  String get notificationSetting => 'அறிவிப்பு அமைப்பு';

  @override
  String get howOften => 'எவ்வளவு அடிக்கடி?';

  @override
  String get topicsYouCareAbout => 'நீங்கள் விரும்பும் தலைப்புகள்';

  @override
  String get ok => 'சரி';

  @override
  String get allSet => 'எல்லாம் தயார் ✨';

  @override
  String get setPreferences => 'விருப்பத்தேர்வுகளை அமைக்கவும்';

  @override
  String get save => 'சேமிக்கவும்';

  @override
  String get bundlesCombos => 'தொகுப்புகள் மற்றும் காம்போக்கள்';

  @override
  String get noCombosRightNow => 'தற்போது காம்போக்கள் எதுவும் இல்லை';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'காம்போ சேர்க்கவும் · ₹$bundlePrice';
  }

  @override
  String get cart => 'வண்டி';

  @override
  String get clear => 'தெளிவான';

  @override
  String get yourCartIsEmpty => 'உங்கள் கூடை காலியாக உள்ளது';

  @override
  String get browseProductsAndAddThemHere =>
      'பொருட்களைப் பார்த்து அவற்றை இங்கே சேர்க்கவும்.';

  @override
  String walletBalanceAddTotalBalanceTo(Object balance, Object balance2) {
    return 'வாலட் ₹$balance · செக் அவுட்டில் ₹$balance2 சேர்க்கவும்';
  }

  @override
  String walletBalance(Object balance) {
    return 'வாலட்: ₹$balance';
  }

  @override
  String couponTrimmedAppliedResDiscountOff(Object trimmed, Object discount) {
    return 'கூப்பன் $trimmed பயன்படுத்தப்பட்டது · ₹$discount தள்ளுபடி';
  }

  @override
  String get pleaseAddADeliveryAddress =>
      'தயவுசெய்து விநியோக முகவரியைச் சேர்க்கவும்.';

  @override
  String get checkout => 'செக் அவுட்';

  @override
  String get addNewAddress => 'புதிய முகவரியைச் சேர்க்கவும்';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code பயன்படுத்தப்பட்டது · ₹$discount தள்ளுபடி';
  }

  @override
  String get remove => 'அகற்று';

  @override
  String get enterCouponCode => 'கூப்பன் குறியீட்டை உள்ளிடவும்';

  @override
  String viewAllCouponsLength(Object length) {
    return 'அனைத்தையும் காண்க ($length)';
  }

  @override
  String get availableOffers => 'கிடைக்கக்கூடிய சலுகைகள்';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'குறைந்தபட்ச ஆர்டர் ₹$minOrderValue';
  }

  @override
  String get applied => 'பயன்படுத்தப்பட்ட';

  @override
  String get nothingToCheckout => 'சரிபார்க்க எதுவும் இல்லை';

  @override
  String get orderPlaced => 'ஆர்டர் செய்யப்பட்டது!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return 'உங்கள் வாலட்டிலிருந்து ₹$total செலுத்தப்பட்டது. உங்கள் ஆர்டர் உறுதிசெய்யப்பட்டுவிட்டது, விரைவில் அனுப்பப்படும்.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'ஆர்டர் எண் #$orderId';
  }

  @override
  String get continueShopping => 'தொடர்ந்து ஷாப்பிங் செய்யுங்கள்';

  @override
  String get yourOrders => 'உங்கள் ஆர்டர்கள்';

  @override
  String get noOrdersYet => 'இன்னும் ஆர்டர்கள் எதுவும் வரவில்லை';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'நீங்கள் கடையில் இருந்து ஏதேனும் வாங்கியவுடன், உங்கள் ஆர்டர்கள் இங்கே தோன்றும்.';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'விலைப்பட்டியல் இன்னும் உருவாக்கப்பட்டு வருகிறது. சிறிது நேரத்தில் மீண்டும் முயற்சிக்கவும்.';

  @override
  String get couldNotOpenTheInvoice => 'விலைப்பட்டியலைத் திறக்க முடியவில்லை';

  @override
  String get thanksOurTeamWillReachOut =>
      'நன்றி! எங்கள் குழுவினர் இந்த ஆர்டர் குறித்து உங்களைத் தொடர்புகொள்வார்கள்.';

  @override
  String get orderDetails => 'ஆர்டர் விவரங்கள்';

  @override
  String get needHelp => 'உதவி தேவை';

  @override
  String get needHelpWithThisOrder => 'இந்த ஆர்டர் தொடர்பாக உதவி தேவையா?';

  @override
  String placedOnDate(Object date) {
    return '$date இல் வைக்கப்பட்டது';
  }

  @override
  String get invoice => 'விலைப்பட்டியல்';

  @override
  String get download => 'பதிவிறக்கம்';

  @override
  String get needHelp2 => 'உதவி தேவை';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'ஆர்டர் எண் #$orderNo';
  }

  @override
  String get whatWentWrong => 'என்ன தவறு நடந்தது?';

  @override
  String get describeTheIssue => 'பிரச்சினையை விவரிக்கவும்';

  @override
  String get tellUsWhatHappenedSoWe =>
      'என்ன நடந்தது என்று சொல்லுங்கள், நாங்கள் உதவ முடியும்...';

  @override
  String get submitRequest => 'கோரிக்கையைச் சமர்ப்பிக்கவும்';

  @override
  String get addedToCart => 'கூடையில் சேர்க்கப்பட்டது';

  @override
  String get productUnavailable => 'பொருள் கிடைக்கவில்லை';

  @override
  String pDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% தள்ளுபடி';
  }

  @override
  String pReviewcountReviews(Object reviewCount) {
    return '$reviewCount மதிப்புரைகள்';
  }

  @override
  String pDiscountpercentOff2(Object discountPercent) {
    return '$discountPercent% தள்ளுபடி';
  }

  @override
  String get fewItemsLeft => 'சில பொருட்கள் மட்டுமே மீதமுள்ளன';

  @override
  String get description => 'விளக்கம்';

  @override
  String get frequentlyBoughtTogether => 'அடிக்கடி ஒன்றாக வாங்கப்பட்டது';

  @override
  String get viewAll => 'அனைத்தையும் காண்க';

  @override
  String get addToCart => 'கூடையில் சேர்க்கவும்';

  @override
  String get buyNow => 'இப்போதே வாங்குங்கள்';

  @override
  String get searchProducts => 'தயாரிப்புகளைத் தேடுங்கள்…';

  @override
  String get noProductsFound => 'பொருட்கள் எதுவும் காணப்படவில்லை';

  @override
  String get priceRange => 'விலை வரம்பு (₹)';

  @override
  String get min => 'மின்';

  @override
  String get max => 'மேக்ஸ்';

  @override
  String get inStockOnly => 'கையிருப்பில் மட்டுமே';

  @override
  String get sortBy => 'வரிசைப்படுத்து';

  @override
  String get addDeliveryAddress => 'விநியோக முகவரியைச் சேர்க்கவும்';

  @override
  String get setAsDefaultAddress => 'இயல்புநிலை முகவரியாக அமைக்கவும்';

  @override
  String get saveAddress => 'முகவரியைச் சேமிக்கவும்';

  @override
  String codeCouponCode(Object code) {
    return 'குறியீடு $code';
  }

  @override
  String saveBundleYousave(Object youSave) {
    return '₹⟦0 சேமிக்கவும்';
  }

  @override
  String bundleProductsLengthItemsCombo(Object length) {
    return '$length பொருட்களின் காம்போ';
  }

  @override
  String bundleDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% தள்ளுபடி';
  }

  @override
  String get fewLeft => 'சிலரே எஞ்சியுள்ளனர்';

  @override
  String savePSaveamount(Object saveAmount) {
    return '₹⟦0 சேமிக்கவும்';
  }

  @override
  String get freeDelivery => 'இலவச டெலிவரி';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'தேடு $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'இன்னும் இங்கே எதுவும் இல்லை.';

  @override
  String get loadingSecurePayment => 'பாதுகாப்பான கட்டணம் ஏற்றப்படுகிறது…';

  @override
  String get couldNotStartRecharge => 'ரீசார்ஜ் தொடங்க முடியவில்லை';

  @override
  String get paymentSuccessful => 'பணம் செலுத்துதல் வெற்றிகரமாக முடிந்தது 🎉';

  @override
  String get paymentWasNotCompleted => 'பணம் செலுத்துதல் நிறைவடையவில்லை';

  @override
  String get couldNotStartRechargeTryAgain =>
      'மீள்நிரப்பலைத் தொடங்க முடியவில்லை, மீண்டும் முயற்சிக்கவும்.';

  @override
  String get wallet => 'பணப்பை';

  @override
  String get availableBalance => 'இருப்பு';

  @override
  String get useItForPoojasConsultations =>
      'பூஜைகள் மற்றும் ஆலோசனைகளுக்கு இதைப் பயன்படுத்துங்கள்';

  @override
  String get instantTopUp => 'தானிய டாப்-அப்';

  @override
  String get noRechargePacksAvailableRightNow =>
      'தற்போது ரீசார்ஜ் பேக்குகள் எதுவும் கிடைக்கவில்லை.';

  @override
  String get transactions => 'பரிவர்த்தனைகள்';

  @override
  String get endOfTransactions => '— பரிவர்த்தனைகளின் முடிவு —';

  @override
  String get youGet => 'நீங்கள் பெறுவது';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus போனஸ்';
  }

  @override
  String payPackAmount(Object amount) {
    return '₹⟦0 செலுத்தவும்';
  }

  @override
  String get rudra => 'வானியல்';

  @override
  String get ganga => 'செயலி';

  @override
  String get about => 'பற்றி';

  @override
  String get astrologer => 'ஜோதிடர்';

  @override
  String get seeker => 'தேடுபவர்';

  @override
  String get free => 'இலவசம்';

  @override
  String get jan => 'ஜனவரி';

  @override
  String get feb => 'டிசம்பர்';

  @override
  String get mar => 'மார்';

  @override
  String get apr => 'ஏப்ரல்';

  @override
  String get may => 'மே';

  @override
  String get jun => 'ஜூன்';

  @override
  String get jul => 'ஜூலை';

  @override
  String get aug => 'ஆகஸ்ட்';

  @override
  String get sep => 'செப்டம்பர்';

  @override
  String get oct => 'அக்டோபர்';

  @override
  String get nov => 'நவம்பர்';

  @override
  String get dec => 'டிசம்பர்';

  @override
  String get english => 'ஆங்கிலம்';

  @override
  String get all => 'அனைத்தும்';

  @override
  String get vedic => 'வேத';

  @override
  String get tarot => 'டாரட்';

  @override
  String get numerology => 'எண் கணிதம்';

  @override
  String get vastu => 'வாஸ்து';

  @override
  String get palmistry => 'கைரேகை சாஸ்திரம்';

  @override
  String get kp => 'கே.பி.';

  @override
  String get love => 'காதல்';

  @override
  String get taraAi => 'தாரா ஏஐ';

  @override
  String get instantVedicAnswers247 => 'உடனடி வேத பதில்கள் • 24×7';

  @override
  String get allLanguages => 'அனைத்து மொழிகளும்';

  @override
  String get jyotiAi => 'ஜோதி ஏஐ';

  @override
  String get loveCareerGuidance => 'காதல் மற்றும் தொழில் வழிகாட்டுதல்';

  @override
  String get hindiEnglish => 'ஹிந்தி, ஆங்கிலம்';

  @override
  String get veduAi => 'வேடு ஏஐ';

  @override
  String get remediesPredictions => 'பரிகாரங்கள் மற்றும் கணிப்புகள்';

  @override
  String get couldNotLoadAstrologers => 'ஜோதிடர்களை ஏற்ற முடியவில்லை';

  @override
  String get aiAstrologers => 'AI ஜோதிடர்கள்';

  @override
  String get featuredAstrologers => 'சிறப்பு ஜோதிடர்கள்';

  @override
  String get astrologers => 'ஜோதிடர்கள்';

  @override
  String get searchAiAstrologers => 'செயற்கை நுண்ணறிவு ஜோதிடர்களைத் தேடுங்கள்…';

  @override
  String get searchAstrologersByName => 'பெயர் மூலம் ஜோதிடர்களைத் தேடுங்கள்…';

  @override
  String get aiChat => 'AI அரட்டை';

  @override
  String get noAstrologersMatch => 'ஜோதிடர்கள் யாரும் பொருந்தவில்லை';

  @override
  String get noAstrologersYet => 'இன்னும் ஜோதிடர்கள் இல்லை';

  @override
  String get couldnTSetTheReminderPlease =>
      'நினைவூட்டலை அமைக்க முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get ai => 'செயற்கை நுண்ணறிவு';

  @override
  String get live2 => 'நேரலை';

  @override
  String get online => 'ஆன்லைன்';

  @override
  String get busy => 'பிஸியாக';

  @override
  String get offline => 'ஆஃப்லைன்';

  @override
  String get chat => 'அரட்டை';

  @override
  String get call => 'அழைப்பு';

  @override
  String get video => 'வீடியோ';

  @override
  String get notEnoughBalanceToStartPlease =>
      'தொடங்குவதற்குப் போதுமான இருப்பு இல்லை. தயவுசெய்து ரீசார்ஜ் செய்யவும்.';

  @override
  String get couldNotStartTheConsultationPlease =>
      'ஆலோசனையைத் தொடங்க முடியவில்லை. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get share => 'பகிர்';

  @override
  String get follow => 'பின்தொடரவும்';

  @override
  String get chats => 'அரட்டைகள்';

  @override
  String get calls => 'அழைப்புகள்';

  @override
  String get videos => 'வீடியோக்கள்';

  @override
  String get gifts => 'பரிசுகள்';

  @override
  String get languages => 'மொழிகள்';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'அவர்கள் தொழில், திருமணம், நிதி மற்றும் வாழ்க்கைப் பாதை தொடர்பான கேள்விகளில் ஆயிரக்கணக்கான தேடுவோருக்கு வழிகாட்டியுள்ளனர்.';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'அவர்களின் வாசிப்புகள், பாரம்பரிய வேதக் கோட்பாடுகளை நடைமுறைக்கு உகந்த, கருணையான வழிகாட்டுதலுடன் கலந்து, உங்களுக்கு உதவுகின்றன.';

  @override
  String get findClarityAndActionableRemediesFor =>
      'வரும் காலத்திற்கான தெளிவையும், செயல்படுத்தக்கூடிய தீர்வுகளையும் கண்டறியுங்கள்.';

  @override
  String get giftsReceived => 'பெறப்பட்ட பரிசுகள்';

  @override
  String get reviews => 'விமர்சனங்கள்';

  @override
  String get weLlNotifyYouTheMoment =>
      'அவை காலியானவுடன் உங்களுக்குத் தெரிவிப்போம்.';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'அவர்கள் ஆன்லைனில் வந்தவுடன் உங்களுக்குத் தெரிவிப்போம்.';

  @override
  String get getAHeadsUpTheMoment =>
      'அவை கிடைக்கும் தருணத்திலேயே முன்அறிவிப்பைப் பெறுங்கள்.';

  @override
  String get couldNotLoadThisStore => 'இந்தக் கடையை ஏற்ற முடியவில்லை';

  @override
  String get products => 'தயாரிப்புகள்';

  @override
  String get poojas => 'பூஜைகள்';

  @override
  String get book => 'புத்தகம்';

  @override
  String get buy => 'வாங்க';

  @override
  String get lalKitab => 'லால் கிதாப்';

  @override
  String get hindi => 'ஹிந்தி';

  @override
  String get bengali => 'பெங்காலி';

  @override
  String get tamil => 'நாகர்';

  @override
  String get marathi => 'மராத்தி';

  @override
  String get punjabi => 'பஞ்சாபி';

  @override
  String get telugu => 'தெலுங்கு';

  @override
  String get expertise => 'நிபுணத்துவம்';

  @override
  String get couldNotLoadGifts => 'பரிசுகளை ஏற்ற முடியவில்லை';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'இருப்பு போதாது. பரிசுகள் அனுப்ப பணம் சேர்க்கவும்.';

  @override
  String get couldNotSendTheGiftPlease =>
      'பரிசை அனுப்ப முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get connecting2 => 'இணைக்கிறது…';

  @override
  String get couldNotLoadThisChatHistory =>
      'இந்த உரையாடல் வரலாற்றை ஏற்ற முடியவில்லை';

  @override
  String get thisChatHistoryIsNoLonger =>
      'இந்த உரையாடல் வரலாறு இனி கிடைக்காது\n(உரையாடல்கள் 7 நாட்களுக்குச் சேமிக்கப்படும்).';

  @override
  String get dailyFor14Days => 'தினமும் · 14 நாட்களுக்கு';

  @override
  String get dailyMantra => 'தினசரி மந்திரம்';

  @override
  String get reminder => 'நினைவூட்டல்';

  @override
  String get audio => 'ஆடியோ';

  @override
  String get couldNotLoadYourConsultations =>
      'உங்கள் ஆலோசனைகளை ஏற்ற முடியவில்லை';

  @override
  String get missed => 'தவறவிட்டது';

  @override
  String get declined => 'நிராகரிக்கப்பட்டது';

  @override
  String get cancelled => 'ரத்து செய்யப்பட்டது';

  @override
  String get lowBalance => 'குறைந்த இருப்பு';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'உங்கள் ஆலோசனையைத் தொடர இப்போதே ரீசார்ஜ் செய்யுங்கள். நீங்கள் பணம் செலுத்தும்போதும் உங்கள் அரட்டை திறந்தே இருக்கும்.';

  @override
  String get sessionEndedLowBalance =>
      'உங்கள் இருப்புத் தீர்ந்துவிட்டதால், கலந்தாய்வு முடிவடைந்தது. எப்போது வேண்டுமானாலும் தொடர, மீண்டும் ரீசார்ஜ் செய்துகொள்ளுங்கள்.';

  @override
  String get couldNotLoadHoroscope =>
      'ஜாதகத்தை ஏற்ற முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get chooseSign => 'அடையாளத்தை மாற்றவும்';

  @override
  String get yesterday => 'நேற்று';

  @override
  String get today => 'இன்று';

  @override
  String get tomorrow => 'நாளை';

  @override
  String get totalScore => 'ஒட்டுமொத்த மதிப்பெண்';

  @override
  String get luckyColor => 'அதிர்ஷ்ட நிறம்';

  @override
  String get luckyNumber => 'அதிர்ஷ்ட எண்';

  @override
  String get lifeAreas => 'வாழ்க்கை பகுதிகள்';

  @override
  String get todaysReading => 'இன்றைய வாசிப்பு';

  @override
  String get career => 'தொழில்';

  @override
  String get finances => 'நிதி';

  @override
  String get health => 'ஆரோக்கியம்';

  @override
  String get relationship => 'உறவு';

  @override
  String get family => 'குடும்பம்';

  @override
  String get friends => 'நண்பர்கள்';

  @override
  String get travel => 'பயணம்';

  @override
  String get physique => 'உடல்';

  @override
  String get statusLabel => 'நிலை';

  @override
  String get signAries => 'மேஷம்';

  @override
  String get signTaurus => 'டாரன்கள்';

  @override
  String get signGemini => 'ஜெமினி';

  @override
  String get signCancer => 'புற்றுநோய்';

  @override
  String get signLeo => 'லியோ';

  @override
  String get signVirgo => 'கன்னி';

  @override
  String get signLibra => 'துலாம்';

  @override
  String get signScorpio => 'விருச்சிகம்';

  @override
  String get signSagittarius => 'தனுசு';

  @override
  String get signCapricorn => 'மகரம்';

  @override
  String get signAquarius => 'கும்பம்';

  @override
  String get signPisces => 'மீனம்';

  @override
  String get couldNotLoadPanchang =>
      'பஞ்சாங்கத்தை ஏற்ற முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get tithi => 'திதி';

  @override
  String get nakshatra => 'நட்சத்திரம்';

  @override
  String get yoga => 'யோகா';

  @override
  String get karana => 'கரணா';

  @override
  String get weekday => 'வாரநாள்';

  @override
  String get inauspiciousTimes => 'அசுபமான காலங்கள்';

  @override
  String get rahuKaal => 'ராகு கால்';

  @override
  String get gulikaKaal => 'குலிகா கால்';

  @override
  String get yamaganda => 'யமகண்டா';

  @override
  String get duration => 'கால அளவு';

  @override
  String get coinsUsed => 'பயன்படுத்தப்பட்ட நாணயங்கள்';

  @override
  String get guest => 'விருந்தினர்';

  @override
  String get changeLanguage => 'மொழியை மாற்றவும்';

  @override
  String get chooseYourKundli => 'உங்கள் குண்டலியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'உங்கள் பணப்பை, பலன்கள் மற்றும் சேமிக்கப்பட்ட விவரங்கள் பாதுகாப்பாக இருக்கும் — ஆனால் வெளியேறினால் உங்கள் தினசரி ராசிபலன், சலுகைகள் மற்றும் நினைவூட்டல்களைத் தவறவிடுவீர்கள். நட்சத்திரங்களுடன் தொடர்பில் இருங்கள்? ✨';

  @override
  String get offers => 'சலுகைகள்';

  @override
  String get dailyPanchang => 'தினசரி பஞ்சாங்கம்';

  @override
  String get talkToAstrologer => 'ஜோதிடரிடம் பேசுங்கள்';

  @override
  String get brihatKundli => 'பிருஹத் குண்டலி';

  @override
  String get dailyNotes => 'தினசரி குறிப்புகள்';

  @override
  String get askAQuestion => 'ஒரு கேள்வி கேளுங்கள்';

  @override
  String get free50Pages => '50+ பக்கங்கள் இலவசம்';

  @override
  String get freeReport => 'இலவச அறிக்கை';

  @override
  String get freeMatrimony => 'இலவச திருமணம்';

  @override
  String get matrimony => 'திருமணம்';

  @override
  String get loveMatch => 'காதல் போட்டி';

  @override
  String get horoscope => 'ஜாதகம்';

  @override
  String get dailyHoroscope => 'தினசரி ராசிபலன்';

  @override
  String get vedicAstrology => 'வேத ஜோதிடம்';

  @override
  String get acharyaVeda => 'ஆச்சார்ய வேதம்';

  @override
  String get panditRohan => 'பண்டிட் ரோஹன்';

  @override
  String get guruMaya => 'குரு மாயா';

  @override
  String get jayaShastri => 'ஜெய சாஸ்திரி';

  @override
  String get devSharma => 'தேவ் ஷர்மா';

  @override
  String get sureshG => 'சுரேஷ் ஜி.';

  @override
  String get lataP => 'லதா பி.';

  @override
  String get kiranB => 'கிரண் பி.';

  @override
  String get mohanT => 'மோகன் டி.';

  @override
  String get anilJoshi => 'அனில் ஜோஷி';

  @override
  String get meeraDevi => 'மீரா தேவி';

  @override
  String get raviKumar => 'ரவி குமார்';

  @override
  String get sunitaRao => 'சுனிதா ராவ்';

  @override
  String get bengaluruKarnataka => 'பெங்களூரு, கர்நாடகா';

  @override
  String get locating => 'கண்டறிதல்…';

  @override
  String get festivalOffer => 'பண்டிகை சலுகை';

  @override
  String get upTo30OffOnGemstones => 'இரத்தினக்கற்களுக்கு 30% வரை தள்ளுபடி';

  @override
  String get talkToTopAstrologers => 'சிறந்த ஜோதிடர்களுடன் பேசுங்கள்';

  @override
  String get firstConsultationSpecial => 'முதல் ஆலோசனை சிறப்பு';

  @override
  String get rudrakshaCollection => 'ருத்ராட்ச சேகரிப்பு';

  @override
  String get authenticEnergised => 'உண்மையான மற்றும் ஆற்றல்மிக்க';

  @override
  String get resumeSession => 'அமர்வை மீண்டும் தொடங்கு';

  @override
  String get home => 'வீடு';

  @override
  String get aiAstro => 'AI ஆஸ்ட்ரோ';

  @override
  String get ask => 'கேளுங்கள்';

  @override
  String get history => 'வரலாறு';

  @override
  String get seeAll2 => 'அனைத்தையும் காண்க';

  @override
  String get s1AcceptanceOfTheseTerms => '1. இந்த விதிமுறைகளை ஏற்றுக்கொள்வது';

  @override
  String get termsOfService2 => 'சேவை விதிமுறைகள்';

  @override
  String get lastUpdated26June2026 =>
      'கடைசியாகப் புதுப்பிக்கப்பட்டது: 26 ஜூன் 2026';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appName வழிகாட்டுதல் மற்றும் தனிப்பட்ட தேவைகளுக்காக ஜோதிடம், ஆன்மீகம் மற்றும் நல்வாழ்வு ஆலோசனைகளை வழங்குகிறது.';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'இது வெறும் பிரதிபலிப்பு மட்டுமே. எங்கள் சேவைகள் தொழில்முறை மருத்துவம், சட்டம், நிதி போன்றவற்றிற்கு மாற்றாகாது.';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'அல்லது உளவியல் ஆலோசனை. இந்தச் செயலியைப் பயன்படுத்த உங்களுக்கு 18 வயது அல்லது அதற்கு மேற்பட்ட வயது இருக்க வேண்டும்.';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'ஒரு கணக்கை உருவாக்குவதன் மூலம் அல்லது $appName மொபைல் செயலி மற்றும் அது தொடர்பான சேவைகளைப் பயன்படுத்துவதன் மூலம் (';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '“சேவைகள்” என்பதன் கீழ், இந்தச் சேவை விதிமுறைகள் மற்றும் எங்கள் தனியுரிமைக் கொள்கை மற்றும் பணம் திரும்பப்பெறுதல் கொள்கைக்குக் கட்டுப்பட நீங்கள் ஒப்புக்கொள்கிறீர்கள்.';

  @override
  String get policyIfYouDoNotAgree =>
      'கொள்கை. நீங்கள் உடன்படவில்லை எனில், தயவுசெய்து சேவைகளைப் பயன்படுத்த வேண்டாம்.';

  @override
  String get s2EligibilityYourAccount => '2. தகுதி மற்றும் உங்கள் கணக்கு';

  @override
  String get youMustBeAtLeast18 =>
      'உங்களுக்குக் குறைந்தபட்சம் 18 வயது நிரம்பியிருக்க வேண்டும் மற்றும் சட்டப்படி ஒப்பந்தம் செய்துகொள்ளும் தகுதி பெற்றிருக்க வேண்டும்.';

  @override
  String get youRegisterWithAPhoneNumber =>
      'ஒருமுறை கடவுச்சொல் (OTP) மூலம் சரிபார்க்கப்பட்ட தொலைபேசி எண்ணைப் பயன்படுத்தி நீங்கள் பதிவு செய்கிறீர்கள். அந்த எண் மற்றும் சாதனத்திற்கான அணுகலைப் பாதுகாப்பாக வைத்திருப்பது உங்கள் பொறுப்பாகும்.';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'பலன் கணிப்பிற்காக நீங்கள் பகிர விரும்பும் பட்சத்தில், பிறப்பு விவரங்கள் உட்பட துல்லியமான தகவல்களை வழங்க ஒப்புக்கொள்கிறீர்கள். உங்கள் கணக்கின் கீழ் நடைபெறும் அனைத்து செயல்பாடுகளுக்கும் நீங்களே பொறுப்பாவீர்கள்.';

  @override
  String get s3TheServicesWeOffer => '3. நாங்கள் வழங்கும் சேவைகள்';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appName, ஒலி அழைப்பு, காணொளி அழைப்பு மூலம் கலந்தாலோசனைகளுக்காக, சரிபார்க்கப்பட்ட ஜோதிடர்களுடன் உங்களை இணைக்கிறது.';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'மற்றும் அரட்டை, மேலும் ஜாதக உருவாக்கம் மற்றும் பொருத்தம், ஒரு AI ஜோதிடர் போன்ற தொடர்புடைய அம்சங்களையும் வழங்குகிறது.';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'தினசரி ராசிபலன்கள், பூஜை முன்பதிவுகள், ஆன்மீகப் பொருட்கள் கடை, பரிசளித்தல் மற்றும் திருமணப் பொருத்தம்.';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'எந்தவொரு அம்சம் அல்லது ஜோதிடரின் கிடைக்கும்தன்மை எந்த நேரத்திலும் மாறக்கூடும்.';

  @override
  String get s4WalletPricingBilling =>
      '4. வாலட், விலை நிர்ணயம் மற்றும் பில்லிங்';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'ஆலோசனைகளுக்கு முன்பணம் செலுத்த வேண்டும். நீங்கள் இணைவதற்கு முன்பு, செயலிக்குள் இருக்கும் பணப்பையில் பணத்தைச் சேர்த்து, ஜோதிடர் மற்றும் சேவைக்குக் காட்டப்படும் நிமிடக் கட்டண விகிதத்தில் பணம் செலுத்த வேண்டும்.';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'ஜோதிடர் ஏற்றுக்கொண்டு அமர்வு இணைக்கப்பட்டவுடன் கட்டணம் வசூலிக்கத் தொடங்குகிறது. முதல் நிமிடம் இணைக்கப்பட்டவுடன் கட்டணம் வசூலிக்கப்படும், மேலும் ஒவ்வொரு அடுத்த நிமிடமும் அதன் தொடக்கத்தில் கட்டணம் வசூலிக்கப்படும். அமர்வின் போது நேரலை மீட்டர் காட்டப்படும், மேலும் உங்கள் இருப்பு குறைந்தால் அமர்வு தானாகவே முடிவடையும்.';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'பணம் செலுத்துதல் எங்கள் கட்டணக் கூட்டாளரான (PayU) மூலம் செயல்படுத்தப்படுகிறது. நாங்கள் முழு அட்டை விவரங்களையும் சேமிப்பதில்லை.';

  @override
  String get walletBalancesAreForUseWithin =>
      'வாலட் இருப்புகள் சேவைகளுக்குள் பயன்படுத்துவதற்காக மட்டுமே. பணம் திரும்பப் பெறுதல், பொருந்தக்கூடிய இடங்களில், எங்கள் பணம் திரும்பப் பெறுதல் கொள்கையின்படி நிர்வகிக்கப்படும்.';

  @override
  String get pricesAreInIndianRupeesInr =>
      'விலைகள் இந்திய ரூபாயில் (INR) குறிப்பிடப்பட்டுள்ளன, மேலும் இதில் பொருந்தக்கூடிய வரிகளும் அடங்கலாம்.';

  @override
  String get s5AcceptableUse => '5. ஏற்றுக்கொள்ளத்தக்க பயன்பாடு';

  @override
  String get youAgreeNotTo =>
      'நீங்கள் பின்வருவனவற்றைச் செய்ய மாட்டீர்கள் என ஒப்புக்கொள்கிறீர்கள்:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'ஜோதிடர்கள் அல்லது ஊழியர்களைத் துன்புறுத்துதல், நிந்தித்தல், அச்சுறுத்துதல் அல்லது பாலியல் ரீதியாக வெளிப்படையான அல்லது சட்டவிரோதமான உள்ளடக்கத்தைப் பகிர்தல்.';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'ஒரு சேவையைப் பெறுவதற்கோ அல்லது பணத்தைத் திரும்பப் பெறுவதற்கோ, எந்தவொரு நபராகவும் ஆள்மாறாட்டம் செய்வது அல்லது தவறான தகவல்களை வழங்குவது.';

  @override
  String get attemptToTakeAConsultationOff =>
      'கட்டணங்களைத் தவிர்ப்பதற்காக, தளத்திற்கு வெளியே கலந்தாலோசனையை மேற்கொள்ள முயற்சிப்பது அல்லது தனிப்பட்ட தொடர்பு விவரங்களைக் கோருவது.';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'சேவைகளில் அல்லது அவற்றின் பாதுகாப்பில் குறுக்கிடுதல், தகவல்களைச் சுரண்டுதல் அல்லது சீர்குலைக்க முயற்சித்தல்.';

  @override
  String get s6AstrologersOnThePlatform => '6. மேடையில் உள்ள ஜோதிடர்கள்';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'ஜோதிடர்கள் என்பவர்கள் $appName ஆல் அடையாளம் சரிபார்க்கப்பட்டு அங்கீகரிக்கப்பட்ட சுயாதீனமான தொழில் வல்லுநர்கள் ஆவர்.';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'அவர்கள் ஆலோசனைகளை வழங்குவதற்கு முன்பு, நாங்கள் வரையறுக்கும் வரம்புகளுக்குள் தங்களின் நிமிடக் கட்டணங்களைத் தாங்களே நிர்ணயித்துக் கொள்கிறார்கள்.';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'ஆலோசனையின் போது பகிரப்படும் கருத்துக்களும் வழிகாட்டுதல்களும் அந்தந்த ஜோதிடருடையவையே அன்றி வேறு யாருடையதும் அல்ல.';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return '$appName. கலந்தாலோசனையின் அடிப்படையில் நீங்கள் எடுக்கும் எந்தவொரு முடிவுக்கும் நாங்கள் பொறுப்பல்ல.';
  }

  @override
  String get s7RecordingsContent => '7. பதிவுகள் மற்றும் உள்ளடக்கம்';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'தரம், பாதுகாப்பு மற்றும் தகராறு தீர்வு ஆகிய காரணங்களுக்காக, ஒலி மற்றும் காணொளிக் கலந்தாய்வுகள் பதிவு செய்யப்படலாம்.';

  @override
  String get consentToSuchRecordingByStarting =>
      'ஒரு அமர்வைத் தொடங்குவதன் மூலம் அத்தகைய பதிவிற்கு ஒப்புதல் அளிக்கவும். அரட்டை உரையாடல்கள் சேமிக்கப்படுகின்றன, எனவே நீங்கள் அவற்றை மீண்டும் பார்க்கலாம்.';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'அவற்றை. இந்தத் தரவு எவ்வாறு கையாளப்படுகிறது என்பதை அறிய எங்கள் தனியுரிமைக் கொள்கையைப் பார்க்கவும்.';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. பொறுப்புத் துறப்பு மற்றும் பொறுப்பு வரம்பு';

  @override
  String get theServicesAreProvidedAsIs =>
      'இந்தச் சேவைகள், வழிகாட்டுதல் மற்றும் பொழுதுபோக்கு சார்ந்த தனிப்பட்ட சுயசிந்தனைக்காக, உள்ளபடியே வழங்கப்படுகின்றன.';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return '$appName எந்தவொரு முன்னறிவிப்பு அல்லது பரிகாரத்தின் துல்லியத்தன்மை குறித்தும் எந்த உத்தரவாதமும் அளிக்கவில்லை. அதிகபட்ச அளவிற்கு';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'சட்டத்தால் அனுமதிக்கப்பட்டால், நீங்கள் சேவைகளைப் பயன்படுத்துவதால் எழும் $appName-இன் மொத்தப் பொறுப்பானது இதற்குள் வரம்பிடப்பட்டுள்ளது.';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'உரிமைகோரலுக்கு வழிவகுக்கும் நிகழ்வுக்கு முந்தைய 30 நாட்களில் உங்கள் வாலட்டில் நீங்கள் செலுத்திய தொகை. நாங்கள்';

  @override
  String get areNotLiableForIndirectOr =>
      'மறைமுக அல்லது பின்விளைவு இழப்புகளுக்குப் பொறுப்பாக மாட்டார்கள்.';

  @override
  String get s9SuspensionTermination =>
      '9. தற்காலிகப் பணிநீக்கம் மற்றும் பணி நீக்கம்';

  @override
  String get weMaySuspendOrTerminateYour =>
      'நீங்கள் இந்த விதிமுறைகளை மீறினால், மோசடி செய்ய முயன்றால், அல்லது தவறாகப் பயன்படுத்தினால், நாங்கள் உங்கள் கணக்கை இடைநிறுத்தலாம் அல்லது முடக்கலாம்.';

  @override
  String get servicesYouMayStopUsingThe =>
      'சேவைகள். நீங்கள் எந்த நேரத்திலும் சேவைகளைப் பயன்படுத்துவதை நிறுத்திக்கொள்ளலாம். சில விதிமுறைகள் (கட்டணக் கடமைகள்,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'பொறுப்புத் துறப்புகள் மற்றும் பொறுப்பு வரம்புகள் ஆகியவை ஒப்பந்தம் முடிவடைந்த பின்னரும் செல்லுபடியாகும்.';

  @override
  String get s10ChangesToTheseTerms => '10. இந்த விதிமுறைகளில் மாற்றங்கள்';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'நாங்கள் இந்த விதிமுறைகளை அவ்வப்போது புதுப்பிக்கலாம். குறிப்பிடத்தக்க மாற்றங்கள் செயலியில் அல்லது இதன்மூலம் அறிவிக்கப்படும்.';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'மேலே உள்ள “கடைசியாகப் புதுப்பிக்கப்பட்ட” தேதியைப் புதுப்பித்தல். மாற்றங்களுக்குப் பிறகும் தொடர்ந்து பயன்படுத்துவது, நீங்கள் அவற்றை ஏற்றுக்கொள்கிறீர்கள் என்பதைக் குறிக்கும்.';

  @override
  String get s11ContactUs => '11. எங்களைத் தொடர்பு கொள்ளுங்கள்';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'இந்த விதிமுறைகள் குறித்து ஏதேனும் கேள்விகள் உள்ளதா? எங்கள் இணையதளத்தில் உள்ள தொடர்புப் படிவத்தின் மூலமாகவோ அல்லது செயலியில் உள்ள படிவத்தின் மூலமாகவோ எங்களைத் தொடர்பு கொள்ளுங்கள்.';

  @override
  String get helpSupportSection => 'உதவி மற்றும் ஆதரவுப் பிரிவு.';

  @override
  String get privacyPolicy2 => 'தனியுரிமைக் கொள்கை';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'உங்கள் பிறப்பு விவரங்கள், கலந்தாய்வுகள் மற்றும் உரையாடல்கள் உங்களுக்கே உரியவை. நாங்கள் என்ன செய்கிறோம் என்பதை இந்தக் கொள்கை விளக்குகிறது.';

  @override
  String get collectWhyAndTheControlYou =>
      'சேகரிப்பது, ஏன் சேகரிப்பது, மற்றும் அதன் மீது உங்களுக்கு இருக்கும் கட்டுப்பாடு.';

  @override
  String get s1InformationWeCollect => '1. நாங்கள் சேகரிக்கும் தகவல்கள்';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'கணக்குத் தகவல்கள்: உங்கள் பெயர், தொலைபேசி எண் (OTP மூலம் சரிபார்க்கப்பட்டது), மற்றும் வழங்கப்பட்டிருந்தால் மின்னஞ்சல் முகவரி.';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'பிறப்பு விவரங்கள்: ஜாதகம் மற்றும் பலன் கூறுவதற்காக நீங்கள் பகிர விரும்பும் பிறந்த தேதி, நேரம் மற்றும் இடம்.';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'ஆலோசனைத் தரவுகள்: அரட்டைச் செய்திகள், மற்றும் தேவைப்படும் இடங்களில் ஒலி/ஒளி அழைப்புப் பதிவுகள்.';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'பணம் செலுத்தும் தரவுகள்: பணப்பை பரிவர்த்தனைகள் மற்றும் பணம் செலுத்தியதற்கான குறிப்புகள். அட்டை விவரங்கள் எங்கள் பணம் செலுத்தும் கூட்டாளரால் (PayU) கையாளப்படுகின்றன; நாங்கள் முழு அட்டை எண்களையும் சேமிப்பதில்லை.';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'சேவைகளை இயக்குவதற்கும் மேம்படுத்துவதற்கும் பயன்படுத்தப்படும் சாதனம் மற்றும் பயன்பாட்டுத் தரவு: சாதன வகை, இயக்க முறைமை, உங்கள் IP முகவரியிலிருந்து பெறப்பட்ட தோராயமான இருப்பிடம், பார்வையிட்ட பக்கங்கள் மற்றும் ஊடாட்டங்கள்.';

  @override
  String get s2HowWeUseIt => '2. நாம் அதை எவ்வாறு பயன்படுத்துகிறோம்';

  @override
  String get toCreateAndSecureYourAccount =>
      'உங்கள் கணக்கை உருவாக்கிப் பாதுகாக்கவும், உங்கள் அடையாளத்தைச் சரிபார்க்கவும்.';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'உங்களை ஜோதிடர்களுடன் இணைக்கவும், ஆலோசனைகள், ஜாதகம், ராசிபலன்கள் மற்றும் பிற அம்சங்களை வழங்கவும்.';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'வாலட் ரீசார்ஜ்கள், நிமிடக் கட்டண வசூல், பணம் வழங்குதல் மற்றும் ஆர்டர் நிறைவேற்றுதல் ஆகியவற்றைச் செயல்படுத்த.';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'ஆதரவளிக்கவும், மோசடி மற்றும் முறைகேடுகளைத் தடுக்கவும், சட்டப்பூர்வ கடமைகளை நிறைவேற்றவும்.';

  @override
  String get toUnderstandAndImproveHowThe =>
      'செயலி மற்றும் இணையதளம் பயன்படுத்தப்படும் விதத்தைப் புரிந்துகொண்டு அதை மேம்படுத்துதல்.';

  @override
  String get s3WhenWeShareInformation => '3. நாம் தகவல்களைப் பகிரும்போது';

  @override
  String get weDoNotSellYourPersonal =>
      'நாங்கள் உங்கள் தனிப்பட்ட தகவல்களை விற்பனை செய்வதில்லை. நாங்கள் அவற்றை பின்வருவனவற்றுக்கு மட்டுமே பகிர்கிறோம்:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'நீங்கள் கலந்தாலோசிக்கும் ஜோதிடருடன், பலனைக் கணிப்பதற்குத் தேவையானவை மட்டுமே (உதாரணமாக, உங்கள் பிறந்த விவரங்கள் மற்றும் உரையாடல்).';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'பணம் செலுத்தும் செயல்முறை (PayU), கிளவுட் ஹோஸ்டிங் மற்றும் சேமிப்பகம், தகவல் தொடர்பு (OTP-க்கான WhatsApp/SMS) மற்றும் அறிவிப்புகள் போன்ற, எங்கள் செயல்பாடுகளுக்கு உதவும் சேவை வழங்குநர்களுடன் நாங்கள் ரகசியக் காப்பு கடமைகளுக்கு உட்பட்டுள்ளோம்.';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'சட்டப்படி தேவைப்படும்போது, அல்லது பயனர்கள் மற்றும் $appName ஆகியோரின் உரிமைகள், பாதுகாப்பு மற்றும் சொத்துக்களைப் பாதுகாப்பதற்காக.';
  }

  @override
  String get s4ConsultationRecordingsChats =>
      '4. கலந்தாய்வுப் பதிவுகள் மற்றும் உரையாடல்கள்';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'தரம், பாதுகாப்பு மற்றும் நலன் கருதி, ஒலி மற்றும் காணொளிக் கலந்தாய்வுகள் பதிவு செய்யப்படலாம், மேலும் உரையாடல்கள் சேமிக்கப்படுகின்றன.';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'தகராறு தீர்வு. செயலியில் உங்கள் அரட்டை வரலாற்றை நீங்கள் பார்க்கலாம். பதிவுகள் பின்வருமாறு தக்கவைக்கப்படுகின்றன.';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'கீழே விவரிக்கப்பட்டுள்ளபடி, ஆதரவு, பாதுகாப்பு அல்லது சட்டக் காரணங்களுக்காகத் தேவைப்படும்போது மட்டுமே அணுகப்படும்.';

  @override
  String get s5AnalyticsCookies => '5. பகுப்பாய்வுகள் மற்றும் குக்கீகள்';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'மீண்டும் வருகை தருபவர்களை அடையாளம் காணவும், பயனர்களின் பயன்பாட்டை அளவிடவும் எங்கள் இணையதளம் ஒரு முதல் தரப்பு குக்கீ/அடையாளங்காட்டியைப் பயன்படுத்துகிறது.';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'முகப்புப் பக்கத்தின் செயல்திறன் (எடுத்துக்காட்டாக, எந்தப் பிரிவுகள் கிளிக் செய்யப்படுகின்றன), மற்றும் பதிவுசெய்தல்களைச் சந்தைப்படுத்தலுடன் தொடர்புபடுத்துதல்.';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'பிரச்சாரங்கள். அனுபவத்தை மேம்படுத்துவதற்காக இது ஒட்டுமொத்தமாகப் பயன்படுத்தப்படுகிறது. நாங்கள் தோராயமான நகரம்/பிராந்தியத்தை வருவிக்கிறோம்.';

  @override
  String get fromYourIpAddressWeDo =>
      'உங்கள் IP முகவரியிலிருந்து; நாங்கள் பகுப்பாய்விற்காகத் துல்லியமான GPS இருப்பிடத்தைப் பயன்படுத்துவதில்லை.';

  @override
  String get s6DataRetention => '6. தரவு தக்கவைப்பு';

  @override
  String get weKeepYourInformationForAs =>
      'உங்கள் கணக்கு செயலில் இருக்கும் வரையிலும், சேவைகளை வழங்கத் தேவைப்படும் வரையிலும் உங்கள் தகவல்களை நாங்கள் வைத்திருக்கிறோம்.';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'சேவைகள், சட்டப்பூர்வ கடமைகளுக்கு இணங்குதல், தகராறுகளைத் தீர்த்தல் மற்றும் நமது ஒப்பந்தங்களைச் செயல்படுத்துதல். நீங்கள்';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'சட்டப்பூர்வ தக்கவைப்புக்கு உட்பட்டு, உங்கள் கணக்கு மற்றும் அதனுடன் தொடர்புடைய தனிப்பட்ட தரவுகளை நீக்குமாறு கோரவும்.';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'தேவைகள் (உதாரணமாக, கணக்கியல் மற்றும் வரிவிதிப்புக்காக நாம் வைத்திருக்க வேண்டிய பரிவர்த்தனைப் பதிவுகள்).';

  @override
  String get s7Security => '7. பாதுகாப்பு';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'நாங்கள் பரிமாற்றத்தின் போது குறியாக்கம், அணுகல் கட்டுப்பாடுகள் மற்றும் பாதுகாப்பான போன்ற தொழில்துறை தரநிலை நடவடிக்கைகளைப் பயன்படுத்துகிறோம்.';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'உங்கள் தகவலைப் பாதுகாப்பதற்கான உள்கட்டமைப்பு. எந்தவொரு பரிமாற்ற அல்லது சேமிப்பு முறையும் முழுமையாகப் பாதுகாப்பானது அல்ல.';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'பாதுகாப்பானது, எனவே எங்களால் முழுமையான பாதுகாப்பிற்கு உத்தரவாதம் அளிக்க முடியாது.';

  @override
  String get s8YourRightsChoices => '8. உங்கள் உரிமைகள் மற்றும் தேர்வுகள்';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'செயலியில் உங்கள் சுயவிவரம் மற்றும் பிறப்பு விவரங்களை அணுகவும், திருத்தவும் அல்லது புதுப்பிக்கவும்.';

  @override
  String get requestACopyOrDeletionOf =>
      'உங்கள் தனிப்பட்ட தரவுகளின் நகலைப் பெற அல்லது அவற்றை நீக்க, எங்களைத் தொடர்பு கொள்ளுங்கள்.';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'உங்கள் சாதனம் அல்லது செயலி அமைப்புகளில் விளம்பர அறிவிப்புகளிலிருந்து விலகிக்கொள்ளுங்கள்.';

  @override
  String get s9Children => '9. குழந்தைகள்';

  @override
  String get theServicesAreIntendedForUsers =>
      'இந்தச் சேவைகள் 18 வயது மற்றும் அதற்கு மேற்பட்ட பயனர்களுக்காக உருவாக்கப்பட்டவை. நாங்கள் தெரிந்தே யாரிடமிருந்தும் தரவுகளைச் சேகரிப்பதில்லை.';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '18 வயதுக்குட்பட்ட எவரும். ஒரு சிறுவர் இந்தச் சேவைகளைப் பயன்படுத்தியதாக நீங்கள் நம்பினால், அதை நாங்கள் அகற்றுவதற்காக எங்களைத் தொடர்பு கொள்ளவும்.';

  @override
  String get s10ChangesToThisPolicy => '10. இந்தக் கொள்கையில் மாற்றங்கள்';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'நாங்கள் இந்தக் கொள்கையைப் புதுப்பிக்கக்கூடும். குறிப்பிடத்தக்க மாற்றங்கள் செயலியில் அல்லது புதுப்பிப்பதன் மூலம் அறிவிக்கப்படும்.';

  @override
  String get lastUpdatedDateAbove =>
      'மேலே உள்ள “கடைசியாகப் புதுப்பிக்கப்பட்ட” தேதி.';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'தனியுரிமை தொடர்பான கேள்விகள் அல்லது தரவுக் கோரிக்கைகளுக்கு, எங்கள் இணையதளத்தில் உள்ள தொடர்புப் படிவத்தின் மூலமாகவோ அல்லது';

  @override
  String get appSHelpSupportSection => 'செயலியின் உதவி மற்றும் ஆதரவுப் பிரிவு.';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return '© 2026 $appName · 18+ · வழிகாட்டுதல் மற்றும் நல்வாழ்விற்காக \nதொழில்முறை ஆலோசனைக்கு மாற்றானது அல்ல.';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'அகலம்=சாதனத்தின் அகலம், ஆரம்ப அளவு=1, அதிகபட்ச அளவு=1';

  @override
  String get segoeUi => 'செகோ UI';

  @override
  String get vote => 'வாக்களியுங்கள்';

  @override
  String get couldnTLoadLiveSessions => 'நேரலை அமர்வுகளை ஏற்ற முடியவில்லை';

  @override
  String get noOneIsLiveRightNow => 'தற்போது யாரும் நேரலையில் இல்லை.';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'ஒரு ஜோதிடர் நேரலைக்கு வரும்போது, அவர் இங்கே தோன்றுவார். புதுப்பிக்கக் கீழே இழுக்கவும் — அல்லது அறிவிப்புக்காகக் காத்திருக்கவும்.';

  @override
  String get justNow => 'சற்று முன்பு';

  @override
  String get couldNotLoad => 'ஏற்ற முடியவில்லை';

  @override
  String get continueLabel => 'தொடரவும்';

  @override
  String get openSettings => 'அமைப்புகளைத் திறக்கவும்';

  @override
  String get somePermissionsAreBlockedTapA =>
      'சில அனுமதிகள் தடுக்கப்பட்டுள்ளன. தடுக்கப்பட்ட உருப்படியைத் (அல்லது “அமைப்புகளைத் திற”) தட்டி அதைச் செயல்படுத்திவிட்டு, பின்னர் இங்குத் திரும்பவும்.';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return '$appName-ஐப் பயன்படுத்த இந்த அனுமதிகள் தேவை. அனுமதி வழங்க, நிலுவையில் உள்ள எந்தவொரு உருப்படியையும் தட்டவும்.';
  }

  @override
  String get settings2 => 'அமைப்புகள்';

  @override
  String get allow => 'அனுமதி';

  @override
  String get blockedEnableItInSettings =>
      'தடுக்கப்பட்டுள்ளது — அமைப்புகளில் இதை இயக்கவும்';

  @override
  String get allowsUpTo => 'வரை அனுமதிக்கிறது';

  @override
  String get bookingFailed => 'முன்பதிவு தோல்வியடைந்தது';

  @override
  String get yourDetails => 'உங்கள் விவரங்கள்';

  @override
  String get fromYourProfile => 'உங்கள் சுயவிவரத்திலிருந்து';

  @override
  String get familyMembers => 'குடும்ப உறுப்பினர்கள்';

  @override
  String get addMember => 'உறுப்பினரைச் சேர்க்கவும்';

  @override
  String get addAnother => 'இன்னொன்றைச் சேர்க்கவும்';

  @override
  String get preferredDateOptional => 'விருப்பமான தேதி (விருப்பத்திற்குரியது)';

  @override
  String get anyDate => 'எந்த தேதியும்';

  @override
  String get bookNowFree => 'இப்போதே முன்பதிவு செய்யுங்கள் (இலவசம்)';

  @override
  String get couldNotLoadThisPooja => 'இந்தப் பூஜையை ஏற்ற முடியவில்லை';

  @override
  String get forLabel => 'பக்கம்';

  @override
  String get s1Person => '1 நபர்';

  @override
  String get bookShareDetails => 'பதிவு செய்து விவரங்களைப் பகிரவும்';

  @override
  String get confirmYourBookingWithTheNames =>
      'பூஜை செய்யப்படும் நபர்களின் பெயர்களைக் கூறி உங்கள் முன்பதிவை உறுதிப்படுத்தவும்.';

  @override
  String get panditCoordinates => 'பண்டிட் ஒருங்கிணைப்புகள்';

  @override
  String get aVerifiedPanditCallsToFix =>
      'சரிபார்க்கப்பட்ட ஒரு பண்டிதர், நேரத்தை நிர்ணயிக்கவும் சாமான்களை ஏற்பாடு செய்யவும் அழைக்கிறார்.';

  @override
  String get poojaPerformed => 'பூஜை செய்யப்பட்டது';

  @override
  String get sankalpIsTakenInYourFamily =>
      'சங்கல்பம் உங்கள் குடும்பத்தினரின் பெயரில் எடுக்கப்பட்டு, பின்னர் தகுந்த இடங்களில் பிரசாதம் பகிர்ந்தளிக்கப்படும்.';

  @override
  String get couldNotLoadPoojas => 'பூஜைகளை ஏற்ற முடியவில்லை';

  @override
  String get any => 'ஏதேனும்';

  @override
  String get noPoojasHere => 'இங்கே பூஜைகள் இல்லை';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'தற்போதைய வடிப்பான்களுடன் எதுவும் பொருந்தவில்லை.';

  @override
  String get noPoojasAvailableYet => 'இன்னும் பூஜைகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get showAllPoojas => 'அனைத்து பூஜைகளையும் காட்டு';

  @override
  String get tapToViewDetailsBook =>
      'விவரங்களைக் காணவும் முன்பதிவு செய்யவும் தட்டவும்.';

  @override
  String get appliedYouBothEarnOnYour =>
      'செயல்படுத்தப்பட்டது! உங்கள் இருவருக்கும் முதல் ரீசார்ஜிலேயே வருமானம் கிடைக்கும்.';

  @override
  String get shareYourCode => 'உங்கள் குறியீட்டைப் பகிரவும்';

  @override
  String get sendYourCodeToFriendsVia =>
      'உங்கள் குறியீட்டை வாட்ஸ்அப், எஸ்எம்எஸ் என எங்கு வேண்டுமானாலும் நண்பர்களுக்கு அனுப்புங்கள்.';

  @override
  String get friendSignsUp => 'நண்பர் பதிவு செய்கிறார்';

  @override
  String get theyEnterYourCodeInRefer =>
      'அவர்கள் பதிவுசெய்த பிறகு, ரெஃபர் & ஏர்ன் (Refer & Earn) திட்டத்தில் உங்கள் குறியீட்டை உள்ளிடுவார்கள்.';

  @override
  String get feedbackReceived => 'கருத்துகள் பெறப்பட்டன ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'நன்றி — எங்கள் குழுவினர் இது குறித்து ஆராய்வார்கள்.';

  @override
  String get fullName => 'முழு பெயர்';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get phoneNumber => 'தொலைபேசி எண்';

  @override
  String get message => 'செய்தி';

  @override
  String get requiredLabel => 'தேவைப்படும்';

  @override
  String get applicationReceived => 'விண்ணப்பம் பெறப்பட்டது ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'உங்கள் ஜோதிடர் சுயவிவரம் குறித்து எங்கள் குழு உங்களைத் தொடர்புகொள்ளும்.';

  @override
  String get enter10Digits => '10 இலக்கங்களை உள்ளிடவும்';

  @override
  String get aboutYouBioExpertiseExperience =>
      'உங்களைப் பற்றி (சுயவிவரம், நிபுணத்துவம், அனுபவம்)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appName தொழில் வழிகாட்டுதல், நம்பகமான வேத ஜோதிடர்களுடன் உங்களை இணைக்கிறது.';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'திருமணம், நிதி, ஆரோக்கியம் மற்றும் வாழ்க்கையின் முக்கிய கேள்விகள் — அரட்டை, அழைப்பு மற்றும் காணொளி வாயிலாக.';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'உங்கள் இலவச ஜாதகம், தினசரி ராசிபலன், திருமண ஏற்பாடு, பூஜைகள் மற்றும் பரிகாரங்கள் அனைத்தையும் ஒரே இடத்தில் பெறுங்கள்.\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'உண்மையான, கருணையான ஆன்மீக வழிகாட்டுதலை அனைவருக்கும் கிடைக்கச் செய்வதே எங்கள் நோக்கம்.';

  @override
  String get inYourOwnLanguage => 'உங்கள் சொந்த மொழியில்.';

  @override
  String get verifiedExperiencedAstrologers =>
      'சரிபார்க்கப்பட்ட, அனுபவம் வாய்ந்த ஜோதிடர்கள்';

  @override
  String get privateSecureConsultations =>
      'தனிப்பட்ட மற்றும் பாதுகாப்பான ஆலோசனைகள்';

  @override
  String get availableIn6IndianLanguages => '6 இந்திய மொழிகளில் கிடைக்கிறது';

  @override
  String get thanksForRatingUs => 'எங்களுக்கு மதிப்பளித்ததற்கு நன்றி ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'உங்கள் கருத்துகள் $appName வளர உதவுகின்றன.';
  }

  @override
  String get onceInADay => 'ஒரு நாளைக்கு ஒரு முறை';

  @override
  String get twiceInADay => 'ஒரு நாளைக்கு இரண்டு முறை';

  @override
  String get asManyTimesAsItComes => 'எத்தனை முறை வந்தாலும்';

  @override
  String get never => 'ஒருபோதும்';

  @override
  String get cricket => 'கிரிக்கெட்';

  @override
  String get shareMarket => 'பங்குச் சந்தை';

  @override
  String get bollywood => 'பாலிவுட்';

  @override
  String get newMagazine => 'புதிய இதழ்';

  @override
  String get festivals => 'திருவிழாக்கள்';

  @override
  String get notificationsUpdated => 'அறிவிப்புகள் புதுப்பிக்கப்பட்டன ✓';

  @override
  String get youLlHearFromUsBased =>
      'உங்கள் விருப்பங்களின் அடிப்படையில் எங்களிடமிருந்து பதில் வரும்.';

  @override
  String get yourChartsWillNowFollowYour =>
      'இனி உங்கள் விளக்கப்படங்கள் நீங்கள் தேர்ந்தெடுத்த பாணியைப் பின்பற்றும்.';

  @override
  String get chartStyle => 'விளக்கப்பட பாணி';

  @override
  String get northIndian => 'வட இந்திய';

  @override
  String get southIndian => 'தென்னிந்தியர்';

  @override
  String get monthSystem => 'மாத அமைப்பு';

  @override
  String get amanta => 'அமண்டா';

  @override
  String get purnimanta => 'பூர்ணிமந்தா';

  @override
  String get darkMode => 'இருண்ட பயன்முறை';

  @override
  String get off => 'ஆஃப்';

  @override
  String get onLabel => 'ஆன்';

  @override
  String get useDeviceSettings => 'சாதன அமைப்புகளைப் பயன்படுத்தவும்';

  @override
  String get ayanamsa => 'அயனாம்சம்';

  @override
  String get nCLahiri => 'என்.சி. லஹிரி';

  @override
  String get kpNew => 'கேபி புதிய';

  @override
  String get kpOld => 'கேபி பழைய';

  @override
  String get raman => 'ராமன்';

  @override
  String get kpKhullar => 'கே.பி. குல்லர்';

  @override
  String get subtotal => 'மொத்த தொகை';

  @override
  String get youSave => 'நீங்கள் சேமிக்கிறீர்கள்';

  @override
  String get total => 'மொத்தம்';

  @override
  String get deliveryAddress => 'விநியோக முகவரி';

  @override
  String get orderSummary => 'ஆர்டர் சுருக்கம்';

  @override
  String get couponsOffers => 'கூப்பன்கள் மற்றும் சலுகைகள்';

  @override
  String get billDetails => 'மசோதா விவரங்கள்';

  @override
  String get address => 'முகவரி';

  @override
  String get productDiscount => 'பொருள் தள்ளுபடி';

  @override
  String get itemsSubtotal => 'பொருட்களின் மொத்தத்தொகை';

  @override
  String get delivery => 'விநியோகம்';

  @override
  String get free2 => 'இலவசம்';

  @override
  String get toPay => 'பணம் செலுத்த';

  @override
  String get dMmmYyyyHMmA => 'டி எம்எம்எம் ய்ய்ய்ய், ஹெச்:எம்எம் ஏ';

  @override
  String get couldNotDownloadInvoice =>
      'விலைப்பட்டியலைப் பதிவிறக்க முடியவில்லை';

  @override
  String get orderNotFound => 'ஆர்டர் காணப்படவில்லை';

  @override
  String get activityTimeline => 'செயல்பாட்டு காலவரிசை';

  @override
  String get eeeDMmmYyyyHMm => 'ஈஈஈ, டி எம்எம்எம் ஒய்ஒய்ஒய்ஒய் · எச்:மிமீ ஏ';

  @override
  String get totalPaid => 'மொத்தமாக செலுத்தப்பட்டது';

  @override
  String get orderPlaced2 => 'ஆர்டர் செய்யப்பட்டது';

  @override
  String get dMmmHMmA => 'டி எம்எம்எம், எச்:எம்எம் அ';

  @override
  String get generating => 'உருவாக்குகிறது…';

  @override
  String get pleaseDescribeTheIssue => 'தயவுசெய்து சிக்கலை விவரிக்கவும்.';

  @override
  String get couldNotLoadProducts => 'தயாரிப்புகளை ஏற்ற முடியவில்லை';

  @override
  String get newest => 'புதிய';

  @override
  String get priceLowHigh => 'விலை: குறைவு→அதிகம்';

  @override
  String get priceHighLow => 'விலை: அதிகம்→குறைவு';

  @override
  String get topRated => 'சிறந்த மதிப்பீடு பெற்ற';

  @override
  String get s6DigitPin => '6-இலக்க PIN';

  @override
  String get addressLine1 => 'முகவரி வரி 1 *';

  @override
  String get addressLine2 => 'முகவரி வரி 2';

  @override
  String get city => 'நகரம் *';

  @override
  String get state => 'மாநிலம் *';

  @override
  String get pinCode => 'பின் குறியீடு *';

  @override
  String get payment => 'பணம் செலுத்துதல்';

  @override
  String get pooja => 'பூஜா';

  @override
  String get shop => 'கடை';

  @override
  String get securePayment => 'பாதுகாப்பான கட்டணம்';

  @override
  String get noTransactionsMatchTheseFilters =>
      'இந்த வடிகட்டிகளுடன் எந்தப் பரிவர்த்தனைகளும் பொருந்தவில்லை.';

  @override
  String get noTransactionsYet => 'இன்னும் பரிவர்த்தனைகள் எதுவும் இல்லை';

  @override
  String get moneyAdded => 'பணம் சேர்க்கப்பட்டது';

  @override
  String get poojaBooking => 'பூஜை முன்பதிவு';

  @override
  String get videoCall => 'வீடியோ அழைப்பு';

  @override
  String get shopOrder => 'கடை ஆர்டர்';

  @override
  String get refund => 'பணத்தைத் திரும்பப் பெறுதல்';

  @override
  String get bonus => 'போனஸ்';

  @override
  String get credited => 'வரவு வைக்கப்பட்டது';

  @override
  String get debited => 'பற்று வைக்கப்பட்டது';

  @override
  String get rg => 'ஒரு';

  @override
  String aExperienceyearsYrsExp(Object experienceYears) {
    return '$experienceYears வருட அனுபவம்';
  }

  @override
  String weLlLetYouKnowWhen2(Object name, Object reason) {
    return '$name, $reason ஆகும்போது உங்களுக்குத் தெரிவிப்போம்.';
  }

  @override
  String priceMin(Object price) {
    return '₹$price/நிமிடம்';
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
    return '$name என்பவர் $desc இல் ஆழ்ந்த நிபுணத்துவம் பெற்ற ஒரு நம்பகமான ஜோதிடர். இந்தத் தளத்தில் பல வருடப் பயிற்சியின் மூலம்,';
  }

  @override
  String chatMin(Object chat) {
    return '₹$chat/நிமிடம்';
  }

  @override
  String callMin(Object call) {
    return '₹$call/நிமிடம்';
  }

  @override
  String videoMin(Object video) {
    return '₹$video/நிமிடம்';
  }

  @override
  String widgetNameIsLive(Object name) {
    return '$name நேரலையில் உள்ளது';
  }

  @override
  String widgetNameIsInASession(Object name) {
    return '$name தற்போது ஒரு அமர்வில் உள்ளது';
  }

  @override
  String widgetNameIsOfflineRightNow(Object name) {
    return '$name தற்போது ஆஃப்லைனில் உள்ளது';
  }

  @override
  String storeFollowers1000Tostringasfixed1K(Object toStringAsFixed) {
    return '${toStringAsFixed}k';
  }

  @override
  String maxPriceMaxpriceRoundMin(Object round) {
    return 'அதிகபட்ச விலை · ₹$round/நிமிடம்';
  }

  @override
  String sendTotalTokens(Object total) {
    return 'அனுப்பு · $total டோக்கன்கள்';
  }

  @override
  String sTypeTouppercaseLive(Object toUpperCase) {
    return '$toUpperCase · நேரலை';
  }

  @override
  String widgetAstrologernameChatHistory(Object astrologerName) {
    return '$astrologerName · அரட்டை வரலாறு';
  }

  @override
  String dailyAtRTimeofdayFor14(Object timeOfDay) {
    return 'தினமும் $timeOfDay · 14 நாட்களுக்கு';
  }

  @override
  String onRDate(Object date) {
    return '$date இல்';
  }

  @override
  String durSDurationsecSTotalamountCoins(
      Object durationSec, Object totalAmount) {
    return '$durationSec · $totalAmount நாணயங்கள்';
  }

  @override
  String aboutMinutesleftMinLeft(Object minutesLeft) {
    return 'சுமார் $minutesLeft நிமிடங்கள் மீதமுள்ளன';
  }

  @override
  String nearbyPermissionPerm(Object perm) {
    return '[அருகில்] அனுமதி = $perm';
  }

  @override
  String nearbyGetcurrentpositionFailedETryingLast(Object e) {
    return '[அருகில்] getCurrentPosition தோல்வியடைந்தது: $e — கடைசியாக அறியப்பட்டதை முயற்சிக்கிறது';
  }

  @override
  String nearbyPositionPosLatitudePosLongitude(
      Object latitude, Object longitude) {
    return '[அருகில்] நிலை = $latitude, $longitude';
  }

  @override
  String nearbyReversegeocodeCityCity(Object city) {
    return '[அருகிலுள்ள] ரிவர்ஸ்ஜியோகோட் நகரம் = \"$city\"';
  }

  @override
  String nearbyResolveErrorE(Object e) {
    return '[அருகில்] தீர்வுப் பிழை: $e';
  }

  @override
  String resumeSessionClock(Object clock) {
    return 'சுயவிவரம் · $clock';
  }

  @override
  String rateperminMin(Object ratePerMin) {
    return '₹$ratePerMin/நிமிடம்';
  }

  @override
  String checkYourConnectionAndTryAgain(Object error) {
    return 'உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.\n\n($error)';
  }

  @override
  String diffInminutesMAgo(Object inMinutes) {
    return '$inMinutesமீ முன்பு';
  }

  @override
  String diffInhoursHAgo(Object inHours) {
    return '${inHours}h முன்பு';
  }

  @override
  String diffIndaysDAgo(Object inDays) {
    return '${inDays}d முன்பு';
  }

  @override
  String thisPoojaCostsWidgetPoojaBaseprice(Object basePrice) {
    return 'இந்தப் பூஜைக்கு ₹$basePrice செலவாகும். உங்கள் பணப்பையில் போதுமான இருப்பு இல்லை — பணத்தைச் சேர்த்து மீண்டும் முயற்சிக்கவும்.';
  }

  @override
  String payWidgetPoojaBasepriceBook(Object basePrice) {
    return '₹$basePrice செலுத்தி முன்பதிவு செய்யுங்கள்';
  }

  @override
  String upToPMaxpersons(Object maxPersons) {
    return '$maxPersons வரை';
  }

  @override
  String aSacredPNamePerformedBy(Object name) {
    return 'அனுபவம் வாய்ந்த பண்டிதர்களால் நிகழ்த்தப்படும் ஒரு புனிதமான $name சடங்கு. ஒரு நேரத்தை முன்பதிவு செய்யுங்கள், விவரங்களையும் நேரத்தையும் ஒருங்கிணைக்க எங்கள் குழு உங்களைத் தொடர்புகொள்ளும்.';
  }

  @override
  String upToPoojaMaxpersons(Object maxPersons) {
    return '$maxPersons வரை';
  }

  @override
  String earnIRewardOnRudraganga(Object reward, String appName) {
    return '⟦1-க்கு ₹$reward சம்பாதியுங்கள்';
  }

  @override
  String bothEarnIReward(Object reward) {
    return 'இருவரும் ₹$reward சம்பாதிக்கிறார்கள்';
  }

  @override
  String onTheirFirstWalletRechargeYou(Object reward) {
    return 'உங்கள் வாலட்டை முதல் முறை ரீசார்ஜ் செய்யும்போது, உங்கள் இருவருக்கும் உடனடியாக ₹$reward கிடைக்கும்.';
  }

  @override
  String rechargeTotalBalance(Object balance) {
    return 'ரீசார்ஜ் ₹$balance';
  }

  @override
  String itemTotalMrpQtycount(Object qtyCount) {
    return 'பொருட்களின் மொத்த விலை (MRP) · $qtyCount';
  }

  @override
  String couponAppliedCode(Object code) {
    return 'கூப்பன் ($code)';
  }

  @override
  String placeOrderTotal(Object total) {
    return 'ஆர்டர் செய்யுங்கள் · ₹$total';
  }

  @override
  String pPriceWasPMrp(Object price, Object mrp) {
    return '₹$price (முன்பு ₹$mrp)';
  }

  @override
  String pNamePricelineUrl(Object name, Object priceLine, Object url) {
    return '$name $priceLine\n$url';
  }

  @override
  String ytWebviewErrorEErrorcodeE(Object errorCode, Object description) {
    return 'YT வெப்வியூ பிழை: $errorCode $description';
  }

  @override
  String rgpayHttpErrorEResponseStatuscode(Object statusCode) {
    return 'RGPAY http பிழை: $statusCode';
  }

  @override
  String rgpayResourceErrorEErrorcodeE(Object errorCode, Object description) {
    return 'RGPAY வளப் பிழை: $errorCode $description';
  }

  @override
  String get welcomeBonusTitle => 'Welcome gift unlocked!';

  @override
  String get welcomeBonusBody =>
      'has been added to your wallet. Start your first consultation on us.';

  @override
  String get welcomeBonusCta => 'Start exploring';

  @override
  String get exitAppTitle => 'Leave the app?';

  @override
  String get exitAppBody => 'Are you sure you want to exit?';

  @override
  String get exitAppConfirm => 'Exit';

  @override
  String get stay => 'Stay';

  @override
  String get yourName => 'உங்கள் பெயர்';

  @override
  String get enterYourName => 'உங்கள் பெயரை உள்ளிடவும்';

  @override
  String get runNumerology => 'எண் கணிதத்தை இயக்கு';

  @override
  String get numerologyIntro =>
      'உங்கள் பெயர் மற்றும் பிறந்த தேதியிலிருந்து உங்கள் எண்கள், அவற்றின் பொருள் அறியுங்கள்.';

  @override
  String get dateOfBirth => 'பிறந்த தேதி';

  @override
  String get timeOfBirth => 'பிறந்த நேரம்';

  @override
  String get birthPlace => 'பிறந்த இடம்';

  @override
  String get manglikDosh => 'மாங்லிக் தோஷம்';

  @override
  String get compatibility => 'பொருத்தம்';

  @override
  String get partner1 => 'பெண்';

  @override
  String get partner2 => 'ஆண்';

  @override
  String get checkCompatibility => 'பொருத்தத்தைச் சரிபார்';

  @override
  String get checkManglik => 'மாங்லிக் தோஷத்தைச் சரிபார்';

  @override
  String get matchingIntro =>
      'திருமணப் பொருத்தத்தைச் சரிபார் — குண மிலன், தோஷங்கள் மற்றும் மொத்த மதிப்பெண்.';

  @override
  String get manglikIntro =>
      'மாங்லிக் (செவ்வாய்) தோஷம் உள்ளதா, எவ்வளவு என்பதைச் சரிபார்.';

  @override
  String get fillBothPartners =>
      'இரு துணைகளின் பிறப்பு விவரங்களையும் உள்ளிடவும்.';

  @override
  String get enterBirthDetails => 'பிறப்பு விவரங்களை உள்ளிடவும்.';

  @override
  String get overallScore => 'மொத்த மதிப்பெண்';
}
