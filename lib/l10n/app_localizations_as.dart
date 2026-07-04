// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class L10nAs extends L10n {
  L10nAs([String locale = 'as']) : super(locale);

  @override
  String get appName => 'Astro App';

  @override
  String get tagline => 'জ্যোতিষ আৰু কল্যাণ';

  @override
  String get splashBlessing => 'স্পষ্টতাৰ পথত আপোনাৰ যাত্ৰা ইয়াৰ পৰাই আৰম্ভ';

  @override
  String get authWelcomeTitle => 'স্বাগতম';

  @override
  String get authWelcomeSubtitle =>
      'আপোনাৰ ফোন নম্বৰেৰে ছাইন ইন কৰক বা একাউণ্ট সৃষ্টি কৰক';

  @override
  String get phoneLabel => 'ফোন নম্বৰ';

  @override
  String get phoneHint => '১০ অংকৰ মোবাইল নম্বৰ';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'আগবাঢ়ক';

  @override
  String get sendOtpButton => 'OTP পঠিয়াওক';

  @override
  String get otpTitle => 'আপোনাৰ নম্বৰ সত্যাপন কৰক';

  @override
  String otpSubtitle(String phone) {
    return '$phone-লৈ পঠোৱা ৬ অংকৰ ক\'ডটো দিয়ক';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'সত্যাপন কৰি আগবাঢ়ক';

  @override
  String get resendOtp => 'ক\'ড পুনৰ পঠিয়াওক';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds ছেকেণ্ডত পুনৰ পঠিয়াওক';
  }

  @override
  String get changeNumber => 'নম্বৰ সলনি কৰক';

  @override
  String get termsNotice =>
      'আগবাঢ়িলে আপুনি আমাৰ চৰ্তাৱলী আৰু গোপনীয়তা নীতিত সন্মত হৈছে';

  @override
  String get acceptPrefix => 'মই সন্মত';

  @override
  String get acceptAnd => 'আৰু';

  @override
  String get termsOfService => 'সেৱাৰ চৰ্তাৱলী';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get errInvalidPhone => 'এটা বৈধ ১০ অংকৰ ফোন নম্বৰ দিয়ক';

  @override
  String get errInvalidOtp => '৬ অংকৰ ক\'ডটো দিয়ক';

  @override
  String get errGeneric => 'কিবা ভুল হ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get errNetwork =>
      'সংযোগ নাই। আপোনাৰ ইণ্টাৰনেট পৰীক্ষা কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get otpSent => 'OTP পঠোৱা হ\'ল';

  @override
  String get loginSuccess => 'ছাইন ইন হ\'ল';

  @override
  String get settings => 'ছেটিংছ';

  @override
  String get language => 'ভাষা';

  @override
  String get theme => 'থীম';

  @override
  String get themeSystem => 'চিষ্টেম';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডাৰ্ক';

  @override
  String homeWelcome(String name) {
    return 'নমস্কাৰ, $name';
  }

  @override
  String get logout => 'লগ আউট';

  @override
  String get onbTitle => 'আপোনাৰ বিষয়ে কওক';

  @override
  String get onbSubtitle =>
      'ই আপোনাৰ ৰিডিং ব্যক্তিগতকৰণ কৰাত সহায় কৰে। একোৱেই বাধ্যতামূলক নহয় — পিছত সম্পূৰ্ণ কৰিব পাৰে।';

  @override
  String get onbName => 'আপোনাৰ নাম';

  @override
  String get onbAddPhoto => 'ফটো যোগ কৰক';

  @override
  String get onbChangePhoto => 'ফটো সলনি কৰক';

  @override
  String get onbGender => 'লিংগ';

  @override
  String get genderMale => 'পুৰুষ';

  @override
  String get genderFemale => 'মহিলা';

  @override
  String get genderOther => 'অন্য';

  @override
  String get onbDob => 'জন্ম তাৰিখ';

  @override
  String get onbTob => 'জন্ম সময়';

  @override
  String get onbDontKnowTime => 'মই মোৰ জন্ম সময় নাজানো';

  @override
  String get onbPob => 'জন্মস্থান';

  @override
  String get onbPobHint => 'আপোনাৰ জন্ম চহৰ বিচাৰক';

  @override
  String get onbLanguage => 'পছন্দৰ ভাষা';

  @override
  String get onbSelectDate => 'তাৰিখ বাছনি কৰক';

  @override
  String get onbSelectTime => 'সময় বাছনি কৰক';

  @override
  String get onbSkip => 'এতিয়া এৰি দিয়ক';

  @override
  String get onbFinish => 'সম্পূৰ্ণ কৰক';

  @override
  String get onbSaved => 'প্ৰোফাইল সংৰক্ষিত হ\'ল';

  @override
  String get completeProfile => 'আপোনাৰ প্ৰোফাইল সম্পূৰ্ণ কৰক';

  @override
  String get completeProfileCta => 'ছেটআপ সম্পূৰ্ণ কৰক';

  @override
  String get permTitle => 'কেইটামান অনুমতি';

  @override
  String get permSubtitle =>
      'যাতে কল, জাননী আৰু ফটো ভালদৰে চলে। আপুনি যিকোনো সময়ত ছেটিংছত সলনি কৰিব পাৰে।';

  @override
  String get permNotifications => 'জাননী';

  @override
  String get permNotificationsDesc =>
      'পৰামৰ্শ সতৰ্কবাণী, অৰ্ডাৰ আপডেট আৰু ৰিমাইণ্ডাৰ';

  @override
  String get permMic => 'মাইক্ৰʼফোন';

  @override
  String get permMicDesc => 'জ্যোতিষীৰ সৈতে ভইচ কলৰ বাবে';

  @override
  String get permCamera => 'কেমেৰা';

  @override
  String get permCameraDesc => 'ভিডিঅ\' কল আৰু ফটো আপলোডৰ বাবে';

  @override
  String get permPhotos => 'ফটো';

  @override
  String get permPhotosDesc => 'আপোনাৰ প্ৰোফাইল ছবি ছেট কৰিবলৈ';

  @override
  String get permAllow => 'অনুমতি দিয়ক';

  @override
  String get permContinue => 'আগবাঢ়ক';

  @override
  String get permLocation => 'অৱস্থান';

  @override
  String get permLocationDesc => 'আপোনাৰ ওচৰৰ জ্যোতিষী বিচাৰক';

  @override
  String get secFeatured => 'বিশিষ্ট জ্যোতিষী';

  @override
  String get secNearby => 'ওচৰৰ জ্যোতিষী';

  @override
  String get secCallChat => 'কল আৰু চেট';

  @override
  String get secAiAstro => 'AI জ্যোতিষী';

  @override
  String get secProducts => 'সামগ্ৰী';

  @override
  String get secVideos => 'ভিডিঅ\'';

  @override
  String get secLessons => 'জ্যোতিষ পাঠ';

  @override
  String get secOthers => 'অন্যান্য';

  @override
  String get secHistory => 'আপোনাৰ পৰামৰ্শ';

  @override
  String get seeAll => 'সকলো চাওক';

  @override
  String get basedOnLocation => 'আপোনাৰ অৱস্থান অনুসৰি';

  @override
  String get shareApp => 'বন্ধুৰ সৈতে এপ শ্বেয়াৰ কৰক';

  @override
  String get startReadingHint =>
      'এতিয়ালৈকে কোনো পৰামৰ্শ নাই। আপোনাৰ প্ৰথম ৰিডিং আৰম্ভ কৰক।';

  @override
  String get startBtn => 'আৰম্ভ';

  @override
  String get namaste => 'নমস্কাৰ';

  @override
  String get kFreeKundli => 'বিনামূলীয়া কুণ্ডলী';

  @override
  String get kMatching => 'মিলন';

  @override
  String get kBrihat => 'বৃহৎ কুণ্ডলী';

  @override
  String get kKundliAi => 'কুণ্ডলী AI+';

  @override
  String get tCareer => 'কেৰিয়াৰ';

  @override
  String get tMarriage => 'বিবাহ';

  @override
  String get tFinance => 'বিত্ত';

  @override
  String get tHealth => 'স্বাস্থ্য';

  @override
  String get tEducation => 'শিক্ষা';

  @override
  String get tTravel => 'ভ্ৰমণ';

  @override
  String get statusOnline => 'অনলাইন';

  @override
  String get statusBusy => 'ব্যস্ত';

  @override
  String get statusOffline => 'অফলাইন';

  @override
  String get retry => 'পুনৰ চেষ্টা কৰক';

  @override
  String get chatNow => 'এতিয়া আড্ডা দিয়ক';

  @override
  String get notifyMe => 'মোক অৱগত কৰক';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'এই জ্যোতিষীজন এতিয়াও পৰামৰ্শ ল’ব পৰা নাই।';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'আপোনাৰ প্ৰফাইল সম্পূৰ্ণ কৰক';

  @override
  String get addYourDateTimePlaceOf =>
      'আপোনাৰ জন্ম তাৰিখ, সময় আৰু স্থান যোগ কৰক যাতে জ্যোতিষীয়ে আপোনাক স্পষ্টকৈ পঢ়িব পাৰে।';

  @override
  String get completeProfile2 => 'সম্পূৰ্ণ প্ৰফাইল';

  @override
  String get skipForNow => 'এতিয়াৰ বাবে এৰি দিয়ক';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'কিয় (ঐচ্ছিক) কওক — ই আমাক উন্নতি কৰাত সহায় কৰে।';

  @override
  String get reasonOptional => 'কাৰণ (ঐচ্ছিক)';

  @override
  String get cancel => 'বাতিল কৰক';

  @override
  String get unfollow => 'আনফ\'ল\' কৰক';

  @override
  String get s21kReviews => '  (২.১k পর্যালোচনা)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'উপহাৰ';

  @override
  String get store => 'দোকান';

  @override
  String get joinLiveSession => 'লাইভ অধিবেশনত যোগদান কৰক';

  @override
  String get youLlBeNotified => 'আপোনাক অৱগত কৰা হ\'ব';

  @override
  String get thisStoreHasNoItemsYet => 'এই দোকানখনত এতিয়াও কোনো বস্তু নাই।';

  @override
  String get filters => 'ফিল্টাৰসমূহ';

  @override
  String get reset => 'ৰিছেট কৰক';

  @override
  String get onlineNowOnly => 'এতিয়া কেৱল অনলাইন';

  @override
  String get applyFilters => 'ফিল্টাৰ প্ৰয়োগ কৰক';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'এই জ্যোতিষীৰ বাবে উপহাৰ উপলব্ধ নহয়।';

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
  String get recharge => 'ৰিচাৰ্জ';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'পৰিমাণ';

  @override
  String get min1Max100 => 'নূন্যতম ১ সৰ্বোচ্চ ১০০';

  @override
  String get comingSoon => 'আহি আছে';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'আপোনাৰ বাবে সোঁৱৰাই দিয়া হৈছে';

  @override
  String get suggestedForYou => 'আপোনাৰ বাবে পৰামৰ্শ দিয়া হৈছে';

  @override
  String get couldNotSendImage => 'ছবি প্ৰেৰণ কৰিব পৰা নগ\'ল';

  @override
  String get endConsultation => 'পৰামৰ্শ শেষ কৰা?';

  @override
  String get thisWillEndTheChatAnd =>
      'ইয়াৰ ফলত আড্ডা শেষ হ’ব আৰু বিলিং বন্ধ হ’ব।';

  @override
  String get keepChatting => 'আড্ডা মাৰি থাকিব';

  @override
  String get end => 'সমাপ্ত';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'চুইচ';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'অডিঅ\' কললৈ সলনি কৰক';

  @override
  String get switchToVideoCall => 'ভিডিঅ’ কললৈ সলনি কৰক';

  @override
  String get endConsultation2 => 'পৰামৰ্শ শেষ কৰক';

  @override
  String get sendAGift => 'এটা উপহাৰ পঠাওক';

  @override
  String get sayHello => 'নমস্কাৰ কওক 🙏';

  @override
  String get typeAMessage => 'এটা বাৰ্তা টাইপ কৰক...';

  @override
  String get recommendedProduct => 'পৰামৰ্শ দিয়া সামগ্ৰী';

  @override
  String get view => 'দৰ্শন';

  @override
  String get connecting => 'সংযোগ...';

  @override
  String get myConsultations => 'মোৰ পৰামৰ্শ';

  @override
  String get noConsultationsYet => 'এতিয়াও কোনো পৰামৰ্শ নাই';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'আড্ডা চাওক';

  @override
  String get historyExpired => 'ইতিহাসৰ ম্যাদ উকলি গ’ল';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'জ্যোতিষীক ৰিং কৰি';

  @override
  String get cancelRequest => 'অনুৰোধ বাতিল কৰক';

  @override
  String get notNow => 'এতিয়া নহয়';

  @override
  String get thanksForYourFeedback => 'আপোনাৰ মতামতৰ বাবে ধন্যবাদ!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'জমা দিব পৰা নগ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get consultationEnded => 'আলোচনাৰ অন্ত পৰিল';

  @override
  String get hopeYouGotTheClarityYou => 'আশাকৰোঁ আপুনি বিচৰা স্পষ্টতাটো পাইছে।';

  @override
  String get shareYourExperienceOptional =>
      'আপোনাৰ অভিজ্ঞতা শ্বেয়াৰ কৰক (ঐচ্ছিক)';

  @override
  String get howWasTheCallQuality => 'কলৰ মানদণ্ড কেনেকুৱা আছিল?';

  @override
  String get skip => 'বাদ দিয়া';

  @override
  String get submit => 'দাখিল কৰক';

  @override
  String get close => 'বন্ধ';

  @override
  String get viewProfile => 'প্ৰফাইল চাওক';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'দ্বাৰা নিৰ্মিত ';

  @override
  String get devifai => 'ডেভিফএআই';

  @override
  String get withLabel => ' ❤️ ৰ সৈতে';

  @override
  String get leavingSoSoon => 'ইমান সোনকালে গুচি যাব?';

  @override
  String get stayLoggedIn => 'লগ ইন হৈ থাকক';

  @override
  String get logOutAnyway => 'যিয়েই নহওক লগ আউট কৰক';

  @override
  String get noNearbyAstrologersYet => 'ওচৰৰ কোনো জ্যোতিষী এতিয়াও নাই';

  @override
  String get bookAPooja => 'পূজা বুক কৰক';

  @override
  String get panditLedPoojasAtYourChosen =>
      'আপোনাৰ নিৰ্বাচিত তাৰিখত পণ্ডিত নেতৃত্বাধীন পূজা';

  @override
  String get back => 'পিছলৈ';

  @override
  String get connectingToLive => 'লাইভ কৰিবলৈ সংযোগ কৰা হৈছে...';

  @override
  String get live => 'জীয়াই থকা';

  @override
  String get thisLiveHasEnded => 'এই লাইভৰ অন্ত পৰিল';

  @override
  String get backToLive => 'লাইভলৈ উভতি যাওক';

  @override
  String get sayHelloBeTheFirstTo => 'নমস্কাৰ কওক 👋 প্ৰথম মন্তব্য কৰক';

  @override
  String get aiPollLive => 'AI Poll · লাইভ';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'এটা মন্তব্য যোগ কৰক...';

  @override
  String get send => 'পঠোৱা';

  @override
  String get liveNow => 'এতিয়াই জীয়াই থাকক';

  @override
  String get searchByAstrologerName => 'জ্যোতিষীৰ নামেৰে সন্ধান কৰক';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'সতেজ কৰক';

  @override
  String get join => 'যোগদান কৰক';

  @override
  String get clearAllNotifications => 'সকলো জাননী পৰিষ্কাৰ কৰিবনে?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'ই আপোনাৰ সকলো জাননী স্থায়ীভাৱে মচি পেলায়।';

  @override
  String get clearAll => 'সকলো পৰিষ্কাৰ কৰক';

  @override
  String get notifications => 'জাননীসমূহ';

  @override
  String get markAllRead => 'মাৰ্ক সকলোৱে পঢ়িলে';

  @override
  String get noNotifications => 'কোনো জাননী নাই';

  @override
  String get youReAllCaughtUp => 'তোমালোক সকলো ধৰা পৰিছে।';

  @override
  String get nameIsRequired => 'নাম দৰকাৰ';

  @override
  String get enterAValidPhone => 'এটা বৈধ ফোন প্ৰৱেশ কৰক';

  @override
  String get bookingConfirmed => 'বুকিং নিশ্চিত 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'বুকিং বিফল, অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক';

  @override
  String get addMoneyToContinue => 'আগবাঢ়ি যাবলৈ টকা যোগ কৰক';

  @override
  String get addMoney => 'টকা যোগ কৰক';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'Book $name';
  }

  @override
  String get name => 'নাম';

  @override
  String get phone => 'ফোন';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'Add the people this pooja is performed for (up to $_maxPersons). Fill one before adding the next.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'Member $key name';
  }

  @override
  String get specialInstructionsOptional => 'বিশেষ নিৰ্দেশনা (ঐচ্ছিক)';

  @override
  String get poojaDetails => 'পূজাৰ সবিশেষ';

  @override
  String get price => 'মূল্য';

  @override
  String get bookNow => 'এতিয়াই বুকিং কৰক';

  @override
  String get aboutThisPooja => 'এই পূজাৰ বিষয়ে';

  @override
  String get ourPanditWillCallYou => 'আমাৰ পণ্ডিতে আপোনাক ফোন কৰিব';

  @override
  String get beforeThePoojaToConfirmThe =>
      'পূজাৰ আগতে, সময় আৰু আপোনাৰ সংকল্পৰ সবিশেষ নিশ্চিত কৰিবলৈ।';

  @override
  String get howItWorks => 'কেনেকৈ কাম কৰে';

  @override
  String get filterPoojas => 'পূজা ফিল্টাৰ কৰক';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'মিন ব্যক্তি সমৰ্থিত';

  @override
  String get apply => 'প্ৰয়োগ কৰক';

  @override
  String get searchPoojas => 'Search poojas...';

  @override
  String get myProfile => 'মোৰ প্ৰফাইল';

  @override
  String get referEarn => 'ৰেফাৰ কৰক আৰু উপাৰ্জন কৰক';

  @override
  String get couldNotLoadTryAgain => 'লোড কৰিব পৰা নগ\'ল। আকৌ এবাৰ চেষ্টা কৰক।';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'আপোনাৰ ৰেফাৰেল ক\'ড';

  @override
  String get codeCopied => 'ক\'ড কপি কৰা হৈছে';

  @override
  String get shareEarn => 'শ্বেয়াৰ কৰক আৰু উপাৰ্জন কৰক';

  @override
  String get haveAFriendSCode => 'বন্ধুৰ ক’ড আছেনে?';

  @override
  String get enterReferralCode => 'ৰেফাৰেল ক\'ড দিয়ক';

  @override
  String get aReferralCodeIsAppliedTo =>
      'আপোনাৰ একাউণ্টত এটা ৰেফাৰেল ক\'ড প্ৰয়োগ কৰা হয়।';

  @override
  String get feedbackSubmitted => 'মতামত দাখিল কৰা হৈছে';

  @override
  String get feedback => 'মতামত';

  @override
  String get applicationSubmitted => 'আবেদন দাখিল কৰা হৈছে';

  @override
  String get astrologerRegistration => 'জ্যোতিষী পঞ্জীয়ন';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return 'জ্যোতিষী হিচাপে $appNameৰ সৈতে যোগদান কৰক';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'নিজৰ বিষয়ে কওকচোন — আমাৰ দলটোৱে পৰ্যালোচনা কৰি হাত আগবঢ়াব।';

  @override
  String get aboutUs => 'আমাৰ বিষয়ে';

  @override
  String rudraganga(String appName) {
    return '$appName';
  }

  @override
  String get astrologyWellness => 'জ্যোতিষ আৰু সুস্থতা';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · ভক্তিৰে নিৰ্মিত';

  @override
  String get thanksForYourRating => 'আপোনাৰ ৰেটিঙৰ বাবে ধন্যবাদ!';

  @override
  String rateRudraganga(String appName) {
    return 'ৰেট $appName';
  }

  @override
  String get howIsYourExperience => 'আপোনাৰ অভিজ্ঞতা কেনেকুৱা?';

  @override
  String get writeAReviewOptional => 'পৰ্যালোচনা লিখক (ঐচ্ছিক)';

  @override
  String get saved => 'সংৰক্ষণ কৰা হৈছে';

  @override
  String get notificationSetting => 'জাননী ছেটিং';

  @override
  String get howOften => 'কিমান সঘনাই?';

  @override
  String get topicsYouCareAbout => 'আপুনি গুৰুত্ব দিয়া বিষয়';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get allSet => 'সকলো ছেট ✨';

  @override
  String get setPreferences => 'পছন্দসমূহ নিৰ্ধাৰণ কৰক';

  @override
  String get save => 'সঞ্চয় কৰা';

  @override
  String get bundlesCombos => 'বাণ্ডিল আৰু কম্বো';

  @override
  String get noCombosRightNow => 'এতিয়া কোনো কম্বো নাই';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'কাৰ্ট';

  @override
  String get clear => 'পৰিষ্কাৰ';

  @override
  String get yourCartIsEmpty => 'আপোনাৰ গাড়ীখন খালী হৈ আছে';

  @override
  String get browseProductsAndAddThemHere =>
      'প্ৰডাক্টসমূহ ব্ৰাউজ কৰক আৰু ইয়াত যোগ কৰক';

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
  String get pleaseAddADeliveryAddress =>
      'অনুগ্ৰহ কৰি এটা ডেলিভাৰী ঠিকনা যোগ কৰক';

  @override
  String get checkout => 'চেকআউট কৰক';

  @override
  String get addNewAddress => 'নতুন ঠিকনা যোগ কৰক';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'আঁতৰোৱা';

  @override
  String get enterCouponCode => 'কুপন ক\'ড দিয়ক';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'উপলব্ধ অফাৰ';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'প্ৰয়োগ কৰা হৈছে';

  @override
  String get nothingToCheckout => 'চেকআউট কৰিবলৈ একো নাই';

  @override
  String get orderPlaced => 'অৰ্ডাৰ দিয়া হৈছে!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'বজাৰ কৰি যাওক';

  @override
  String get yourOrders => 'আপোনাৰ অৰ্ডাৰ';

  @override
  String get noOrdersYet => 'এতিয়াও কোনো অৰ্ডাৰ নাই';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'দোকানৰ পৰা কিবা এটা কিনিলেই ইয়াত আপোনাৰ অৰ্ডাৰ ওলাব।';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'এতিয়াও চালান সৃষ্টি কৰা হৈছে। অলপ পিছতে আকৌ চেষ্টা কৰক।';

  @override
  String get couldNotOpenTheInvoice => 'চালান খুলিব পৰা নগ\'ল';

  @override
  String get thanksOurTeamWillReachOut =>
      'ধন্যবাদ! এই আদেশৰ বিষয়ে আমাৰ দলটোৱে হাত আগবঢ়াব।';

  @override
  String get orderDetails => 'অৰ্ডাৰৰ সবিশেষ';

  @override
  String get needHelp => 'সহায়ৰ প্ৰয়োজন';

  @override
  String get needHelpWithThisOrder => 'এই অৰ্ডাৰৰ ক্ষেত্ৰত সহায়ৰ প্ৰয়োজন?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'চালান';

  @override
  String get download => 'ডাউনল’ড';

  @override
  String get needHelp2 => 'সহায়ৰ প্ৰয়োজন';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'কি ভুল হ’ল?';

  @override
  String get describeTheIssue => 'বিষয়টোৰ বৰ্ণনা কৰা';

  @override
  String get tellUsWhatHappenedSoWe =>
      'আমাক কি হৈছিল কওক যাতে আমি সহায় কৰিব পাৰো...';

  @override
  String get submitRequest => 'অনুৰোধ জমা দিয়ক';

  @override
  String get addedToCart => 'কাৰ্টত যোগ কৰা হৈছে';

  @override
  String get productUnavailable => 'প্ৰডাক্ট উপলব্ধ নহয়';

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
  String get fewItemsLeft => 'কম বস্তু বাকী';

  @override
  String get description => 'বিৱৰণ';

  @override
  String get frequentlyBoughtTogether => 'সঘনাই একেলগে কিনা';

  @override
  String get viewAll => 'সকলো চাওক';

  @override
  String get addToCart => 'কাৰ্টত যোগ কৰক';

  @override
  String get buyNow => 'এতিয়াই কিনি লওক';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get noProductsFound => 'কোনো সামগ্ৰী পোৱা নগ\'ল';

  @override
  String get priceRange => 'মূল্যৰ পৰিসৰ (₹)';

  @override
  String get min => 'নূন্যতম';

  @override
  String get max => 'সৰ্বোচ্চ';

  @override
  String get inStockOnly => 'কেৱল ষ্টকত আছে';

  @override
  String get sortBy => 'দ্বাৰা সজাই থওক';

  @override
  String get addDeliveryAddress => 'ডেলিভাৰীৰ ঠিকনা যোগ কৰক';

  @override
  String get setAsDefaultAddress => 'অবিকল্পিত ঠিকনা হিচাপে নিৰ্ধাৰণ কৰক';

  @override
  String get saveAddress => 'ঠিকনা সংৰক্ষণ কৰক';

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
  String get fewLeft => 'কমেইহে বাকী থাকিল';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'বিনামূলীয়া ডেলিভাৰী';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'ইয়াত এতিয়াও একো নাই';

  @override
  String get loadingSecurePayment => 'লোডিং নিৰাপদ পেমেন্ট...';

  @override
  String get couldNotStartRecharge => 'ৰিচাৰ্জ আৰম্ভ কৰিব পৰা নগ\'ল';

  @override
  String get paymentSuccessful => 'পেমেন্ট সফল 🎉';

  @override
  String get paymentWasNotCompleted => 'পেমেণ্ট সম্পূৰ্ণ নহ’ল';

  @override
  String get couldNotStartRechargeTryAgain =>
      'ৰিচাৰ্জ আৰম্ভ কৰিব পৰা নগ\'ল, আকৌ চেষ্টা কৰক';

  @override
  String get wallet => 'ধনৰ মোনা';

  @override
  String get availableBalance => 'উপলব্ধ বেলেঞ্চ';

  @override
  String get useItForPoojasConsultations =>
      'পূজা আৰু পৰামৰ্শৰ বাবে ইয়াক ব্যৱহাৰ কৰক';

  @override
  String get instantTopUp => 'তৎক্ষণাত টপ-আপ';

  @override
  String get noRechargePacksAvailableRightNow =>
      'বৰ্তমান কোনো ৰিচাৰ্জ পেক উপলব্ধ নহয়।';

  @override
  String get transactions => 'লেনদেন';

  @override
  String get endOfTransactions => '— লেনদেনৰ অন্ত —';

  @override
  String get youGet => 'পায়';

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
  String get about => 'বিষয়ে';

  @override
  String get astrologer => 'জ্যোতিষী';

  @override
  String get seeker => 'সাধক';

  @override
  String get free => 'বিনামূলীয়া';

  @override
  String get jan => 'জানুৱাৰী মাহত';

  @override
  String get feb => 'ফেব্ৰুৱাৰী';

  @override
  String get mar => 'মাৰ্চ';

  @override
  String get apr => 'এপ্ৰিল';

  @override
  String get may => 'হয়তো';

  @override
  String get jun => 'জুন';

  @override
  String get jul => 'জুলাই';

  @override
  String get aug => 'আগষ্ট';

  @override
  String get sep => 'ছেপ্টেম্বৰ';

  @override
  String get oct => 'অক্টোবৰ';

  @override
  String get nov => 'নৱেম্বৰ মাহত';

  @override
  String get dec => 'ডিচেম্বৰ';

  @override
  String get english => 'ইংৰাজী';

  @override
  String get all => 'আটাইবোৰ';

  @override
  String get vedic => 'বৈদিক';

  @override
  String get tarot => 'টেৰ’ট';

  @override
  String get numerology => 'সংখ্যা বিজ্ঞান';

  @override
  String get vastu => 'বিৰুদ্ধে';

  @override
  String get palmistry => 'হাতৰ বিজ্ঞান';

  @override
  String get kp => 'কে পি';

  @override
  String get love => 'ভালপোৱা';

  @override
  String get taraAi => 'দেশৰ এ আই';

  @override
  String get instantVedicAnswers247 => 'তৎক্ষণাত বৈদিক উত্তৰ • ২৪×৭';

  @override
  String get allLanguages => 'সকলো ভাষা';

  @override
  String get jyotiAi => 'জ্যোতি এ আই';

  @override
  String get loveCareerGuidance => 'প্ৰেম আৰু কেৰিয়াৰ গাইডেন্স';

  @override
  String get hindiEnglish => 'হিন্দী, ইংৰাজী';

  @override
  String get veduAi => 'বেদু এ আই';

  @override
  String get remediesPredictions => 'প্ৰতিকাৰ আৰু ভৱিষ্যদ্বাণী';

  @override
  String get couldNotLoadAstrologers => 'জ্যোতিষীসকলক লোড কৰিব পৰা নাছিল';

  @override
  String get aiAstrologers => 'এ আই জ্যোতিষীসকল';

  @override
  String get featuredAstrologers => 'বৈশিষ্ট্যযুক্ত জ্যোতিষীসকল';

  @override
  String get astrologers => 'জ্যোতিষীসকল';

  @override
  String get searchAiAstrologers => 'AI জ্যোতিষী অনুসন্ধান...';

  @override
  String get searchAstrologersByName => 'নাম দ্বারা জ্যোতিষী অনুসন্ধান...';

  @override
  String get aiChat => 'এ আই আড্ডা';

  @override
  String get noAstrologersMatch => 'কোনো জ্যোতিষীৰ মিল নাই';

  @override
  String get noAstrologersYet => 'এতিয়াও কোনো জ্যোতিষী নাই';

  @override
  String get couldnTSetTheReminderPlease =>
      'সোঁৱৰাই দিয়াটো ছেট কৰিব পৰা নগ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get ai => 'এ আই';

  @override
  String get live2 => 'লাইভ';

  @override
  String get online => 'অনলাইন';

  @override
  String get busy => 'ব্যস্ত';

  @override
  String get offline => 'অফলাইন';

  @override
  String get chat => 'চেট';

  @override
  String get call => 'কল';

  @override
  String get video => 'ভিডিঅ’';

  @override
  String get notEnoughBalanceToStartPlease =>
      'আৰম্ভ কৰিবলৈ পৰ্যাপ্ত ভাৰসাম্য নাই। অনুগ্ৰহ কৰি ৰিচাৰ্জ কৰক।';

  @override
  String get couldNotStartTheConsultationPlease =>
      'পৰামৰ্শ আৰম্ভ কৰিব পৰা নগ’ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get share => 'ভাগ-বতৰা কৰা';

  @override
  String get follow => 'অনুসৰণ কৰা';

  @override
  String get chats => 'আড্ডা';

  @override
  String get calls => 'কল কৰে';

  @override
  String get videos => 'ভিডিঅ\'';

  @override
  String get gifts => 'উপহাৰ';

  @override
  String get languages => 'ভাষাসমূহ';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'তেওঁলোকে হাজাৰ হাজাৰ সাধকক কেৰিয়াৰ, বিবাহ, বিত্ত আৰু জীৱন-পথৰ প্ৰশ্নৰ জৰিয়তে পথ প্ৰদৰ্শন কৰিছে। ';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'তেওঁলোকৰ পঠনে ধ্ৰুপদী বৈদিক নীতিসমূহক ব্যৱহাৰিক, দয়ালু পথ প্ৰদৰ্শনৰ সৈতে মিহলাই দিয়ে — আপোনাক সহায় কৰে ';

  @override
  String get findClarityAndActionableRemediesFor =>
      'আগন্তুক পথৰ বাবে স্পষ্টতা আৰু কাৰ্য্যকৰী প্ৰতিকাৰ বিচাৰি উলিয়াব।';

  @override
  String get giftsReceived => 'উপহাৰ লাভ কৰা';

  @override
  String get reviews => 'পৰ্যালোচনা';

  @override
  String get weLlNotifyYouTheMoment =>
      'তেওঁলোক মুক্ত হোৱাৰ মুহূৰ্ততে আমি আপোনাক অৱগত কৰিম।';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'তেওঁলোক অনলাইন হোৱাৰ মুহূৰ্ততে আমি আপোনাক অৱগত কৰিম।';

  @override
  String get getAHeadsUpTheMoment =>
      'তেওঁলোক উপলব্ধ হোৱাৰ মুহূৰ্ততে এটা হেডছ-আপ লওক৷';

  @override
  String get couldNotLoadThisStore => 'এই ষ্ট\'ৰ লোড কৰিব পৰা নগ\'ল';

  @override
  String get products => 'প্ৰডাক্ট';

  @override
  String get poojas => 'পূজাত';

  @override
  String get book => 'কিতাপ';

  @override
  String get buy => 'ক্ৰয় কৰা';

  @override
  String get lalKitab => 'লাল কিতাব';

  @override
  String get hindi => 'নহয়';

  @override
  String get bengali => 'বাংলা';

  @override
  String get tamil => 'তামিল';

  @override
  String get marathi => 'মাৰাঠী';

  @override
  String get punjabi => 'পাঞ্জাবী';

  @override
  String get telugu => 'তেলেগু';

  @override
  String get expertise => 'বিশেষজ্ঞতা';

  @override
  String get couldNotLoadGifts => 'উপহাৰ লোড কৰিব পৰা নাছিল';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'পৰ্যাপ্ত ভাৰসাম্য নাই। উপহাৰ পঠিয়াবলৈ টকা যোগ কৰক।';

  @override
  String get couldNotSendTheGiftPlease =>
      'উপহাৰটো পঠাব নোৱাৰিলে। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get connecting2 => 'সংযোগ...';

  @override
  String get couldNotLoadThisChatHistory =>
      'এই আড্ডাৰ ইতিহাস লোড কৰিব পৰা নগ\'ল';

  @override
  String get thisChatHistoryIsNoLonger =>
      'এই আড্ডাৰ ইতিহাস আৰু উপলব্ধ নহয়\n(৭ দিন আড্ডা ৰখা হয়)।';

  @override
  String get dailyFor14Days => 'দৈনিক · ১৪ দিনৰ বাবে';

  @override
  String get dailyMantra => 'দৈনিক মন্ত্ৰ';

  @override
  String get reminder => 'স্মাৰক';

  @override
  String get audio => 'অডিঅ\'';

  @override
  String get couldNotLoadYourConsultations =>
      'আপোনাৰ পৰামৰ্শসমূহ লোড কৰিব পৰা নগ\'ল';

  @override
  String get missed => 'মিছড';

  @override
  String get declined => 'অস্বীকাৰ কৰিলে';

  @override
  String get cancelled => 'বাতিল কৰা হৈছে';

  @override
  String get lowBalance => 'ভাৰসাম্য কম';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'আপোনাৰ পৰামৰ্শ চলি থাকিবলৈ এতিয়াই ৰিচাৰ্জ কৰক। আপুনি ধন পৰিশোধ কৰাৰ সময়ত আপোনাৰ আড্ডা খোলা থাকে।';

  @override
  String get sessionEndedLowBalance =>
      'আপোনাৰ বেলেন্স শেষ হোৱাত পৰামৰ্শ সমাপ্ত হ\'ল। যিকোনো সময়ত ৰিচাৰ্জ কৰি আকৌ আৰম্ভ কৰিব পাৰে।';

  @override
  String get couldNotLoadHoroscope =>
      'ৰাশিফল ল\'ড কৰিব পৰা নগ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get chooseSign => 'ৰাশি সলনি কৰক';

  @override
  String get yesterday => 'কালি';

  @override
  String get today => 'আজি';

  @override
  String get tomorrow => 'অহা কালি';

  @override
  String get totalScore => 'মুঠ স্ক\'ৰ';

  @override
  String get luckyColor => 'শুভ ৰং';

  @override
  String get luckyNumber => 'শুভ সংখ্যা';

  @override
  String get lifeAreas => 'জীৱনৰ ক্ষেত্ৰ';

  @override
  String get todaysReading => 'আজিৰ ৰাশিফল';

  @override
  String get career => 'কেৰিয়াৰ';

  @override
  String get finances => 'বিত্ত';

  @override
  String get health => 'স্বাস্থ্য';

  @override
  String get relationship => 'সম্পৰ্ক';

  @override
  String get family => 'পৰিয়াল';

  @override
  String get friends => 'বন্ধু';

  @override
  String get travel => 'ভ্ৰমণ';

  @override
  String get physique => 'শৰীৰ';

  @override
  String get statusLabel => 'অৱস্থা';

  @override
  String get signAries => 'মেষ';

  @override
  String get signTaurus => 'বৃষ';

  @override
  String get signGemini => 'মিথুন';

  @override
  String get signCancer => 'কৰ্কট';

  @override
  String get signLeo => 'সিংহ';

  @override
  String get signVirgo => 'কন্যা';

  @override
  String get signLibra => 'তুলা';

  @override
  String get signScorpio => 'বৃশ্চিক';

  @override
  String get signSagittarius => 'ধনু';

  @override
  String get signCapricorn => 'মকৰ';

  @override
  String get signAquarius => 'কুম্ভ';

  @override
  String get signPisces => 'মীন';

  @override
  String get couldNotLoadPanchang =>
      'পঞ্চাংগ ল\'ড কৰিব পৰা নগ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get tithi => 'তিথি';

  @override
  String get nakshatra => 'নক্ষত্ৰ';

  @override
  String get yoga => 'যোগ';

  @override
  String get karana => 'কৰণ';

  @override
  String get weekday => 'বাৰ';

  @override
  String get inauspiciousTimes => 'অশুভ সময়';

  @override
  String get rahuKaal => 'ৰাহু কাল';

  @override
  String get gulikaKaal => 'গুলিক কাল';

  @override
  String get yamaganda => 'যমগণ্ড';

  @override
  String get duration => 'সময়কাল';

  @override
  String get coinsUsed => 'ব্যৱহৃত মুদ্ৰা';

  @override
  String get guest => 'আলহী';

  @override
  String get changeLanguage => 'ভাষা সলনি কৰক';

  @override
  String get chooseYourKundli => 'আপোনাৰ কুণ্ডলী বাছি লওক';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'আপোনাৰ মানিবেগ, পঢ়া আৰু সংৰক্ষিত বিৱৰণসমূহ সুৰক্ষিত থাকে — কিন্তু লগ আউট কৰাৰ অৰ্থ হ\'ল আপোনাৰ দৈনিক ৰাশিফল, অফাৰ আৰু সোঁৱৰাই দিয়া। তাৰকাৰ সৈতে সংযুক্ত হৈ থাকিবনে? ✨';

  @override
  String get offers => 'অফাৰ';

  @override
  String get dailyPanchang => 'দৈনিক পঞ্চাং';

  @override
  String get talkToAstrologer => 'জ্যোতিষীৰ লগত কথা পাতক';

  @override
  String get brihatKundli => 'বৃহত কুণ্ডলী';

  @override
  String get dailyNotes => 'দৈনিক টোকা';

  @override
  String get askAQuestion => 'এটা প্ৰশ্ন কৰক';

  @override
  String get free50Pages => 'বিনামূলীয়া ৫০+ পৃষ্ঠা';

  @override
  String get freeReport => 'বিনামূলীয়া প্ৰতিবেদন';

  @override
  String get freeMatrimony => 'বিনামূলীয়া বিবাহ';

  @override
  String get matrimony => 'বিবাহ';

  @override
  String get loveMatch => 'লাভ মেচ';

  @override
  String get horoscope => 'ৰাশিফল';

  @override
  String get dailyHoroscope => 'দৈনিক ৰাশিফল';

  @override
  String get vedicAstrology => 'বৈদিক জ্যোতিষ';

  @override
  String get acharyaVeda => 'আচাৰ্য বেদ';

  @override
  String get panditRohan => 'পণ্ডিত ৰোহন';

  @override
  String get guruMaya => 'ভাৰ্চুৱেল শিক্ষক';

  @override
  String get jayaShastri => 'জয়া শাস্ত্ৰী';

  @override
  String get devSharma => 'দেৱ শৰ্মা';

  @override
  String get sureshG => 'সুৰেশ জি.';

  @override
  String get lataP => 'পি বছৰ';

  @override
  String get kiranB => 'কিৰণ বি.';

  @override
  String get mohanT => 'মোহন টি.';

  @override
  String get anilJoshi => 'অনিল যোশী';

  @override
  String get meeraDevi => 'মীৰা দেৱী';

  @override
  String get raviKumar => 'ৰবি কুমাৰ';

  @override
  String get sunitaRao => 'সুনীতা ৰাও';

  @override
  String get bengaluruKarnataka => 'বেংগালুৰু, কৰ্ণাটক';

  @override
  String get locating => 'অবস্থান...';

  @override
  String get festivalOffer => 'উৎসৱৰ প্ৰস্তাৱ';

  @override
  String get upTo30OffOnGemstones => 'ৰত্নত ৩০% পৰ্যন্ত ৰেহাই';

  @override
  String get talkToTopAstrologers => 'শীৰ্ষ জ্যোতিষীৰ সৈতে কথা পাতক';

  @override
  String get firstConsultationSpecial => 'প্ৰথম পৰামৰ্শ বিশেষ';

  @override
  String get rudrakshaCollection => 'ৰুদ্ৰাক্ষ সংগ্ৰহ';

  @override
  String get authenticEnergised => 'প্ৰামাণিক আৰু শক্তিশালী';

  @override
  String get resumeSession => 'অধিবেশন পুনৰ আৰম্ভ কৰক';

  @override
  String get home => 'গৃহ';

  @override
  String get aiAstro => 'এ আই এষ্ট্ৰ\'';

  @override
  String get ask => 'সোধা';

  @override
  String get history => 'ইতিহাস';

  @override
  String get seeAll2 => 'সকলো চাওক';

  @override
  String get s1AcceptanceOfTheseTerms => '১/ এই চৰ্তসমূহ গ্ৰহণ কৰা';

  @override
  String get termsOfService2 => 'সেৱাৰ চৰ্তসমূহ';

  @override
  String get lastUpdated26June2026 =>
      'শেষবাৰৰ বাবে আপডেট কৰা হৈছে: ২৬ জুন ২০২৬';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appNameই জ্যোতিষ, আধ্যাত্মিক, আৰু সুস্থতাৰ পৰামৰ্শ আগবঢ়ায় নিৰ্দেশনা আৰু ব্যক্তিগত ';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'কেৱল প্ৰতিফলন। আমাৰ সেৱাসমূহ পেছাদাৰী চিকিৎসা, আইনী, আৰ্থিক, ';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'বা মানসিক পৰামৰ্শ। এপটো ব্যৱহাৰ কৰিবলৈ আপোনাৰ বয়স ১৮ বছৰ বা তাতকৈ অধিক হ’ব লাগিব।';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'একাউণ্ট তৈয়াৰ কৰি বা $appName মোবাইল এপ্লিকেচন আৰু আনুষংগিক সেৱাসমূহ ব্যৱহাৰ কৰি (the... ';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '“সেৱাসমূহ”), আপুনি এই সেৱাৰ চৰ্তসমূহ আৰু আমাৰ গোপনীয়তা নীতি আৰু ধন ঘূৰাই দিয়াৰ দ্বাৰা বান্ধ খাই থাকিবলৈ সন্মত হৈছে৷ ';

  @override
  String get policyIfYouDoNotAgree =>
      'নীতি। যদি আপুনি সন্মত নহয়, অনুগ্ৰহ কৰি সেৱাসমূহ ব্যৱহাৰ নকৰিব।';

  @override
  String get s2EligibilityYourAccount => '২/ যোগ্যতা & আপোনাৰ একাউণ্ট';

  @override
  String get youMustBeAtLeast18 =>
      'আপুনি কমেও ১৮ বছৰ বয়সৰ হ’ব লাগিব আৰু আইনগতভাৱে চুক্তিবদ্ধ হ’ব পাৰিব লাগিব।';

  @override
  String get youRegisterWithAPhoneNumber =>
      'আপুনি এটা এককালীন পাছৱৰ্ড (OTP) দ্বাৰা পৰীক্ষা কৰা ফোন নম্বৰৰ সৈতে পঞ্জীয়ন কৰে। সেই নম্বৰ আৰু ডিভাইচলৈ অভিগম সুৰক্ষিত ৰখাৰ বাবে আপুনি দায়বদ্ধ।';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'আপুনি সঠিক তথ্য দিবলৈ সন্মত হৈছে, য\'ত আপুনি পঢ়াৰ বাবে শ্বেয়াৰ কৰিবলৈ বাছি লয় জন্মৰ বিৱৰণো অন্তৰ্ভুক্ত। আপোনাৰ একাউণ্টৰ অধীনত থকা সকলো কাৰ্য্যকলাপৰ বাবে আপুনি দায়বদ্ধ।';

  @override
  String get s3TheServicesWeOffer => '৩/ আমি আগবঢ়োৱা সেৱাসমূহ';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appNameই আপোনাক অডিঅ\' কল, ভিডিঅ\' কল, ';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'আৰু আড্ডা, আৰু আনুষংগিক বৈশিষ্ট্যসমূহ যেনে kundli প্ৰজন্ম আৰু মিলন, এজন AI জ্যোতিষী, ';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'দৈনিক ৰাশিফল, পূজা বুকিং, আধ্যাত্মিক সামগ্ৰীৰ দোকান, উপহাৰ, আৰু বিবাহৰ মিল। ';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'যিকোনো বৈশিষ্ট্য বা জ্যোতিষীৰ উপলব্ধতা যিকোনো সময়তে সলনি হ’ব পাৰে।';

  @override
  String get s4WalletPricingBilling => '৪/ ৱালেট, মূল্য নিৰ্ধাৰণ আৰু বিলিং';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'পৰামৰ্শ প্ৰিপেইড কৰা হয়। আপুনি এটা ইন-এপ ৱালেটত ধন যোগ কৰে আৰু আপুনি সংযোগ কৰাৰ আগতে জ্যোতিষী আৰু সেৱাৰ বাবে দেখুওৱা হাৰত প্ৰতি মিনিটত ধন দিয়ে।';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'বিলিং আৰম্ভ হয় যেতিয়া জ্যোতিষীয়ে গ্ৰহণ কৰে আৰু অধিবেশন সংযোগ হয়। প্ৰথম মিনিটটো কানেক্টত চাৰ্জ কৰা হয়, আৰু পৰৱৰ্তী মিনিটটো ইয়াৰ আৰম্ভণিতে চাৰ্জ কৰা হয়। অধিবেশনৰ সময়ত এটা লাইভ মিটাৰ দেখুওৱা হয়, আৰু অধিবেশন স্বয়ংক্ৰিয়ভাৱে শেষ হয় যদি আপোনাৰ বেলেন্স কম হয়।';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'পেমেণ্টসমূহ আমাৰ পেমেণ্ট পাৰ্টনাৰ (PayU) দ্বাৰা প্ৰক্ৰিয়াকৰণ কৰা হয়। আমি কাৰ্ডৰ সম্পূৰ্ণ সবিশেষ সংৰক্ষণ নকৰো।';

  @override
  String get walletBalancesAreForUseWithin =>
      'ৱালেটৰ বেলেঞ্চ সেৱাসমূহৰ ভিতৰত ব্যৱহাৰৰ বাবে। ৰিফাণ্ড, য\'ত প্ৰযোজ্য, আমাৰ ৰিফাণ্ড নীতিৰ দ্বাৰা পৰিচালিত হয়।';

  @override
  String get pricesAreInIndianRupeesInr =>
      'মূল্য ভাৰতীয় টকা (INR)ত আৰু ইয়াত প্ৰযোজ্য কৰ অন্তৰ্ভুক্ত হ’ব পাৰে।';

  @override
  String get s5AcceptableUse => '৫/ গ্ৰহণযোগ্য ব্যৱহাৰ';

  @override
  String get youAgreeNotTo => 'আপুনি এইটো নকৰিবলৈ সন্মত হৈছে:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'জ্যোতিষী বা কৰ্মচাৰীৰ সৈতে যৌন সম্পৰ্কীয় বা অবৈধ বিষয়বস্তু হাৰাশাস্তি, নিৰ্যাতন, ভাবুকি বা ভাগ-বতৰা কৰা।';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'কোনো ব্যক্তিৰ ৰূপ লোৱা, বা সেৱা বা ধন ঘূৰাই পাবলৈ ভুৱা তথ্য প্ৰদান কৰা।';

  @override
  String get attemptToTakeAConsultationOff =>
      'মাচুল এৰাই চলিবলৈ এটা পৰামৰ্শ অফ-প্লেটফৰ্ম ল\'বলৈ চেষ্টা কৰক, বা ব্যক্তিগত যোগাযোগৰ বিৱৰণ বিচাৰিব।';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'সেৱাসমূহ বা সিহতৰ সুৰক্ষাত হস্তক্ষেপ কৰক, স্ক্ৰেপ কৰক, বা বিঘ্নিত কৰাৰ চেষ্টা কৰক।';

  @override
  String get s6AstrologersOnThePlatform => '৬/ মঞ্চত জ্যোতিষীসকল';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'জ্যোতিষীসকল হৈছে স্বতন্ত্ৰ অনুশীলনকাৰী যিসকলৰ পৰিচয়-পৰীক্ষা আৰু $appNameৰ অনুমোদিত ';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'তেওঁলোকে পৰামৰ্শ আগবঢ়াব পৰাৰ আগতে। আমি নিৰ্ধাৰণ কৰা সীমাৰ ভিতৰত তেওঁলোকে নিজৰ প্ৰতি মিনিটৰ ভাড়া নিৰ্ধাৰণ কৰে। ';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'আলোচনাৰ সময়ত ভাগ কৰা মতামত আৰু নিৰ্দেশনা ব্যক্তিগত জ্যোতিষীৰহে আৰু নহয় ';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return '$appNameৰ। আপুনি পৰামৰ্শৰ ভিত্তিত লোৱা কোনো সিদ্ধান্তৰ বাবে আমি দায়বদ্ধ নহয়।';
  }

  @override
  String get s7RecordingsContent => '৭/ ৰেকৰ্ডিং আৰু বিষয়বস্তু';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'গুণগত মান, সুৰক্ষা, আৰু বিবাদ নিষ্পত্তিৰ বাবে, অডিঅ\' আৰু ভিডিঅ\' পৰামৰ্শ ৰেকৰ্ড কৰিব পাৰি। আপুনি ';

  @override
  String get consentToSuchRecordingByStarting =>
      'এটা অধিবেশন আৰম্ভ কৰি এনে ৰেকৰ্ডিঙৰ বাবে সন্মতি দিব। আড্ডাৰ কথোপকথনসমূহ সংৰক্ষণ কৰা হয় যাতে আপুনি পুনৰ চাব পাৰে ';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'তেওঁলোকক। এই তথ্য কেনেকৈ নিয়ন্ত্ৰণ কৰা হয় তাৰ বাবে আমাৰ গোপনীয়তা নীতি চাওক।';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '৮/ অস্বীকাৰ আৰু দায়বদ্ধতাৰ সীমাবদ্ধতা';

  @override
  String get theServicesAreProvidedAsIs =>
      'সেৱাসমূহ নিৰ্দেশনা আৰু মনোৰঞ্জনৰ কাষৰীয়া ব্যক্তিগত প্ৰতিফলনৰ বাবে “যেনেকৈ আছে” প্ৰদান কৰা হয়। ';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return '$appNameই কোনো ভৱিষ্যদ্বাণী বা প্ৰতিকাৰৰ সঠিকতাৰ কোনো নিশ্চয়তা নিদিয়ে। সৰ্বোচ্চ পৰিসৰলৈকে ';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'আইনৰ দ্বাৰা অনুমোদিত, আপোনাৰ সেৱাসমূহৰ ব্যৱহাৰৰ পৰা উদ্ভৱ হোৱা $appName’s মুঠ দায়বদ্ধতা... ';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'আপুনি দাবীৰ জন্ম দিয়া ইভেণ্টৰ আগৰ ৩০ দিনত আপোনাৰ মানিবেগত দিয়া ধনৰাশি। আমি ';

  @override
  String get areNotLiableForIndirectOr =>
      'পৰোক্ষ বা ফলস্বৰূপে হোৱা লোকচানৰ বাবে দায়ী নহয়।';

  @override
  String get s9SuspensionTermination => '৯/ নিলম্বন আৰু সমাপ্তি';

  @override
  String get weMaySuspendOrTerminateYour =>
      'যদি আপুনি এই চৰ্তসমূহ উলংঘা কৰে, প্ৰৱঞ্চনাৰ চেষ্টা কৰে, বা অপব্যৱহাৰ কৰে তেন্তে আমি আপোনাৰ একাউণ্ট স্থগিত বা বন্ধ কৰিব পাৰো ';

  @override
  String get servicesYouMayStopUsingThe =>
      'সেৱাসমূহ। আপুনি যিকোনো সময়তে সেৱাসমূহ ব্যৱহাৰ কৰা বন্ধ কৰিব পাৰে। কিছুমান বিধান (পেমেণ্টৰ বাধ্যবাধকতা, ';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'অস্বীকাৰ, আৰু দায়বদ্ধতাৰ সীমাবদ্ধতা) সমাপ্তিৰ পৰা বাচি থাকে।';

  @override
  String get s10ChangesToTheseTerms => '১০) এই চৰ্তসমূহৰ পৰিৱৰ্তন';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'আমি সময়ে সময়ে এই চৰ্তসমূহ আপডেট কৰিব পাৰো। বস্তুগত পৰিৱৰ্তনৰ বিষয়ে এপত বা দ্বাৰা অৱগত কৰা হ\'ব ';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'ওপৰৰ “শেষ আপডেট কৰা” তাৰিখটো আপডেট কৰা। পৰিৱৰ্তনৰ পিছত ব্যৱহাৰ অব্যাহত ৰখাৰ অৰ্থ হ’ল আপুনি সেইবোৰ গ্ৰহণ কৰে।';

  @override
  String get s11ContactUs => '১১) আমাৰ সৈতে যোগাযোগ কৰক';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'এই শব্দবোৰৰ বিষয়ে প্ৰশ্ন? আমাৰ ৱেবছাইটত বা এপৰ যোগাযোগ প্ৰপত্ৰৰ জৰিয়তে আমাৰ সৈতে যোগাযোগ কৰক ';

  @override
  String get helpSupportSection => 'সহায় আৰু সমৰ্থন অংশ।';

  @override
  String get privacyPolicy2 => 'গোপনীয়তা নীতি';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'আপোনাৰ জন্মৰ সবিশেষ, পৰামৰ্শ, আৰু আড্ডা আপোনাৰ বাবে ব্যক্তিগত। এই নীতিয়ে বুজাই দিয়ে আমি কি... ';

  @override
  String get collectWhyAndTheControlYou =>
      'সংগ্ৰহ কৰক, কিয়, আৰু ইয়াৰ ওপৰত আপোনাৰ নিয়ন্ত্ৰণ।';

  @override
  String get s1InformationWeCollect => '১/ আমি সংগ্ৰহ কৰা তথ্য';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'একাউণ্টৰ তথ্য: আপোনাৰ নাম, ফোন নম্বৰ (OTP দ্বাৰা পৰীক্ষা কৰা), আৰু ইমেইল যদি প্ৰদান কৰা হয়।';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'জন্মৰ বিৱৰণ: তাৰিখ, সময়, আৰু জন্মস্থান যিবোৰ আপুনি কুণ্ডলী আৰু পঢ়াৰ বাবে শ্বেয়াৰ কৰিবলৈ বাছি লয়।';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'পৰামৰ্শৰ তথ্য: আড্ডা বাৰ্তা, আৰু প্ৰযোজ্য ঠাইত অডিঅ\'/ভিডিঅ\' কল ৰেকৰ্ডিং।';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'পেমেণ্ট ডাটা: ৱালেট লেনদেন আৰু পেমেণ্ট ৰেফাৰেন্স। কাৰ্ডৰ সবিশেষ আমাৰ পেমেণ্ট পাৰ্টনাৰ (PayU) দ্বাৰা চম্ভালে; আমি সম্পূৰ্ণ কাৰ্ড নম্বৰ সংৰক্ষণ নকৰো।';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'ডিভাইচ আৰু ব্যৱহাৰৰ তথ্য: ডিভাইচৰ ধৰণ, কাৰ্য্যকৰপ্ৰণালী, আপোনাৰ IP ঠিকনাৰ পৰা আহৰণ কৰা আনুমানিক অৱস্থান, ভ্ৰমণ কৰা পৃষ্ঠাসমূহ, আৰু পাৰস্পৰিক ক্ৰিয়াসমূহ, সেৱাসমূহ চলাবলৈ আৰু উন্নত কৰিবলে ব্যৱহৃত।';

  @override
  String get s2HowWeUseIt => '২/ আমি ইয়াক কেনেকৈ ব্যৱহাৰ কৰো';

  @override
  String get toCreateAndSecureYourAccount =>
      'আপোনাৰ একাউণ্ট সৃষ্টি আৰু সুৰক্ষিত কৰিবলৈ আৰু আপোনাৰ পৰিচয় পৰীক্ষা কৰিবলৈ।';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'জ্যোতিষীসকলৰ সৈতে আপোনাক সংযোগ কৰিবলৈ আৰু পৰামৰ্শ, কুণ্ডলী, ৰাশিফল, আৰু অন্যান্য বৈশিষ্ট্যসমূহ প্ৰদান কৰিবলৈ।';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'ৱালেট ৰিচাৰ্জ, প্ৰতি মিনিট বিলিং, পেআউট, আৰু অৰ্ডাৰ পূৰণ প্ৰক্ৰিয়া কৰিবলৈ।';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'সহায় আগবঢ়াবলৈ, প্ৰৱঞ্চনা আৰু অপব্যৱহাৰ প্ৰতিৰোধ কৰিবলৈ, আৰু আইনী বাধ্যবাধকতা পূৰণ কৰিবলৈ।';

  @override
  String get toUnderstandAndImproveHowThe =>
      'এপ আৰু ৱেবছাইট কেনেকৈ ব্যৱহাৰ কৰা হয় বুজিবলৈ আৰু উন্নত কৰিবলৈ।';

  @override
  String get s3WhenWeShareInformation => '৩/ আমি যেতিয়া তথ্য ভাগ-বতৰা কৰো';

  @override
  String get weDoNotSellYourPersonal =>
      'আমি আপোনাৰ ব্যক্তিগত তথ্য বিক্ৰী নকৰো। আমি ইয়াক কেৱল শ্বেয়াৰ কৰো:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'আপুনি পৰামৰ্শ লোৱা জ্যোতিষীজনৰ সৈতে, পঢ়াৰ বাবে প্ৰয়োজনীয়খিনিত সীমাবদ্ধ (যেনে আপোনাৰ জন্মৰ বিৱৰণ আৰু আড্ডা)।';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'আমাক পৰিচালনা কৰাত সহায় কৰা সেৱা প্ৰদানকাৰীসকলৰ সৈতে — পেমেণ্ট প্ৰচেছিং (PayU), ক্লাউড হ\'ষ্টিং আৰু সংৰক্ষণ, যোগাযোগ (OTPৰ বাবে WhatsApp/SMS), আৰু জাননীসমূহ — গোপনীয়তাৰ বাধ্যবাধকতাৰ অধীনত৷';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'আইনৰ দ্বাৰা প্ৰয়োজনীয় হ\'লে, বা ব্যৱহাৰকাৰী আৰু $appNameৰ অধিকাৰ, সুৰক্ষা, আৰু সম্পত্তি সুৰক্ষিত কৰিবলৈ।';
  }

  @override
  String get s4ConsultationRecordingsChats => '৪/ পৰামৰ্শৰ ৰেকৰ্ডিং আৰু আড্ডা';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'অডিঅ\' আৰু ভিডিঅ\' পৰামৰ্শসমূহ ৰেকৰ্ড কৰিব পাৰি, আৰু আড্ডাসমূহ সংৰক্ষণ কৰা হয়, গুণগত মান, সুৰক্ষা, আৰু... ';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'বিবাদ নিষ্পত্তি। এপটোত আপোনাৰ আড্ডাৰ ইতিহাস পৰ্যালোচনা কৰিব পাৰিব। ৰেকৰ্ডিংসমূহ হিচাপে ৰখা হয় ';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'তলত বৰ্ণনা কৰা হৈছে আৰু সমৰ্থন, সুৰক্ষা, বা আইনী কাৰণত প্ৰয়োজন হ\'লেহে প্ৰৱেশ কৰা হয়।';

  @override
  String get s5AnalyticsCookies => '৫/ বিশ্লেষণ আৰু কুকিজ';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'আমাৰ ৱেবছাইটটোৱে উভতি অহাসকলক চিনাক্ত কৰিবলৈ, কেনেকৈ... ';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'লেণ্ডিং পৃষ্ঠাই পৰিৱেশন কৰে (যেনে কোনবোৰ অংশ ক্লিক কৰা হয়), আৰু চাইন-আপসমূহক বিপণনৰ বাবে বৈশিষ্ট্য দিয়ে ';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'অভিযানসমূহ। অভিজ্ঞতা উন্নত কৰিবলৈ ইয়াক সামগ্ৰিকভাৱে ব্যৱহাৰ কৰা হয়। আমি আনুমানিক চহৰ/অঞ্চল উলিয়াওঁ ';

  @override
  String get fromYourIpAddressWeDo =>
      'আপোনাৰ IP ঠিকনাৰ পৰা; আমি বিশ্লেষণৰ বাবে নিৰ্দিষ্ট জিপিএছ অৱস্থান ব্যৱহাৰ নকৰো।';

  @override
  String get s6DataRetention => '৬/ তথ্য ধৰি ৰখা';

  @override
  String get weKeepYourInformationForAs =>
      'আমি আপোনাৰ তথ্য যেতিয়ালৈকে আপোনাৰ একাউণ্ট সক্ৰিয় হৈ থাকে আৰু প্ৰয়োজন অনুসৰি ৰাখোঁ ';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'সেৱাসমূহ, আইনী বাধ্যবাধকতাসমূহ মানি চলা, বিবাদসমূহ সমাধান কৰা, আৰু আমাৰ চুক্তিসমূহ বলবৎ কৰা। আপুনিও পাৰে ';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'আপোনাৰ একাউণ্ট আৰু সংশ্লিষ্ট ব্যক্তিগত তথ্য মচি পেলাবলৈ অনুৰোধ কৰক, আইনী ধৰি ৰখাৰ অধীনত ';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'প্ৰয়োজনীয়তাসমূহ (উদাহৰণস্বৰূপে, লেনদেনৰ ৰেকৰ্ডসমূহ আমি হিচাপ আৰু কৰ বাবে ৰাখিব লাগিব)।';

  @override
  String get s7Security => '৭/ নিৰাপত্তা';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'আমি উদ্যোগ-মানক ব্যৱস্থা ব্যৱহাৰ কৰো — ট্ৰেনজিটত এনক্ৰিপচন, অভিগম নিয়ন্ত্ৰণ, আৰু সুৰক্ষিত৷ ';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'আন্তঃগাঁথনি — আপোনাৰ তথ্য সুৰক্ষিত কৰিবলৈ। সংক্ৰমণ বা সংৰক্ষণৰ কোনো পদ্ধতি সম্পূৰ্ণৰূপে নহয় ';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'সুৰক্ষিত, গতিকে আমি নিৰপেক্ষ নিৰাপত্তাৰ নিশ্চয়তা দিব নোৱাৰো।';

  @override
  String get s8YourRightsChoices => '৮/ আপোনাৰ অধিকাৰ আৰু পছন্দ';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'এপটোত আপোনাৰ প্ৰফাইল আৰু জন্মৰ বিৱৰণ প্ৰৱেশ কৰক, সংশোধন বা আপডেট কৰক।';

  @override
  String get requestACopyOrDeletionOf =>
      'আমাৰ সৈতে যোগাযোগ কৰি আপোনাৰ ব্যক্তিগত তথ্যৰ কপি বা মচি পেলাবলৈ অনুৰোধ কৰক।';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'আপোনাৰ ডিভাইচ বা এপ ছেটিংছত প্ৰচাৰমূলক জাননীসমূহৰ পৰা আঁতৰি যাওক।';

  @override
  String get s9Children => '৯/ শিশু';

  @override
  String get theServicesAreIntendedForUsers =>
      'সেৱাসমূহ ১৮ বছৰ আৰু তাৰ ওপৰৰ ব্যৱহাৰকাৰীসকলৰ বাবে উদ্দেশ্য কৰা হৈছে। আমি জানি-বুজিৰ পৰা তথ্য সংগ্ৰহ নকৰো ';

  @override
  String get anyoneUnder18IfYouBelieve =>
      'যদি আপুনি বিশ্বাস কৰে যে কোনো নাবালকে সেৱাসমূহ ব্যৱহাৰ কৰিছে, অনুগ্ৰহ কৰি আমাৰ সৈতে যোগাযোগ কৰক যাতে আমি ইয়াক আঁতৰাব পাৰো।';

  @override
  String get s10ChangesToThisPolicy => '১০) এই নীতিৰ পৰিৱৰ্তন';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'আমি এই নীতি আপডেট কৰিব পাৰো। সামগ্ৰীৰ পৰিৱৰ্তনসমূহ এপত বা আপডেট কৰি অৱগত কৰা হ\'ব ';

  @override
  String get lastUpdatedDateAbove => 'ওপৰত “শেষ আপডেট কৰা” তাৰিখ।';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'গোপনীয়তাৰ প্ৰশ্ন বা ডাটাৰ অনুৰোধৰ বাবে, আমাৰ ৱেবছাইটত থকা যোগাযোগ প্ৰপত্ৰৰ জৰিয়তে আমাৰ সৈতে যোগাযোগ কৰক বা... ';

  @override
  String get appSHelpSupportSection => 'এপৰ সহায় আৰু সমৰ্থন অংশ।';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return 'Â© ২০২৬ $appName Â· ১৮+ Â· পথ প্ৰদৰ্শন আৰু মংগলৰ বাবে â\nপেছাদাৰী পৰামৰ্শৰ বিকল্প নহয়।';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'width=ডিভাইচ-প্ৰস্থ, প্ৰাৰম্ভিক-স্কেল=1, সৰ্বোচ্চ-স্কেল=1';

  @override
  String get segoeUi => 'Segoe UI';

  @override
  String get vote => 'ভোট দিয়ক';

  @override
  String get couldnTLoadLiveSessions => 'লাইভ অধিবেশনসমূহ লোড কৰিব পৰা নগ’ল৷';

  @override
  String get noOneIsLiveRightNow => 'বৰ্তমান কোনেও লাইভ নাই';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'যেতিয়া কোনো জ্যোতিষী লাইভ হ’ব, তেতিয়া তেওঁলোক ইয়াত দেখা দিব৷ সতেজ কৰিবলৈ তললৈ টানিব — বা এটা জাননীৰ বাবে চাওক।';

  @override
  String get justNow => 'মাত্ৰ এতিয়াই';

  @override
  String get couldNotLoad => 'লোড কৰিব পৰা নগ\'ল';

  @override
  String get continueLabel => 'অব্যাহত ৰাখক';

  @override
  String get openSettings => 'ছেটিংছ খোলক';

  @override
  String get somePermissionsAreBlockedTapA =>
      'কিছুমান অনুমতি ব্লক কৰা হৈছে। এটা ব্লক কৰা বস্তু (বা “সংহতিসমূহ খোলক”) টেপ কৰক আৰু ইয়াক সামৰ্থবান কৰক, তাৰ পিছত ইয়ালৈ উভতি যাওক।';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return '$appName ব্যৱহাৰ কৰিবলৈ এই অনুমতিসমূহৰ প্ৰয়োজন। যিকোনো বাকী থকা বস্তুটো অনুমোদন কৰিবলৈ টেপ কৰক।';
  }

  @override
  String get settings2 => 'ছেটিংছ';

  @override
  String get allow => 'অনুমতি দিয়া';

  @override
  String get blockedEnableItInSettings =>
      'ব্লক কৰা হৈছে — সংহতিসমূহত ইয়াক সামৰ্থবান কৰক';

  @override
  String get allowsUpTo => 'পৰ্যন্ত অনুমতি দিয়ে';

  @override
  String get bookingFailed => 'বুকিং বিফল হ’ল';

  @override
  String get yourDetails => 'আপোনাৰ সবিশেষ';

  @override
  String get fromYourProfile => 'আপোনাৰ প্ৰফাইলৰ পৰা';

  @override
  String get familyMembers => 'পৰিয়ালৰ সদস্য';

  @override
  String get addMember => 'সদস্য যোগ কৰক';

  @override
  String get addAnother => 'আন এটা যোগ কৰক';

  @override
  String get preferredDateOptional => 'পছন্দৰ তাৰিখ (ঐচ্ছিক)';

  @override
  String get anyDate => 'যিকোনো তাৰিখ';

  @override
  String get bookNowFree => 'এতিয়াই বুকিং কৰক (বিনামূলীয়া)';

  @override
  String get couldNotLoadThisPooja => 'এই পূজা লোড কৰিব পৰা নগ\'ল';

  @override
  String get forLabel => 'বাবে';

  @override
  String get s1Person => '১ জন ব্যক্তি';

  @override
  String get bookShareDetails => 'বুক & শ্বেয়াৰৰ বিৱৰণ';

  @override
  String get confirmYourBookingWithTheNames =>
      'পূজা কৰা নামেৰে আপোনাৰ বুকিং নিশ্চিত কৰক।';

  @override
  String get panditCoordinates => 'পণ্ডিত স্থানাংক';

  @override
  String get aVerifiedPanditCallsToFix =>
      'এজন ভেৰিফাইড পণ্ডিতে সময় ঠিক কৰি সমগ্ৰীৰ ব্যৱস্থা কৰিবলৈ মাতে।';

  @override
  String get poojaPerformed => 'পূজাই পৰিবেশন কৰিলে';

  @override
  String get sankalpIsTakenInYourFamily =>
      'সংকল্প আপোনাৰ পৰিয়ালৰ নামত লোৱা হয়, আৰু য’ত প্ৰযোজ্য হয় তাত পিছত প্ৰসাদ ভাগ কৰা হয়।';

  @override
  String get couldNotLoadPoojas => 'পূজা লোড কৰিব পৰা নগ\'ল';

  @override
  String get any => 'যিকোনো';

  @override
  String get noPoojasHere => 'ইয়াত পূজা নাই';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'বৰ্তমানৰ ফিল্টাৰসমূহৰ সৈতে একোৱেই মিল নাই';

  @override
  String get noPoojasAvailableYet => 'এতিয়াও কোনো পূজা উপলব্ধ নহয়';

  @override
  String get showAllPoojas => 'সকলো পূজা দেখুৱাওক';

  @override
  String get tapToViewDetailsBook => 'বিৱৰণ আৰু কিতাপ চাবলৈ টেপ কৰক';

  @override
  String get appliedYouBothEarnOnYour =>
      'প্ৰয়োগ কৰা হৈছে! আপুনি দুয়োজনে প্ৰথম ৰিচাৰ্জত উপাৰ্জন কৰে।';

  @override
  String get shareYourCode => 'আপোনাৰ ক\'ড শ্বেয়াৰ কৰক';

  @override
  String get sendYourCodeToFriendsVia =>
      'WhatsApp, SMS, যিকোনো ঠাইতে বন্ধু-বান্ধৱীলৈ আপোনাৰ ক\'ড প্ৰেৰণ কৰক।';

  @override
  String get friendSignsUp => 'বন্ধুৱে চাইন আপ কৰে';

  @override
  String get theyEnterYourCodeInRefer =>
      'চাইন আপ কৰাৰ পিছত তেওঁলোকে আপোনাৰ ক’ড Refer & Earn ত প্ৰৱেশ কৰে।';

  @override
  String get feedbackReceived => 'মতামত লাভ কৰা হৈছে ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'ধন্যবাদ — আমাৰ দলটোৱে ইয়াৰ ওপৰত চকু দিব।';

  @override
  String get fullName => 'সম্পূৰ্ণ নাম';

  @override
  String get email => 'ইমেইল';

  @override
  String get phoneNumber => 'ফোন নম্বৰ';

  @override
  String get message => 'বাৰ্তা';

  @override
  String get requiredLabel => 'প্ৰয়োজনীয়';

  @override
  String get applicationReceived => 'আবেদন লাভ কৰা হৈছে ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'আমাৰ দলটোৱে আপোনাৰ জ্যোতিষী প্ৰফাইলৰ বিষয়ে হাত আগবঢ়াব।';

  @override
  String get enter10Digits => '১০টা অংক দিয়ক';

  @override
  String get aboutYouBioExpertiseExperience =>
      'আপোনাৰ বিষয়ে (বায়\', বিশেষজ্ঞতা, অভিজ্ঞতা)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appNameই আপোনাক কেৰিয়াৰৰ ওপৰত পথ প্ৰদৰ্শনৰ বাবে বিশ্বাসযোগ্য বৈদিক জ্যোতিষীসকলৰ সৈতে সংযোগ কৰে, ';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'বিবাহ, বিত্ত, স্বাস্থ্য আৰু জীৱনৰ ডাঙৰ প্ৰশ্ন — আড্ডা, কল আৰু ভিডিঅ’ৰ জৰিয়তে৷ ';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'আপোনাৰ বিনামূলীয়া কুণ্ডলী, দৈনিক ৰাশিফল, মেচমেকিং, পূজা আৰু প্ৰতিকাৰ, সকলো একে ঠাইতে লাভ কৰক।\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'আমাৰ মিছন হৈছে প্ৰামাণিক, দয়ালু আধ্যাত্মিক পথ প্ৰদৰ্শন সকলোৰে বাবে সুলভ কৰি তোলা, ';

  @override
  String get inYourOwnLanguage => 'নিজৰ ভাষাত।';

  @override
  String get verifiedExperiencedAstrologers => 'পৰীক্ষা কৰা, অভিজ্ঞ জ্যোতিষী';

  @override
  String get privateSecureConsultations => 'ব্যক্তিগত আৰু সুৰক্ষিত পৰামৰ্শ';

  @override
  String get availableIn6IndianLanguages => '৬ টা ভাৰতীয় ভাষাত উপলব্ধ';

  @override
  String get thanksForRatingUs => 'আমাক ৰেটিং দিয়াৰ বাবে ধন্যবাদ ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'আপোনাৰ মতামতে $appNameক বৃদ্ধি কৰাত সহায় কৰে।';
  }

  @override
  String get onceInADay => 'দিনটোত এবাৰ';

  @override
  String get twiceInADay => 'দিনটোত দুবাৰকৈ';

  @override
  String get asManyTimesAsItComes => 'যিমানবাৰ আহে';

  @override
  String get never => 'কেতিয়াও নহয়';

  @override
  String get cricket => 'ক্ৰিকেট';

  @override
  String get shareMarket => 'শ্বেয়াৰ মাৰ্কেট';

  @override
  String get bollywood => 'বলীউড';

  @override
  String get newMagazine => 'নিউ মেগাজিন';

  @override
  String get festivals => 'উৎসৱ-পাৰ্বণ';

  @override
  String get notificationsUpdated => 'জাননীসমূহ আপডেট কৰা হৈছে ✓';

  @override
  String get youLlHearFromUsBased =>
      'আপোনাৰ পছন্দৰ ওপৰত ভিত্তি কৰি আমাৰ পৰা শুনিব।';

  @override
  String get yourChartsWillNowFollowYour =>
      'আপোনাৰ চাৰ্টসমূহে এতিয়া আপোনাৰ নিৰ্বাচিত শৈলী অনুসৰণ কৰিব।';

  @override
  String get chartStyle => 'চাৰ্ট শৈলী';

  @override
  String get northIndian => 'উত্তৰ ভাৰতীয়';

  @override
  String get southIndian => 'দক্ষিণ ভাৰতীয়';

  @override
  String get monthSystem => 'মাহৰ ব্যৱস্থা';

  @override
  String get amanta => 'মিষ্ট্ৰেছ';

  @override
  String get purnimanta => 'পূৰ্ণিমন্ত';

  @override
  String get darkMode => 'ডাৰ্ক মোড';

  @override
  String get off => 'বন্ধ কৰা';

  @override
  String get onLabel => 'ওপৰত';

  @override
  String get useDeviceSettings => 'ডিভাইচ সংহতিসমূহ ব্যৱহাৰ কৰক';

  @override
  String get ayanamsa => 'অয়নাংসা';

  @override
  String get nCLahiri => 'এন চি লাহিৰি';

  @override
  String get kpNew => 'কে পি নিউ';

  @override
  String get kpOld => 'কে পি অল্ড';

  @override
  String get raman => 'ৰমন';

  @override
  String get kpKhullar => 'কে পি খুল্লাৰ';

  @override
  String get subtotal => 'উপমুঠ';

  @override
  String get youSave => 'আপুনি সঞ্চয় কৰে';

  @override
  String get total => 'মুঠ';

  @override
  String get deliveryAddress => 'ডেলিভাৰীৰ ঠিকনা';

  @override
  String get orderSummary => 'অৰ্ডাৰৰ সাৰাংশ';

  @override
  String get couponsOffers => 'কুপন আৰু অফাৰ';

  @override
  String get billDetails => 'বিলৰ সবিশেষ';

  @override
  String get address => 'ঠিকনা';

  @override
  String get productDiscount => 'প্ৰডাক্ট ৰেহাই';

  @override
  String get itemsSubtotal => 'আইটেমসমূহ উপমুঠ';

  @override
  String get delivery => 'বিলি কৰা';

  @override
  String get free2 => 'বিনামূলীয়া';

  @override
  String get toPay => 'ধন দিবলৈ';

  @override
  String get dMmmYyyyHMmA => 'ঘ এমএমএম yyyy, h:mm a';

  @override
  String get couldNotDownloadInvoice => 'চালান ডাউনলোড কৰিব পৰা নগ\'ল';

  @override
  String get orderNotFound => 'অৰ্ডাৰ পোৱা নগ\'ল';

  @override
  String get activityTimeline => 'কাৰ্য্যকলাপৰ সময়সীমা';

  @override
  String get eeeDMmmYyyyHMm => 'ইইই, ঘ এমএমএম yyyy · h:mm ক';

  @override
  String get totalPaid => 'মুঠ পৰিশোধ কৰা হৈছে';

  @override
  String get orderPlaced2 => 'অৰ্ডাৰ দিয়া হৈছে';

  @override
  String get dMmmHMmA => 'ঘ এমএমএম, h:mm ক';

  @override
  String get generating => 'জেনেৰেটিং...';

  @override
  String get pleaseDescribeTheIssue => 'বিষয়টো বৰ্ণনা কৰক';

  @override
  String get couldNotLoadProducts => 'প্ৰডাক্টসমূহ লোড কৰিব পৰা নগ\'ল';

  @override
  String get newest => 'নতুনতম';

  @override
  String get priceLowHigh => 'মূল্য: কম→উচ্চ';

  @override
  String get priceHighLow => 'মূল্য: উচ্চ→নিম্ন';

  @override
  String get topRated => 'শীৰ্ষ ৰেটিং';

  @override
  String get s6DigitPin => '৬ অংকৰ পিন';

  @override
  String get addressLine1 => 'ঠিকনা লাইন ১ *';

  @override
  String get addressLine2 => 'ঠিকনা শাৰী 2';

  @override
  String get city => 'চহৰ *';

  @override
  String get state => 'ৰাজ্য *';

  @override
  String get pinCode => 'পিন কোড *';

  @override
  String get payment => 'পৰিশোধ';

  @override
  String get pooja => 'পূজা';

  @override
  String get shop => 'দোকান';

  @override
  String get securePayment => 'নিৰাপদ পেমেণ্ট';

  @override
  String get noTransactionsMatchTheseFilters =>
      'কোনো লেনদেন এই ফিল্টাৰসমূহৰ সৈতে মিল নাই';

  @override
  String get noTransactionsYet => 'এতিয়াও কোনো লেনদেন হোৱা নাই';

  @override
  String get moneyAdded => 'টকা যোগ কৰিলে';

  @override
  String get poojaBooking => 'পূজা বুকিং';

  @override
  String get videoCall => 'ভিডিঅ\' কল';

  @override
  String get shopOrder => 'দোকানৰ অৰ্ডাৰ';

  @override
  String get refund => 'ধন উভতোৱা';

  @override
  String get bonus => 'বোনাছ';

  @override
  String get credited => 'ক্ৰেডিট দিয়া হৈছে';

  @override
  String get debited => 'ডেবিট কৰা হৈছে';

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
