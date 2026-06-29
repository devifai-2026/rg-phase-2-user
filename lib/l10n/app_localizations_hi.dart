// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class L10nHi extends L10n {
  L10nHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'रुद्रगंगा';

  @override
  String get tagline => 'ज्योतिष और कल्याण';

  @override
  String get splashBlessing =>
      'स्पष्टता की ओर आपकी यात्रा यहाँ से शुरू होती है';

  @override
  String get authWelcomeTitle => 'स्वागत है';

  @override
  String get authWelcomeSubtitle =>
      'अपने फ़ोन नंबर से साइन इन करें या खाता बनाएँ';

  @override
  String get phoneLabel => 'फ़ोन नंबर';

  @override
  String get phoneHint => '10 अंकों का मोबाइल नंबर';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'आगे बढ़ें';

  @override
  String get sendOtpButton => 'OTP भेजें';

  @override
  String get otpTitle => 'अपना नंबर सत्यापित करें';

  @override
  String otpSubtitle(String phone) {
    return '$phone पर भेजा गया 6 अंकों का कोड दर्ज करें';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'सत्यापित करें और आगे बढ़ें';

  @override
  String get resendOtp => 'कोड फिर भेजें';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds सेकंड में पुनः भेजें';
  }

  @override
  String get changeNumber => 'नंबर बदलें';

  @override
  String get termsNotice =>
      'आगे बढ़ने पर आप हमारी शर्तें और गोपनीयता नीति से सहमत होते हैं';

  @override
  String get acceptPrefix => 'मैं सहमत हूँ';

  @override
  String get acceptAnd => 'और';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get errInvalidPhone => 'मान्य 10 अंकों का फ़ोन नंबर दर्ज करें';

  @override
  String get errInvalidOtp => '6 अंकों का कोड दर्ज करें';

  @override
  String get errGeneric => 'कुछ गड़बड़ हो गई। कृपया पुनः प्रयास करें।';

  @override
  String get errNetwork =>
      'कोई कनेक्शन नहीं। अपना इंटरनेट जाँचें और पुनः प्रयास करें।';

  @override
  String get otpSent => 'OTP भेजा गया';

  @override
  String get loginSuccess => 'साइन इन हो गए';

  @override
  String get settings => 'सेटिंग्स';

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
    return 'नमस्ते, $name';
  }

  @override
  String get logout => 'लॉग आउट';

  @override
  String get onbTitle => 'हमें अपने बारे में बताएं';

  @override
  String get onbSubtitle =>
      'इससे हम आपके लिए बेहतर भविष्यवाणी कर पाते हैं। कुछ भी अनिवार्य नहीं है — आप बाद में भी पूरा कर सकते हैं।';

  @override
  String get onbName => 'आपका नाम';

  @override
  String get onbAddPhoto => 'फ़ोटो जोड़ें';

  @override
  String get onbChangePhoto => 'फ़ोटो बदलें';

  @override
  String get onbGender => 'लिंग';

  @override
  String get genderMale => 'पुरुष';

  @override
  String get genderFemale => 'महिला';

  @override
  String get genderOther => 'अन्य';

  @override
  String get onbDob => 'जन्म तिथि';

  @override
  String get onbTob => 'जन्म समय';

  @override
  String get onbDontKnowTime => 'मुझे अपना जन्म समय नहीं पता';

  @override
  String get onbPob => 'जन्म स्थान';

  @override
  String get onbPobHint => 'अपना जन्म शहर खोजें';

  @override
  String get onbLanguage => 'पसंदीदा भाषा';

  @override
  String get onbSelectDate => 'तिथि चुनें';

  @override
  String get onbSelectTime => 'समय चुनें';

  @override
  String get onbSkip => 'अभी छोड़ें';

  @override
  String get onbFinish => 'पूर्ण करें';

  @override
  String get onbSaved => 'प्रोफ़ाइल सहेजी गई';

  @override
  String get completeProfile => 'अपनी प्रोफ़ाइल पूरी करें';

  @override
  String get completeProfileCta => 'सेटअप पूरा करें';

  @override
  String get permTitle => 'कुछ अनुमतियाँ';

  @override
  String get permSubtitle =>
      'ताकि कॉल, सूचनाएँ और फ़ोटो सही से काम करें। आप इन्हें कभी भी सेटिंग्स में बदल सकते हैं।';

  @override
  String get permNotifications => 'सूचनाएँ';

  @override
  String get permNotificationsDesc => 'परामर्श अलर्ट, ऑर्डर अपडेट और रिमाइंडर';

  @override
  String get permMic => 'माइक्रोफ़ोन';

  @override
  String get permMicDesc => 'ज्योतिषियों के साथ वॉइस कॉल के लिए';

  @override
  String get permCamera => 'कैमरा';

  @override
  String get permCameraDesc => 'वीडियो कॉल और फ़ोटो अपलोड के लिए';

  @override
  String get permPhotos => 'फ़ोटो';

  @override
  String get permPhotosDesc => 'अपनी प्रोफ़ाइल तस्वीर सेट करने के लिए';

  @override
  String get permAllow => 'अनुमति दें';

  @override
  String get permContinue => 'आगे बढ़ें';

  @override
  String get permLocation => 'स्थान';

  @override
  String get permLocationDesc => 'आपके आस-पास के ज्योतिषी खोजें';

  @override
  String get secFeatured => 'विशेष ज्योतिषी';

  @override
  String get secNearby => 'आस-पास के ज्योतिषी';

  @override
  String get secCallChat => 'कॉल और चैट';

  @override
  String get secAiAstro => 'AI ज्योतिषी';

  @override
  String get secProducts => 'उत्पाद';

  @override
  String get secVideos => 'वीडियो';

  @override
  String get secLessons => 'ज्योतिष पाठ';

  @override
  String get secOthers => 'अन्य';

  @override
  String get secHistory => 'आपके परामर्श';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String get basedOnLocation => 'आपके स्थान के आधार पर';

  @override
  String get shareApp => 'दोस्तों के साथ ऐप साझा करें';

  @override
  String get startReadingHint =>
      'अभी कोई परामर्श नहीं। अपनी पहली रीडिंग शुरू करें।';

  @override
  String get startBtn => 'शुरू करें';

  @override
  String get namaste => 'नमस्ते';

  @override
  String get kFreeKundli => 'मुफ्त कुंडली';

  @override
  String get kMatching => 'मिलान';

  @override
  String get kBrihat => 'बृहत कुंडली';

  @override
  String get kKundliAi => 'कुंडली AI+';

  @override
  String get tCareer => 'करियर';

  @override
  String get tMarriage => 'विवाह';

  @override
  String get tFinance => 'वित्त';

  @override
  String get tHealth => 'स्वास्थ्य';

  @override
  String get tEducation => 'शिक्षा';

  @override
  String get tTravel => 'यात्रा';

  @override
  String get statusOnline => 'ऑनलाइन';

  @override
  String get statusBusy => 'व्यस्त';

  @override
  String get statusOffline => 'ऑफ़लाइन';

  @override
  String get retry => 'पुन: प्रयास करें';

  @override
  String get chatNow => 'अभी बातचीत करें';

  @override
  String get notifyMe => 'मुझे सूचित करें';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'इस ज्योतिषी से अभी परामर्श लेना संभव नहीं है।';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'अपनी प्रोफ़ाइल पूरी करें';

  @override
  String get addYourDateTimePlaceOf =>
      'अपनी जन्मतिथि, जन्म समय और जन्म स्थान अवश्य बताएं ताकि ज्योतिषी आपको बेहतर भविष्यवाणी दे सकें।';

  @override
  String get completeProfile2 => 'पूरी प्रोफ़ाइल';

  @override
  String get skipForNow => 'अभी के लिए छोड़ दे';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'हमें कारण बताएँ (वैकल्पिक) — इससे हमें सुधार करने में मदद मिलती है।';

  @override
  String get reasonOptional => 'कारण (वैकल्पिक)';

  @override
  String get cancel => 'रद्द करना';

  @override
  String get unfollow => 'करें';

  @override
  String get s21kReviews => '(2.1 हजार समीक्षाएं)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'उपहार';

  @override
  String get store => 'इकट्ठा करना';

  @override
  String get joinLiveSession => 'लाइव सेशन में शामिल हों';

  @override
  String get youLlBeNotified => 'आपको सूचित कर दिया जाएगा';

  @override
  String get thisStoreHasNoItemsYet =>
      'इस स्टोर में अभी कोई सामान उपलब्ध नहीं है।';

  @override
  String get filters => 'फिल्टर';

  @override
  String get reset => 'रीसेट करें';

  @override
  String get onlineNowOnly => 'अभी केवल ऑनलाइन उपलब्ध है';

  @override
  String get applyFilters => 'फ़िल्टर लागू करें';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'इस ज्योतिषी के लिए उपहार देने की सुविधा उपलब्ध नहीं है।';

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
  String get recharge => 'फिर से दाम लगाना';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'मात्रा';

  @override
  String get min1Max100 => 'न्यूनतम 1 अधिकतम 100';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'आपके लिए रिमाइंडर सेट किए गए हैं';

  @override
  String get suggestedForYou => 'आपके लिए सुझाया गया';

  @override
  String get couldNotSendImage => 'छवि भेजी नहीं जा सकी';

  @override
  String get endConsultation => 'परामर्श समाप्त करें?';

  @override
  String get thisWillEndTheChatAnd =>
      'इससे चैट समाप्त हो जाएगी और बिलिंग बंद हो जाएगी।';

  @override
  String get keepChatting => 'बातचीत जारी रखें';

  @override
  String get end => 'अंत';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'बदलना';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'ऑडियो कॉल पर स्विच करें';

  @override
  String get switchToVideoCall => 'वीडियो कॉल पर स्विच करें';

  @override
  String get endConsultation2 => 'परामर्श समाप्त करें';

  @override
  String get sendAGift => 'उपहार भेजें';

  @override
  String get sayHello => 'नमस्कार कहिए 🙏';

  @override
  String get typeAMessage => 'एक संदेश लिखें…';

  @override
  String get recommendedProduct => 'अनुशंसित उत्पाद';

  @override
  String get view => 'देखना';

  @override
  String get connecting => 'कनेक्ट हो रहा है…';

  @override
  String get myConsultations => 'मेरे परामर्श';

  @override
  String get noConsultationsYet => 'अभी तक कोई परामर्श नहीं हुआ है';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'चैट देखें';

  @override
  String get historyExpired => 'इतिहास समाप्त हो गया';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'ज्योतिषी को फोन करना';

  @override
  String get cancelRequest => 'अनुरोध को रद्द करें';

  @override
  String get notNow => 'अभी नहीं';

  @override
  String get thanksForYourFeedback => 'आपकी प्रतिक्रिया के लिए धन्यवाद!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'सबमिट नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get consultationEnded => 'परामर्श समाप्त हुआ';

  @override
  String get hopeYouGotTheClarityYou =>
      'आशा है कि आपको वह स्पष्टता मिल गई होगी जिसकी आपको तलाश थी।';

  @override
  String get shareYourExperienceOptional => 'अपना अनुभव साझा करें (वैकल्पिक)';

  @override
  String get howWasTheCallQuality => 'कॉल की गुणवत्ता कैसी थी?';

  @override
  String get skip => 'छोडना';

  @override
  String get submit => 'जमा करना';

  @override
  String get close => 'बंद करना';

  @override
  String get viewProfile => 'प्रोफ़ाइल देखें';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'द्वारा बनाया गया ';

  @override
  String get devifai => 'DevifAI';

  @override
  String get withLabel => '❤️ के साथ';

  @override
  String get leavingSoSoon => 'इतनी जल्दी जाना?';

  @override
  String get stayLoggedIn => 'लॉग इन रहें';

  @override
  String get logOutAnyway => 'फिर भी लॉग आउट करें';

  @override
  String get noNearbyAstrologersYet => 'अभी आस-पास कोई ज्योतिषी नहीं है';

  @override
  String get bookAPooja => 'पूजा बुक करें';

  @override
  String get panditLedPoojasAtYourChosen =>
      'आपकी चुनी हुई तिथि पर पंडितों के नेतृत्व में पूजा-अर्चना।';

  @override
  String get back => 'पीछे';

  @override
  String get connectingToLive => 'लाइव से जुड़ें…';

  @override
  String get live => 'रहना';

  @override
  String get thisLiveHasEnded => 'यह लाइव समाप्त हो गया है।';

  @override
  String get backToLive => 'लाइव पर वापस';

  @override
  String get sayHelloBeTheFirstTo => 'नमस्ते कहिए 👋 सबसे पहले कमेंट करें';

  @override
  String get aiPollLive => 'एआई पोल · लाइव';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'एक टिप्पणी जोड़ने…';

  @override
  String get send => 'भेजना';

  @override
  String get liveNow => 'अब सीधा प्रसारण हो रहा है';

  @override
  String get searchByAstrologerName => 'ज्योतिषी के नाम से खोजें';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'ताज़ा करना';

  @override
  String get join => 'जोड़ना';

  @override
  String get clearAllNotifications => 'सभी सूचनाएं हटा दें?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'इससे आपकी सभी सूचनाएं स्थायी रूप से हट जाएंगी।';

  @override
  String get clearAll => 'सभी साफ करें';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get markAllRead => 'सभी को पढ़ा दिखाएं';

  @override
  String get noNotifications => 'कोई सूचना नहीं';

  @override
  String get youReAllCaughtUp => 'आप सभी अपडेट्स से अवगत हैं।';

  @override
  String get nameIsRequired => 'नाम आवश्यक है';

  @override
  String get enterAValidPhone => 'एक वैध फ़ोन नंबर दर्ज करें';

  @override
  String get bookingConfirmed => 'बुकिंग की पुष्टि हो गई है 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'बुकिंग विफल रही, कृपया पुनः प्रयास करें';

  @override
  String get addMoneyToContinue => 'जारी रखने के लिए पैसे जोड़ें';

  @override
  String get addMoney => 'पैसे जोड़ें';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'Book $name';
  }

  @override
  String get name => 'नाम';

  @override
  String get phone => 'फ़ोन';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'Add the people this pooja is performed for (up to $_maxPersons). Fill one before adding the next.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'Member $key name';
  }

  @override
  String get specialInstructionsOptional => 'विशेष निर्देश (वैकल्पिक)';

  @override
  String get poojaDetails => 'पूजा संबंधी विवरण';

  @override
  String get price => 'कीमत';

  @override
  String get bookNow => 'अभी बुक करें';

  @override
  String get aboutThisPooja => 'इस पूजा के बारे में';

  @override
  String get ourPanditWillCallYou => 'हमारे पंडित जी आपको फोन करेंगे';

  @override
  String get beforeThePoojaToConfirmThe =>
      'पूजा से पहले, समय और अपने संकल्पों की पुष्टि कर लें।';

  @override
  String get howItWorks => 'यह काम किस प्रकार करता है';

  @override
  String get filterPoojas => 'पूजाओं को फ़िल्टर करें';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'न्यूनतम समर्थित व्यक्ति';

  @override
  String get apply => 'आवेदन करना';

  @override
  String get searchPoojas => 'पूजाओं की खोज करें…';

  @override
  String get myProfile => 'मेरी प्रोफाइल';

  @override
  String get referEarn => 'रेफर करें और कमाएं';

  @override
  String get couldNotLoadTryAgain => 'लोड नहीं हो सका। पुनः प्रयास करें।';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'आपका रेफरल कोड';

  @override
  String get codeCopied => 'कोड कॉपी किया गया';

  @override
  String get shareEarn => 'शेयर करें और कमाएं';

  @override
  String get haveAFriendSCode => 'क्या आपके पास किसी दोस्त का कोड है?';

  @override
  String get enterReferralCode => 'रेफरल कोड दर्ज करें';

  @override
  String get aReferralCodeIsAppliedTo =>
      'आपके खाते में एक रेफरल कोड लागू किया गया है।';

  @override
  String get feedbackSubmitted => 'प्रतिक्रिया प्रस्तुत की गई';

  @override
  String get feedback => 'प्रतिक्रिया';

  @override
  String get applicationSubmitted => 'आवेदन जमा कर दिया गया';

  @override
  String get astrologerRegistration => 'ज्योतिषी पंजीकरण';

  @override
  String get joinRudragangaAsAnAstrologer =>
      'रुद्रगंगा में ज्योतिषी के रूप में शामिल हों';

  @override
  String get tellUsAboutYourselfOurTeam =>
      'अपने बारे में हमें बताएं — हमारी टीम इसकी समीक्षा करेगी और आपसे संपर्क करेगी।';

  @override
  String get aboutUs => 'हमारे बारे में';

  @override
  String get rudraganga => 'रुद्रगन को';

  @override
  String get astrologyWellness => 'ज्योतिष और स्वास्थ्य';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · समर्पण के साथ बनाया गया';

  @override
  String get thanksForYourRating => 'आपकी रेटिंग के लिए धन्यवाद!';

  @override
  String get rateRudraganga => 'रुद्रगंगा को रेट करें';

  @override
  String get howIsYourExperience => 'आपका अनुभव कैसा रहा?';

  @override
  String get writeAReviewOptional => 'समीक्षा लिखें (वैकल्पिक)';

  @override
  String get saved => 'सहेजा गया';

  @override
  String get notificationSetting => 'अधिसूचना सेटिंग';

  @override
  String get howOften => 'कितनी बार?';

  @override
  String get topicsYouCareAbout => 'जिन विषयों में आपकी रुचि है';

  @override
  String get ok => 'ठीक है';

  @override
  String get allSet => 'सब तैयार है ✨';

  @override
  String get setPreferences => 'प्राथमिकताएं निर्धारित करें';

  @override
  String get save => 'बचाना';

  @override
  String get bundlesCombos => 'बंडल और कॉम्बो';

  @override
  String get noCombosRightNow => 'अभी कोई कॉम्बो उपलब्ध नहीं है';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'कार्ट';

  @override
  String get clear => 'स्पष्ट';

  @override
  String get yourCartIsEmpty => 'आपकी कार्ट खाली है';

  @override
  String get browseProductsAndAddThemHere =>
      'उत्पादों को ब्राउज़ करें और उन्हें यहां जोड़ें';

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
  String get pleaseAddADeliveryAddress => 'कृपया डिलीवरी का पता जोड़ें';

  @override
  String get checkout => 'चेक आउट';

  @override
  String get addNewAddress => 'नया पता जोड़ें';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'निकालना';

  @override
  String get enterCouponCode => 'परचा कूट दर्ज करें';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'उपलब्ध ऑफर';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'लागू किया गया';

  @override
  String get nothingToCheckout => 'चेकआउट करने के लिए कुछ नहीं है';

  @override
  String get orderPlaced => 'आदेश रखा!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'खरीदारी जारी रखें';

  @override
  String get yourOrders => 'तुम्हारे ऑर्डर';

  @override
  String get noOrdersYet => 'अभी तक कोई ऑर्डर नहीं आया है';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'स्टोर से कुछ खरीदने के बाद आपके ऑर्डर यहां दिखाई देंगे।';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'इनवॉइस अभी तैयार हो रहा है। कृपया कुछ देर बाद पुनः प्रयास करें।';

  @override
  String get couldNotOpenTheInvoice => 'इनवॉइस नहीं खुल सका';

  @override
  String get thanksOurTeamWillReachOut =>
      'धन्यवाद! हमारी टीम इस ऑर्डर के बारे में आपसे संपर्क करेगी।';

  @override
  String get orderDetails => 'ऑर्डर का विवरण';

  @override
  String get needHelp => 'मदद की ज़रूरत है';

  @override
  String get needHelpWithThisOrder => 'इस आदेश के साथ मदद की आवश्यकता है?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'चालान';

  @override
  String get download => 'डाउनलोड करना';

  @override
  String get needHelp2 => 'मदद की ज़रूरत है';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'क्या गलत हो गया?';

  @override
  String get describeTheIssue => 'समस्या का वर्णन करें';

  @override
  String get tellUsWhatHappenedSoWe =>
      'हमें बताएं कि क्या हुआ ताकि हम आपकी मदद कर सकें…';

  @override
  String get submitRequest => 'अनुरोध सबमिट करें';

  @override
  String get addedToCart => 'कार्ट में जोड़ा गया';

  @override
  String get productUnavailable => 'उत्पाद अनुपलब्ध है';

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
  String get fewItemsLeft => 'कुछ ही वस्तुएँ बची हैं';

  @override
  String get description => 'विवरण';

  @override
  String get frequentlyBoughtTogether => 'अक्सर एक साथ खरीदे जाने वाले';

  @override
  String get viewAll => 'सभी को देखें';

  @override
  String get addToCart => 'कार्ट में जोड़ें';

  @override
  String get buyNow => 'अभी खरीदें';

  @override
  String get searchProducts => 'उत्पादों को खोजना…';

  @override
  String get noProductsFound => 'कोई उत्पाद नहीं मिला';

  @override
  String get priceRange => 'मूल्य सीमा (₹)';

  @override
  String get min => 'मिन';

  @override
  String get max => 'अधिकतम';

  @override
  String get inStockOnly => 'केवल स्टॉक में उपलब्ध है';

  @override
  String get sortBy => 'इसके अनुसार क्रमबद्ध करें';

  @override
  String get addDeliveryAddress => 'डिलीवरी का पता जोड़ें';

  @override
  String get setAsDefaultAddress => 'डिफ़ॉल्ट पते के रूप में सेट करें';

  @override
  String get saveAddress => 'पता सहेजें';

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
  String get fewLeft => 'थोड़े रह गए हैं';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'नि: शुल्क डिलिवरी';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'अभी तक यहाँ कुछ नहीं है';

  @override
  String get loadingSecurePayment => 'सुरक्षित भुगतान प्रक्रिया लोड हो रही है…';

  @override
  String get couldNotStartRecharge => 'रिचार्ज शुरू नहीं हो सका';

  @override
  String get paymentSuccessful => 'भुगतान सफल रहा 🎉';

  @override
  String get paymentWasNotCompleted => 'भुगतान पूरा नहीं हुआ';

  @override
  String get couldNotStartRechargeTryAgain =>
      'रिचार्ज शुरू नहीं हो सका, कृपया पुनः प्रयास करें।';

  @override
  String get wallet => 'बटुआ';

  @override
  String get availableBalance => 'उपलब्ध शेष राशि';

  @override
  String get useItForPoojasConsultations =>
      'इसका प्रयोग पूजा-पाठ और परामर्श के लिए करें।';

  @override
  String get instantTopUp => 'तत्काल टॉप-अप';

  @override
  String get noRechargePacksAvailableRightNow =>
      'फिलहाल कोई रिचार्ज पैक उपलब्ध नहीं है।';

  @override
  String get transactions => 'लेनदेन';

  @override
  String get endOfTransactions => '— लेन-देन समाप्त —';

  @override
  String get youGet => 'आपको मिला';

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
  String get ganga => 'टहलना';

  @override
  String get about => 'के बारे में';

  @override
  String get astrologer => 'ज्योतिषी';

  @override
  String get seeker => 'साधक';

  @override
  String get free => 'मुक्त';

  @override
  String get jan => 'जनवरी';

  @override
  String get feb => 'फ़रवरी';

  @override
  String get mar => 'मार्च';

  @override
  String get apr => 'अप्रैल';

  @override
  String get may => 'मई';

  @override
  String get jun => 'जून';

  @override
  String get jul => 'जुलाई';

  @override
  String get aug => 'अगस्त';

  @override
  String get sep => 'सितम्बर';

  @override
  String get oct => 'अक्टूबर';

  @override
  String get nov => 'नवंबर';

  @override
  String get dec => 'दिसम्बर';

  @override
  String get english => 'अंग्रेज़ी';

  @override
  String get all => 'सभी';

  @override
  String get vedic => 'वैदिक';

  @override
  String get tarot => 'टैरो';

  @override
  String get numerology => 'अंक ज्योतिष';

  @override
  String get vastu => 'ख़िलाफ़';

  @override
  String get palmistry => 'हस्तरेखा शास्त्र';

  @override
  String get kp => 'केपी';

  @override
  String get love => 'प्यार';

  @override
  String get taraAi => 'देश एआई';

  @override
  String get instantVedicAnswers247 => 'त्वरित वैदिक उत्तर • 24×7';

  @override
  String get allLanguages => 'सभी भाषाएँ';

  @override
  String get jyotiAi => 'ज्योति एआई';

  @override
  String get loveCareerGuidance => 'प्रेम एवं करियर मार्गदर्शन';

  @override
  String get hindiEnglish => 'हिंदी, अंग्रेजी';

  @override
  String get veduAi => 'वेदु एआई';

  @override
  String get remediesPredictions => 'उपचार और भविष्यवाणियाँ';

  @override
  String get couldNotLoadAstrologers => 'ज्योतिषियों को लोड नहीं किया जा सका';

  @override
  String get aiAstrologers => 'एआई ज्योतिषी';

  @override
  String get featuredAstrologers => 'विशेष ज्योतिषी';

  @override
  String get astrologers => 'ज्योतिषियों';

  @override
  String get searchAiAstrologers => 'एआई ज्योतिषियों की खोज करें…';

  @override
  String get searchAstrologersByName => 'ज्योतिषियों को नाम से खोजें…';

  @override
  String get aiChat => 'एआई चैट';

  @override
  String get noAstrologersMatch => 'कोई ज्योतिषी मेल नहीं खाता';

  @override
  String get noAstrologersYet => 'अभी तक कोई ज्योतिषी नहीं';

  @override
  String get couldnTSetTheReminderPlease =>
      'रिमाइंडर सेट नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get ai => 'ऐ';

  @override
  String get live2 => 'लाइव';

  @override
  String get online => 'ऑनलाइन';

  @override
  String get busy => 'व्यस्त';

  @override
  String get offline => 'ऑफलाइन';

  @override
  String get chat => 'चैट';

  @override
  String get call => 'कॉल';

  @override
  String get video => 'वीडियो';

  @override
  String get notEnoughBalanceToStartPlease =>
      'शुरू करने के लिए पर्याप्त बैलेंस नहीं है। कृपया रिचार्ज करें।';

  @override
  String get couldNotStartTheConsultationPlease =>
      'परामर्श शुरू नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get share => 'शेयर करना';

  @override
  String get follow => 'अनुसरण करना';

  @override
  String get chats => 'चैट';

  @override
  String get calls => 'कॉल';

  @override
  String get videos => 'वीडियो';

  @override
  String get gifts => 'उपहार';

  @override
  String get languages => 'बोली';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'उन्होंने हजारों जिज्ञासुओं को करियर, विवाह, वित्त और जीवन पथ से संबंधित प्रश्नों में मार्गदर्शन प्रदान किया है।';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'उनकी व्याख्याएं शास्त्रीय वैदिक सिद्धांतों को व्यावहारिक, करुणामय मार्गदर्शन के साथ जोड़ती हैं - जिससे आपको मदद मिलती है।';

  @override
  String get findClarityAndActionableRemediesFor =>
      'आगे के रास्ते के लिए स्पष्टता और व्यावहारिक समाधान खोजें।';

  @override
  String get giftsReceived => 'प्राप्त उपहार';

  @override
  String get reviews => 'समीक्षा';

  @override
  String get weLlNotifyYouTheMoment =>
      'जैसे ही वे उपलब्ध होंगे, हम आपको सूचित कर देंगे।';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'जैसे ही वे ऑनलाइन होंगे, हम आपको सूचित कर देंगे।';

  @override
  String get getAHeadsUpTheMoment =>
      'जैसे ही वे उपलब्ध हों, आपको तुरंत सूचना मिल जाएगी।';

  @override
  String get couldNotLoadThisStore => 'इस स्टोर को लोड नहीं किया जा सका';

  @override
  String get products => 'उत्पादों';

  @override
  String get poojas => 'पूजा में';

  @override
  String get book => 'किताब';

  @override
  String get buy => 'खरीदना';

  @override
  String get lalKitab => 'Lal Kitab';

  @override
  String get hindi => 'नहीं';

  @override
  String get bengali => 'बंगाली';

  @override
  String get tamil => 'तामिल';

  @override
  String get marathi => 'मराठी';

  @override
  String get punjabi => 'पंजाबी';

  @override
  String get telugu => 'तेलुगू';

  @override
  String get expertise => 'विशेषज्ञता';

  @override
  String get couldNotLoadGifts => 'उपहार लोड नहीं हो सके';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'खाते में पर्याप्त धनराशि नहीं है। उपहार भेजने के लिए अतिरिक्त धनराशि डालें।';

  @override
  String get couldNotSendTheGiftPlease =>
      'उपहार भेजा नहीं जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get connecting2 => 'जुड़ना…';

  @override
  String get couldNotLoadThisChatHistory => 'यह चैट इतिहास लोड नहीं हो सका';

  @override
  String get thisChatHistoryIsNoLonger =>
      'यह चैट इतिहास अब उपलब्ध नहीं है।\n(चैट 7 दिनों तक रखी जाती हैं।)';

  @override
  String get dailyFor14Days => 'प्रतिदिन · 14 दिनों के लिए';

  @override
  String get dailyMantra => 'दैनिक मंत्र';

  @override
  String get reminder => 'अनुस्मारक';

  @override
  String get audio => 'ऑडियो';

  @override
  String get couldNotLoadYourConsultations => 'आपके परामर्श लोड नहीं हो सके।';

  @override
  String get missed => 'चुक होना';

  @override
  String get declined => 'अस्वीकृत';

  @override
  String get cancelled => 'रद्द कर दिया गया';

  @override
  String get lowBalance => 'कम संतुलन';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'अपनी परामर्श प्रक्रिया जारी रखने के लिए अभी रिचार्ज करें। भुगतान करते समय आपकी चैट खुली रहेगी।';

  @override
  String get duration => 'अवधि';

  @override
  String get coinsUsed => 'प्रयुक्त सिक्के';

  @override
  String get guest => 'अतिथि';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get chooseYourKundli => 'अपनी कुंडली चुनें';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'आपका बटुआ, राशिफल और सहेजी गई जानकारी सुरक्षित रहेगी — लेकिन लॉग आउट करने का मतलब है कि आप अपने दैनिक राशिफल, ऑफ़र और रिमाइंडर से वंचित रह जाएंगे। सितारों से जुड़े रहें? ✨';

  @override
  String get offers => 'ऑफर';

  @override
  String get dailyPanchang => 'Daily Panchang';

  @override
  String get talkToAstrologer => 'ज्योतिषी से बात करें';

  @override
  String get brihatKundli => 'Brihat Kundli';

  @override
  String get dailyNotes => 'दैनिक नोट्स';

  @override
  String get askAQuestion => 'प्रश्न पूछें';

  @override
  String get free50Pages => '50+ पेज निःशुल्क';

  @override
  String get freeReport => 'निःशुल्क रिपोर्ट';

  @override
  String get freeMatrimony => 'मुफ्त विवाह';

  @override
  String get matrimony => 'विवाह';

  @override
  String get loveMatch => 'प्रेम विवाह';

  @override
  String get horoscope => 'राशिफल';

  @override
  String get dailyHoroscope => 'दैनिक राशिफल';

  @override
  String get vedicAstrology => 'वैदिक ज्योतिष';

  @override
  String get acharyaVeda => 'Acharya Veda';

  @override
  String get panditRohan => 'Pandit Rohan';

  @override
  String get guruMaya => 'वर्चुअल शिक्षक';

  @override
  String get jayaShastri => 'Jaya Shastri';

  @override
  String get devSharma => 'Dev Sharma';

  @override
  String get sureshG => 'सुरेश जी.';

  @override
  String get lataP => 'पी. वर्ष';

  @override
  String get kiranB => 'किरण बी.';

  @override
  String get mohanT => 'मोहन टी.';

  @override
  String get anilJoshi => 'अनिल जोशी';

  @override
  String get meeraDevi => 'मीरा देवी';

  @override
  String get raviKumar => 'Ravi Kumar';

  @override
  String get sunitaRao => 'सुनीता राव';

  @override
  String get bengaluruKarnataka => 'Bengaluru, Karnataka';

  @override
  String get locating => 'पता लगाया जा रहा है…';

  @override
  String get festivalOffer => 'महोत्सव प्रस्ताव';

  @override
  String get upTo30OffOnGemstones => 'रत्नों पर 30% तक की छूट';

  @override
  String get talkToTopAstrologers => 'शीर्ष ज्योतिषियों से बात करें';

  @override
  String get firstConsultationSpecial => 'पहली परामर्श विशेष';

  @override
  String get rudrakshaCollection => 'रुद्राक्ष संग्रह';

  @override
  String get authenticEnergised => 'प्रामाणिक और ऊर्जावान';

  @override
  String get resumeSession => 'सत्र पुनः आरंभ करें';

  @override
  String get home => 'घर';

  @override
  String get aiAstro => 'एआई एस्ट्रो';

  @override
  String get ask => 'पूछना';

  @override
  String get history => 'इतिहास';

  @override
  String get seeAll2 => 'सभी देखें';

  @override
  String get s1AcceptanceOfTheseTerms => '1. इन शर्तों की स्वीकृति';

  @override
  String get termsOfService2 => 'सेवा की शर्तें';

  @override
  String get lastUpdated26June2026 => 'अंतिम अद्यतन: 26 जून 2026';

  @override
  String get rudragangaProvidesAstrologySpiritualAndWellness =>
      'रुद्रगंगा व्यक्तिगत मार्गदर्शन और विकास के लिए ज्योतिष, आध्यात्मिकता और स्वास्थ्य संबंधी परामर्श प्रदान करता है।';

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'केवल विचारणीय सेवाएं। हमारी सेवाएं पेशेवर चिकित्सा, कानूनी, वित्तीय सेवाओं का विकल्प नहीं हैं।';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'या मनोवैज्ञानिक सलाह। ऐप का उपयोग करने के लिए आपकी आयु 18 वर्ष या उससे अधिक होनी चाहिए।';

  @override
  String get byCreatingAnAccountOrUsing =>
      'एक खाता बनाकर या रुद्रगंगा मोबाइल एप्लिकेशन और संबंधित सेवाओं (';

  @override
  String get servicesYouAgreeToBeBound =>
      'आप \"सेवाओं\" का उपयोग करते समय इन सेवा शर्तों और हमारी गोपनीयता नीति और धनवापसी नीति से बाध्य होने के लिए सहमत होते हैं।';

  @override
  String get policyIfYouDoNotAgree =>
      'नीति। यदि आप इससे सहमत नहीं हैं, तो कृपया सेवाओं का उपयोग न करें।';

  @override
  String get s2EligibilityYourAccount => '2. पात्रता और आपका खाता';

  @override
  String get youMustBeAtLeast18 =>
      'अनुबंध करने के लिए आपकी आयु कम से कम 18 वर्ष होनी चाहिए और आप कानूनी रूप से अनुबंध करने में सक्षम होने चाहिए।';

  @override
  String get youRegisterWithAPhoneNumber =>
      'आप एक ऐसे फ़ोन नंबर से पंजीकरण करते हैं जिसे एक बार के पासवर्ड (OTP) द्वारा सत्यापित किया जाता है। उस नंबर और डिवाइस तक पहुंच को सुरक्षित रखना आपकी ज़िम्मेदारी है।';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'आप रीडिंग के लिए अपनी इच्छानुसार जन्म विवरण सहित सटीक जानकारी प्रदान करने के लिए सहमत हैं। आपके खाते के अंतर्गत होने वाली सभी गतिविधियों के लिए आप स्वयं जिम्मेदार हैं।';

  @override
  String get s3TheServicesWeOffer => '3. हम जो सेवाएं प्रदान करते हैं';

  @override
  String get rudragangaConnectsYouWithVerifiedAstrologers =>
      'रुद्रगंगा आपको ऑडियो कॉल, वीडियो कॉल आदि के माध्यम से परामर्श के लिए सत्यापित ज्योतिषियों से जोड़ता है।';

  @override
  String get andChatAndOffersRelatedFeatures =>
      'और चैट की सुविधा उपलब्ध है, साथ ही कुंडली निर्माण और मिलान, एआई ज्योतिषी जैसी संबंधित सुविधाएं भी प्रदान करता है।';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'दैनिक राशिफल, पूजा बुकिंग, आध्यात्मिक उत्पादों की दुकान, उपहार देने की सुविधा और वैवाहिक संबंध बनाने की सुविधा।';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'किसी भी सुविधा या ज्योतिषी की उपलब्धता किसी भी समय बदल सकती है।';

  @override
  String get s4WalletPricingBilling => '4. वॉलेट, मूल्य निर्धारण और बिलिंग';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'परामर्श के लिए पहले से भुगतान करना होगा। आप ऐप में मौजूद वॉलेट में पैसे जमा करते हैं और ज्योतिषी और सेवा के लिए दिखाए गए प्रति मिनट के हिसाब से भुगतान करते हैं।';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'ज्योतिषी द्वारा सहमति मिलने और सेशन शुरू होने पर बिलिंग शुरू हो जाती है। पहले मिनट का शुल्क कनेक्ट होते ही लिया जाता है, और उसके बाद प्रत्येक मिनट का शुल्क शुरू होते ही लिया जाता है। सेशन के दौरान एक लाइव मीटर दिखाया जाता है, और यदि आपका बैलेंस कम हो जाता है तो सेशन अपने आप समाप्त हो जाता है।';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'भुगतान की प्रक्रिया हमारे भुगतान भागीदार (PayU) द्वारा की जाती है। हम कार्ड की पूरी जानकारी संग्रहीत नहीं करते हैं।';

  @override
  String get walletBalancesAreForUseWithin =>
      'वॉलेट बैलेंस का उपयोग सेवाओं के भीतर ही किया जा सकता है। रिफंड, जहां लागू हो, हमारी रिफंड नीति के अनुसार दिया जाएगा।';

  @override
  String get pricesAreInIndianRupeesInr =>
      'कीमतें भारतीय रुपये (INR) में हैं और इनमें लागू कर शामिल हो सकते हैं।';

  @override
  String get s5AcceptableUse => '5. स्वीकार्य उपयोग';

  @override
  String get youAgreeNotTo => 'आप निम्नलिखित कार्य न करने के लिए सहमत हैं:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'ज्योतिषियों या कर्मचारियों के साथ दुर्व्यवहार करना, गाली देना, धमकी देना या यौन रूप से स्पष्ट या गैरकानूनी सामग्री साझा करना।';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'किसी सेवा या धनवापसी प्राप्त करने के लिए किसी अन्य व्यक्ति का रूप धारण करना या गलत जानकारी प्रदान करना।';

  @override
  String get attemptToTakeAConsultationOff =>
      'शुल्क से बचने के लिए या व्यक्तिगत संपर्क विवरण प्राप्त करने के लिए, परामर्श को प्लेटफ़ॉर्म से बाहर लेने का प्रयास करें।';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'सेवाओं या उनकी सुरक्षा में हस्तक्षेप करना, डेटा स्क्रैप करना या उसे बाधित करने का प्रयास करना।';

  @override
  String get s6AstrologersOnThePlatform => '6. मंच पर ज्योतिषी';

  @override
  String get astrologersAreIndependentPractitionersWhoAre =>
      'ज्योतिषी स्वतंत्र पेशेवर हैं जिनकी पहचान रुद्रगंगा द्वारा सत्यापित और अनुमोदित की गई है।';

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'परामर्श देने से पहले ही वे अपनी प्रति मिनट की दरें तय कर लेते हैं, जो हमारे द्वारा निर्धारित सीमाओं के भीतर होती हैं।';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'परामर्श के दौरान साझा किए गए विचार और मार्गदर्शन संबंधित ज्योतिषी के हैं, न कि उनके स्वयं के।';

  @override
  String get ofRudragangaWeAreNotResponsible =>
      'रुद्रगंगा के। परामर्श के आधार पर आपके द्वारा लिए गए किसी भी निर्णय के लिए हम जिम्मेदार नहीं हैं।';

  @override
  String get s7RecordingsContent => '7. रिकॉर्डिंग और सामग्री';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'गुणवत्ता, सुरक्षा और विवाद समाधान के लिए, ऑडियो और वीडियो परामर्श रिकॉर्ड किए जा सकते हैं।';

  @override
  String get consentToSuchRecordingByStarting =>
      'सेशन शुरू करके ऐसी रिकॉर्डिंग के लिए सहमति दें। चैट बातचीत संग्रहीत की जाती है ताकि आप बाद में उसे देख सकें।';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'उन्हें। इस डेटा को कैसे संभाला जाता है, इसके लिए हमारी गोपनीयता नीति देखें।';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. अस्वीकरण एवं दायित्व की सीमा';

  @override
  String get theServicesAreProvidedAsIs =>
      'ये सेवाएं मार्गदर्शन और मनोरंजन से संबंधित व्यक्तिगत चिंतन के लिए \"जैसी हैं वैसी ही\" प्रदान की जाती हैं।';

  @override
  String get rudragangaMakesNoGuaranteeAboutThe =>
      'रुद्रगंगा किसी भी भविष्यवाणी या उपाय की सटीकता की कोई गारंटी नहीं देता है।';

  @override
  String get permittedByLawRudragangaSTotal =>
      'कानून द्वारा अनुमत होने पर, सेवाओं के आपके उपयोग से उत्पन्न होने वाली रुद्रगंगा की कुल देयता सीमित है।';

  @override
  String get theAmountYouPaidIntoYour =>
      'दावा उत्पन्न करने वाली घटना से 30 दिन पहले आपने अपने वॉलेट में जो राशि जमा की थी।';

  @override
  String get areNotLiableForIndirectOr =>
      'अप्रत्यक्ष या परिणामी हानियों के लिए उत्तरदायी नहीं हैं।';

  @override
  String get s9SuspensionTermination => '9. निलंबन एवं बर्खास्तगी';

  @override
  String get weMaySuspendOrTerminateYour =>
      'इन शर्तों का उल्लंघन करने, धोखाधड़ी का प्रयास करने या दुरुपयोग करने पर हम आपका खाता निलंबित या समाप्त कर सकते हैं।';

  @override
  String get servicesYouMayStopUsingThe =>
      'सेवाएं। आप किसी भी समय सेवाओं का उपयोग बंद कर सकते हैं। कुछ प्रावधान (भुगतान दायित्व,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'अस्वीकरण और दायित्व की सीमाएं समाप्ति के बाद भी लागू रहेंगी।';

  @override
  String get s10ChangesToTheseTerms => '10. इन शर्तों में परिवर्तन';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'हम समय-समय पर इन शर्तों को अपडेट कर सकते हैं। महत्वपूर्ण परिवर्तनों की सूचना ऐप में या ईमेल के माध्यम से दी जाएगी।';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'ऊपर दी गई \"अंतिम अद्यतन तिथि\" को अपडेट किया जा रहा है। परिवर्तनों के बाद इसका उपयोग जारी रखने का अर्थ है कि आप उन्हें स्वीकार करते हैं।';

  @override
  String get s11ContactUs => '11. हमसे संपर्क करें';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'इन शर्तों के बारे में कोई प्रश्न हैं? हमारी वेबसाइट या ऐप पर दिए गए संपर्क फ़ॉर्म के माध्यम से हमसे संपर्क करें।';

  @override
  String get helpSupportSection => 'सहायता एवं समर्थन अनुभाग।';

  @override
  String get privacyPolicy2 => 'गोपनीयता नीति';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'आपकी जन्म संबंधी जानकारी, परामर्श और बातचीत आपके लिए निजी हैं। यह नीति बताती है कि हम क्या करते हैं।';

  @override
  String get collectWhyAndTheControlYou =>
      'आप इसे क्यों इकट्ठा करते हैं और इस पर आपका कितना नियंत्रण है।';

  @override
  String get s1InformationWeCollect => '1. हम जो जानकारी एकत्र करते हैं';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'खाता जानकारी: आपका नाम, फ़ोन नंबर (ओटीपी द्वारा सत्यापित), और यदि प्रदान किया गया हो तो ईमेल।';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'जन्म संबंधी विवरण: जन्म तिथि, समय और स्थान जो आप कुंडली विश्लेषण और रीडिंग के लिए साझा करना चाहते हैं।';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'परामर्श संबंधी डेटा: चैट संदेश, और जहां लागू हो वहां ऑडियो/वीडियो कॉल रिकॉर्डिंग।';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'भुगतान संबंधी डेटा: वॉलेट लेनदेन और भुगतान संदर्भ। कार्ड विवरण हमारे भुगतान भागीदार (PayU) द्वारा संभाले जाते हैं; हम पूर्ण कार्ड नंबर संग्रहीत नहीं करते हैं।';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'डिवाइस और उपयोग संबंधी डेटा: डिवाइस का प्रकार, ऑपरेटिंग सिस्टम, आपके आईपी पते से प्राप्त अनुमानित स्थान, देखे गए पृष्ठ और इंटरैक्शन, जिनका उपयोग सेवाओं को संचालित करने और बेहतर बनाने के लिए किया जाता है।';

  @override
  String get s2HowWeUseIt => '2. हम इसका उपयोग कैसे करते हैं';

  @override
  String get toCreateAndSecureYourAccount =>
      'अपना खाता बनाने और उसे सुरक्षित करने तथा अपनी पहचान सत्यापित करने के लिए।';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'आपको ज्योतिषियों से जोड़ने और परामर्श, कुंडली, राशिफल और अन्य सुविधाएं प्रदान करने के लिए।';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'वॉलेट रिचार्ज, प्रति मिनट बिलिंग, भुगतान और ऑर्डर पूर्ति की प्रक्रिया के लिए।';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'सहायता प्रदान करना, धोखाधड़ी और दुरुपयोग को रोकना और कानूनी दायित्वों को पूरा करना।';

  @override
  String get toUnderstandAndImproveHowThe =>
      'ऐप और वेबसाइट के उपयोग के तरीके को समझने और उसमें सुधार करने के लिए।';

  @override
  String get s3WhenWeShareInformation => '3. जब हम जानकारी साझा करते हैं';

  @override
  String get weDoNotSellYourPersonal =>
      'हम आपकी व्यक्तिगत जानकारी नहीं बेचते हैं। हम इसे केवल इन लोगों के साथ साझा करते हैं:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'आप जिस ज्योतिषी से परामर्श लेते हैं, उससे केवल उतनी ही जानकारी ली जाती है जितनी भविष्यवाणी के लिए आवश्यक होती है (जैसे कि आपकी जन्मतिथि और बातचीत)।';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'हम उन सेवा प्रदाताओं के साथ काम करते हैं जो हमें संचालन में मदद करते हैं — भुगतान प्रसंस्करण (PayU), क्लाउड होस्टिंग और स्टोरेज, संचार (OTP के लिए WhatsApp/SMS), और सूचनाएं — गोपनीयता की बाध्यताओं के तहत।';

  @override
  String get whenRequiredByLawOrTo =>
      'जब कानून द्वारा आवश्यक हो, या उपयोगकर्ताओं और रुद्रगंगा के अधिकारों, सुरक्षा और संपत्ति की रक्षा के लिए।';

  @override
  String get s4ConsultationRecordingsChats =>
      '4. परामर्श की रिकॉर्डिंग और बातचीत';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'गुणवत्ता, सुरक्षा और अन्य उद्देश्यों के लिए ऑडियो और वीडियो परामर्श रिकॉर्ड किए जा सकते हैं, और चैट को संग्रहीत किया जाता है।';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'विवाद समाधान। आप ऐप में अपनी चैट हिस्ट्री देख सकते हैं। रिकॉर्डिंग सुरक्षित रखी जाती हैं।';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'नीचे वर्णित है और इसका उपयोग केवल सहायता, सुरक्षा या कानूनी कारणों से आवश्यक होने पर ही किया जा सकता है।';

  @override
  String get s5AnalyticsCookies => '5. एनालिटिक्स और कुकीज़';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'हमारी वेबसाइट पर आने वाले आगंतुकों को पहचानने और उनके व्यवहार को मापने के लिए फर्स्ट-पार्टी कुकी/आइडेंटिफायर का उपयोग किया जाता है।';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'लैंडिंग पेज के प्रदर्शन (जैसे कि किन अनुभागों पर क्लिक किया गया) और साइन-अप को मार्केटिंग से जोड़ना।';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'अभियान। इसका उपयोग समग्र रूप से अनुभव को बेहतर बनाने के लिए किया जाता है। हम अनुमानित शहर/क्षेत्र प्राप्त करते हैं।';

  @override
  String get fromYourIpAddressWeDo =>
      'हम आपके आईपी पते से डेटा प्राप्त करते हैं; हम विश्लेषण के लिए सटीक जीपीएस स्थान का उपयोग नहीं करते हैं।';

  @override
  String get s6DataRetention => '6. डेटा प्रतिधारण';

  @override
  String get weKeepYourInformationForAs =>
      'हम आपकी जानकारी तब तक अपने पास रखते हैं जब तक आपका खाता सक्रिय रहता है और जब तक आवश्यक हो, ताकि हम सेवाएं प्रदान कर सकें।';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'सेवाएं प्रदान करना, कानूनी दायित्वों का अनुपालन करना, विवादों का समाधान करना और हमारे समझौतों को लागू करना। आप';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'कानूनी रूप से डेटा को सुरक्षित रखने की शर्त के अधीन, अपने खाते और उससे संबंधित व्यक्तिगत डेटा को हटाने का अनुरोध करें।';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'आवश्यकताएं (उदाहरण के लिए, लेनदेन के रिकॉर्ड जिन्हें हमें लेखांकन और कर के लिए रखना आवश्यक है)।';

  @override
  String get s7Security => '7. सुरक्षा';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'हम उद्योग-मानक उपायों का उपयोग करते हैं — परिवहन में एन्क्रिप्शन, एक्सेस नियंत्रण और सुरक्षित';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'बुनियादी ढांचा — आपकी जानकारी की सुरक्षा के लिए। संचरण या भंडारण का कोई भी तरीका पूरी तरह से सुरक्षित नहीं है।';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'यह सुरक्षित है, इसलिए हम पूर्ण सुरक्षा की गारंटी नहीं दे सकते।';

  @override
  String get s8YourRightsChoices => '8. आपके अधिकार और विकल्प';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'ऐप में अपनी प्रोफ़ाइल और जन्म विवरण तक पहुंचें, उनमें सुधार करें या उन्हें अपडेट करें।';

  @override
  String get requestACopyOrDeletionOf =>
      'अपनी व्यक्तिगत जानकारी की प्रतिलिपि प्राप्त करने या उसे हटाने का अनुरोध करने के लिए हमसे संपर्क करें।';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'अपने डिवाइस या ऐप की सेटिंग में जाकर प्रमोशनल नोटिफिकेशन से ऑप्ट आउट करें।';

  @override
  String get s9Children => '9. बच्चे';

  @override
  String get theServicesAreIntendedForUsers =>
      'यह सेवाएं 18 वर्ष और उससे अधिक आयु के उपयोगकर्ताओं के लिए हैं। हम जानबूझकर किसी भी प्रकार का डेटा एकत्र नहीं करते हैं।';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '18 वर्ष से कम आयु का कोई भी व्यक्ति। यदि आपको लगता है कि किसी नाबालिग ने सेवाओं का उपयोग किया है, तो कृपया हमसे संपर्क करें ताकि हम उसे हटा सकें।';

  @override
  String get s10ChangesToThisPolicy => '10. इस नीति में परिवर्तन';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'हम इस नीति को अपडेट कर सकते हैं। महत्वपूर्ण परिवर्तनों की सूचना ऐप में या अपडेट के माध्यम से दी जाएगी।';

  @override
  String get lastUpdatedDateAbove => 'ऊपर दी गई \"अंतिम अद्यतन तिथि\" देखें।';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'गोपनीयता संबंधी प्रश्नों या डेटा अनुरोधों के लिए, हमारी वेबसाइट पर दिए गए संपर्क फ़ॉर्म या अन्य माध्यमों से हमसे संपर्क करें।';

  @override
  String get appSHelpSupportSection => 'ऐप का सहायता एवं समर्थन अनुभाग।';

  @override
  String get s2026Rudraganga18ForGuidanceAnd =>
      '© 2026 रुद्रगंगा · 18+ · मार्गदर्शन और कल्याण के लिए →\nपेशेवर सलाह का विकल्प नहीं।';

  @override
  String get widthDeviceWidthInitialScale1 =>
      'चौड़ाई = डिवाइस की चौड़ाई, प्रारंभिक पैमाना = 1, अधिकतम पैमाना = 1';

  @override
  String get segoeUi => 'सेगो यूआई';

  @override
  String get vote => 'वोट';

  @override
  String get couldnTLoadLiveSessions => 'लाइव सेशन लोड नहीं हो सके';

  @override
  String get noOneIsLiveRightNow => 'इस समय कोई भी लाइव नहीं है';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'जब कोई ज्योतिषी लाइव आएगा, तो वह यहां दिखाई देगा। पेज को रिफ्रेश करने के लिए नीचे स्क्रॉल करें या नोटिफिकेशन का इंतजार करें।';

  @override
  String get justNow => 'बस अब ';

  @override
  String get couldNotLoad => 'लोड नहीं हो सका';

  @override
  String get continueLabel => 'जारी रखना';

  @override
  String get openSettings => 'खुली सेटिंग';

  @override
  String get somePermissionsAreBlockedTapA =>
      'कुछ अनुमतियाँ अवरुद्ध हैं। अवरुद्ध आइटम (या \"सेटिंग्स खोलें\") पर टैप करके उसे सक्षम करें, फिर यहाँ वापस आएँ।';

  @override
  String get thesePermissionsAreRequiredToUse =>
      'रुद्रगंगा का उपयोग करने के लिए इन अनुमतियों की आवश्यकता है। इन्हें प्रदान करने के लिए किसी भी लंबित आइटम पर टैप करें।';

  @override
  String get settings2 => 'सेटिंग्स';

  @override
  String get allow => 'अनुमति दें';

  @override
  String get blockedEnableItInSettings =>
      'अवरुद्ध — इसे सेटिंग्स में सक्षम करें';

  @override
  String get allowsUpTo => 'अधिकतम की अनुमति देता है';

  @override
  String get bookingFailed => 'बुकिंग विफल';

  @override
  String get yourDetails => 'आपके विवरण';

  @override
  String get fromYourProfile => 'आपकी प्रोफ़ाइल से';

  @override
  String get familyMembers => 'परिवार के सदस्य';

  @override
  String get addMember => 'सदस्य जोड़ें';

  @override
  String get addAnother => 'एक और जोड़ें';

  @override
  String get preferredDateOptional => 'पसंदीदा तिथि (वैकल्पिक)';

  @override
  String get anyDate => 'कोई दिन';

  @override
  String get bookNowFree => 'अभी बुक करें (निःशुल्क)';

  @override
  String get couldNotLoadThisPooja => 'यह पूजा लोड नहीं हो सकी';

  @override
  String get forLabel => 'के लिए';

  @override
  String get s1Person => '1 व्यक्ति';

  @override
  String get bookShareDetails => 'बुकिंग करें और विवरण साझा करें';

  @override
  String get confirmYourBookingWithTheNames =>
      'जिन नामों के लिए पूजा की जा रही है, उनके साथ अपनी बुकिंग की पुष्टि करें।';

  @override
  String get panditCoordinates => 'पंडित निर्देशांक';

  @override
  String get aVerifiedPanditCallsToFix =>
      'एक प्रमाणित पंडित समय तय करने और सामग्री की व्यवस्था करने के लिए फोन करते हैं।';

  @override
  String get poojaPerformed => 'पूजा संपन्न हुई';

  @override
  String get sankalpIsTakenInYourFamily =>
      'संकल्प आपके परिवार के नाम पर लिया जाता है, और बाद में जहां उपयुक्त हो वहां प्रसाद बांटा जाता है।';

  @override
  String get couldNotLoadPoojas => 'पूजाएं लोड नहीं हो सकीं';

  @override
  String get any => 'कोई';

  @override
  String get noPoojasHere => 'यहां कोई पूजा नहीं होती';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'वर्तमान फ़िल्टरों से कुछ भी मेल नहीं खाता।';

  @override
  String get noPoojasAvailableYet => 'अभी कोई पूजा उपलब्ध नहीं है';

  @override
  String get showAllPoojas => 'सभी पूजाएँ दिखाएँ';

  @override
  String get tapToViewDetailsBook =>
      'विवरण देखने और बुकिंग करने के लिए टैप करें';

  @override
  String get appliedYouBothEarnOnYour =>
      'लागू! आप दोनों को पहले रिचार्ज पर लाभ मिलेगा।';

  @override
  String get shareYourCode => 'अपना कोड साझा करें';

  @override
  String get sendYourCodeToFriendsVia =>
      'अपना कोड व्हाट्सएप, एसएमएस या किसी भी माध्यम से दोस्तों को भेजें।';

  @override
  String get friendSignsUp => 'दोस्त साइन अप करता है';

  @override
  String get theyEnterYourCodeInRefer =>
      'साइन अप करने के बाद वे रेफर एंड अर्न में आपका कोड दर्ज करते हैं।';

  @override
  String get feedbackReceived => 'प्रतिक्रिया प्राप्त हुई ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'धन्यवाद—हमारी टीम इस मामले की जांच करेगी।';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get email => 'ईमेल';

  @override
  String get phoneNumber => 'फ़ोन नंबर';

  @override
  String get message => 'संदेश';

  @override
  String get requiredLabel => 'आवश्यक';

  @override
  String get applicationReceived => 'आवेदन प्राप्त हुआ ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'हमारी टीम आपके ज्योतिषी प्रोफाइल के बारे में आपसे संपर्क करेगी।';

  @override
  String get enter10Digits => '10 अंक दर्ज करें';

  @override
  String get aboutYouBioExpertiseExperience =>
      'आपके बारे में (जीवनी, विशेषज्ञता, अनुभव)';

  @override
  String get rudragangaConnectsYouWithTrustedVedic =>
      'रुद्रगंगा आपको करियर संबंधी मार्गदर्शन के लिए विश्वसनीय वैदिक ज्योतिषियों से जोड़ता है।';

  @override
  String get marriageFinanceHealthAndLifeS =>
      'शादी, वित्त, स्वास्थ्य और जीवन के बड़े सवालों के जवाब चैट, कॉल और वीडियो के माध्यम से प्राप्त करें।';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'अपनी कुंडली, दैनिक राशिफल, वैवाहिक सलाह, पूजा-पाठ और उपाय, सब कुछ एक ही स्थान पर पाएं।\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'हमारा उद्देश्य प्रामाणिक, करुणामय आध्यात्मिक मार्गदर्शन को सभी के लिए सुलभ बनाना है।';

  @override
  String get inYourOwnLanguage => 'अपनी भाषा में।';

  @override
  String get verifiedExperiencedAstrologers => 'प्रमाणित, अनुभवी ज्योतिषी';

  @override
  String get privateSecureConsultations => 'निजी और सुरक्षित परामर्श';

  @override
  String get availableIn6IndianLanguages => '6 भारतीय भाषाओं में उपलब्ध है';

  @override
  String get thanksForRatingUs => 'हमें रेटिंग देने के लिए धन्यवाद ✓';

  @override
  String get yourFeedbackHelpsRudragangaGrow =>
      'आपकी प्रतिक्रिया रुद्रगंगा को आगे बढ़ने में मदद करती है।';

  @override
  String get onceInADay => 'दिन में एक बार';

  @override
  String get twiceInADay => 'दिन में दो बार';

  @override
  String get asManyTimesAsItComes => 'जितनी बार भी ऐसा होता है';

  @override
  String get never => 'कभी नहीं';

  @override
  String get cricket => 'क्रिकेट';

  @override
  String get shareMarket => 'शेयर बाजार';

  @override
  String get bollywood => 'बॉलीवुड';

  @override
  String get newMagazine => 'नई पत्रिका';

  @override
  String get festivals => 'समारोह';

  @override
  String get notificationsUpdated => 'सूचनाएं अपडेट हो गईं ✓';

  @override
  String get youLlHearFromUsBased =>
      'आपके द्वारा चुने गए विकल्पों के आधार पर हम आपसे संपर्क करेंगे।';

  @override
  String get yourChartsWillNowFollowYour =>
      'अब आपके चार्ट आपके द्वारा चुनी गई शैली का अनुसरण करेंगे।';

  @override
  String get chartStyle => 'चार्ट शैली';

  @override
  String get northIndian => 'उत्तर भारतीय';

  @override
  String get southIndian => 'दक्षिण भारतीय';

  @override
  String get monthSystem => 'माह प्रणाली';

  @override
  String get amanta => 'स्वामिनी';

  @override
  String get purnimanta => 'Purnimanta';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get off => 'बंद';

  @override
  String get onLabel => 'पर';

  @override
  String get useDeviceSettings => 'डिवाइस सेटिंग्स का उपयोग करें';

  @override
  String get ayanamsa => 'अयनांश गणना';

  @override
  String get nCLahiri => 'एन.सी. लाहिड़ी';

  @override
  String get kpNew => 'केपी न्यू';

  @override
  String get kpOld => 'केपी ओल्ड';

  @override
  String get raman => 'रमन';

  @override
  String get kpKhullar => 'KP Khullar';

  @override
  String get subtotal => 'उप-योग';

  @override
  String get youSave => 'आप बचाते हैं';

  @override
  String get total => 'कुल';

  @override
  String get deliveryAddress => 'डिलिवरी का पता';

  @override
  String get orderSummary => 'आदेश सारांश';

  @override
  String get couponsOffers => 'कूपन और ऑफर';

  @override
  String get billDetails => 'बिल विवरण';

  @override
  String get address => 'पता';

  @override
  String get productDiscount => 'उत्पाद छूट';

  @override
  String get itemsSubtotal => 'मदों का उप-योग';

  @override
  String get delivery => 'वितरण';

  @override
  String get free2 => 'मुक्त';

  @override
  String get toPay => 'भुगतान करने के लिए';

  @override
  String get dMmmYyyyHMmA => 'डी एमएमएम यययय, एच:एमएम ए';

  @override
  String get couldNotDownloadInvoice => 'इनवॉइस डाउनलोड नहीं हो सका';

  @override
  String get orderNotFound => 'आदेश नहीं मिला';

  @override
  String get activityTimeline => 'गतिविधि समयरेखा';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM yyyy · h:mm a';

  @override
  String get totalPaid => 'पूर्ण भुगतान';

  @override
  String get orderPlaced2 => 'आदेश रखा';

  @override
  String get dMmmHMmA => 'डी एमएमएम, एच:एमएम ए';

  @override
  String get generating => 'उत्पन्न हो रहा है…';

  @override
  String get pleaseDescribeTheIssue => 'कृपया समस्या का वर्णन करें।';

  @override
  String get couldNotLoadProducts => 'उत्पाद लोड नहीं हो सके';

  @override
  String get newest => 'नवीनतम';

  @override
  String get priceLowHigh => 'कीमत: कम→अधिक';

  @override
  String get priceHighLow => 'कीमत: उच्च→निम्न';

  @override
  String get topRated => 'टॉप रेटेड';

  @override
  String get s6DigitPin => '6-अंकों का पिन';

  @override
  String get addressLine1 => 'पता पंक्ति 1 *';

  @override
  String get addressLine2 => 'पता पंक्ति नं। 2';

  @override
  String get city => 'शहर *';

  @override
  String get state => 'राज्य *';

  @override
  String get pinCode => 'पिन कोड *';

  @override
  String get payment => 'भुगतान';

  @override
  String get pooja => 'पूजा';

  @override
  String get shop => 'दुकान';

  @override
  String get securePayment => 'भुगतान सुरक्षित';

  @override
  String get noTransactionsMatchTheseFilters =>
      'इन फ़िल्टरों से कोई लेन-देन मेल नहीं खाता।';

  @override
  String get noTransactionsYet => 'अभी तक कोई लेन-देन नहीं हुआ है';

  @override
  String get moneyAdded => 'पैसा जोड़ा गया';

  @override
  String get poojaBooking => 'पूजा बुकिंग';

  @override
  String get videoCall => 'वीडियो कॉल';

  @override
  String get shopOrder => 'दुकान का आदेश';

  @override
  String get refund => 'धनवापसी';

  @override
  String get bonus => 'बोनस';

  @override
  String get credited => 'आकलित';

  @override
  String get debited => 'डेबिट किया गया';

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
