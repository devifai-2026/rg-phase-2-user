// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class L10nMr extends L10n {
  L10nMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'रुद्रगंगा';

  @override
  String get tagline => 'ज्योतिष आणि कल्याण';

  @override
  String get splashBlessing => 'स्पष्टतेकडे तुमचा प्रवास येथून सुरू होतो';

  @override
  String get authWelcomeTitle => 'स्वागत आहे';

  @override
  String get authWelcomeSubtitle =>
      'तुमच्या फोन नंबरने साइन इन करा किंवा खाते तयार करा';

  @override
  String get phoneLabel => 'फोन नंबर';

  @override
  String get phoneHint => '१० अंकी मोबाईल नंबर';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'पुढे चला';

  @override
  String get sendOtpButton => 'OTP पाठवा';

  @override
  String get otpTitle => 'तुमचा नंबर पडताळा';

  @override
  String otpSubtitle(String phone) {
    return '$phone वर पाठवलेला ६ अंकी कोड टाका';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'पडताळा आणि पुढे चला';

  @override
  String get resendOtp => 'कोड पुन्हा पाठवा';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds सेकंदात पुन्हा पाठवा';
  }

  @override
  String get changeNumber => 'नंबर बदला';

  @override
  String get termsNotice =>
      'पुढे गेल्यास तुम्ही आमच्या अटी व गोपनीयता धोरणाशी सहमत आहात';

  @override
  String get acceptPrefix => 'मी सहमत आहे';

  @override
  String get acceptAnd => 'आणि';

  @override
  String get termsOfService => 'सेवा अटी';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get errInvalidPhone => 'वैध १० अंकी फोन नंबर टाका';

  @override
  String get errInvalidOtp => '६ अंकी कोड टाका';

  @override
  String get errGeneric => 'काहीतरी चूक झाली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errNetwork =>
      'कनेक्शन नाही. तुमचे इंटरनेट तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get otpSent => 'OTP पाठवला';

  @override
  String get loginSuccess => 'साइन इन झाले';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get language => 'भाषा';

  @override
  String get theme => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String homeWelcome(String name) {
    return 'नमस्कार, $name';
  }

  @override
  String get logout => 'लॉग आउट';

  @override
  String get onbTitle => 'तुमच्याबद्दल सांगा';

  @override
  String get onbSubtitle =>
      'यामुळे आम्ही तुमच्यासाठी अधिक अचूक भविष्य सांगू शकतो. काहीही अनिवार्य नाही — तुम्ही नंतरही पूर्ण करू शकता.';

  @override
  String get onbName => 'तुमचे नाव';

  @override
  String get onbAddPhoto => 'फोटो जोडा';

  @override
  String get onbChangePhoto => 'फोटो बदला';

  @override
  String get onbGender => 'लिंग';

  @override
  String get genderMale => 'पुरुष';

  @override
  String get genderFemale => 'स्त्री';

  @override
  String get genderOther => 'इतर';

  @override
  String get onbDob => 'जन्म तारीख';

  @override
  String get onbTob => 'जन्म वेळ';

  @override
  String get onbDontKnowTime => 'मला माझी जन्म वेळ माहित नाही';

  @override
  String get onbPob => 'जन्म ठिकाण';

  @override
  String get onbPobHint => 'तुमचे जन्म शहर शोधा';

  @override
  String get onbLanguage => 'पसंतीची भाषा';

  @override
  String get onbSelectDate => 'तारीख निवडा';

  @override
  String get onbSelectTime => 'वेळ निवडा';

  @override
  String get onbSkip => 'आता वगळा';

  @override
  String get onbFinish => 'पूर्ण करा';

  @override
  String get onbSaved => 'प्रोफाइल जतन केले';

  @override
  String get completeProfile => 'तुमची प्रोफाइल पूर्ण करा';

  @override
  String get completeProfileCta => 'सेटअप पूर्ण करा';

  @override
  String get permTitle => 'काही परवानग्या';

  @override
  String get permSubtitle =>
      'जेणेकरून कॉल, सूचना आणि फोटो व्यवस्थित चालतील. तुम्ही कधीही सेटिंग्जमध्ये बदलू शकता.';

  @override
  String get permNotifications => 'सूचना';

  @override
  String get permNotificationsDesc => 'सल्ला सूचना, ऑर्डर अपडेट आणि स्मरणपत्रे';

  @override
  String get permMic => 'मायक्रोफोन';

  @override
  String get permMicDesc => 'ज्योतिषांसोबत व्हॉइस कॉलसाठी';

  @override
  String get permCamera => 'कॅमेरा';

  @override
  String get permCameraDesc => 'व्हिडिओ कॉल आणि फोटो अपलोडसाठी';

  @override
  String get permPhotos => 'फोटो';

  @override
  String get permPhotosDesc => 'तुमचा प्रोफाइल फोटो सेट करण्यासाठी';

  @override
  String get permAllow => 'परवानगी द्या';

  @override
  String get permContinue => 'पुढे चला';

  @override
  String get permLocation => 'स्थान';

  @override
  String get permLocationDesc => 'तुमच्या जवळचे ज्योतिषी शोधा';

  @override
  String get secFeatured => 'विशेष ज्योतिषी';

  @override
  String get secNearby => 'जवळचे ज्योतिषी';

  @override
  String get secCallChat => 'कॉल आणि चॅट';

  @override
  String get secAiAstro => 'AI ज्योतिषी';

  @override
  String get secProducts => 'उत्पादने';

  @override
  String get secVideos => 'व्हिडिओ';

  @override
  String get secLessons => 'ज्योतिष धडे';

  @override
  String get secOthers => 'इतर';

  @override
  String get secHistory => 'तुमचे सल्ले';

  @override
  String get seeAll => 'सर्व पहा';

  @override
  String get basedOnLocation => 'तुमच्या स्थानानुसार';

  @override
  String get shareApp => 'मित्रांसोबत अ‍ॅप शेअर करा';

  @override
  String get startReadingHint =>
      'अजून सल्ला नाही. तुमची पहिली रीडिंग सुरू करा.';

  @override
  String get startBtn => 'सुरू';

  @override
  String get namaste => 'नमस्कार';

  @override
  String get kFreeKundli => 'मोफत कुंडली';

  @override
  String get kMatching => 'जुळणी';

  @override
  String get kBrihat => 'बृहत कुंडली';

  @override
  String get kKundliAi => 'कुंडली AI+';

  @override
  String get tCareer => 'करिअर';

  @override
  String get tMarriage => 'विवाह';

  @override
  String get tFinance => 'वित्त';

  @override
  String get tHealth => 'आरोग्य';

  @override
  String get tEducation => 'शिक्षण';

  @override
  String get tTravel => 'प्रवास';

  @override
  String get statusOnline => 'ऑनलाइन';

  @override
  String get statusBusy => 'व्यस्त';

  @override
  String get statusOffline => 'ऑफलाइन';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get chatNow => 'आता चॅट करा';

  @override
  String get notifyMe => 'मला सूचित करा';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'हे ज्योतिषी अद्याप भेटीसाठी उपलब्ध नाहीत.';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'तुमचे प्रोफाइल पूर्ण करा';

  @override
  String get addYourDateTimePlaceOf =>
      'तुमची जन्मतारीख, वेळ आणि ठिकाण नमूद करा, जेणेकरून ज्योतिषी तुम्हाला अधिक स्पष्ट भविष्य सांगू शकतील.';

  @override
  String get completeProfile2 => 'संपूर्ण प्रोफाइल';

  @override
  String get skipForNow => 'सध्यासाठी वगळा';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'कारण सांगा (ऐच्छिक) — यामुळे आम्हाला सुधारणा करण्यास मदत होते.';

  @override
  String get reasonOptional => 'कारण (ऐच्छिक)';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get unfollow => 'अनफॉलो';

  @override
  String get s21kReviews => '(२.१ हजार समीक्षणे)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'भेटवस्तू';

  @override
  String get store => 'स्टोअर';

  @override
  String get joinLiveSession => 'थेट सत्रात सामील व्हा';

  @override
  String get youLlBeNotified => 'तुम्हाला सूचित केले जाईल';

  @override
  String get thisStoreHasNoItemsYet => 'या दुकानात अजून एकही वस्तू नाही.';

  @override
  String get filters => 'फिल्टर';

  @override
  String get reset => 'रीसेट करा';

  @override
  String get onlineNowOnly => 'आता फक्त ऑनलाइन';

  @override
  String get applyFilters => 'फिल्टर लावा';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'या ज्योतिषाकडून दानधर्म उपलब्ध नाही.';

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
  String get recharge => 'रिचार्ज';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'प्रमाण';

  @override
  String get min1Max100 => 'किमान १ कमाल १००';

  @override
  String get comingSoon => 'लवकरच येत आहे';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'तुमच्यासाठी सेट केलेले स्मरणपत्रे';

  @override
  String get suggestedForYou => 'तुमच्यासाठी सुचवलेले';

  @override
  String get couldNotSendImage => 'प्रतिमा पाठवता आली नाही.';

  @override
  String get endConsultation => 'चर्चा संपवायची का?';

  @override
  String get thisWillEndTheChatAnd =>
      'यामुळे चॅट समाप्त होईल आणि बिलिंग थांबेल.';

  @override
  String get keepChatting => 'गप्पा मारत रहा';

  @override
  String get end => 'शेवट';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'स्विच';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'ऑडिओ कॉलवर स्विच करा';

  @override
  String get switchToVideoCall => 'व्हिडिओ कॉलवर स्विच करा';

  @override
  String get endConsultation2 => 'सल्लामसलत समाप्त करा';

  @override
  String get sendAGift => 'भेटवस्तू पाठवा';

  @override
  String get sayHello => 'नमस्कार म्हणा 🙏';

  @override
  String get typeAMessage => 'संदेश टाईप करा…';

  @override
  String get recommendedProduct => 'शिफारस केलेले उत्पादन';

  @override
  String get view => 'पहा';

  @override
  String get connecting => 'जोडत आहे…';

  @override
  String get myConsultations => 'माझे सल्लामसलत';

  @override
  String get noConsultationsYet => 'अद्याप कोणतीही चर्चा झालेली नाही';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'चॅट पहा';

  @override
  String get historyExpired => 'इतिहास कालबाह्य झाला.';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'ज्योतिषाला फोन करणे';

  @override
  String get cancelRequest => 'विनंती रद्द करा';

  @override
  String get notNow => 'आता नाही';

  @override
  String get thanksForYourFeedback => 'तुमच्या अभिप्रायाबद्दल धन्यवाद!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'सबमिट करता आले नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get consultationEnded => 'चर्चा संपली.';

  @override
  String get hopeYouGotTheClarityYou =>
      'तुम्हाला हवी असलेली स्पष्टता मिळाली असेल अशी आशा आहे.';

  @override
  String get shareYourExperienceOptional => 'तुमचा अनुभव सांगा (ऐच्छिक)';

  @override
  String get howWasTheCallQuality => 'कॉलची गुणवत्ता कशी होती?';

  @override
  String get skip => 'वगळा';

  @override
  String get submit => 'सबमिट करा';

  @override
  String get close => 'बंद करा';

  @override
  String get viewProfile => 'प्रोफाइल पहा';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'यांनी बनवले';

  @override
  String get devifai => 'DevifAI';

  @override
  String get withLabel => '❤️ सह';

  @override
  String get leavingSoSoon => 'इतक्या लवकर निघणार?';

  @override
  String get stayLoggedIn => 'लॉग इन रहा';

  @override
  String get logOutAnyway => 'तरीही लॉग आउट करा';

  @override
  String get noNearbyAstrologersYet => 'जवळपास अद्याप ज्योतिषी नाहीत';

  @override
  String get bookAPooja => 'पूजा बुक करा';

  @override
  String get panditLedPoojasAtYourChosen =>
      'तुमच्या निवडलेल्या तारखेला पंडितांच्या नेतृत्वाखालील पूजा';

  @override
  String get back => 'मागे';

  @override
  String get connectingToLive => 'थेट प्रक्षेपणाशी जोडत आहे…';

  @override
  String get live => 'थेट प्रक्षेपण';

  @override
  String get thisLiveHasEnded => 'हे लाईव्ह संपले आहे.';

  @override
  String get backToLive => 'थेट प्रक्षेपणाकडे परत';

  @override
  String get sayHelloBeTheFirstTo => 'नमस्कार म्हणा 👋 पहिली टिप्पणी करा';

  @override
  String get aiPollLive => 'एआय मतदान · थेट';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'एक टिप्पणी जोडा…';

  @override
  String get send => 'पाठवा';

  @override
  String get liveNow => 'आता थेट प्रक्षेपण';

  @override
  String get searchByAstrologerName => 'ज्योतिषाच्या नावाने शोधा';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'रिफ्रेश करा';

  @override
  String get join => 'सामील व्हा';

  @override
  String get clearAllNotifications => 'सर्व सूचना काढून टाकायच्या आहेत का?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'यामुळे तुमच्या सर्व सूचना कायमच्या हटवल्या जातील.';

  @override
  String get clearAll => 'सर्व साफ करा';

  @override
  String get notifications => 'सूचना';

  @override
  String get markAllRead => 'सर्व वाचले म्हणून चिन्हांकित करा';

  @override
  String get noNotifications => 'कोणत्याही सूचना नाहीत';

  @override
  String get youReAllCaughtUp => 'तुम्हाला आता सर्व माहिती मिळाली आहे.';

  @override
  String get nameIsRequired => 'नाव आवश्यक आहे';

  @override
  String get enterAValidPhone => 'वैध फोन नंबर टाका';

  @override
  String get bookingConfirmed => 'बुकिंग निश्चित झाली आहे 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'बुकिंग अयशस्वी झाली, कृपया पुन्हा प्रयत्न करा.';

  @override
  String get addMoneyToContinue => 'पुढे चालू ठेवण्यासाठी पैसे टाका';

  @override
  String get addMoney => 'पैसे जोडा';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'Book $name';
  }

  @override
  String get name => 'नाव';

  @override
  String get phone => 'फोन';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'Add the people this pooja is performed for (up to $_maxPersons). Fill one before adding the next.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'Member $key name';
  }

  @override
  String get specialInstructionsOptional => 'विशेष सूचना (ऐच्छिक)';

  @override
  String get poojaDetails => 'पूजेचा तपशील';

  @override
  String get price => 'किंमत';

  @override
  String get bookNow => 'आता बुक करा';

  @override
  String get aboutThisPooja => 'या पूजेबद्दल';

  @override
  String get ourPanditWillCallYou => 'आमचे पंडित तुम्हाला बोलावतील';

  @override
  String get beforeThePoojaToConfirmThe =>
      'पूजेपूर्वी, वेळ आणि तुमच्या संकल्पाचा तपशील निश्चित करून घ्या.';

  @override
  String get howItWorks => 'ते कसे काम करते';

  @override
  String get filterPoojas => 'पूजा फिल्टर करा';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'किमान व्यक्तींनी पाठिंबा दिला';

  @override
  String get apply => 'अर्ज करा';

  @override
  String get searchPoojas => 'पूजा शोधा…';

  @override
  String get myProfile => 'माझे प्रोफाइल';

  @override
  String get referEarn => 'रेफर करा आणि कमवा';

  @override
  String get couldNotLoadTryAgain => 'लोड होऊ शकले नाही. पुन्हा प्रयत्न करा.';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'तुमचा रेफरल कोड';

  @override
  String get codeCopied => 'कोड कॉपी केला';

  @override
  String get shareEarn => 'शेअर करा आणि कमवा';

  @override
  String get haveAFriendSCode => 'तुमच्या मित्राचा कोड आहे का?';

  @override
  String get enterReferralCode => 'रेफरल कोड प्रविष्ट करा';

  @override
  String get aReferralCodeIsAppliedTo =>
      'तुमच्या खात्यावर एक रेफरल कोड लागू केला जातो.';

  @override
  String get feedbackSubmitted => 'अभिप्राय सादर केला.';

  @override
  String get feedback => 'अभिप्राय';

  @override
  String get applicationSubmitted => 'अर्ज सादर केला.';

  @override
  String get astrologerRegistration => 'ज्योतिषी नोंदणी';

  @override
  String get joinRudragangaAsAnAstrologer =>
      'ज्योतिषी म्हणून रुद्रगंगाकडे सामील व्हा.';

  @override
  String get tellUsAboutYourselfOurTeam =>
      'तुमच्याबद्दल आम्हाला सांगा — आमची टीम त्याचा आढावा घेईल आणि तुमच्याशी संपर्क साधेल.';

  @override
  String get aboutUs => 'आमच्याबद्दल';

  @override
  String get rudraganga => 'रुद्रगनला';

  @override
  String get astrologyWellness => 'ज्योतिष आणि आरोग्य';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · निष्ठेने बनवलेले';

  @override
  String get thanksForYourRating => 'तुमच्या रेटिंगबद्दल धन्यवाद!';

  @override
  String get rateRudraganga => 'रुद्रगंगाचा दर';

  @override
  String get howIsYourExperience => 'तुमचा अनुभव कसा आहे?';

  @override
  String get writeAReviewOptional => 'अभिप्राय लिहा (ऐच्छिक)';

  @override
  String get saved => 'जतन केले';

  @override
  String get notificationSetting => 'सूचना सेटिंग';

  @override
  String get howOften => 'किती वेळा?';

  @override
  String get topicsYouCareAbout => 'तुम्हाला आवडणारे विषय';

  @override
  String get ok => 'ठीक आहे';

  @override
  String get allSet => 'सर्व काही तयार आहे ✨';

  @override
  String get setPreferences => 'प्राधान्ये सेट करा';

  @override
  String get save => 'जतन करा';

  @override
  String get bundlesCombos => 'बंडल आणि कॉम्बो';

  @override
  String get noCombosRightNow => 'सध्या कोणतेही कॉम्बो नाहीत';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'कार्ट';

  @override
  String get clear => 'स्पष्ट';

  @override
  String get yourCartIsEmpty => 'तुमची कार्ट रिकामी आहे';

  @override
  String get browseProductsAndAddThemHere =>
      'उत्पादने ब्राउझ करा आणि येथे जोडा';

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
  String get pleaseAddADeliveryAddress => 'कृपया डिलिव्हरीचा पत्ता जोडा';

  @override
  String get checkout => 'चेकआउट';

  @override
  String get addNewAddress => 'नवीन पत्ता जोडा';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'काढून टाका';

  @override
  String get enterCouponCode => 'कूपन कोड प्रविष्ट करा';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'उपलब्ध ऑफर्स';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'लागू केले';

  @override
  String get nothingToCheckout => 'तपासण्यासारखे काही नाही';

  @override
  String get orderPlaced => 'ऑर्डर दिली!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'खरेदी सुरू ठेवा';

  @override
  String get yourOrders => 'तुमच्या ऑर्डर';

  @override
  String get noOrdersYet => 'अद्याप कोणतीही ऑर्डर नाही';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'तुम्ही दुकानातून काही खरेदी केल्यावर तुमच्या ऑर्डर येथे दिसतील.';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'इनव्हॉइस अजूनही तयार होत आहे. थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get couldNotOpenTheInvoice => 'इनव्हॉइस उघडता आले नाही.';

  @override
  String get thanksOurTeamWillReachOut =>
      'धन्यवाद! आमची टीम या ऑर्डरसंदर्भात तुमच्याशी संपर्क साधेल.';

  @override
  String get orderDetails => 'ऑर्डर तपशील';

  @override
  String get needHelp => 'मदत हवी आहे';

  @override
  String get needHelpWithThisOrder => 'या ऑर्डरसाठी मदत हवी आहे का?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'बिल';

  @override
  String get download => 'डाउनलोड करा';

  @override
  String get needHelp2 => 'मदत हवी आहे';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'काय चुकलं?';

  @override
  String get describeTheIssue => 'समस्येचे वर्णन करा';

  @override
  String get tellUsWhatHappenedSoWe =>
      'काय घडले ते आम्हाला सांगा म्हणजे आम्ही मदत करू शकू…';

  @override
  String get submitRequest => 'विनंती सादर करा';

  @override
  String get addedToCart => 'कार्टमध्ये जोडले';

  @override
  String get productUnavailable => 'उत्पादन उपलब्ध नाही';

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
  String get fewItemsLeft => 'काही वस्तू शिल्लक आहेत';

  @override
  String get description => 'वर्णन';

  @override
  String get frequentlyBoughtTogether => 'वारंवार एकत्र खरेदी केले जाते';

  @override
  String get viewAll => 'सर्व पहा';

  @override
  String get addToCart => 'कार्टमध्ये जोडा';

  @override
  String get buyNow => 'आता खरेदी करा';

  @override
  String get searchProducts => 'उत्पादने शोधा…';

  @override
  String get noProductsFound => 'कोणतेही उत्पादन आढळले नाही';

  @override
  String get priceRange => 'किंमत श्रेणी (₹)';

  @override
  String get min => 'किमान';

  @override
  String get max => 'मॅक्स';

  @override
  String get inStockOnly => 'स्टॉकमध्ये उपलब्ध';

  @override
  String get sortBy => 'यानुसार क्रमवारी लावा';

  @override
  String get addDeliveryAddress => 'डिलिव्हरीचा पत्ता जोडा';

  @override
  String get setAsDefaultAddress => 'डीफॉल्ट पत्ता म्हणून सेट करा';

  @override
  String get saveAddress => 'पत्ता जतन करा';

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
  String get fewLeft => 'थोडेच शिल्लक राहिले';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'मोफत डिलिव्हरी';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'येथे अजून काही नाही';

  @override
  String get loadingSecurePayment => 'सुरक्षित पेमेंट लोड होत आहे…';

  @override
  String get couldNotStartRecharge => 'रिचार्ज सुरू करता आले नाही.';

  @override
  String get paymentSuccessful => 'पेमेंट यशस्वी झाले 🎉';

  @override
  String get paymentWasNotCompleted => 'पेमेंट पूर्ण झाले नाही.';

  @override
  String get couldNotStartRechargeTryAgain =>
      'रिचार्ज सुरू होऊ शकले नाही, पुन्हा प्रयत्न करा.';

  @override
  String get wallet => 'वॉलेट';

  @override
  String get availableBalance => 'उपलब्ध शिल्लक';

  @override
  String get useItForPoojasConsultations =>
      'याचा उपयोग पूजा आणि सल्लामसलतीसाठी करा.';

  @override
  String get instantTopUp => 'झटपट टॉप-अप';

  @override
  String get noRechargePacksAvailableRightNow =>
      'सध्या कोणतेही रिचार्ज पॅक उपलब्ध नाहीत.';

  @override
  String get transactions => 'व्यवहार';

  @override
  String get endOfTransactions => 'व्यवहारांचा शेवट —';

  @override
  String get youGet => 'तुम्हाला मिळते';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus bonus';
  }

  @override
  String payPackAmount(Object amount) {
    return 'Pay ₹$amount';
  }

  @override
  String get rudra => 'रुद्र';

  @override
  String get ganga => 'चालणे';

  @override
  String get about => 'बद्दल';

  @override
  String get astrologer => 'ज्योतिषी';

  @override
  String get seeker => 'शोधक';

  @override
  String get free => 'मोफत';

  @override
  String get jan => 'जानेवारी';

  @override
  String get feb => 'फेब्रुवारी';

  @override
  String get mar => 'मार';

  @override
  String get apr => 'एप्रिल';

  @override
  String get may => 'मे';

  @override
  String get jun => 'जून';

  @override
  String get jul => 'जुलै';

  @override
  String get aug => 'ऑगस्ट';

  @override
  String get sep => 'सप्टेंबर';

  @override
  String get oct => 'ऑक्टोबर';

  @override
  String get nov => 'नोव्हेंबर';

  @override
  String get dec => 'डिसेंबर';

  @override
  String get english => 'इंग्रजी';

  @override
  String get all => 'सर्व';

  @override
  String get vedic => 'वैदिक';

  @override
  String get tarot => 'टॅरो';

  @override
  String get numerology => 'अंकशास्त्र';

  @override
  String get vastu => 'विरुद्ध';

  @override
  String get palmistry => 'हस्तसामुद्रिक';

  @override
  String get kp => 'केपी';

  @override
  String get love => 'प्रेम';

  @override
  String get taraAi => 'देशातील एआय';

  @override
  String get instantVedicAnswers247 => 'झटपट वैदिक उत्तरे • २४×७';

  @override
  String get allLanguages => 'सर्व भाषा';

  @override
  String get jyotiAi => 'ज्योती एआय';

  @override
  String get loveCareerGuidance => 'प्रेम आणि करिअर मार्गदर्शन';

  @override
  String get hindiEnglish => 'हिंदी, इंग्रजी';

  @override
  String get veduAi => 'वेदू एआय';

  @override
  String get remediesPredictions => 'उपाय आणि भाकिते';

  @override
  String get couldNotLoadAstrologers => 'ज्योतिषी लोड होऊ शकले नाहीत.';

  @override
  String get aiAstrologers => 'एआय ज्योतिषी';

  @override
  String get featuredAstrologers => 'विशेष ज्योतिषी';

  @override
  String get astrologers => 'ज्योतिषी';

  @override
  String get searchAiAstrologers => 'एआय ज्योतिषी शोधा…';

  @override
  String get searchAstrologersByName => 'ज्योतिषींना नावानुसार शोधा…';

  @override
  String get aiChat => 'एआय चॅट';

  @override
  String get noAstrologersMatch => 'कोणताही ज्योतिषी जुळत नाही';

  @override
  String get noAstrologersYet => 'अद्याप एकही ज्योतिषी नाही';

  @override
  String get couldnTSetTheReminderPlease =>
      'रिमाइंडर सेट करता आला नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get ai => 'एआय';

  @override
  String get live2 => 'लाइव्ह';

  @override
  String get online => 'ऑनलाइन';

  @override
  String get busy => 'व्यस्त';

  @override
  String get offline => 'ऑफलाइन';

  @override
  String get chat => 'चॅट';

  @override
  String get call => 'कॉल';

  @override
  String get video => 'व्हिडिओ';

  @override
  String get notEnoughBalanceToStartPlease =>
      'सुरू करण्यासाठी पुरेसा बॅलन्स नाही. कृपया रिचार्ज करा.';

  @override
  String get couldNotStartTheConsultationPlease =>
      'सल्लामसलत सुरू करता आली नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get share => 'शेअर करा';

  @override
  String get follow => 'अनुसरण करा';

  @override
  String get chats => 'गप्पा';

  @override
  String get calls => 'कॉल';

  @override
  String get videos => 'व्हिडिओ';

  @override
  String get gifts => 'भेटवस्तू';

  @override
  String get languages => 'भाषा';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'त्यांनी हजारो साधकांना करिअर, विवाह, आर्थिक बाबी आणि जीवनमार्गासंबंधीच्या प्रश्नांवर मार्गदर्शन केले आहे.';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'त्यांचे मार्गदर्शन शास्त्रीय वैदिक तत्त्वांना व्यावहारिक, करुणापूर्ण मार्गदर्शनासोबत जोडते — जे तुम्हाला मदत करते.';

  @override
  String get findClarityAndActionableRemediesFor =>
      'पुढील वाटचालीसाठी स्पष्टता आणि कृती करण्यायोग्य उपाययोजना शोधा.';

  @override
  String get giftsReceived => 'मिळालेल्या भेटवस्तू';

  @override
  String get reviews => 'पुनरावलोकने';

  @override
  String get weLlNotifyYouTheMoment =>
      'ते मोकळे झाल्याबरोबर आम्ही तुम्हाला कळवू.';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'ते ऑनलाइन आल्याबरोबर आम्ही तुम्हाला कळवू.';

  @override
  String get getAHeadsUpTheMoment =>
      'ते उपलब्ध होताच तुम्हाला पूर्वसूचना मिळेल.';

  @override
  String get couldNotLoadThisStore => 'हे स्टोअर लोड करता आले नाही.';

  @override
  String get products => 'उत्पादने';

  @override
  String get poojas => 'पूजेमध्ये';

  @override
  String get book => 'पुस्तक';

  @override
  String get buy => 'खरेदी करा';

  @override
  String get lalKitab => 'लाल किताब';

  @override
  String get hindi => 'नाही';

  @override
  String get bengali => 'बंगाली';

  @override
  String get tamil => 'तमिळ';

  @override
  String get marathi => 'मराठी';

  @override
  String get punjabi => 'पंजाबी';

  @override
  String get telugu => 'तेलगू';

  @override
  String get expertise => 'तज्ञता';

  @override
  String get couldNotLoadGifts => 'भेटवस्तू लोड करता आल्या नाहीत.';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'शिल्लक पुरेशी नाही. भेटवस्तू पाठवण्यासाठी पैसे भरा.';

  @override
  String get couldNotSendTheGiftPlease =>
      'भेटवस्तू पाठवता आली नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get connecting2 => 'जोडणी होत आहे…';

  @override
  String get couldNotLoadThisChatHistory => 'हा चॅट इतिहास लोड करता आला नाही.';

  @override
  String get thisChatHistoryIsNoLonger =>
      'हा चॅट इतिहास आता उपलब्ध नाही\n\n(चॅट्स ७ दिवसांसाठी जपून ठेवले जातात).';

  @override
  String get dailyFor14Days => 'दररोज · १४ दिवसांसाठी';

  @override
  String get dailyMantra => 'दररोजचा मंत्र';

  @override
  String get reminder => 'स्मरणपत्र';

  @override
  String get audio => 'ऑडिओ';

  @override
  String get couldNotLoadYourConsultations =>
      'तुमचे सल्लामसलत लोड करता आले नाहीत.';

  @override
  String get missed => 'चुकले';

  @override
  String get declined => 'नाकारले';

  @override
  String get cancelled => 'रद्द केले';

  @override
  String get lowBalance => 'कमी शिल्लक';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'तुमची चर्चा सुरू ठेवण्यासाठी आता रिचार्ज करा. तुम्ही पैसे भरत असताना तुमची चॅट सुरूच राहील.';

  @override
  String get duration => 'कालावधी';

  @override
  String get coinsUsed => 'वापरलेली नाणी';

  @override
  String get guest => 'पाहुणे';

  @override
  String get changeLanguage => 'भाषा बदला';

  @override
  String get chooseYourKundli => 'तुमची कुंडली निवडा';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'तुमचे वॉलेट, वाचन आणि जतन केलेला तपशील सुरक्षित राहतो — पण लॉग आउट केल्यास तुम्ही तुमचे दैनिक राशीभविष्य, ऑफर्स आणि रिमाइंडर्स चुकवता. ताऱ्यांशी जोडलेले रहायचे आहे का? ✨';

  @override
  String get offers => 'ऑफर';

  @override
  String get dailyPanchang => 'दैनिक पंचांग';

  @override
  String get talkToAstrologer => 'ज्योतिषाशी बोला';

  @override
  String get brihatKundli => 'बृहत् कुंडली';

  @override
  String get dailyNotes => 'दैनंदिन नोंदी';

  @override
  String get askAQuestion => 'प्रश्न विचारा';

  @override
  String get free50Pages => 'मोफत ५०+ पृष्ठे';

  @override
  String get freeReport => 'मोफत अहवाल';

  @override
  String get freeMatrimony => 'मोफत विवाह';

  @override
  String get matrimony => 'विवाह';

  @override
  String get loveMatch => 'प्रेम जुळणी';

  @override
  String get horoscope => 'राशिभविष्य';

  @override
  String get dailyHoroscope => 'दैनिक राशीभविष्य';

  @override
  String get vedicAstrology => 'वैदिक ज्योतिष';

  @override
  String get acharyaVeda => 'आचार्य वेद';

  @override
  String get panditRohan => 'पंडित रोहन';

  @override
  String get guruMaya => 'आभासी शिक्षक';

  @override
  String get jayaShastri => 'जया शास्त्री';

  @override
  String get devSharma => 'देव शर्मा';

  @override
  String get sureshG => 'सुरेश जी.';

  @override
  String get lataP => 'पी. वर्षे';

  @override
  String get kiranB => 'किरण बी.';

  @override
  String get mohanT => 'मोहन टी.';

  @override
  String get anilJoshi => 'अनिल जोशी';

  @override
  String get meeraDevi => 'मीरा देवी';

  @override
  String get raviKumar => 'रवी कुमार';

  @override
  String get sunitaRao => 'सुनिता राव';

  @override
  String get bengaluruKarnataka => 'बंगळूरु, कर्नाटक';

  @override
  String get locating => 'शोधत आहे…';

  @override
  String get festivalOffer => 'उत्सव ऑफर';

  @override
  String get upTo30OffOnGemstones => 'रत्नांवर ३०% पर्यंत सूट';

  @override
  String get talkToTopAstrologers => 'नामांकित ज्योतिषांशी बोला';

  @override
  String get firstConsultationSpecial => 'पहिली सल्लामसलत विशेष';

  @override
  String get rudrakshaCollection => 'रुद्राक्ष संग्रह';

  @override
  String get authenticEnergised => 'अस्सल आणि उत्साही';

  @override
  String get resumeSession => 'सत्र पुन्हा सुरू करा';

  @override
  String get home => 'घर';

  @override
  String get aiAstro => 'एआय अॅस्ट्रो';

  @override
  String get ask => 'विचारा';

  @override
  String get history => 'इतिहास';

  @override
  String get seeAll2 => 'सर्व पहा';

  @override
  String get s1AcceptanceOfTheseTerms => '१. या अटींची स्वीकृती';

  @override
  String get termsOfService2 => 'सेवा अटी';

  @override
  String get lastUpdated26June2026 => 'शेवटचे अद्यतन: २६ जून २०२६';

  @override
  String get rudragangaProvidesAstrologySpiritualAndWellness =>
      'रुद्रगंगा मार्गदर्शन आणि वैयक्तिक मदतीसाठी ज्योतिष, अध्यात्म आणि आरोग्यविषयक सल्ला देतात.';

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'केवळ प्रतिबिंब. आमच्या सेवा व्यावसायिक वैद्यकीय, कायदेशीर, आर्थिक सेवांचा पर्याय नाहीत.';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'किंवा मानसिक सल्ला. ॲप वापरण्यासाठी तुमचे वय १८ वर्षे किंवा त्याहून अधिक असणे आवश्यक आहे.';

  @override
  String get byCreatingAnAccountOrUsing =>
      'खाते तयार करून किंवा रुद्रगंगा मोबाईल ॲप्लिकेशन आणि संबंधित सेवांचा वापर करून (';

  @override
  String get servicesYouAgreeToBeBound =>
      '“सेवा”), तुम्ही या सेवा अटी आणि आमच्या गोपनीयता धोरण आणि परतावा धोरणाचे पालन करण्यास सहमत आहात.';

  @override
  String get policyIfYouDoNotAgree =>
      'धोरण. आपण सहमत नसल्यास, कृपया सेवांचा वापर करू नका.';

  @override
  String get s2EligibilityYourAccount => '२. पात्रता आणि तुमचे खाते';

  @override
  String get youMustBeAtLeast18 =>
      'तुम्ही किमान १८ वर्षांचे आणि कायदेशीररित्या करार करण्यास सक्षम असणे आवश्यक आहे.';

  @override
  String get youRegisterWithAPhoneNumber =>
      'तुम्ही एक-वेळच्या पासवर्डने (OTP) सत्यापित केलेल्या फोन नंबरद्वारे नोंदणी करता. त्या नंबरचा आणि डिव्हाइसचा ॲक्सेस सुरक्षित ठेवण्याची जबाबदारी तुमची आहे.';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'तुम्ही अचूक माहिती देण्यास सहमत आहात, ज्यामध्ये तुम्ही वाचनासाठी माहिती देण्याचे निवडल्यास जन्माच्या तपशिलांचाही समावेश आहे. तुमच्या खात्याअंतर्गत होणाऱ्या सर्व व्यवहारांसाठी तुम्ही जबाबदार असाल.';

  @override
  String get s3TheServicesWeOffer => '३. आम्ही देत असलेल्या सेवा';

  @override
  String get rudragangaConnectsYouWithVerifiedAstrologers =>
      'रुद्रगंगा तुम्हाला ऑडिओ कॉल, व्हिडिओ कॉलद्वारे सल्ल्यासाठी सत्यापित ज्योतिषांशी जोडून देते.';

  @override
  String get andChatAndOffersRelatedFeatures =>
      'आणि चॅट, तसेच कुंडली तयार करणे आणि जुळवणे, एआय ज्योतिषी यांसारख्या संबंधित सुविधा पुरवते.';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'दैनिक राशीभविष्य, पूजा बुकिंग, आध्यात्मिक उत्पादनांचे दुकान, भेटवस्तू आणि विवाह जुळवणी.';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'कोणत्याही सुविधेची किंवा ज्योतिषाची उपलब्धता केव्हाही बदलू शकते.';

  @override
  String get s4WalletPricingBilling => '४. वॉलेट, किंमत आणि बिलिंग';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'सल्लामसलतीसाठी आगाऊ पैसे द्यावे लागतात. संपर्क साधण्यापूर्वी, तुम्ही ॲपमधील वॉलेटमध्ये पैसे जमा करता आणि ज्योतिषी व सेवेसाठी दाखवलेल्या दरानुसार प्रति मिनिट पैसे भरता.';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'ज्योतिषी तुमची विनंती स्वीकारतात आणि सेशन कनेक्ट होते, तेव्हा बिलिंग सुरू होते. कनेक्ट झाल्यावर पहिल्या मिनिटाचे शुल्क आकारले जाते आणि त्यानंतरच्या प्रत्येक मिनिटाचे शुल्क ते सुरू झाल्यावर आकारले जाते. सेशन दरम्यान एक चालू मीटर दाखवला जातो आणि तुमची शिल्लक कमी झाल्यास सेशन आपोआप संपते.';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'पेमेंटची प्रक्रिया आमच्या पेमेंट पार्टनर (PayU) द्वारे केली जाते. आम्ही कार्डचा संपूर्ण तपशील साठवत नाही.';

  @override
  String get walletBalancesAreForUseWithin =>
      'वॉलेटमधील शिल्लक रक्कम केवळ सेवांच्या अंतर्गत वापरासाठी आहे. परतावा, जिथे लागू असेल तिथे, आमच्या परतावा धोरणानुसार दिला जाईल.';

  @override
  String get pricesAreInIndianRupeesInr =>
      'किंमती भारतीय रुपयांमध्ये (INR) आहेत आणि त्यामध्ये लागू करांचा समावेश असू शकतो.';

  @override
  String get s5AcceptableUse => '५. स्वीकारार्ह वापर';

  @override
  String get youAgreeNotTo => 'तुम्ही खालील गोष्टी न करण्यास सहमत आहात:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'ज्योतिषी किंवा कर्मचाऱ्यांचा छळ करणे, त्यांना शिवीगाळ करणे, धमकावणे किंवा त्यांच्यासोबत लैंगिकदृष्ट्या स्पष्ट किंवा बेकायदेशीर सामग्री शेअर करणे.';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'सेवा किंवा परतावा मिळवण्यासाठी कोणत्याही व्यक्तीचे सोंग घेणे, किंवा खोटी माहिती देणे.';

  @override
  String get attemptToTakeAConsultationOff =>
      'शुल्क टाळण्यासाठी किंवा वैयक्तिक संपर्क तपशील मिळवण्यासाठी प्लॅटफॉर्मबाहेर सल्लामसलत करण्याचा प्रयत्न करा.';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'सेवांमध्ये किंवा त्यांच्या सुरक्षेमध्ये हस्तक्षेप करणे, माहिती चोरणे किंवा त्यात व्यत्यय आणण्याचा प्रयत्न करणे.';

  @override
  String get s6AstrologersOnThePlatform => '६. प्लॅटफॉर्मवरील ज्योतिषी';

  @override
  String get astrologersAreIndependentPractitionersWhoAre =>
      'ज्योतिषी हे स्वतंत्र व्यावसायिक आहेत, ज्यांची ओळख रुद्रगंगाद्वारे पडताळली जाते आणि त्यांना मान्यता दिली जाते.';

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'ते सल्ला देऊ शकण्यापूर्वी, आम्ही ठरवलेल्या मर्यादेत राहून ते स्वतःचे प्रति-मिनिट दर निश्चित करतात.';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'सल्लामसलतीदरम्यान दिलेली मते आणि मार्गदर्शन हे वैयक्तिक ज्योतिषाचे असते, ते इतरांचे नसते.';

  @override
  String get ofRudragangaWeAreNotResponsible =>
      'रुद्रगंगाचे. सल्लामसलतीच्या आधारावर तुम्ही घेतलेल्या कोणत्याही निर्णयासाठी आम्ही जबाबदार नाही.';

  @override
  String get s7RecordingsContent => '७. रेकॉर्डिंग आणि सामग्री';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'गुणवत्ता, सुरक्षितता आणि वाद निवारणासाठी, ऑडिओ आणि व्हिडिओ सल्लामसलत रेकॉर्ड केली जाऊ शकते. तुम्ही';

  @override
  String get consentToSuchRecordingByStarting =>
      'सेशन सुरू करून अशा रेकॉर्डिंगला संमती द्या. चॅट संभाषणे संग्रहित केली जातात जेणेकरून तुम्ही ती पुन्हा पाहू शकाल.';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'त्यांच्याबद्दल. हा डेटा कसा हाताळला जातो, हे पाहण्यासाठी आमचे गोपनीयता धोरण पहा.';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '८. अस्वीकरण आणि उत्तरदायित्वाची मर्यादा';

  @override
  String get theServicesAreProvidedAsIs =>
      'या सेवा मार्गदर्शन आणि मनोरंजनाशी संबंधित वैयक्तिक चिंतनासाठी जशा आहेत तशा पुरवल्या जातात.';

  @override
  String get rudragangaMakesNoGuaranteeAboutThe =>
      'रुद्रगंगा कोणत्याही भविष्यवाणीच्या किंवा उपायाच्या अचूकतेबद्दल कोणतीही हमी देत नाही. जास्तीत जास्त मर्यादेपर्यंत';

  @override
  String get permittedByLawRudragangaSTotal =>
      'कायद्याने परवानगी दिल्याप्रमाणे, तुमच्या सेवांच्या वापरामुळे उद्भवणारी रुद्रगंगाची एकूण जबाबदारी मर्यादित आहे.';

  @override
  String get theAmountYouPaidIntoYour =>
      'ज्या घटनेमुळे दावा उद्भवला आहे, त्या घटनेच्या आधीच्या ३० दिवसांत तुम्ही तुमच्या वॉलेटमध्ये भरलेली रक्कम. आम्ही';

  @override
  String get areNotLiableForIndirectOr =>
      'अप्रत्यक्ष किंवा परिणामी नुकसानीसाठी जबाबदार नाहीत.';

  @override
  String get s9SuspensionTermination => '९. निलंबन आणि बडतर्फी';

  @override
  String get weMaySuspendOrTerminateYour =>
      'तुम्ही या अटींचे उल्लंघन केल्यास, फसवणूक करण्याचा प्रयत्न केल्यास किंवा गैरवापर केल्यास आम्ही तुमचे खाते निलंबित किंवा समाप्त करू शकतो.';

  @override
  String get servicesYouMayStopUsingThe =>
      'सेवा. तुम्ही कोणत्याही वेळी सेवांचा वापर थांबवू शकता. काही तरतुदी (देयकाची जबाबदारी,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'अस्वीकरण आणि दायित्वाच्या मर्यादा) समाप्तीनंतरही लागू राहतात.';

  @override
  String get s10ChangesToTheseTerms => '१०. या अटींमधील बदल';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'आम्ही वेळोवेळी या अटी अद्ययावत करू शकतो. महत्त्वाच्या बदलांची सूचना ॲपमध्ये किंवा याद्वारे दिली जाईल.';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'वरील “शेवटचे अद्यतन” तारीख अद्ययावत करत आहे. बदलांनंतर वापर सुरू ठेवल्यास, ते बदल तुम्हाला मान्य आहेत असे मानले जाईल.';

  @override
  String get s11ContactUs => '११. आमच्याशी संपर्क साधा';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'या अटींबद्दल प्रश्न आहेत का? आमच्या वेबसाइटवरील किंवा ॲपमधील संपर्क फॉर्मद्वारे आमच्याशी संपर्क साधा.';

  @override
  String get helpSupportSection => 'मदत आणि समर्थन विभाग.';

  @override
  String get privacyPolicy2 => 'गोपनीयता धोरण';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'तुमची जन्माची माहिती, सल्लामसलत आणि चॅट्स तुमच्यासाठी वैयक्तिक आहेत. आम्ही काय करतो हे हे धोरण स्पष्ट करते.';

  @override
  String get collectWhyAndTheControlYou =>
      'गोळा करणे, का, आणि त्यावर तुमचे असलेले नियंत्रण.';

  @override
  String get s1InformationWeCollect => '१. आम्ही गोळा करत असलेली माहिती';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'खात्याची माहिती: तुमचे नाव, फोन नंबर (OTP द्वारे सत्यापित), आणि ईमेल (दिलेला असल्यास).';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'जन्माचा तपशील: जन्मतारीख, वेळ आणि ठिकाण, जे तुम्ही कुंडली आणि वाचनासाठी देऊ इच्छिता.';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'सल्लामसलतीचा डेटा: चॅट संदेश, आणि लागू असल्यास ऑडिओ/व्हिडिओ कॉल रेकॉर्डिंग.';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'पेमेंट डेटा: वॉलेट व्यवहार आणि पेमेंट संदर्भ. कार्ड तपशील आमच्या पेमेंट पार्टनरद्वारे (PayU) हाताळले जातात; आम्ही संपूर्ण कार्ड क्रमांक साठवत नाही.';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'डिव्हाइस आणि वापराचा डेटा: डिव्हाइसचा प्रकार, ऑपरेटिंग सिस्टम, तुमच्या आयपी ॲड्रेसवरून काढलेले अंदाजे स्थान, भेट दिलेली पृष्ठे आणि परस्परसंवाद, यांचा वापर सेवा चालवण्यासाठी आणि सुधारण्यासाठी केला जातो.';

  @override
  String get s2HowWeUseIt => '२. आपण त्याचा वापर कसा करतो';

  @override
  String get toCreateAndSecureYourAccount =>
      'तुमचे खाते तयार करून सुरक्षित करण्यासाठी आणि तुमची ओळख पडताळण्यासाठी.';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'तुम्हाला ज्योतिषांशी जोडणे आणि सल्ला, कुंडली, पत्रिका व इतर सुविधा पुरवणे.';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'वॉलेट रिचार्ज, प्रति-मिनिट बिलिंग, पेआउट आणि ऑर्डरची पूर्तता प्रक्रिया करण्यासाठी.';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'आधार देणे, फसवणूक आणि गैरवापर रोखणे, आणि कायदेशीर जबाबदाऱ्या पार पाडणे.';

  @override
  String get toUnderstandAndImproveHowThe =>
      'अ‍ॅप आणि वेबसाइटचा वापर कसा केला जातो हे समजून घेणे आणि त्यात सुधारणा करणे.';

  @override
  String get s3WhenWeShareInformation =>
      '३. जेव्हा आपण माहितीची देवाणघेवाण करतो';

  @override
  String get weDoNotSellYourPersonal =>
      'आम्ही तुमची वैयक्तिक माहिती विकत नाही. आम्ही ती केवळ खालील कारणांसाठी शेअर करतो:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'तुम्ही ज्या ज्योतिषाचा सल्ला घेता, त्याच्याकडून भविष्य जाणून घेण्यासाठी आवश्यक असलेल्या माहितीपुरतीच माहिती घेता (उदा. तुमच्या जन्माचा तपशील आणि माहिती).';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'आम्हाला कामकाज चालवण्यास मदत करणाऱ्या सेवा प्रदात्यांसोबत — पेमेंट प्रोसेसिंग (PayU), क्लाउड होस्टिंग आणि स्टोरेज, कम्युनिकेशन्स (OTP साठी WhatsApp/SMS), आणि नोटिफिकेशन्स — गोपनीयतेच्या बंधनांतर्गत.';

  @override
  String get whenRequiredByLawOrTo =>
      'जेव्हा कायद्यानुसार आवश्यक असेल, किंवा वापरकर्ते आणि रुद्रगंगा यांचे हक्क, सुरक्षितता आणि मालमत्ता यांचे संरक्षण करण्यासाठी.';

  @override
  String get s4ConsultationRecordingsChats =>
      '४. सल्लामसलतीचे रेकॉर्डिंग आणि चॅट्स';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'गुणवत्ता, सुरक्षितता आणि गोपनीयतेसाठी ऑडिओ आणि व्हिडिओ सल्लामसलत रेकॉर्ड केली जाऊ शकते, तसेच चॅट्स संग्रहित केले जातात.';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'विवाद निवारण. तुम्ही अॅपमध्ये तुमचा चॅट इतिहास पाहू शकता. रेकॉर्डिंग जतन करून ठेवली जातात.';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'खाली वर्णन केले आहे आणि केवळ समर्थन, सुरक्षितता किंवा कायदेशीर कारणांसाठी आवश्यक असेल तेव्हाच ते वापरले जाईल.';

  @override
  String get s5AnalyticsCookies => '५. विश्लेषण आणि कुकीज';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'आमची वेबसाइट परत येणाऱ्या भेटी ओळखण्यासाठी, आणि आमच्या वेबसाइटने कसा प्रतिसाद दिला हे मोजण्यासाठी फर्स्ट-पार्टी कुकी/आयडेंटिफायर वापरते.';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'लँडिंग पेजची कामगिरी (जसे की कोणत्या विभागांवर क्लिक केले जाते) आणि साइन-अप्सना मार्केटिंगशी जोडणे.';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'मोहिमा. अनुभव सुधारण्यासाठी याचा एकत्रितपणे वापर केला जातो. आम्ही अंदाजे शहर/प्रदेश निश्चित करतो.';

  @override
  String get fromYourIpAddressWeDo =>
      'तुमच्या आयपी पत्त्यावरून; आम्ही विश्लेषणासाठी अचूक जीपीएस स्थानाचा वापर करत नाही.';

  @override
  String get s6DataRetention => '६. डेटा जतन करणे';

  @override
  String get weKeepYourInformationForAs =>
      'जोपर्यंत तुमचे खाते सक्रिय आहे आणि सेवा पुरवण्यासाठी आवश्यक असेल तोपर्यंत आम्ही तुमची माहिती जपून ठेवतो.';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'सेवा, कायदेशीर बंधनांचे पालन करणे, विवाद सोडवणे आणि आमच्या करारांची अंमलबजावणी करणे. आपण';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'आपले खाते आणि त्यासंबंधित वैयक्तिक डेटा हटवण्याची विनंती, कायदेशीर जतन करण्याच्या अधीन.';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'आवश्यकता (उदाहरणार्थ, लेखांकन आणि करासाठी आपल्याला ठेवाव्या लागणाऱ्या व्यवहाराच्या नोंदी).';

  @override
  String get s7Security => '७. सुरक्षा';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'आम्ही उद्योग-मानक उपाययोजना वापरतो — ट्रान्झिटमधील एन्क्रिप्शन, प्रवेश नियंत्रणे आणि सुरक्षितता.';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'पायाभूत सुविधा — तुमच्या माहितीचे संरक्षण करण्यासाठी. प्रसारण किंवा साठवणुकीची कोणतीही पद्धत पूर्णपणे';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'सुरक्षित असले तरी, आम्ही संपूर्ण सुरक्षिततेची हमी देऊ शकत नाही.';

  @override
  String get s8YourRightsChoices => '८. तुमचे हक्क आणि पर्याय';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'अॅपमध्ये तुमचे प्रोफाइल आणि जन्माचा तपशील पहा, दुरुस्त करा किंवा अद्ययावत करा.';

  @override
  String get requestACopyOrDeletionOf =>
      'तुमच्या वैयक्तिक डेटाची प्रत मिळवण्यासाठी किंवा तो हटवण्यासाठी आमच्याशी संपर्क साधा.';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'तुमच्या डिव्हाइस किंवा ॲप सेटिंग्जमध्ये प्रचारात्मक सूचनांमधून बाहेर पडा.';

  @override
  String get s9Children => '९. मुले';

  @override
  String get theServicesAreIntendedForUsers =>
      'या सेवा १८ वर्षे व त्याहून अधिक वयाच्या वापरकर्त्यांसाठी आहेत. आम्ही जाणूनबुजून कोणाकडूनही डेटा गोळा करत नाही.';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '१८ वर्षांखालील कोणीही. जर तुम्हाला वाटत असेल की एखाद्या अल्पवयीन व्यक्तीने सेवांचा वापर केला आहे, तर कृपया आमच्याशी संपर्क साधा जेणेकरून आम्ही ते काढून टाकू शकू.';

  @override
  String get s10ChangesToThisPolicy => '१०. या धोरणातील बदल';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'आम्ही हे धोरण अद्ययावत करू शकतो. महत्त्वाच्या बदलांची सूचना ॲपमध्ये किंवा अपडेट करून दिली जाईल.';

  @override
  String get lastUpdatedDateAbove => 'वरील “शेवटचे अद्यतन” तारीख.';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'गोपनीयतेच्या प्रश्नांसाठी किंवा डेटा विनंत्यांसाठी, आमच्या वेबसाइटवरील संपर्क फॉर्मद्वारे किंवा आमच्याशी संपर्क साधा.';

  @override
  String get appSHelpSupportSection => 'अॅपचा मदत आणि समर्थन विभाग.';

  @override
  String get s2026Rudraganga18ForGuidanceAnd =>
      '© २०२६ रुद्रगंगा · १८+ · मार्गदर्शन आणि आरोग्यासाठी · व्यावसायिक सल्ल्याचा पर्याय नाही.';

  @override
  String get widthDeviceWidthInitialScale1 =>
      'रुंदी=डिव्हाइस-रुंदी, प्रारंभिक-स्केल=1, कमाल-स्केल=1';

  @override
  String get segoeUi => 'सेगो UI';

  @override
  String get vote => 'मतदान करा';

  @override
  String get couldnTLoadLiveSessions => 'थेट सत्रे लोड करता आली नाहीत.';

  @override
  String get noOneIsLiveRightNow => 'सध्या कोणीही लाईव्ह नाही';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'जेव्हा एखादे ज्योतिषी थेट (लाइव्ह) येतील, तेव्हा ते येथे दिसतील. रिफ्रेश करण्यासाठी खाली ओढा — किंवा नोटिफिकेशनची वाट पाहा.';

  @override
  String get justNow => 'आत्ताच';

  @override
  String get couldNotLoad => 'लोड करता आले नाही';

  @override
  String get continueLabel => 'पुढे चालू ठेवा';

  @override
  String get openSettings => 'सेटिंग्ज उघडा';

  @override
  String get somePermissionsAreBlockedTapA =>
      'काही परवानग्या अवरोधित केल्या आहेत. अवरोधित केलेल्या आयटमवर टॅप करा (किंवा “सेटिंग्ज उघडा”) आणि ते सक्षम करा, त्यानंतर येथे परत या.';

  @override
  String get thesePermissionsAreRequiredToUse =>
      'रुद्रगंगा वापरण्यासाठी या परवानग्या आवश्यक आहेत. परवानगी देण्यासाठी कोणत्याही प्रलंबित आयटमवर टॅप करा.';

  @override
  String get settings2 => 'सेटिंग्ज';

  @override
  String get allow => 'परवानगी द्या';

  @override
  String get blockedEnableItInSettings => 'अवरोधित — सेटिंग्जमध्ये सक्षम करा';

  @override
  String get allowsUpTo => 'पर्यंत परवानगी देते';

  @override
  String get bookingFailed => 'बुकिंग अयशस्वी झाले';

  @override
  String get yourDetails => 'तुमची माहिती';

  @override
  String get fromYourProfile => 'तुमच्या प्रोफाइलवरून';

  @override
  String get familyMembers => 'कुटुंबातील सदस्य';

  @override
  String get addMember => 'सदस्य जोडा';

  @override
  String get addAnother => 'आणखी एक जोडा';

  @override
  String get preferredDateOptional => 'पसंतीची तारीख (ऐच्छिक)';

  @override
  String get anyDate => 'कोणतीही तारीख';

  @override
  String get bookNowFree => 'आता बुक करा (मोफत)';

  @override
  String get couldNotLoadThisPooja => 'ही पूजा लोड करता आली नाही.';

  @override
  String get forLabel => 'साठी';

  @override
  String get s1Person => '१ व्यक्ती';

  @override
  String get bookShareDetails => 'पुस्तक आणि शेअर तपशील';

  @override
  String get confirmYourBookingWithTheNames =>
      'ज्या नावांकरिता पूजा केली जाणार आहे, त्या नावांसह आपले आरक्षण निश्चित करा.';

  @override
  String get panditCoordinates => 'पंडित निर्देशांक';

  @override
  String get aVerifiedPanditCallsToFix =>
      'एक प्रमाणित पंडित वेळ निश्चित करण्यासाठी आणि सामग्रीची व्यवस्था करण्यासाठी फोन करतात.';

  @override
  String get poojaPerformed => 'पूजा केली गेली';

  @override
  String get sankalpIsTakenInYourFamily =>
      'तुमच्या कुटुंबीयांच्या नावाने संकल्प घेतला जातो आणि त्यानंतर, जिथे लागू असेल तिथे, प्रसाद वाटला जातो.';

  @override
  String get couldNotLoadPoojas => 'पूजा लोड करता आल्या नाहीत.';

  @override
  String get any => 'कोणतेही';

  @override
  String get noPoojasHere => 'येथे पूजा केली जात नाही';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'सध्याच्या फिल्टरशी काहीही जुळत नाही.';

  @override
  String get noPoojasAvailableYet => 'अद्याप कोणतीही पूजा उपलब्ध नाही';

  @override
  String get showAllPoojas => 'सर्व पूजा दाखवा';

  @override
  String get tapToViewDetailsBook =>
      'तपशील पाहण्यासाठी आणि बुक करण्यासाठी टॅप करा';

  @override
  String get appliedYouBothEarnOnYour =>
      'लागू झाले! तुमच्या पहिल्या रिचार्जवर तुम्हा दोघांनाही कमाई होईल.';

  @override
  String get shareYourCode => 'तुमचा कोड शेअर करा';

  @override
  String get sendYourCodeToFriendsVia =>
      'तुमचा कोड मित्रांना WhatsApp, SMS द्वारे किंवा कुठेही पाठवा.';

  @override
  String get friendSignsUp => 'मित्र नोंदणी करतो';

  @override
  String get theyEnterYourCodeInRefer =>
      'साइन अप केल्यानंतर ते तुमचा कोड \'रेफर अँड अर्न\'मध्ये टाकतात.';

  @override
  String get feedbackReceived => 'अभिप्राय प्राप्त झाला ✓';

  @override
  String get thanksOurTeamWillLookInto => 'धन्यवाद — आमची टीम याची चौकशी करेल.';

  @override
  String get fullName => 'पूर्ण नाव';

  @override
  String get email => 'ईमेल';

  @override
  String get phoneNumber => 'फोन नंबर';

  @override
  String get message => 'संदेश';

  @override
  String get requiredLabel => 'आवश्यक';

  @override
  String get applicationReceived => 'अर्ज प्राप्त झाला ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'आमची टीम तुमच्या ज्योतिषी प्रोफाइलबाबत संपर्क साधेल.';

  @override
  String get enter10Digits => '१० अंक प्रविष्ट करा';

  @override
  String get aboutYouBioExpertiseExperience =>
      'तुमच्याबद्दल माहिती (चरित्र, कौशल्य, अनुभव)';

  @override
  String get rudragangaConnectsYouWithTrustedVedic =>
      'रुद्रगंगा तुम्हाला करिअरच्या मार्गदर्शनासाठी विश्वसनीय वैदिक ज्योतिषांशी जोडून देते.';

  @override
  String get marriageFinanceHealthAndLifeS =>
      'लग्न, आर्थिक बाबी, आरोग्य आणि आयुष्यातील मोठे प्रश्न — चॅट, कॉल आणि व्हिडिओद्वारे.';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'तुमची मोफत कुंडली, दैनिक राशीभविष्य, विवाह जुळवणी, पूजा आणि उपाय, सर्व काही एकाच ठिकाणी मिळवा.\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'खरे, करुणापूर्ण आध्यात्मिक मार्गदर्शन सर्वांना उपलब्ध करून देणे, हे आमचे ध्येय आहे.';

  @override
  String get inYourOwnLanguage => 'तुमच्या स्वतःच्या भाषेत.';

  @override
  String get verifiedExperiencedAstrologers => 'प्रमाणित, अनुभवी ज्योतिषी';

  @override
  String get privateSecureConsultations => 'खाजगी आणि सुरक्षित सल्लामसलत';

  @override
  String get availableIn6IndianLanguages => '६ भारतीय भाषांमध्ये उपलब्ध';

  @override
  String get thanksForRatingUs => 'आम्हाला रेटिंग दिल्याबद्दल धन्यवाद ✓';

  @override
  String get yourFeedbackHelpsRudragangaGrow =>
      'तुमच्या अभिप्रायामुळे रुद्रगंगाच्या वाढीस मदत होते.';

  @override
  String get onceInADay => 'दिवसातून एकदा';

  @override
  String get twiceInADay => 'दिवसातून दोनदा';

  @override
  String get asManyTimesAsItComes => 'जेवढ्या वेळा ते येते';

  @override
  String get never => 'कधीही नाही';

  @override
  String get cricket => 'क्रिकेट';

  @override
  String get shareMarket => 'शेअर मार्केट';

  @override
  String get bollywood => 'बॉलीवूड';

  @override
  String get newMagazine => 'नवीन मासिक';

  @override
  String get festivals => 'उत्सव';

  @override
  String get notificationsUpdated => 'सूचना अद्ययावत झाल्या आहेत ✓';

  @override
  String get youLlHearFromUsBased =>
      'तुमच्या निवडीनुसार आम्ही तुमच्याशी संपर्क साधू.';

  @override
  String get yourChartsWillNowFollowYour =>
      'तुमचे चार्ट आता तुम्ही निवडलेल्या शैलीनुसार असतील.';

  @override
  String get chartStyle => 'चार्ट शैली';

  @override
  String get northIndian => 'उत्तर भारतीय';

  @override
  String get southIndian => 'दक्षिण भारतीय';

  @override
  String get monthSystem => 'महिना प्रणाली';

  @override
  String get amanta => 'मालकीण';

  @override
  String get purnimanta => 'पूर्णिमंत';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get off => 'बंद';

  @override
  String get onLabel => 'वर';

  @override
  String get useDeviceSettings => 'डिव्हाइस सेटिंग्ज वापरा';

  @override
  String get ayanamsa => 'अयनांश';

  @override
  String get nCLahiri => 'एन.सी. लाहिरी';

  @override
  String get kpNew => 'केपी नवीन';

  @override
  String get kpOld => 'केपी जुने';

  @override
  String get raman => 'रमण';

  @override
  String get kpKhullar => 'केपी खुल्लर';

  @override
  String get subtotal => 'उपएकूण';

  @override
  String get youSave => 'तुम्ही बचत करता';

  @override
  String get total => 'एकूण';

  @override
  String get deliveryAddress => 'डिलिव्हरी पत्ता';

  @override
  String get orderSummary => 'ऑर्डर सारांश';

  @override
  String get couponsOffers => 'कूपन आणि ऑफर';

  @override
  String get billDetails => 'बिलाचा तपशील';

  @override
  String get address => 'पत्ता';

  @override
  String get productDiscount => 'उत्पादन सवलत';

  @override
  String get itemsSubtotal => 'वस्तूंची उपएकूण';

  @override
  String get delivery => 'डिलिव्हरी';

  @override
  String get free2 => 'मोफत';

  @override
  String get toPay => 'पैसे देण्यासाठी';

  @override
  String get dMmmYyyyHMmA => 'd MMM yyyy, h:mm a';

  @override
  String get couldNotDownloadInvoice => 'इनव्हॉइस डाउनलोड करता आले नाही.';

  @override
  String get orderNotFound => 'ऑर्डर सापडली नाही';

  @override
  String get activityTimeline => 'कृतीची कालरेखा';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM yyyy · h:mm a';

  @override
  String get totalPaid => 'एकूण दिलेले';

  @override
  String get orderPlaced2 => 'ऑर्डर दिली';

  @override
  String get dMmmHMmA => 'd MMM, h:mm a';

  @override
  String get generating => 'निर्माण करत आहे…';

  @override
  String get pleaseDescribeTheIssue => 'कृपया समस्येचे वर्णन करा';

  @override
  String get couldNotLoadProducts => 'उत्पादने लोड करता आली नाहीत.';

  @override
  String get newest => 'नवीनतम';

  @override
  String get priceLowHigh => 'किंमत: कमी→जास्त';

  @override
  String get priceHighLow => 'किंमत: जास्त→कमी';

  @override
  String get topRated => 'सर्वोत्तम रेटिंग';

  @override
  String get s6DigitPin => '६-अंकी पिन';

  @override
  String get addressLine1 => 'पत्ता ओळ १ *';

  @override
  String get addressLine2 => 'पत्ता ओळ २';

  @override
  String get city => 'शहर *';

  @override
  String get state => 'राज्य *';

  @override
  String get pinCode => 'पिन कोड *';

  @override
  String get payment => 'पेमेंट';

  @override
  String get pooja => 'पूजा';

  @override
  String get shop => 'दुकान';

  @override
  String get securePayment => 'सुरक्षित पेमेंट';

  @override
  String get noTransactionsMatchTheseFilters =>
      'या फिल्टरशी जुळणारे कोणतेही व्यवहार नाहीत.';

  @override
  String get noTransactionsYet => 'अद्याप कोणतेही व्यवहार नाहीत';

  @override
  String get moneyAdded => 'पैसे जोडले';

  @override
  String get poojaBooking => 'पूजा बुकिंग';

  @override
  String get videoCall => 'व्हिडिओ कॉल';

  @override
  String get shopOrder => 'दुकान ऑर्डर';

  @override
  String get refund => 'परतावा';

  @override
  String get bonus => 'बोनस';

  @override
  String get credited => 'श्रेय दिले';

  @override
  String get debited => 'डेबिट केले';

  @override
  String get rg => 'आरजी';

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
  String earnIRewardOnRudraganga(Object reward) {
    return 'Earn ₹$reward on Rudraganga';
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
