// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class L10nTe extends L10n {
  L10nTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'ఆస్ట్రో యాప్';

  @override
  String get tagline => 'జ్యోతిష్యం & ఆరోగ్యం';

  @override
  String get splashBlessing => 'స్పష్టత వైపు మీ ప్రయాణం ఇక్కడ మొదలవుతుంది';

  @override
  String get authWelcomeTitle => 'స్వాగతం';

  @override
  String get authWelcomeSubtitle =>
      'మీ ఫోన్ నంబర్‌తో సైన్ ఇన్ చేయండి లేదా మీ ఖాతాను సృష్టించుకోండి.';

  @override
  String get phoneLabel => 'ఫోన్ నంబర్';

  @override
  String get phoneHint => '10-అంకెల మొబైల్ నంబర్';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'కొనసాగించండి';

  @override
  String get sendOtpButton => 'OTP పంపండి';

  @override
  String get otpTitle => 'మీ నంబర్‌ను ధృవీకరించండి';

  @override
  String otpSubtitle(String phone) {
    return '$phoneకు పంపిన 6-అంకెల కోడ్‌ను నమోదు చేయండి';
  }

  @override
  String get otpLabel => 'ఓటీపీ';

  @override
  String get verifyButton => 'ధృవీకరించి, కొనసాగించండి';

  @override
  String get resendOtp => 'కోడ్‌ను మళ్లీ పంపండి';

  @override
  String resendOtpIn(int seconds) {
    return '${seconds}s లో తిరిగి పంపండి';
  }

  @override
  String get changeNumber => 'మార్పు సంఖ్య';

  @override
  String get termsNotice =>
      'కొనసాగించడం ద్వారా మీరు మా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తున్నారు';

  @override
  String get acceptPrefix => 'నేను అంగీకరిస్తున్నాను';

  @override
  String get acceptAnd => 'మరియు';

  @override
  String get termsOfService => 'సేవా నిబంధనలు';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get errInvalidPhone =>
      'చెల్లుబాటు అయ్యే 10-అంకెల ఫోన్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get errInvalidOtp => '6 అంకెల కోడ్‌ను నమోదు చేయండి';

  @override
  String get errGeneric => 'ఏదో పొరపాటు జరిగింది. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get errNetwork =>
      'కనెక్షన్ లేదు. మీ ఇంటర్నెట్‌ను తనిఖీ చేసి, మళ్లీ ప్రయత్నించండి.';

  @override
  String get otpSent => 'OTP పంపబడింది';

  @override
  String get loginSuccess => 'సంతకం చేసారు';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get language => 'భాష';

  @override
  String get theme => 'థీమ్';

  @override
  String get themeSystem => 'వ్యవస్థ';

  @override
  String get themeLight => 'కాంతి';

  @override
  String get themeDark => 'చీకటి';

  @override
  String homeWelcome(String name) {
    return 'నమస్తే, $name';
  }

  @override
  String get logout => 'లాగ్ అవుట్';

  @override
  String get onbTitle => 'మీ గురించి మాకు చెప్పండి';

  @override
  String get onbSubtitle =>
      'ఇది మీ రీడింగ్‌లను వ్యక్తిగతీకరించడానికి మాకు సహాయపడుతుంది. ఇందులో ఏదీ తప్పనిసరి కాదు — మీరు దీన్ని దాటవేసి, తర్వాత పూర్తి చేయవచ్చు.';

  @override
  String get onbName => 'మీ పేరు';

  @override
  String get onbAddPhoto => 'ఫోటోను జోడించండి';

  @override
  String get onbChangePhoto => 'ఫోటోను మార్చండి';

  @override
  String get onbGender => 'లింగం';

  @override
  String get genderMale => 'పురుషుడు';

  @override
  String get genderFemale => 'స్త్రీ';

  @override
  String get genderOther => 'ఇతర';

  @override
  String get onbDob => 'పుట్టిన తేదీ';

  @override
  String get onbTob => 'పుట్టిన సమయం';

  @override
  String get onbDontKnowTime => 'నాకు నా పుట్టిన సమయం తెలియదు';

  @override
  String get onbPob => 'జన్మస్థలం';

  @override
  String get onbPobHint => 'మీ జన్మస్థలాన్ని శోధించండి';

  @override
  String get onbLanguage => 'ప్రాధాన్య భాష';

  @override
  String get onbSelectDate => 'తేదీని ఎంచుకోండి';

  @override
  String get onbSelectTime => 'సమయాన్ని ఎంచుకోండి';

  @override
  String get onbSkip => 'ప్రస్తుతానికి దాటవేయండి';

  @override
  String get onbFinish => 'ముగించు';

  @override
  String get onbSaved => 'ప్రొఫైల్ సేవ్ చేయబడింది';

  @override
  String get completeProfile => 'మీ ప్రొఫైల్‌ను పూర్తి చేయండి';

  @override
  String get completeProfileCta => 'సెటప్‌ను పూర్తి చేయండి';

  @override
  String get permTitle => 'కొన్ని అనుమతులు';

  @override
  String get permSubtitle =>
      'కాల్స్, అలర్ట్స్ మరియు ఫోటోలు సజావుగా పనిచేయడానికి ఇవి మనకు అవసరం. మీరు వీటిని సెట్టింగ్స్‌లో ఎప్పుడైనా మార్చుకోవచ్చు.';

  @override
  String get permNotifications => 'నోటిఫికేషన్లు';

  @override
  String get permNotificationsDesc =>
      'సంప్రదింపు హెచ్చరికలు, ఆర్డర్ అప్‌డేట్‌లు మరియు రిమైండర్‌లు';

  @override
  String get permMic => 'మైక్రోఫోన్';

  @override
  String get permMicDesc => 'జ్యోతిష్యులతో వాయిస్ కాల్స్ కోసం';

  @override
  String get permCamera => 'కెమెరా';

  @override
  String get permCameraDesc => 'వీడియో కాల్స్ మరియు ఫోటోలను అప్‌లోడ్ చేయడానికి';

  @override
  String get permPhotos => 'ఫోటోలు';

  @override
  String get permPhotosDesc => 'మీ ప్రొఫైల్ చిత్రాన్ని సెట్ చేయడానికి';

  @override
  String get permAllow => 'యాక్సెస్‌ను అనుమతించండి';

  @override
  String get permContinue => 'కొనసాగించండి';

  @override
  String get permLocation => 'స్థానం';

  @override
  String get permLocationDesc => 'మీకు సమీపంలో ఉన్న జ్యోతిష్యులను కనుగొనండి';

  @override
  String get secFeatured => 'ప్రముఖ జ్యోతిష్యులు';

  @override
  String get secNearby => 'సమీపంలోని జ్యోతిష్యులు';

  @override
  String get secCallChat => 'కాల్ & చాట్';

  @override
  String get secAiAstro => 'AI జ్యోతిష్యులు';

  @override
  String get secProducts => 'ఉత్పత్తులు';

  @override
  String get secVideos => 'వీడియోలు';

  @override
  String get secLessons => 'జ్యోతిష్య పాఠాలు';

  @override
  String get secOthers => 'ఇతరులు';

  @override
  String get secHistory => 'మీ సంప్రదింపులు';

  @override
  String get seeAll => 'అన్నీ చూడండి';

  @override
  String get basedOnLocation => 'మీ స్థానాన్ని బట్టి';

  @override
  String get shareApp => 'యాప్‌ను స్నేహితులతో పంచుకోండి';

  @override
  String get startReadingHint =>
      'ఇంకా సంప్రదింపులు జరగలేదు. మీ మొదటి రీడింగ్‌ను ప్రారంభించండి.';

  @override
  String get startBtn => 'ప్రారంభించండి';

  @override
  String get namaste => 'నమస్కారం';

  @override
  String get kFreeKundli => 'ఉచిత కుండలి';

  @override
  String get kMatching => 'సరిపోల్చడం';

  @override
  String get kBrihat => 'బృహత్ కుండలి';

  @override
  String get kKundliAi => 'కుండ్లి AI+';

  @override
  String get tCareer => 'కెరీర్';

  @override
  String get tMarriage => 'వివాహం';

  @override
  String get tFinance => 'ఫైనాన్స్';

  @override
  String get tHealth => 'ఆరోగ్యం';

  @override
  String get tEducation => 'విద్య';

  @override
  String get tTravel => 'ప్రయాణం';

  @override
  String get statusOnline => 'ఆన్‌లైన్';

  @override
  String get statusBusy => 'బిజీగా';

  @override
  String get statusOffline => 'ఆఫ్‌లైన్';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String get chatNow => 'ఇప్పుడే చాట్ చేయండి';

  @override
  String get notifyMe => 'నాకు తెలియజేయండి';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return '$name అనేది $reason అయినప్పుడు మేము మీకు తెలియజేస్తాము.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'ఈ జ్యోతిష్యుడు ఇంకా సంప్రదించడానికి అందుబాటులో లేరు.';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'ఒక నిమిషానికి మీకు కనీసం ₹⟦�⟧ అవసరం. దయచేసి రీఛార్జ్ చేసుకోండి.';
  }

  @override
  String get completeYourProfile => 'మీ ప్రొఫైల్‌ను పూర్తి చేయండి';

  @override
  String get addYourDateTimePlaceOf =>
      'జ్యోతిష్యుడు మీకు మరింత స్పష్టమైన జాతకాన్ని అందించడానికి వీలుగా, మీ పుట్టిన తేదీ, సమయం మరియు ప్రదేశాన్ని జోడించండి.';

  @override
  String get completeProfile2 => 'పూర్తి ప్రొఫైల్';

  @override
  String get skipForNow => 'ప్రస్తుతానికి దాటవేయండి';

  @override
  String unfollowWidgetName(Object name) {
    return 'అనుసరించడం మానేయాలా $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'ఎందుకో మాకు చెప్పండి (ఐచ్ఛికం) — అది మాకు మెరుగుపడటానికి సహాయపడుతుంది.';

  @override
  String get reasonOptional => 'కారణం (ఐచ్ఛికం)';

  @override
  String get cancel => 'రద్దు చేయండి';

  @override
  String get unfollow => 'అన్‌ఫాలో';

  @override
  String get s21kReviews => '(2.1వేల సమీక్షలు)';

  @override
  String followersFollowers(Object followers) {
    return '$followers అనుచరులు';
  }

  @override
  String get gift => 'బహుమతి';

  @override
  String get store => 'స్టోర్';

  @override
  String get joinLiveSession => 'లైవ్ సెషన్‌లో చేరండి';

  @override
  String get youLlBeNotified => 'మీకు తెలియజేయబడుతుంది';

  @override
  String get thisStoreHasNoItemsYet => 'ఈ స్టోర్‌లో ఇంకా వస్తువులు ఏమీ లేవు.';

  @override
  String get filters => 'ఫిల్టర్లు';

  @override
  String get reset => 'రీసెట్';

  @override
  String get onlineNowOnly => 'ప్రస్తుతం ఆన్‌లైన్‌లో మాత్రమే';

  @override
  String get applyFilters => 'ఫిల్టర్‌లను వర్తింపజేయండి';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'ఈ జ్యోతిష్యునికి బహుమతులు ఇవ్వడం అందుబాటులో లేదు.';

  @override
  String needTotalcostYourBalanceIsWallet(Object totalCost, Object balance) {
    return '₹$totalCost కావాలి — మీ బ్యాలెన్స్ ₹$balance ఉంది. దయచేసి రీఛార్జ్ చేయండి.';
  }

  @override
  String sentQtyGiftNameToWidget(
      Object _qty, Object name, Object astrologerName) {
    return '$_qty $name నుండి $astrologerName కు పంపబడింది 🎁';
  }

  @override
  String sendAGiftToWidgetAstrologername(Object astrologerName) {
    return '$astrologerNameకు బహుమతి పంపండి';
  }

  @override
  String balanceContextWatchWalletproviderBalance(Object balance) {
    return 'నిల్వ: ₹$balance';
  }

  @override
  String get recharge => 'రీఛార్జ్';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost టికె';
  }

  @override
  String get quantity => 'పరిమాణం';

  @override
  String get min1Max100 => 'కనిష్టంగా 1 · గరిష్టంగా 100';

  @override
  String get comingSoon => 'త్వరలో వస్తుంది';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return '$astrologerName నుండి సారాంశం';
  }

  @override
  String get remindersSetForYou => 'మీ కోసం రిమైండర్‌లు సెట్ చేయబడ్డాయి';

  @override
  String get suggestedForYou => 'మీ కోసం సూచించబడింది';

  @override
  String get couldNotSendImage => 'చిత్రాన్ని పంపలేకపోయాను';

  @override
  String get endConsultation => 'సంప్రదింపులు ముగించాలా?';

  @override
  String get thisWillEndTheChatAnd =>
      'దీంతో చాట్ ముగిసి, బిల్లింగ్ ఆగిపోతుంది.';

  @override
  String get keepChatting => 'మాట్లాడుతూ ఉండండి';

  @override
  String get end => 'ముగింపు';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return '$toUpperCase$substring కు మారాలా?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'మీ చాట్ ముగుస్తుంది మరియు $type2 రేటుతో కొత్త $type సంప్రదింపు ప్రారంభమవుతుంది.';
  }

  @override
  String get switchLabel => 'స్విచ్';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'మార్చలేకపోయింది: $toString';
  }

  @override
  String get switchToAudioCall => 'ఆడియో కాల్‌కు మారండి';

  @override
  String get switchToVideoCall => 'వీడియో కాల్‌కు మారండి';

  @override
  String get endConsultation2 => 'సంప్రదింపుల ముగింపు';

  @override
  String get sendAGift => 'బహుమతి పంపండి';

  @override
  String get sayHello => 'హలో చెప్పండి 🙏';

  @override
  String get typeAMessage => 'సందేశాన్ని టైప్ చేయండి…';

  @override
  String get recommendedProduct => 'సిఫార్సు చేయబడిన ఉత్పత్తి';

  @override
  String get view => 'వీక్షణ';

  @override
  String get connecting => 'కనెక్ట్ అవుతోంది…';

  @override
  String get myConsultations => 'నా సంప్రదింపులు';

  @override
  String get noConsultationsYet => 'ఇంకా సంప్రదింపులు జరగలేదు';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type సంప్రదింపులు';
  }

  @override
  String get viewChat => 'చాట్‌ను వీక్షించండి';

  @override
  String get historyExpired => 'చరిత్ర గడువు ముగిసింది';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'మీ $type సంప్రదింపును కనెక్ట్ చేస్తోంది…';
  }

  @override
  String get ringingTheAstrologer => 'జ్యోతిష్యుడికి ఫోన్ చేయడం';

  @override
  String get cancelRequest => 'అభ్యర్థనను రద్దు చేయండి';

  @override
  String get notNow => 'ఇప్పుడు కాదు';

  @override
  String get thanksForYourFeedback => 'మీ అభిప్రాయానికి ధన్యవాదాలు!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'సమర్పించలేకపోయాము. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get consultationEnded => 'సంప్రదింపులు ముగిశాయి';

  @override
  String get hopeYouGotTheClarityYou =>
      'మీరు కోరుకున్న స్పష్టత మీకు లభించిందని ఆశిస్తున్నాను.';

  @override
  String get shareYourExperienceOptional => 'మీ అనుభవాన్ని పంచుకోండి (ఐచ్ఛికం)';

  @override
  String get howWasTheCallQuality => 'కాల్ నాణ్యత ఎలా ఉంది?';

  @override
  String get skip => 'దాటవేయి';

  @override
  String get submit => 'సమర్పించండి';

  @override
  String get close => 'మూసివేయండి';

  @override
  String get viewProfile => 'ప్రొఫైల్ చూడండి';

  @override
  String vAppversion(Object _appVersion) {
    return 'వి$_appVersion';
  }

  @override
  String get madeBy => 'తయారుచేసింది';

  @override
  String get devifai => 'దేవిఫ్ఏఐ';

  @override
  String get withLabel => '❤️తో';

  @override
  String get leavingSoSoon => 'ఇంత త్వరగా వెళ్ళిపోతున్నారా?';

  @override
  String get stayLoggedIn => 'లాగిన్ అయి ఉండండి';

  @override
  String get logOutAnyway => 'ఏమైనప్పటికీ లాగ్ అవుట్ చేయండి';

  @override
  String get noNearbyAstrologersYet => 'సమీపంలో ఇంకా జ్యోతిష్యులు లేరు';

  @override
  String get bookAPooja => 'పూజను బుక్ చేసుకోండి';

  @override
  String get panditLedPoojasAtYourChosen =>
      'మీరు ఎంచుకున్న తేదీన పండిట్లచే పూజలు';

  @override
  String get back => 'వెనుక';

  @override
  String get connectingToLive => 'ప్రత్యక్ష ప్రసారానికి కనెక్ట్ అవుతోంది…';

  @override
  String get live => 'ప్రత్యక్ష ప్రసారం';

  @override
  String get thisLiveHasEnded => 'ఈ ప్రత్యక్ష ప్రసారం ముగిసింది';

  @override
  String get backToLive => 'తిరిగి ప్రత్యక్ష ప్రసారానికి';

  @override
  String get sayHelloBeTheFirstTo =>
      'హలో చెప్పండి 👋 కామెంట్ చేసే మొదటి వ్యక్తి అవ్వండి';

  @override
  String get aiPollLive => 'AI పోల్ · ప్రత్యక్ష ప్రసారం';

  @override
  String totalVotes(Object total) {
    return '$total ఓట్లు';
  }

  @override
  String get addAComment => 'వ్యాఖ్యను జోడించండి…';

  @override
  String get send => 'పంపండి';

  @override
  String get liveNow => 'ఇప్పుడు ప్రత్యక్ష ప్రసారం';

  @override
  String get searchByAstrologerName => 'జ్యోతిష్యుని పేరుతో శోధించండి';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return '“$trim” అనే పేరు గల సజీవ జ్యోతిష్కుడు లేడు';
  }

  @override
  String get refresh => 'రిఫ్రెష్';

  @override
  String get join => 'చేరండి';

  @override
  String get clearAllNotifications => 'అన్ని నోటిఫికేషన్‌లను తొలగించాలా?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'ఇది మీ నోటిఫికేషన్‌లన్నింటినీ శాశ్వతంగా తొలగిస్తుంది.';

  @override
  String get clearAll => 'అన్నింటినీ తొలగించండి';

  @override
  String get notifications => 'నోటిఫికేషన్లు';

  @override
  String get markAllRead => 'అన్నీ చదివినట్లుగా గుర్తించండి';

  @override
  String get noNotifications => 'నోటిఫికేషన్లు లేవు';

  @override
  String get youReAllCaughtUp => 'మీరు అన్ని విషయాలు తెలుసుకున్నారు.';

  @override
  String get nameIsRequired => 'పేరు అవసరం';

  @override
  String get enterAValidPhone => 'చెల్లుబాటు అయ్యే ఫోన్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get bookingConfirmed => 'బుకింగ్ ఖరారు చేయబడింది 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'బుకింగ్ విఫలమైంది, దయచేసి మళ్ళీ ప్రయత్నించండి';

  @override
  String get addMoneyToContinue => 'కొనసాగించడానికి డబ్బు జోడించండి';

  @override
  String get addMoney => 'డబ్బును జోడించండి';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'పుస్తకం $name';
  }

  @override
  String get name => 'పేరు';

  @override
  String get phone => 'ఫోన్';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'ఈ పూజ ఎవరి కోసం చేయబడిందో ఆ వ్యక్తులను చేర్చండి ($_maxPersons వరకు). తరువాత చేర్చే ముందు ఒకటి నింపండి.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'సభ్యుడు $key పేరు';
  }

  @override
  String get specialInstructionsOptional => 'ప్రత్యేక సూచనలు (ఐచ్ఛికం)';

  @override
  String get poojaDetails => 'పూజ వివరాలు';

  @override
  String get price => 'ధర';

  @override
  String get bookNow => 'ఇప్పుడే బుక్ చేసుకోండి';

  @override
  String get aboutThisPooja => 'ఈ పూజ గురించి';

  @override
  String get ourPanditWillCallYou => 'మా పండిట్ మీకు ఫోన్ చేస్తారు';

  @override
  String get beforeThePoojaToConfirmThe =>
      'పూజకు ముందు, సమయాన్ని మరియు మీ సంకల్ప వివరాలను నిర్ధారించుకోవాలి.';

  @override
  String get howItWorks => 'ఇది ఎలా పనిచేస్తుంది';

  @override
  String get filterPoojas => 'ఫిల్టర్ పూజలు';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'గరిష్ట బడ్జెట్ · ₹$round';
  }

  @override
  String get minPersonsSupported => 'మద్దతు పొందిన కనీస వ్యక్తులు';

  @override
  String get apply => 'దరఖాస్తు చేసుకోండి';

  @override
  String get searchPoojas => 'పూజల కోసం వెతకండి…';

  @override
  String get myProfile => 'నా ప్రొఫైల్';

  @override
  String get referEarn => 'రిఫర్ చేసి సంపాదించండి';

  @override
  String get couldNotLoadTryAgain => 'లోడ్ చేయలేకపోయింది. మళ్ళీ ప్రయత్నించండి.';

  @override
  String shareEarnIReward(Object reward) {
    return 'పంచుకోండి & ₹$reward సంపాదించండి';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'మీ స్నేహితుని మొదటి రీఛార్జ్‌పై మీకు ₹⟦�⟧ లభిస్తుంది — మరియు వారికి కూడా ₹$reward2 లభిస్తుంది.';
  }

  @override
  String get yourReferralCode => 'మీ రిఫరల్ కోడ్';

  @override
  String get codeCopied => 'కోడ్ కాపీ చేయబడింది';

  @override
  String get shareEarn => 'పంచుకోండి & సంపాదించండి';

  @override
  String get haveAFriendSCode => 'మీ స్నేహితుడి కోడ్ ఉందా?';

  @override
  String get enterReferralCode => 'రిఫరల్ కోడ్‌ను నమోదు చేయండి';

  @override
  String get aReferralCodeIsAppliedTo =>
      'మీ ఖాతాకు ఒక రిఫరల్ కోడ్ వర్తింపజేయబడుతుంది.';

  @override
  String get feedbackSubmitted => 'సమర్పించిన అభిప్రాయం';

  @override
  String get feedback => 'అభిప్రాయం';

  @override
  String get applicationSubmitted => 'దరఖాస్తు సమర్పించబడింది';

  @override
  String get astrologerRegistration => 'జ్యోతిష్య నమోదు';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return '$appName లో జ్యోతిష్యుడిగా చేరండి';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'మీ గురించి మాకు తెలియజేయండి — మా బృందం సమీక్షించి మిమ్మల్ని సంప్రదిస్తుంది.';

  @override
  String get aboutUs => 'మా గురించి';

  @override
  String rudraganga(String appName) {
    return '$appName';
  }

  @override
  String get astrologyWellness => 'జ్యోతిష్యం & ఆరోగ్యం';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · భక్తితో తయారు చేయబడింది';

  @override
  String get thanksForYourRating => 'మీ రేటింగ్‌కు ధన్యవాదాలు!';

  @override
  String rateRudraganga(String appName) {
    return 'రేటింగ్ $appName';
  }

  @override
  String get howIsYourExperience => 'మీ అనుభవం ఎలా ఉంది?';

  @override
  String get writeAReviewOptional => 'సమీక్ష రాయండి (ఐచ్ఛికం)';

  @override
  String get saved => 'సేవ్ చేయబడింది';

  @override
  String get notificationSetting => 'నోటిఫికేషన్ సెట్టింగ్';

  @override
  String get howOften => 'ఎంత తరచుగా?';

  @override
  String get topicsYouCareAbout => 'మీరు శ్రద్ధ వహించే అంశాలు';

  @override
  String get ok => 'సరే';

  @override
  String get allSet => 'అంతా సిద్ధం ✨';

  @override
  String get setPreferences => 'ప్రాధాన్యతలను సెట్ చేయండి';

  @override
  String get save => 'సేవ్ చేయండి';

  @override
  String get bundlesCombos => 'బండిల్స్ & కాంబోలు';

  @override
  String get noCombosRightNow => 'ప్రస్తుతానికి కాంబోలు లేవు';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'కాంబోను జోడించండి · ₹$bundlePrice';
  }

  @override
  String get cart => 'బండి';

  @override
  String get clear => 'స్పష్టం';

  @override
  String get yourCartIsEmpty => 'మీ కార్ట్ ఖాళీగా ఉంది';

  @override
  String get browseProductsAndAddThemHere =>
      'ఉత్పత్తులను బ్రౌజ్ చేసి, వాటిని ఇక్కడ జోడించండి';

  @override
  String walletBalanceAddTotalBalanceTo(Object balance, Object balance2) {
    return 'వాలెట్ ₹$balance · చెక్అవుట్‌కు ₹$balance2 జోడించండి';
  }

  @override
  String walletBalance(Object balance) {
    return 'వాలెట్: ₹$balance';
  }

  @override
  String couponTrimmedAppliedResDiscountOff(Object trimmed, Object discount) {
    return 'కూపన్ $trimmed వర్తింపజేయబడింది · ₹$discount తగ్గింపు';
  }

  @override
  String get pleaseAddADeliveryAddress => 'దయచేసి డెలివరీ చిరునామాను జోడించండి';

  @override
  String get checkout => 'చెక్అవుట్';

  @override
  String get addNewAddress => 'కొత్త చిరునామాను జోడించండి';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code వర్తింపజేయబడింది · ₹$discount తగ్గింపు';
  }

  @override
  String get remove => 'తొలగించండి';

  @override
  String get enterCouponCode => 'కూపన్ కోడ్‌ను నమోదు చేయండి';

  @override
  String viewAllCouponsLength(Object length) {
    return 'అన్నింటినీ చూడండి ($length)';
  }

  @override
  String get availableOffers => 'అందుబాటులో ఉన్న ఆఫర్లు';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'కనీస ఆర్డర్ ₹$minOrderValue';
  }

  @override
  String get applied => 'దరఖాస్తు చేయబడింది';

  @override
  String get nothingToCheckout => 'చూడటానికి ఏమీ లేదు';

  @override
  String get orderPlaced => 'ఆర్డర్ ఇచ్చేసాను!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return 'మీ వాలెట్ నుండి ₹$total చెల్లించబడింది. మీ ఆర్డర్ నిర్ధారించబడింది మరియు త్వరలో పంపబడుతుంది.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'ఆర్డర్ #$orderId';
  }

  @override
  String get continueShopping => 'షాపింగ్ కొనసాగించండి';

  @override
  String get yourOrders => 'మీ ఆర్డర్లు';

  @override
  String get noOrdersYet => 'ఇంకా ఆర్డర్లు రాలేదు';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'మీరు స్టోర్ నుండి ఏదైనా కొనుగోలు చేసిన తర్వాత మీ ఆర్డర్‌లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'ఇన్‌వాయిస్ ఇంకా రూపొందించబడుతోంది. కొద్దిసేపటి తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String get couldNotOpenTheInvoice => 'ఇన్‌వాయిస్‌ను తెరవలేకపోయాను';

  @override
  String get thanksOurTeamWillReachOut =>
      'ధన్యవాదాలు! ఈ ఆర్డర్ గురించి మా బృందం మిమ్మల్ని సంప్రదిస్తుంది.';

  @override
  String get orderDetails => 'ఆర్డర్ వివరాలు';

  @override
  String get needHelp => 'సహాయం కావాలి';

  @override
  String get needHelpWithThisOrder => 'ఈ ఆర్డర్ విషయంలో సహాయం కావాలా?';

  @override
  String placedOnDate(Object date) {
    return '$dateలో ఉంచబడింది';
  }

  @override
  String get invoice => 'ఇన్‌వాయిస్';

  @override
  String get download => 'డౌన్‌లోడ్';

  @override
  String get needHelp2 => 'సహాయం కావాలి';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'ఆర్డర్ #$orderNo';
  }

  @override
  String get whatWentWrong => 'ఏం తప్పు జరిగింది?';

  @override
  String get describeTheIssue => 'సమస్యను వివరించండి';

  @override
  String get tellUsWhatHappenedSoWe =>
      'ఏం జరిగిందో మాకు చెప్పండి, అప్పుడు మేము సహాయం చేయగలం…';

  @override
  String get submitRequest => 'అభ్యర్థనను సమర్పించండి';

  @override
  String get addedToCart => 'కార్ట్‌కు జోడించబడింది';

  @override
  String get productUnavailable => 'ఉత్పత్తి అందుబాటులో లేదు';

  @override
  String pDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% తగ్గింపు';
  }

  @override
  String pReviewcountReviews(Object reviewCount) {
    return '$reviewCount సమీక్షలు';
  }

  @override
  String pDiscountpercentOff2(Object discountPercent) {
    return '$discountPercent% తగ్గింపు';
  }

  @override
  String get fewItemsLeft => 'కొన్ని వస్తువులు మిగిలి ఉన్నాయి';

  @override
  String get description => 'వివరణ';

  @override
  String get frequentlyBoughtTogether => 'తరచుగా కలిపి కొనుగోలు చేయబడినవి';

  @override
  String get viewAll => 'అన్నింటినీ చూడండి';

  @override
  String get addToCart => 'కార్ట్‌కు జోడించండి';

  @override
  String get buyNow => 'ఇప్పుడే కొనండి';

  @override
  String get searchProducts => 'ఉత్పత్తులను శోధించండి…';

  @override
  String get noProductsFound => 'ఉత్పత్తులు ఏవీ కనుగొనబడలేదు';

  @override
  String get priceRange => 'ధరల శ్రేణి (₹)';

  @override
  String get min => 'మిన్';

  @override
  String get max => 'మాక్స్';

  @override
  String get inStockOnly => 'స్టాక్‌లో మాత్రమే';

  @override
  String get sortBy => 'క్రమబద్ధీకరించు';

  @override
  String get addDeliveryAddress => 'డెలివరీ చిరునామాను జోడించండి';

  @override
  String get setAsDefaultAddress => 'డిఫాల్ట్ చిరునామాగా సెట్ చేయండి';

  @override
  String get saveAddress => 'చిరునామాను సేవ్ చేయండి';

  @override
  String codeCouponCode(Object code) {
    return 'కోడ్ $code';
  }

  @override
  String saveBundleYousave(Object youSave) {
    return '₹$youSave ఆదా చేసుకోండి';
  }

  @override
  String bundleProductsLengthItemsCombo(Object length) {
    return '$length ఐటమ్స్ కాంబో';
  }

  @override
  String bundleDiscountpercentOff(Object discountPercent) {
    return '$discountPercent% తగ్గింపు';
  }

  @override
  String get fewLeft => 'కొద్ది మంది మిగిలారు';

  @override
  String savePSaveamount(Object saveAmount) {
    return '₹$saveAmount ఆదా చేసుకోండి';
  }

  @override
  String get freeDelivery => 'ఉచిత డెలివరీ';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'శోధన $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'ఇక్కడ ఇంకా ఏమీ లేదు';

  @override
  String get loadingSecurePayment => 'సురక్షిత చెల్లింపు లోడ్ అవుతోంది…';

  @override
  String get couldNotStartRecharge => 'రీఛార్జ్ ప్రారంభించలేకపోయింది';

  @override
  String get paymentSuccessful => 'చెల్లింపు విజయవంతమైంది 🎉';

  @override
  String get paymentWasNotCompleted => 'చెల్లింపు పూర్తి కాలేదు';

  @override
  String get couldNotStartRechargeTryAgain =>
      'రీఛార్జ్ ప్రారంభించలేకపోయాము, మళ్ళీ ప్రయత్నించండి';

  @override
  String get wallet => 'వాలెట్';

  @override
  String get availableBalance => 'అందుబాటులో ఉన్న బ్యాలెన్స్';

  @override
  String get useItForPoojasConsultations =>
      'పూజలు మరియు సంప్రదింపుల కోసం దీనిని ఉపయోగించండి';

  @override
  String get instantTopUp => 'తక్షణ టాప్-అప్';

  @override
  String get noRechargePacksAvailableRightNow =>
      'ప్రస్తుతం రీఛార్జ్ ప్యాక్‌లు అందుబాటులో లేవు.';

  @override
  String get transactions => 'లావాదేవీలు';

  @override
  String get endOfTransactions => 'లావాదేవీల ముగింపు';

  @override
  String get youGet => 'మీకు లభిస్తుంది';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus బోనస్';
  }

  @override
  String payPackAmount(Object amount) {
    return '₹$amount చెల్లించండి';
  }

  @override
  String get rudra => 'ఆస్ట్రో';

  @override
  String get ganga => 'యాప్';

  @override
  String get about => 'గురించి';

  @override
  String get astrologer => 'జ్యోతిష్యుడు';

  @override
  String get seeker => 'సీకర్';

  @override
  String get free => 'ఉచితం';

  @override
  String get jan => 'జనవరి';

  @override
  String get feb => 'ఫిబ్రవరి';

  @override
  String get mar => 'మార్';

  @override
  String get apr => 'ఏప్రిల్';

  @override
  String get may => 'మే';

  @override
  String get jun => 'జూన్';

  @override
  String get jul => 'జూలై';

  @override
  String get aug => 'ఆగస్టు';

  @override
  String get sep => 'సెప్టెంబర్';

  @override
  String get oct => 'అక్టోబర్';

  @override
  String get nov => 'నవంబర్';

  @override
  String get dec => 'డిసెంబర్';

  @override
  String get english => 'ఇంగ్లీష్';

  @override
  String get all => 'అన్నీ';

  @override
  String get vedic => 'వేద';

  @override
  String get tarot => 'టారో';

  @override
  String get numerology => 'సంఖ్యాశాస్త్రం';

  @override
  String get vastu => 'వాస్తు';

  @override
  String get palmistry => 'హస్తసాముద్రికం';

  @override
  String get kp => 'కేపీ';

  @override
  String get love => 'ప్రేమ';

  @override
  String get taraAi => 'తారా AI';

  @override
  String get instantVedicAnswers247 => 'తక్షణ వేద సమాధానాలు • 24×7';

  @override
  String get allLanguages => 'అన్ని భాషలు';

  @override
  String get jyotiAi => 'జ్యోతి ఏఐ';

  @override
  String get loveCareerGuidance => 'ప్రేమ మరియు కెరీర్ మార్గదర్శకత్వం';

  @override
  String get hindiEnglish => 'హిందీ, ఇంగ్లీష్';

  @override
  String get veduAi => 'వేదు AI';

  @override
  String get remediesPredictions => 'నివారణలు & అంచనాలు';

  @override
  String get couldNotLoadAstrologers => 'జ్యోతిష్యులను లోడ్ చేయలేకపోయారు';

  @override
  String get aiAstrologers => 'AI జ్యోతిష్యులు';

  @override
  String get featuredAstrologers => 'ప్రముఖ జ్యోతిష్యులు';

  @override
  String get astrologers => 'జ్యోతిష్యులు';

  @override
  String get searchAiAstrologers => 'AI జ్యోతిష్యుల కోసం వెతకండి…';

  @override
  String get searchAstrologersByName => 'పేరు ద్వారా జ్యోతిష్యులను వెతకండి…';

  @override
  String get aiChat => 'AI చాట్';

  @override
  String get noAstrologersMatch => 'ఏ జ్యోతిష్యులు సరిపోలరు';

  @override
  String get noAstrologersYet => 'ఇంకా జ్యోతిష్యులు లేరు';

  @override
  String get couldnTSetTheReminderPlease =>
      'రిమైండర్‌ను సెట్ చేయలేకపోయాము. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get ai => 'AI';

  @override
  String get live2 => 'ప్రత్యక్ష ప్రసారం';

  @override
  String get online => 'ఆన్‌లైన్';

  @override
  String get busy => 'బిజీగా';

  @override
  String get offline => 'ఆఫ్‌లైన్';

  @override
  String get chat => 'చాట్';

  @override
  String get call => 'కాల్';

  @override
  String get video => 'వీడియో';

  @override
  String get notEnoughBalanceToStartPlease =>
      'ప్రారంభించడానికి సరిపడా బ్యాలెన్స్ లేదు. దయచేసి రీఛార్జ్ చేయండి.';

  @override
  String get couldNotStartTheConsultationPlease =>
      'సంప్రదింపును ప్రారంభించలేకపోయాము. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get share => 'పంచుకోండి';

  @override
  String get follow => 'అనుసరించండి';

  @override
  String get chats => 'చాట్‌లు';

  @override
  String get calls => 'కాల్స్';

  @override
  String get videos => 'వీడియోలు';

  @override
  String get gifts => 'బహుమతులు';

  @override
  String get languages => 'భాషలు';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'వారు వేలాది మంది అన్వేషకులకు వృత్తి, వివాహం, ఆర్థికం మరియు జీవిత మార్గానికి సంబంధించిన ప్రశ్నల విషయంలో మార్గనిర్దేశం చేశారు.';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'వారి వ్యాఖ్యానాలు సాంప్రదాయ వేద సూత్రాలను ఆచరణాత్మక, కరుణామయ మార్గదర్శకత్వంతో మిళితం చేస్తాయి — మీకు సహాయపడతాయి';

  @override
  String get findClarityAndActionableRemediesFor =>
      'ముందున్న మార్గానికి స్పష్టతను మరియు ఆచరణీయమైన పరిష్కారాలను కనుగొనండి.';

  @override
  String get giftsReceived => 'బహుమతులు అందుకున్నారు';

  @override
  String get reviews => 'సమీక్షలు';

  @override
  String get weLlNotifyYouTheMoment =>
      'వారు ఖాళీ అయిన వెంటనే మేము మీకు తెలియజేస్తాము.';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'వారు ఆన్‌లైన్‌లోకి వచ్చిన వెంటనే మేము మీకు తెలియజేస్తాము.';

  @override
  String get getAHeadsUpTheMoment =>
      'అవి అందుబాటులోకి వచ్చిన వెంటనే సమాచారం పొందండి.';

  @override
  String get couldNotLoadThisStore => 'ఈ స్టోర్‌ను లోడ్ చేయలేకపోయింది';

  @override
  String get products => 'ఉత్పత్తులు';

  @override
  String get poojas => 'పూజలు';

  @override
  String get book => 'పుస్తకం';

  @override
  String get buy => 'కొనండి';

  @override
  String get lalKitab => 'లాల్ కితాబ్';

  @override
  String get hindi => 'హిందీ';

  @override
  String get bengali => 'బెంగాలీ';

  @override
  String get tamil => 'తమిళం';

  @override
  String get marathi => 'మరాఠీ';

  @override
  String get punjabi => 'పంజాబీ';

  @override
  String get telugu => 'తెలుగు';

  @override
  String get expertise => 'నైపుణ్యం';

  @override
  String get couldNotLoadGifts => 'బహుమతులను లోడ్ చేయలేకపోయారు';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'బ్యాలెన్స్ సరిపోలేదు. బహుమతులు పంపడానికి డబ్బు జోడించండి.';

  @override
  String get couldNotSendTheGiftPlease =>
      'బహుమతిని పంపలేకపోయాము. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get connecting2 => 'కనెక్ట్ అవుతోంది…';

  @override
  String get couldNotLoadThisChatHistory =>
      'ఈ చాట్ హిస్టరీని లోడ్ చేయలేకపోయింది';

  @override
  String get thisChatHistoryIsNoLonger =>
      'ఈ చాట్ హిస్టరీ ఇకపై అందుబాటులో లేదు\n\n(చాట్‌లు 7 రోజుల పాటు భద్రపరచబడతాయి).';

  @override
  String get dailyFor14Days => 'ప్రతిరోజూ · 14 రోజుల పాటు';

  @override
  String get dailyMantra => 'రోజువారీ మంత్రం';

  @override
  String get reminder => 'రిమైండర్';

  @override
  String get audio => 'ఆడియో';

  @override
  String get couldNotLoadYourConsultations =>
      'మీ సంప్రదింపులను లోడ్ చేయలేకపోయాము';

  @override
  String get missed => 'తప్పిపోయింది';

  @override
  String get declined => 'తిరస్కరించారు';

  @override
  String get cancelled => 'రద్దు చేయబడింది';

  @override
  String get lowBalance => 'తక్కువ బ్యాలెన్స్';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'మీ సంప్రదింపును కొనసాగించడానికి ఇప్పుడే రీఛార్జ్ చేసుకోండి. మీరు చెల్లిస్తున్నంత సేపు మీ చాట్ తెరిచి ఉంటుంది.';

  @override
  String get sessionEndedLowBalance =>
      'మీ బ్యాలెన్స్ అయిపోయింది, కాబట్టి సంప్రదింపు ముగిసింది. ఎప్పుడైనా కొనసాగించడానికి రీఛార్జ్ చేసుకోండి.';

  @override
  String get couldNotLoadHoroscope =>
      'జాతకాన్ని లోడ్ చేయలేకపోయాము. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get chooseSign => 'మార్పు సంకేతం';

  @override
  String get yesterday => 'నిన్న';

  @override
  String get today => 'ఈరోజు';

  @override
  String get tomorrow => 'రేపు';

  @override
  String get totalScore => 'మొత్తం స్కోరు';

  @override
  String get luckyColor => 'అదృష్ట రంగు';

  @override
  String get luckyNumber => 'అదృష్ట సంఖ్య';

  @override
  String get lifeAreas => 'జీవిత రంగాలు';

  @override
  String get todaysReading => 'నేటి పఠనం';

  @override
  String get career => 'కెరీర్';

  @override
  String get finances => 'ఆర్థిక';

  @override
  String get health => 'ఆరోగ్యం';

  @override
  String get relationship => 'సంబంధం';

  @override
  String get family => 'కుటుంబం';

  @override
  String get friends => 'స్నేహితులు';

  @override
  String get travel => 'ప్రయాణం';

  @override
  String get physique => 'శరీరాకృతి';

  @override
  String get statusLabel => 'స్థితి';

  @override
  String get signAries => 'మేషరాశి';

  @override
  String get signTaurus => 'వృషభ రాశి';

  @override
  String get signGemini => 'మిథునం';

  @override
  String get signCancer => 'క్యాన్సర్';

  @override
  String get signLeo => 'లియో';

  @override
  String get signVirgo => 'కన్యారాశి';

  @override
  String get signLibra => 'తులారాశి';

  @override
  String get signScorpio => 'వృశ్చికం';

  @override
  String get signSagittarius => 'ధనుస్సు రాశి';

  @override
  String get signCapricorn => 'మకర రాశి';

  @override
  String get signAquarius => 'కుంభరాశి';

  @override
  String get signPisces => 'మీన రాశి';

  @override
  String get couldNotLoadPanchang =>
      'పంచాంగం లోడ్ కాలేదు. దయచేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get tithi => 'తిథి';

  @override
  String get nakshatra => 'నక్షత్రం';

  @override
  String get yoga => 'యోగా';

  @override
  String get karana => 'కరణ';

  @override
  String get weekday => 'వారపు రోజు';

  @override
  String get inauspiciousTimes => 'అశుభ సమయాలు';

  @override
  String get rahuKaal => 'రాహు కాలం';

  @override
  String get gulikaKaal => 'గుళిక కాల్';

  @override
  String get yamaganda => 'యమగండ';

  @override
  String get duration => 'వ్యవధి';

  @override
  String get coinsUsed => 'ఉపయోగించిన నాణేలు';

  @override
  String get guest => 'అతిథి';

  @override
  String get changeLanguage => 'భాషను మార్చండి';

  @override
  String get chooseYourKundli => 'మీ కుండలిని ఎంచుకోండి';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'మీ వాలెట్, రీడింగ్‌లు మరియు సేవ్ చేసిన వివరాలు సురక్షితంగా ఉంటాయి — కానీ లాగ్ అవుట్ చేస్తే మీ రోజువారీ జాతకం, ఆఫర్‌లు మరియు రిమైండర్‌లను కోల్పోతారు. నక్షత్రాలతో అనుసంధానమై ఉండండి? ✨';

  @override
  String get offers => 'ఆఫర్లు';

  @override
  String get dailyPanchang => 'రోజువారీ పంచాంగం';

  @override
  String get talkToAstrologer => 'జ్యోతిష్యుడితో మాట్లాడండి';

  @override
  String get brihatKundli => 'బృహత్ కుండలి';

  @override
  String get dailyNotes => 'రోజువారీ గమనికలు';

  @override
  String get askAQuestion => 'ప్రశ్న అడగండి';

  @override
  String get free50Pages => '50+ పేజీలు ఉచితం';

  @override
  String get freeReport => 'ఉచిత నివేదిక';

  @override
  String get freeMatrimony => 'ఉచిత వివాహం';

  @override
  String get matrimony => 'వివాహం';

  @override
  String get loveMatch => 'ప్రేమ మ్యాచ్';

  @override
  String get horoscope => 'జాతకం';

  @override
  String get dailyHoroscope => 'రోజువారీ జాతకం';

  @override
  String get vedicAstrology => 'వేద జ్యోతిష్యం';

  @override
  String get acharyaVeda => 'ఆచార్య వేదం';

  @override
  String get panditRohan => 'పండిట్ రోహన్';

  @override
  String get guruMaya => 'గురు మాయ';

  @override
  String get jayaShastri => 'జయ శాస్త్రి';

  @override
  String get devSharma => 'దేవ్ శర్మ';

  @override
  String get sureshG => 'సురేష్ జి.';

  @override
  String get lataP => 'లతా పి.';

  @override
  String get kiranB => 'కిరణ్ బి.';

  @override
  String get mohanT => 'మోహన్ టి.';

  @override
  String get anilJoshi => 'అనిల్ జోషి';

  @override
  String get meeraDevi => 'మీరా దేవి';

  @override
  String get raviKumar => 'రవి కుమార్';

  @override
  String get sunitaRao => 'సునీత రావు';

  @override
  String get bengaluruKarnataka => 'బెంగళూరు, కర్ణాటక';

  @override
  String get locating => 'గుర్తించడం…';

  @override
  String get festivalOffer => 'పండుగ ఆఫర్';

  @override
  String get upTo30OffOnGemstones => 'రత్నాలపై 30% వరకు తగ్గింపు';

  @override
  String get talkToTopAstrologers => 'ప్రముఖ జ్యోతిష్యులతో మాట్లాడండి';

  @override
  String get firstConsultationSpecial => 'మొదటి సంప్రదింపు ప్రత్యేకం';

  @override
  String get rudrakshaCollection => 'రుద్రాక్ష సేకరణ';

  @override
  String get authenticEnergised => 'ప్రామాణికమైన మరియు శక్తివంతమైన';

  @override
  String get resumeSession => 'సెషన్‌ను పునఃప్రారంభించండి';

  @override
  String get home => 'హోమ్';

  @override
  String get aiAstro => 'AI ఆస్ట్రో';

  @override
  String get ask => 'అడగండి';

  @override
  String get history => 'చరిత్ర';

  @override
  String get seeAll2 => 'అన్నీ చూడండి';

  @override
  String get s1AcceptanceOfTheseTerms => '1. ఈ నిబంధనల అంగీకారం';

  @override
  String get termsOfService2 => 'సేవా నిబంధనలు';

  @override
  String get lastUpdated26June2026 => 'చివరి నవీకరణ: 26 జూన్ 2026';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appName మార్గదర్శనం మరియు వ్యక్తిగత సహాయం కోసం జ్యోతిష్యం, ఆధ్యాత్మిక మరియు ఆరోగ్య సంప్రదింపులను అందిస్తుంది';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'ఇది కేవలం ప్రతిబింబం మాత్రమే. మా సేవలు వృత్తిపరమైన వైద్య, చట్టపరమైన, ఆర్థిక సేవలకు ప్రత్యామ్నాయం కాదు.';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'లేదా మానసిక సలహా. ఈ యాప్‌ను ఉపయోగించడానికి మీకు 18 ఏళ్లు లేదా అంతకంటే ఎక్కువ వయస్సు ఉండాలి.';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'ఖాతాను సృష్టించడం ద్వారా లేదా $appName మొబైల్ అప్లికేషన్ మరియు సంబంధిత సేవలను ఉపయోగించడం ద్వారా (';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '“సేవలు”), మీరు ఈ సేవా నిబంధనలు మరియు మా గోప్యతా విధానం మరియు వాపసు నిబంధనలకు కట్టుబడి ఉంటారని అంగీకరిస్తున్నారు.';

  @override
  String get policyIfYouDoNotAgree =>
      'విధానం. మీరు అంగీకరించకపోతే, దయచేసి సేవలను ఉపయోగించవద్దు.';

  @override
  String get s2EligibilityYourAccount => '2. అర్హత & మీ ఖాతా';

  @override
  String get youMustBeAtLeast18 =>
      'మీకు కనీసం 18 సంవత్సరాల వయస్సు ఉండాలి మరియు చట్టబద్ధంగా ఒప్పందం చేసుకోగల సామర్థ్యం ఉండాలి.';

  @override
  String get youRegisterWithAPhoneNumber =>
      'మీరు వన్-టైమ్ పాస్‌వర్డ్ (OTP) ద్వారా ధృవీకరించబడిన ఫోన్ నంబర్‌తో నమోదు చేసుకుంటారు. ఆ నంబర్ మరియు పరికరానికి యాక్సెస్‌ను సురక్షితంగా ఉంచాల్సిన బాధ్యత మీదే.';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'మీరు జాతకం కోసం పంచుకోవాలని ఎంచుకున్న చోట, పుట్టిన వివరాలతో సహా ఖచ్చితమైన సమాచారాన్ని అందించడానికి అంగీకరిస్తున్నారు. మీ ఖాతా కింద జరిగే అన్ని కార్యకలాపాలకు మీరే బాధ్యులు.';

  @override
  String get s3TheServicesWeOffer => '3. మేము అందించే సేవలు';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appName ఆడియో కాల్, వీడియో కాల్ ద్వారా సంప్రదింపుల కోసం ధృవీకరించబడిన జ్యోతిష్యులతో మిమ్మల్ని కలుపుతుంది,';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'మరియు చాట్, మరియు కుండలి జనరేషన్ మరియు మ్యాచింగ్, ఒక AI జ్యోతిష్కుడు వంటి సంబంధిత ఫీచర్లను అందిస్తుంది,';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'రోజువారీ జాతకాలు, పూజా బుకింగ్‌లు, ఆధ్యాత్మిక ఉత్పత్తుల దుకాణం, బహుమతులు మరియు వివాహ సంబంధాలు కుదర్చడం.';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'ఏదైనా సదుపాయం లేదా జ్యోతిష్యుని లభ్యత ఎప్పుడైనా మారవచ్చు.';

  @override
  String get s4WalletPricingBilling => '4. వాలెట్, ధర నిర్ణయం & బిల్లింగ్';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'సంప్రదింపులకు ముందుగానే చెల్లించాలి. మీరు కనెక్ట్ అవ్వడానికి ముందు, యాప్‌లోని వాలెట్‌కు నిధులను జోడించి, జ్యోతిష్యుడు మరియు సేవ కోసం చూపిన రేటు ప్రకారం నిమిషానికి చెల్లించాలి.';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'జ్యోతిష్యుడు అంగీకరించి, సెషన్ కనెక్ట్ అయినప్పుడు బిల్లింగ్ ప్రారంభమవుతుంది. కనెక్ట్ అయినప్పుడు మొదటి నిమిషానికి ఛార్జ్ చేయబడుతుంది, ఆ తర్వాత ప్రతి నిమిషానికి దాని ప్రారంభంలోనే ఛార్జ్ చేయబడుతుంది. సెషన్ సమయంలో లైవ్ మీటర్ చూపబడుతుంది మరియు మీ బ్యాలెన్స్ తక్కువగా ఉంటే సెషన్ ఆటోమేటిక్‌గా ముగుస్తుంది.';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'చెల్లింపులు మా చెల్లింపు భాగస్వామి (PayU) ద్వారా ప్రాసెస్ చేయబడతాయి. మేము పూర్తి కార్డ్ వివరాలను నిల్వ చేయము.';

  @override
  String get walletBalancesAreForUseWithin =>
      'వాలెట్ బ్యాలెన్స్‌లు సేవలలో ఉపయోగించడం కోసం ఉద్దేశించబడ్డాయి. వర్తించే చోట, వాపసులు మా వాపసు విధానం ద్వారా నియంత్రించబడతాయి.';

  @override
  String get pricesAreInIndianRupeesInr =>
      'ధరలు భారతీయ రూపాయలలో (INR) ఉన్నాయి మరియు వర్తించే పన్నులు కూడా చేర్చబడి ఉండవచ్చు.';

  @override
  String get s5AcceptableUse => '5. ఆమోదయోగ్యమైన ఉపయోగం';

  @override
  String get youAgreeNotTo =>
      'మీరు ఈ క్రింది వాటిని చేయకూడదని అంగీకరిస్తున్నారు:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'జ్యోతిష్యులను లేదా సిబ్బందిని వేధించడం, దుర్భాషలాడటం, బెదిరించడం లేదా లైంగికంగా అసభ్యకరమైన లేదా చట్టవిరుద్ధమైన విషయాలను పంచుకోవడం.';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'సేవను పొందడానికి లేదా వాపసు పొందడానికి ఏ వ్యక్తిగానైనా నటించడం లేదా తప్పుడు సమాచారం అందించడం.';

  @override
  String get attemptToTakeAConsultationOff =>
      'ఫీజులను తప్పించుకోవడానికి ప్లాట్‌ఫారమ్ వెలుపల సంప్రదింపులు జరపడానికి ప్రయత్నించడం, లేదా వ్యక్తిగత సంప్రదింపు వివరాలను అడగడం.';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'సేవలకు లేదా వాటి భద్రతకు ఆటంకం కలిగించడం, స్క్రాప్ చేయడం లేదా అంతరాయం కలిగించడానికి ప్రయత్నించడం.';

  @override
  String get s6AstrologersOnThePlatform => '6. ప్లాట్‌ఫారమ్‌లోని జ్యోతిష్యులు';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'జ్యోతిష్యులు స్వతంత్రంగా పనిచేసేవారు, వీరి గుర్తింపు ధృవీకరించబడి $appName ద్వారా ఆమోదించబడింది.';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'వారు సంప్రదింపులు అందించే ముందు. మేము నిర్దేశించిన పరిమితులలో వారు తమ నిమిషానికి ఛార్జీలను స్వయంగా నిర్ణయించుకుంటారు.';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'సంప్రదింపుల సమయంలో పంచుకునే అభిప్రాయాలు మరియు మార్గదర్శనం అనేవి ఆయా జ్యోతిష్యులవి మాత్రమే, వ్యక్తిగతమైనవి కావు.';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return '$appName. సంప్రదింపుల ఆధారంగా మీరు తీసుకునే ఏ నిర్ణయానికైనా మేము బాధ్యత వహించము.';
  }

  @override
  String get s7RecordingsContent => '7. రికార్డింగ్‌లు & కంటెంట్';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'నాణ్యత, భద్రత మరియు వివాద పరిష్కారం కోసం, ఆడియో మరియు వీడియో సంప్రదింపులు రికార్డ్ చేయబడవచ్చు.';

  @override
  String get consentToSuchRecordingByStarting =>
      'సెషన్‌ను ప్రారంభించడం ద్వారా అటువంటి రికార్డింగ్‌కు సమ్మతించండి. చాట్ సంభాషణలు భద్రపరచబడతాయి, తద్వారా మీరు వాటిని తిరిగి చూడవచ్చు.';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'వాటిని. ఈ డేటాను ఎలా నిర్వహిస్తామో తెలుసుకోవడానికి మా గోప్యతా విధానాన్ని చూడండి.';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. నిరాకరణ మరియు బాధ్యత పరిమితి';

  @override
  String get theServicesAreProvidedAsIs =>
      'ఈ సేవలు మార్గదర్శనం మరియు వినోదానికి దగ్గరగా ఉండే వ్యక్తిగత ఆత్మపరిశీలన కోసం ఉన్నవి ఉన్నట్లుగా అందించబడతాయి.';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return '$appName ఏ అంచనా లేదా నివారణ యొక్క ఖచ్చితత్వం గురించి ఎటువంటి హామీ ఇవ్వదు. గరిష్ట మేరకు';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'చట్టం ద్వారా అనుమతించబడిన, మీరు సేవలను ఉపయోగించడం వల్ల ఉత్పన్నమయ్యే $appName యొక్క మొత్తం బాధ్యత దీనికి పరిమితం చేయబడింది';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'క్లెయిమ్‌కు దారితీసిన సంఘటనకు 30 రోజుల ముందు మీరు మీ వాలెట్‌లో జమ చేసిన మొత్తం. మేము';

  @override
  String get areNotLiableForIndirectOr =>
      'పరోక్ష లేదా పర్యవసాన నష్టాలకు బాధ్యత వహించరు.';

  @override
  String get s9SuspensionTermination => '9. సస్పెన్షన్ & తొలగింపు';

  @override
  String get weMaySuspendOrTerminateYour =>
      'మీరు ఈ నిబంధనలను ఉల్లంఘించినా, మోసానికి ప్రయత్నించినా, లేదా దుర్వినియోగం చేసినా, మేము మీ ఖాతాను తాత్కాలికంగా నిలిపివేయవచ్చు లేదా రద్దు చేయవచ్చు.';

  @override
  String get servicesYouMayStopUsingThe =>
      'సేవలు. మీరు ఎప్పుడైనా సేవలను ఉపయోగించడం ఆపివేయవచ్చు. కొన్ని నిబంధనలు (చెల్లింపు బాధ్యతలు,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'నిరాకరణలు మరియు బాధ్యత పరిమితులు) రద్దు తర్వాత కూడా కొనసాగుతాయి.';

  @override
  String get s10ChangesToTheseTerms => '10. ఈ నిబంధనలకు మార్పులు';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'మేము ఈ నిబంధనలను ఎప్పటికప్పుడు నవీకరించవచ్చు. ముఖ్యమైన మార్పులు యాప్‌లో లేదా దీని ద్వారా తెలియజేయబడతాయి.';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'పైన ఉన్న “చివరిగా నవీకరించిన” తేదీని నవీకరిస్తున్నాము. మార్పుల తర్వాత కూడా దీనిని ఉపయోగించడం కొనసాగిస్తే, మీరు వాటిని అంగీకరించినట్లే.';

  @override
  String get s11ContactUs => '11. మమ్మల్ని సంప్రదించండి';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'ఈ నిబంధనల గురించి ప్రశ్నలు ఉన్నాయా? మా వెబ్‌సైట్‌లోని లేదా యాప్‌లోని సంప్రదింపు ఫారం ద్వారా మమ్మల్ని సంప్రదించండి.';

  @override
  String get helpSupportSection => 'సహాయం మరియు మద్దతు విభాగం.';

  @override
  String get privacyPolicy2 => 'గోప్యతా విధానం';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'మీ పుట్టిన వివరాలు, సంప్రదింపులు మరియు సంభాషణలు మీకు మాత్రమే వ్యక్తిగతమైనవి. ఈ విధానం మేము ఏమి చేస్తామో వివరిస్తుంది.';

  @override
  String get collectWhyAndTheControlYou =>
      'సేకరించడం, ఎందుకు, మరియు దానిపై మీకు ఉన్న నియంత్రణ.';

  @override
  String get s1InformationWeCollect => '1. మేము సేకరించే సమాచారం';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'ఖాతా సమాచారం: మీ పేరు, ఫోన్ నంబర్ (OTP ద్వారా ధృవీకరించబడినది), మరియు మీరు అందించినట్లయితే ఇమెయిల్.';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'జనన వివరాలు: కుండలి మరియు రీడింగ్‌ల కోసం మీరు పంచుకోవాలని ఎంచుకున్న పుట్టిన తేదీ, సమయం మరియు ప్రదేశం.';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'సంప్రదింపు డేటా: చాట్ సందేశాలు, మరియు వర్తించే చోట ఆడియో/వీడియో కాల్ రికార్డింగ్‌లు.';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'చెల్లింపు డేటా: వాలెట్ లావాదేవీలు మరియు చెల్లింపు రిఫరెన్స్‌లు. కార్డ్ వివరాలు మా చెల్లింపు భాగస్వామి (PayU) ద్వారా నిర్వహించబడతాయి; మేము పూర్తి కార్డ్ నంబర్‌లను నిల్వ చేయము.';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'సేవలను నిర్వహించడానికి మరియు మెరుగుపరచడానికి ఉపయోగించే పరికరం & వినియోగ డేటా: పరికరం రకం, ఆపరేటింగ్ సిస్టమ్, మీ IP చిరునామా నుండి పొందిన సుమారు స్థానం, సందర్శించిన పేజీలు మరియు పరస్పర చర్యలు.';

  @override
  String get s2HowWeUseIt => '2. మనం దానిని ఎలా ఉపయోగిస్తాము';

  @override
  String get toCreateAndSecureYourAccount =>
      'మీ ఖాతాను సృష్టించి, భద్రపరచుకోవడానికి మరియు మీ గుర్తింపును ధృవీకరించుకోవడానికి.';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'మిమ్మల్ని జ్యోతిష్యులతో అనుసంధానించి, సంప్రదింపులు, కుండలి, జాతకాలు మరియు ఇతర సేవలను అందించడం.';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'వాలెట్ రీఛార్జ్‌లు, నిమిషానికి బిల్లింగ్, చెల్లింపులు మరియు ఆర్డర్ నెరవేర్పును ప్రాసెస్ చేయడానికి.';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'మద్దతును అందించడం, మోసం మరియు దుర్వినియోగాన్ని నివారించడం, మరియు చట్టపరమైన బాధ్యతలను నెరవేర్చడం.';

  @override
  String get toUnderstandAndImproveHowThe =>
      'యాప్ మరియు వెబ్‌సైట్ ఎలా ఉపయోగించబడుతున్నాయో అర్థం చేసుకోవడానికి మరియు మెరుగుపరచడానికి.';

  @override
  String get s3WhenWeShareInformation => '3. మనం సమాచారాన్ని పంచుకున్నప్పుడు';

  @override
  String get weDoNotSellYourPersonal =>
      'మేము మీ వ్యక్తిగత సమాచారాన్ని అమ్మము. మేము దానిని ఈ క్రింది సందర్భాలలో మాత్రమే పంచుకుంటాము:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'మీరు సంప్రదించే జ్యోతిష్యునితో, జ్యోతిష్య పఠనానికి అవసరమైన వాటికే పరిమితమై ఉంటారు (ఉదాహరణకు మీ పుట్టిన వివరాలు మరియు జాతకం).';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'మా కార్యకలాపాలకు సహాయపడే సేవా ప్రదాతలతో — చెల్లింపుల ప్రాసెసింగ్ (PayU), క్లౌడ్ హోస్టింగ్ మరియు నిల్వ, కమ్యూనికేషన్లు (OTP కోసం WhatsApp/SMS), మరియు నోటిఫికేషన్‌లు — గోప్యతా బాధ్యతలకు లోబడి.';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'చట్టం ప్రకారం అవసరమైనప్పుడు, లేదా వినియోగదారుల హక్కులు, భద్రత మరియు ఆస్తిని రక్షించడానికి మరియు $appName.';
  }

  @override
  String get s4ConsultationRecordingsChats =>
      '4. సంప్రదింపుల రికార్డింగ్‌లు & చాట్‌లు';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'నాణ్యత, భద్రత మరియు ఇతర కారణాల దృష్ట్యా, ఆడియో మరియు వీడియో సంప్రదింపులు రికార్డ్ చేయబడవచ్చు మరియు చాట్‌లు భద్రపరచబడతాయి.';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'వివాద పరిష్కారం. మీరు యాప్‌లో మీ చాట్ హిస్టరీని సమీక్షించుకోవచ్చు. రికార్డింగ్‌లు ఈ విధంగా భద్రపరచబడతాయి.';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'క్రింద వివరించబడింది మరియు మద్దతు, భద్రత లేదా చట్టపరమైన కారణాల కోసం అవసరమైనప్పుడు మాత్రమే యాక్సెస్ చేయబడుతుంది.';

  @override
  String get s5AnalyticsCookies => '5. విశ్లేషణలు & కుకీలు';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'మా వెబ్‌సైట్ తిరిగి వచ్చే సందర్శనలను గుర్తించడానికి, మరియు సందర్శకులు ఎలా ఉన్నారో కొలవడానికి ఒక ఫస్ట్-పార్టీ కుకీ/ఐడెంటిఫయర్‌ను ఉపయోగిస్తుంది.';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'ల్యాండింగ్ పేజీ పనితీరు (ఉదాహరణకు ఏ విభాగాలపై క్లిక్ చేయబడింది), మరియు సైన్-అప్‌లను మార్కెటింగ్‌కు ఆపాదించడం.';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'ప్రచారాలు. అనుభవాన్ని మెరుగుపరచడానికి ఇది మొత్తంగా ఉపయోగించబడుతుంది. మేము సుమారుగా నగరం/ప్రాంతాన్ని పొందుతాము.';

  @override
  String get fromYourIpAddressWeDo =>
      'మీ IP చిరునామా నుండి; మేము విశ్లేషణల కోసం ఖచ్చితమైన GPS స్థానాన్ని ఉపయోగించము.';

  @override
  String get s6DataRetention => '6. డేటా నిలుపుదల';

  @override
  String get weKeepYourInformationForAs =>
      'మీ ఖాతా క్రియాశీలంగా ఉన్నంత కాలం మరియు సేవలను అందించడానికి అవసరమైనంత కాలం మేము మీ సమాచారాన్ని ఉంచుతాము.';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'సేవలు, చట్టపరమైన బాధ్యతలను పాటించడం, వివాదాలను పరిష్కరించడం మరియు మా ఒప్పందాలను అమలు చేయడం. మీరు';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'చట్టపరమైన నిలుపుదలకు లోబడి, మీ ఖాతా మరియు దానికి సంబంధించిన వ్యక్తిగత డేటాను తొలగించమని అభ్యర్థించండి';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'అవసరాలు (ఉదాహరణకు, అకౌంటింగ్ మరియు పన్ను కోసం మనం తప్పనిసరిగా ఉంచాల్సిన లావాదేవీల రికార్డులు).';

  @override
  String get s7Security => '7. భద్రత';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'మేము పరిశ్రమ-ప్రామాణిక చర్యలను ఉపయోగిస్తాము — ప్రసారంలో ఎన్‌క్రిప్షన్, యాక్సెస్ నియంత్రణలు మరియు భద్రత';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'మౌలిక సదుపాయాలు — మీ సమాచారాన్ని రక్షించడానికి. ప్రసారం లేదా నిల్వ చేసే ఏ పద్ధతి కూడా పూర్తిగా';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'సురక్షితం, కాబట్టి మేము సంపూర్ణ భద్రతకు హామీ ఇవ్వలేము.';

  @override
  String get s8YourRightsChoices => '8. మీ హక్కులు మరియు ఎంపికలు';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'యాప్‌లో మీ ప్రొఫైల్ మరియు పుట్టిన వివరాలను యాక్సెస్ చేయండి, సరిదిద్దండి లేదా అప్‌డేట్ చేయండి.';

  @override
  String get requestACopyOrDeletionOf =>
      'మమ్మల్ని సంప్రదించడం ద్వారా మీ వ్యక్తిగత డేటా కాపీని లేదా తొలగింపును అభ్యర్థించండి.';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'మీ పరికరం లేదా యాప్ సెట్టింగ్‌లలో ప్రచార నోటిఫికేషన్‌లను నిలిపివేయండి.';

  @override
  String get s9Children => '9. పిల్లలు';

  @override
  String get theServicesAreIntendedForUsers =>
      'ఈ సేవలు 18 ఏళ్లు మరియు అంతకంటే ఎక్కువ వయస్సు ఉన్న వినియోగదారుల కోసం ఉద్దేశించబడ్డాయి. మేము తెలిసి డేటాను సేకరించము.';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '18 ఏళ్లలోపు వారు ఎవరైనా. ఒక మైనర్ ఈ సేవలను ఉపయోగించారని మీరు భావిస్తే, దయచేసి మమ్మల్ని సంప్రదించండి, తద్వారా మేము దానిని తొలగించగలము.';

  @override
  String get s10ChangesToThisPolicy => '10. ఈ విధానంలో మార్పులు';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'మేము ఈ పాలసీని అప్‌డేట్ చేయవచ్చు. ముఖ్యమైన మార్పులు యాప్‌లో లేదా అప్‌డేట్ చేయడం ద్వారా తెలియజేయబడతాయి.';

  @override
  String get lastUpdatedDateAbove => 'పైన “చివరిగా నవీకరించబడిన” తేదీ.';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'గోప్యతా ప్రశ్నలు లేదా డేటా అభ్యర్థనల కోసం, మా వెబ్‌సైట్‌లోని సంప్రదింపు ఫారం ద్వారా లేదా మమ్మల్ని సంప్రదించండి.';

  @override
  String get appSHelpSupportSection => 'యాప్ యొక్క సహాయం & మద్దతు విభాగం.';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return '© 2026 $appName · 18+ · మార్గదర్శనం మరియు శ్రేయస్సు కోసం \n\nవృత్తిపరమైన సలహాకు ప్రత్యామ్నాయం కాదు.';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'వెడల్పు=పరికర-వెడల్పు, ప్రారంభ-స్కేల్=1, గరిష్ట-స్కేల్=1';

  @override
  String get segoeUi => 'సెగో UI';

  @override
  String get vote => 'ఓటు';

  @override
  String get couldnTLoadLiveSessions => 'లైవ్ సెషన్‌లను లోడ్ చేయలేకపోయాను';

  @override
  String get noOneIsLiveRightNow => 'ప్రస్తుతం ఎవరూ ప్రత్యక్ష ప్రసారంలో లేరు';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'జ్యోతిష్యుడు లైవ్‌లోకి వచ్చినప్పుడు, వారు ఇక్కడ కనిపిస్తారు. రిఫ్రెష్ చేయడానికి కిందకు లాగండి — లేదా నోటిఫికేషన్ కోసం చూడండి.';

  @override
  String get justNow => 'ఇప్పుడే';

  @override
  String get couldNotLoad => 'లోడ్ చేయలేకపోయింది';

  @override
  String get continueLabel => 'కొనసాగించండి';

  @override
  String get openSettings => 'సెట్టింగ్‌లను తెరవండి';

  @override
  String get somePermissionsAreBlockedTapA =>
      'కొన్ని అనుమతులు నిరోధించబడ్డాయి. నిరోధించబడిన అంశాన్ని ట్యాప్ చేయండి (లేదా “సెట్టింగ్‌లను తెరవండి”) మరియు దానిని ఎనేబుల్ చేసి, ఆపై ఇక్కడికి తిరిగి రండి.';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return '$appNameను ఉపయోగించడానికి ఈ అనుమతులు అవసరం. మంజూరు చేయడానికి పెండింగ్‌లో ఉన్న ఏదైనా అంశాన్ని ట్యాప్ చేయండి.';
  }

  @override
  String get settings2 => 'సెట్టింగ్‌లు';

  @override
  String get allow => 'అనుమతించు';

  @override
  String get blockedEnableItInSettings =>
      'నిరోధించబడింది — సెట్టింగ్స్‌లో ఎనేబుల్ చేయండి';

  @override
  String get allowsUpTo => 'వరకు అనుమతిస్తుంది';

  @override
  String get bookingFailed => 'బుకింగ్ విఫలమైంది';

  @override
  String get yourDetails => 'మీ వివరాలు';

  @override
  String get fromYourProfile => 'మీ ప్రొఫైల్ నుండి';

  @override
  String get familyMembers => 'కుటుంబ సభ్యులు';

  @override
  String get addMember => 'సభ్యుడిని జోడించండి';

  @override
  String get addAnother => 'మరొకటి జోడించండి';

  @override
  String get preferredDateOptional => 'ప్రాధాన్య తేదీ (ఐచ్ఛికం)';

  @override
  String get anyDate => 'ఏదైనా తేదీ';

  @override
  String get bookNowFree => 'ఇప్పుడే బుక్ చేసుకోండి (ఉచితం)';

  @override
  String get couldNotLoadThisPooja => 'ఈ పూజను లోడ్ చేయలేకపోయాను';

  @override
  String get forLabel => 'కోసం';

  @override
  String get s1Person => '1 వ్యక్తి';

  @override
  String get bookShareDetails => 'బుక్ చేయండి & వివరాలను పంచుకోండి';

  @override
  String get confirmYourBookingWithTheNames =>
      'పూజ ఎవరి పేర్లతో చేయబడుతుందో ఆ పేర్లతో మీ బుకింగ్‌ను నిర్ధారించండి.';

  @override
  String get panditCoordinates => 'పండిట్ కోఆర్డినేట్స్';

  @override
  String get aVerifiedPanditCallsToFix =>
      'ధృవీకరించబడిన పండిట్ సమయాన్ని నిర్ణయించడానికి మరియు సామాగ్రిని ఏర్పాటు చేయడానికి ఫోన్ చేస్తారు.';

  @override
  String get poojaPerformed => 'పూజ నిర్వహించబడింది';

  @override
  String get sankalpIsTakenInYourFamily =>
      'సంకల్పం మీ కుటుంబ సభ్యుల పేర్ల మీద తీసుకుంటారు, ఆ తర్వాత వర్తించే చోట ప్రసాదం పంచుతారు.';

  @override
  String get couldNotLoadPoojas => 'పూజలను లోడ్ చేయలేకపోయింది';

  @override
  String get any => 'ఏదైనా';

  @override
  String get noPoojasHere => 'ఇక్కడ పూజలు లేవు';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'ప్రస్తుత ఫిల్టర్‌లకు ఏదీ సరిపోలడం లేదు';

  @override
  String get noPoojasAvailableYet => 'ఇంకా పూజలు అందుబాటులో లేవు';

  @override
  String get showAllPoojas => 'అన్ని పూజలను చూపించు';

  @override
  String get tapToViewDetailsBook =>
      'వివరాలు చూడటానికి & బుక్ చేసుకోవడానికి నొక్కండి';

  @override
  String get appliedYouBothEarnOnYour =>
      'వర్తింపజేయబడింది! మీరిద్దరూ మీ మొదటి రీఛార్జ్‌పై పొందుతారు.';

  @override
  String get shareYourCode => 'మీ కోడ్‌ను పంచుకోండి';

  @override
  String get sendYourCodeToFriendsVia =>
      'మీ కోడ్‌ను స్నేహితులకు వాట్సాప్, SMS ద్వారా ఎక్కడికైనా పంపండి.';

  @override
  String get friendSignsUp => 'స్నేహితుడు సైన్ అప్ చేస్తాడు';

  @override
  String get theyEnterYourCodeInRefer =>
      'వారు సైన్ అప్ చేసిన తర్వాత రిఫర్ & ఎర్న్‌లో మీ కోడ్‌ను నమోదు చేస్తారు.';

  @override
  String get feedbackReceived => 'అభిప్రాయం అందింది ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'ధన్యవాదాలు — మా బృందం దీనిని పరిశీలిస్తుంది.';

  @override
  String get fullName => 'పూర్తి పేరు';

  @override
  String get email => 'ఇమెయిల్';

  @override
  String get phoneNumber => 'ఫోన్ నంబర్';

  @override
  String get message => 'సందేశం';

  @override
  String get requiredLabel => 'అవసరం';

  @override
  String get applicationReceived => 'దరఖాస్తు స్వీకరించబడింది ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'మీ జ్యోతిష్య ప్రొఫైల్ గురించి మా బృందం మిమ్మల్ని సంప్రదిస్తుంది.';

  @override
  String get enter10Digits => '10 అంకెలను నమోదు చేయండి';

  @override
  String get aboutYouBioExpertiseExperience =>
      'మీ గురించి (జీవిత చరిత్ర, నైపుణ్యం, అనుభవం)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appName కెరీర్ మార్గదర్శనం కోసం మిమ్మల్ని విశ్వసనీయ వేద జ్యోతిష్యులతో కలుపుతుంది,';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'వివాహం, ఆర్థికం, ఆరోగ్యం మరియు జీవితంలోని పెద్ద ప్రశ్నలు — చాట్, కాల్ మరియు వీడియో ద్వారా.';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'మీ ఉచిత కుండలి, రోజువారీ జాతకం, వివాహ పొంతన, పూజలు మరియు పరిహారాలు, అన్నీ ఒకే చోట పొందండి.\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'ప్రామాణికమైన, కరుణామయమైన ఆధ్యాత్మిక మార్గదర్శకత్వాన్ని ప్రతి ఒక్కరికీ అందుబాటులోకి తీసుకురావడమే మా లక్ష్యం.';

  @override
  String get inYourOwnLanguage => 'మీ స్వంత భాషలో.';

  @override
  String get verifiedExperiencedAstrologers =>
      'ధృవీకరించబడిన, అనుభవజ్ఞులైన జ్యోతిష్యులు';

  @override
  String get privateSecureConsultations =>
      'ప్రైవేట్ & సురక్షితమైన సంప్రదింపులు';

  @override
  String get availableIn6IndianLanguages => '6 భారతీయ భాషలలో అందుబాటులో ఉంది';

  @override
  String get thanksForRatingUs => 'మాకు రేటింగ్ ఇచ్చినందుకు ధన్యవాదాలు ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'మీ అభిప్రాయం $appName అభివృద్ధికి సహాయపడుతుంది.';
  }

  @override
  String get onceInADay => 'రోజులో ఒకసారి';

  @override
  String get twiceInADay => 'రోజుకు రెండుసార్లు';

  @override
  String get asManyTimesAsItComes => 'అది ఎన్నిసార్లు వచ్చినా';

  @override
  String get never => 'ఎప్పుడూ';

  @override
  String get cricket => 'క్రికెట్';

  @override
  String get shareMarket => 'షేర్ మార్కెట్';

  @override
  String get bollywood => 'బాలీవుడ్';

  @override
  String get newMagazine => 'కొత్త పత్రిక';

  @override
  String get festivals => 'పండుగలు';

  @override
  String get notificationsUpdated => 'నోటిఫికేషన్‌లు అప్‌డేట్ చేయబడ్డాయి ✓';

  @override
  String get youLlHearFromUsBased =>
      'మీ ఎంపికల ఆధారంగా మేము మిమ్మల్ని సంప్రదిస్తాము.';

  @override
  String get yourChartsWillNowFollowYour =>
      'మీ చార్ట్‌లు ఇప్పుడు మీరు ఎంచుకున్న శైలిని అనుసరిస్తాయి.';

  @override
  String get chartStyle => 'చార్ట్ శైలి';

  @override
  String get northIndian => 'ఉత్తర భారతీయ';

  @override
  String get southIndian => 'దక్షిణ భారత';

  @override
  String get monthSystem => 'నెలల విధానం';

  @override
  String get amanta => 'అమంటా';

  @override
  String get purnimanta => 'పూర్ణిమంత';

  @override
  String get darkMode => 'డార్క్ మోడ్';

  @override
  String get off => 'ఆఫ్';

  @override
  String get onLabel => 'ఆన్';

  @override
  String get useDeviceSettings => 'పరికర సెట్టింగ్‌లను ఉపయోగించండి';

  @override
  String get ayanamsa => 'అయనాంశం';

  @override
  String get nCLahiri => 'ఎన్.సి. లాహిరి';

  @override
  String get kpNew => 'కేపీ న్యూ';

  @override
  String get kpOld => 'కేపీ ఓల్డ్';

  @override
  String get raman => 'రామన్';

  @override
  String get kpKhullar => 'కేపీ ఖుల్లార్';

  @override
  String get subtotal => 'ఉపమొత్తం';

  @override
  String get youSave => 'మీరు ఆదా చేస్తారు';

  @override
  String get total => 'మొత్తం';

  @override
  String get deliveryAddress => 'డెలివరీ చిరునామా';

  @override
  String get orderSummary => 'ఆర్డర్ సారాంశం';

  @override
  String get couponsOffers => 'కూపన్లు & ఆఫర్లు';

  @override
  String get billDetails => 'బిల్లు వివరాలు';

  @override
  String get address => 'చిరునామా';

  @override
  String get productDiscount => 'ఉత్పత్తి తగ్గింపు';

  @override
  String get itemsSubtotal => 'వస్తువుల ఉపమొత్తం';

  @override
  String get delivery => 'డెలివరీ';

  @override
  String get free2 => 'ఉచితం';

  @override
  String get toPay => 'చెల్లించడానికి';

  @override
  String get dMmmYyyyHMmA => 'd MMM yyyy, h:mm a';

  @override
  String get couldNotDownloadInvoice => 'ఇన్‌వాయిస్‌ను డౌన్‌లోడ్ చేయలేకపోయారు';

  @override
  String get orderNotFound => 'ఆర్డర్ కనుగొనబడలేదు';

  @override
  String get activityTimeline => 'కార్యాచరణ కాలక్రమం';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM yyyy · h:mm a';

  @override
  String get totalPaid => 'చెల్లించిన మొత్తం';

  @override
  String get orderPlaced2 => 'ఆర్డర్ ఇవ్వబడింది';

  @override
  String get dMmmHMmA => 'd MMM, h:mm a';

  @override
  String get generating => 'ఉత్పత్తి అవుతోంది…';

  @override
  String get pleaseDescribeTheIssue => 'దయచేసి సమస్యను వివరించండి';

  @override
  String get couldNotLoadProducts => 'ఉత్పత్తులను లోడ్ చేయలేకపోయారు';

  @override
  String get newest => 'సరికొత్త';

  @override
  String get priceLowHigh => 'ధర: తక్కువ→ఎక్కువ';

  @override
  String get priceHighLow => 'ధర: ఎక్కువ→తక్కువ';

  @override
  String get topRated => 'అగ్రశ్రేణి రేటింగ్';

  @override
  String get s6DigitPin => '6-అంకెల పిన్';

  @override
  String get addressLine1 => 'చిరునామా లైన్ 1 *';

  @override
  String get addressLine2 => 'చిరునామా లైన్ 2';

  @override
  String get city => 'నగరం *';

  @override
  String get state => 'రాష్ట్రం *';

  @override
  String get pinCode => 'పిన్ కోడ్ *';

  @override
  String get payment => 'చెల్లింపు';

  @override
  String get pooja => 'పూజ';

  @override
  String get shop => 'షాప్';

  @override
  String get securePayment => 'సురక్షిత చెల్లింపు';

  @override
  String get noTransactionsMatchTheseFilters =>
      'ఈ ఫిల్టర్‌లకు సరిపోలే లావాదేవీలు ఏవీ లేవు';

  @override
  String get noTransactionsYet => 'ఇంకా లావాదేవీలు జరగలేదు';

  @override
  String get moneyAdded => 'డబ్బు జోడించబడింది';

  @override
  String get poojaBooking => 'పూజా బుకింగ్';

  @override
  String get videoCall => 'వీడియో కాల్';

  @override
  String get shopOrder => 'షాప్ ఆర్డర్';

  @override
  String get refund => 'వాపసు';

  @override
  String get bonus => 'బోనస్';

  @override
  String get credited => 'క్రెడిట్ చేయబడింది';

  @override
  String get debited => 'డెబిట్ చేయబడింది';

  @override
  String get rg => 'ఎ';

  @override
  String aExperienceyearsYrsExp(Object experienceYears) {
    return '$experienceYears సంవత్సరాల అనుభవం';
  }

  @override
  String weLlLetYouKnowWhen2(Object name, Object reason) {
    return '$name అనేది $reason అయినప్పుడు మేము మీకు తెలియజేస్తాము.';
  }

  @override
  String priceMin(Object price) {
    return '₹$price/నిమిషం';
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
    return '$name అనే వారు $desc లో అపారమైన నైపుణ్యం కలిగిన విశ్వసనీయ జ్యోతిష్యులు. ఈ ప్లాట్‌ఫారమ్‌పై సంవత్సరాల తరబడి సాధన చేసిన అనుభవంతో,';
  }

  @override
  String chatMin(Object chat) {
    return '₹$chat/నిమిషం';
  }

  @override
  String callMin(Object call) {
    return '₹$call/నిమిషం';
  }

  @override
  String videoMin(Object video) {
    return '₹$video/నిమిషం';
  }

  @override
  String widgetNameIsLive(Object name) {
    return '$name ప్రత్యక్ష ప్రసారంలో ఉంది';
  }

  @override
  String widgetNameIsInASession(Object name) {
    return '$name ప్రస్తుతం ఒక సెషన్‌లో ఉన్నారు';
  }

  @override
  String widgetNameIsOfflineRightNow(Object name) {
    return '$name ప్రస్తుతం ఆఫ్‌లైన్‌లో ఉన్నారు';
  }

  @override
  String storeFollowers1000Tostringasfixed1K(Object toStringAsFixed) {
    return '${toStringAsFixed}k';
  }

  @override
  String maxPriceMaxpriceRoundMin(Object round) {
    return 'గరిష్ట ధర · ₹$round/నిమిషం';
  }

  @override
  String sendTotalTokens(Object total) {
    return 'పంపండి · $total టోకెన్లు';
  }

  @override
  String sTypeTouppercaseLive(Object toUpperCase) {
    return '$toUpperCase · ప్రత్యక్ష ప్రసారం';
  }

  @override
  String widgetAstrologernameChatHistory(Object astrologerName) {
    return '$astrologerName · చాట్ చరిత్ర';
  }

  @override
  String dailyAtRTimeofdayFor14(Object timeOfDay) {
    return 'ప్రతిరోజూ $timeOfDay వద్ద · 14 రోజుల పాటు';
  }

  @override
  String onRDate(Object date) {
    return '$date';
  }

  @override
  String durSDurationsecSTotalamountCoins(
      Object durationSec, Object totalAmount) {
    return '$durationSec · $totalAmount నాణేలు';
  }

  @override
  String aboutMinutesleftMinLeft(Object minutesLeft) {
    return 'సుమారు $minutesLeft నిమిషాలు మిగిలి ఉన్నాయి';
  }

  @override
  String nearbyPermissionPerm(Object perm) {
    return '[సమీప] అనుమతి = $perm';
  }

  @override
  String nearbyGetcurrentpositionFailedETryingLast(Object e) {
    return '[సమీపంలో] getCurrentPosition విఫలమైంది: $e — చివరిగా తెలిసిన స్థానాన్ని ప్రయత్నిస్తోంది';
  }

  @override
  String nearbyPositionPosLatitudePosLongitude(
      Object latitude, Object longitude) {
    return '[సమీప] స్థానం = $latitude, $longitude';
  }

  @override
  String nearbyReversegeocodeCityCity(Object city) {
    return '[సమీపంలోని] రివర్స్ జియోకోడ్ నగరం = \"$city\"';
  }

  @override
  String nearbyResolveErrorE(Object e) {
    return '[సమీపంలో] పరిష్కార లోపం: $e';
  }

  @override
  String resumeSessionClock(Object clock) {
    return 'పునఃప్రారంభం · $clock';
  }

  @override
  String rateperminMin(Object ratePerMin) {
    return '₹$ratePerMin/నిమిషం';
  }

  @override
  String checkYourConnectionAndTryAgain(Object error) {
    return 'మీ కనెక్షన్‌ను సరిచూసుకుని, మళ్లీ ప్రయత్నించండి.\n\n($error)';
  }

  @override
  String diffInminutesMAgo(Object inMinutes) {
    return '$inMinutes నిమిషాల క్రితం';
  }

  @override
  String diffInhoursHAgo(Object inHours) {
    return '$inHours గంటల క్రితం';
  }

  @override
  String diffIndaysDAgo(Object inDays) {
    return '$inDays రోజుల క్రితం';
  }

  @override
  String thisPoojaCostsWidgetPoojaBaseprice(Object basePrice) {
    return 'ఈ పూజ ఖరీదు ₹$basePrice. మీ వాలెట్‌లో తగినంత బ్యాలెన్స్ లేదు — డబ్బు జోడించి మళ్లీ ప్రయత్నించండి.';
  }

  @override
  String payWidgetPoojaBasepriceBook(Object basePrice) {
    return '₹$basePrice చెల్లించి బుక్ చేసుకోండి';
  }

  @override
  String upToPMaxpersons(Object maxPersons) {
    return '$maxPersons వరకు';
  }

  @override
  String aSacredPNamePerformedBy(Object name) {
    return 'అనుభవజ్ఞులైన పండితులచే ప్రదర్శించబడే ఒక పవిత్రమైన $name. ఒక స్లాట్‌ను బుక్ చేసుకోండి, వివరాలు మరియు సమయాన్ని సమన్వయం చేయడానికి మా బృందం మిమ్మల్ని సంప్రదిస్తుంది.';
  }

  @override
  String upToPoojaMaxpersons(Object maxPersons) {
    return '$maxPersons వరకు';
  }

  @override
  String earnIRewardOnRudraganga(Object reward, String appName) {
    return '$appName పై ₹$reward సంపాదించండి';
  }

  @override
  String bothEarnIReward(Object reward) {
    return 'ఇద్దరూ ₹$reward సంపాదిస్తారు';
  }

  @override
  String onTheirFirstWalletRechargeYou(Object reward) {
    return 'వారి మొదటి వాలెట్ రీఛార్జ్‌పై, మీ ఇద్దరికీ తక్షణమే ₹⟦�⟧ లభిస్తుంది.';
  }

  @override
  String rechargeTotalBalance(Object balance) {
    return 'రీఛార్జ్ ₹$balance';
  }

  @override
  String itemTotalMrpQtycount(Object qtyCount) {
    return 'వస్తువుల మొత్తం (MRP) · $qtyCount';
  }

  @override
  String couponAppliedCode(Object code) {
    return 'కూపన్ ($code)';
  }

  @override
  String placeOrderTotal(Object total) {
    return 'ఆర్డర్ చేయండి · ₹$total';
  }

  @override
  String pPriceWasPMrp(Object price, Object mrp) {
    return '₹$price (గతంలో ₹$mrp)';
  }

  @override
  String pNamePricelineUrl(Object name, Object priceLine, Object url) {
    return '$name â $priceLine\n\n$url';
  }

  @override
  String ytWebviewErrorEErrorcodeE(Object errorCode, Object description) {
    return 'YT వెబ్‌వ్యూ లోపం: $errorCode $description';
  }

  @override
  String rgpayHttpErrorEResponseStatuscode(Object statusCode) {
    return 'RGPAY http లోపం: $statusCode';
  }

  @override
  String rgpayResourceErrorEErrorcodeE(Object errorCode, Object description) {
    return 'RGPAY వనరు లోపం: $errorCode $description';
  }
}
