// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class L10nBn extends L10n {
  L10nBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'রুদ্রগঙ্গা';

  @override
  String get tagline => 'জ্যোতিষ ও কল্যাণ';

  @override
  String get splashBlessing => 'স্পষ্টতার পথে আপনার যাত্রা এখান থেকে শুরু';

  @override
  String get authWelcomeTitle => 'স্বাগতম';

  @override
  String get authWelcomeSubtitle =>
      'আপনার ফোন নম্বর দিয়ে সাইন ইন করুন বা অ্যাকাউন্ট তৈরি করুন';

  @override
  String get phoneLabel => 'ফোন নম্বর';

  @override
  String get phoneHint => '১০ সংখ্যার মোবাইল নম্বর';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'এগিয়ে যান';

  @override
  String get sendOtpButton => 'OTP পাঠান';

  @override
  String get otpTitle => 'আপনার নম্বর যাচাই করুন';

  @override
  String otpSubtitle(String phone) {
    return '$phone-এ পাঠানো ৬ সংখ্যার কোডটি লিখুন';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'যাচাই করে এগিয়ে যান';

  @override
  String get resendOtp => 'কোড পুনরায় পাঠান';

  @override
  String resendOtpIn(int seconds) {
    return '$seconds সেকেন্ডে পুনরায় পাঠান';
  }

  @override
  String get changeNumber => 'নম্বর পরিবর্তন করুন';

  @override
  String get termsNotice =>
      'এগিয়ে গেলে আপনি আমাদের শর্তাবলী ও গোপনীয়তা নীতিতে সম্মত হচ্ছেন';

  @override
  String get acceptPrefix => 'আমি সম্মত';

  @override
  String get acceptAnd => 'এবং';

  @override
  String get termsOfService => 'পরিষেবার শর্তাবলী';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get errInvalidPhone => 'একটি বৈধ ১০ সংখ্যার ফোন নম্বর লিখুন';

  @override
  String get errInvalidOtp => '৬ সংখ্যার কোডটি লিখুন';

  @override
  String get errGeneric => 'কিছু একটা ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get errNetwork => 'সংযোগ নেই। ইন্টারনেট পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get otpSent => 'OTP পাঠানো হয়েছে';

  @override
  String get loginSuccess => 'সাইন ইন হয়েছে';

  @override
  String get settings => 'সেটিংস';

  @override
  String get language => 'ভাষা';

  @override
  String get theme => 'থিম';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeLight => 'লাইট';

  @override
  String get themeDark => 'ডার্ক';

  @override
  String homeWelcome(String name) {
    return 'নমস্কার, $name';
  }

  @override
  String get logout => 'লগ আউট';

  @override
  String get onbTitle => 'আপনার সম্পর্কে বলুন';

  @override
  String get onbSubtitle =>
      'এটি আপনার রিডিং ব্যক্তিগতকৃত করতে সাহায্য করে। কোনোটিই বাধ্যতামূলক নয় — পরে শেষ করতে পারেন।';

  @override
  String get onbName => 'আপনার নাম';

  @override
  String get onbAddPhoto => 'ছবি যোগ করুন';

  @override
  String get onbChangePhoto => 'ছবি পরিবর্তন করুন';

  @override
  String get onbGender => 'লিঙ্গ';

  @override
  String get genderMale => 'পুরুষ';

  @override
  String get genderFemale => 'মহিলা';

  @override
  String get genderOther => 'অন্যান্য';

  @override
  String get onbDob => 'জন্ম তারিখ';

  @override
  String get onbTob => 'জন্ম সময়';

  @override
  String get onbDontKnowTime => 'আমি আমার জন্ম সময় জানি না';

  @override
  String get onbPob => 'জন্মস্থান';

  @override
  String get onbPobHint => 'আপনার জন্ম শহর খুঁজুন';

  @override
  String get onbLanguage => 'পছন্দের ভাষা';

  @override
  String get onbSelectDate => 'তারিখ নির্বাচন করুন';

  @override
  String get onbSelectTime => 'সময় নির্বাচন করুন';

  @override
  String get onbSkip => 'এখন বাদ দিন';

  @override
  String get onbFinish => 'সম্পন্ন করুন';

  @override
  String get onbSaved => 'প্রোফাইল সংরক্ষিত হয়েছে';

  @override
  String get completeProfile => 'আপনার প্রোফাইল সম্পূর্ণ করুন';

  @override
  String get completeProfileCta => 'সেটআপ শেষ করুন';

  @override
  String get permTitle => 'কয়েকটি অনুমতি';

  @override
  String get permSubtitle =>
      'যাতে কল, বিজ্ঞপ্তি ও ছবি ঠিকভাবে কাজ করে। আপনি যেকোনো সময় সেটিংসে পরিবর্তন করতে পারেন।';

  @override
  String get permNotifications => 'বিজ্ঞপ্তি';

  @override
  String get permNotificationsDesc =>
      'পরামর্শ সতর্কতা, অর্ডার আপডেট ও রিমাইন্ডার';

  @override
  String get permMic => 'মাইক্রোফোন';

  @override
  String get permMicDesc => 'জ্যোতিষীদের সাথে ভয়েস কলের জন্য';

  @override
  String get permCamera => 'ক্যামেরা';

  @override
  String get permCameraDesc => 'ভিডিও কল ও ছবি আপলোডের জন্য';

  @override
  String get permPhotos => 'ছবি';

  @override
  String get permPhotosDesc => 'আপনার প্রোফাইল ছবি সেট করতে';

  @override
  String get permAllow => 'অনুমতি দিন';

  @override
  String get permContinue => 'এগিয়ে যান';

  @override
  String get permLocation => 'অবস্থান';

  @override
  String get permLocationDesc => 'আপনার কাছের জ্যোতিষী খুঁজুন';

  @override
  String get secFeatured => 'বিশিষ্ট জ্যোতিষী';

  @override
  String get secNearby => 'কাছের জ্যোতিষী';

  @override
  String get secCallChat => 'কল ও চ্যাট';

  @override
  String get secAiAstro => 'AI জ্যোতিষী';

  @override
  String get secProducts => 'পণ্য';

  @override
  String get secVideos => 'ভিডিও';

  @override
  String get secLessons => 'জ্যোতিষ পাঠ';

  @override
  String get secOthers => 'অন্যান্য';

  @override
  String get secHistory => 'আপনার পরামর্শ';

  @override
  String get seeAll => 'সব দেখুন';

  @override
  String get basedOnLocation => 'আপনার অবস্থান অনুসারে';

  @override
  String get shareApp => 'বন্ধুদের সাথে অ্যাপ শেয়ার করুন';

  @override
  String get startReadingHint =>
      'এখনও কোনো পরামর্শ নেই। আপনার প্রথম রিডিং শুরু করুন।';

  @override
  String get startBtn => 'শুরু';

  @override
  String get namaste => 'নমস্কার';

  @override
  String get kFreeKundli => 'বিনামূল্যে কুণ্ডলী';

  @override
  String get kMatching => 'মিল';

  @override
  String get kBrihat => 'বৃহৎ কুণ্ডলী';

  @override
  String get kKundliAi => 'কুণ্ডলী AI+';

  @override
  String get tCareer => 'কেরিয়ার';

  @override
  String get tMarriage => 'বিবাহ';

  @override
  String get tFinance => 'অর্থ';

  @override
  String get tHealth => 'স্বাস্থ্য';

  @override
  String get tEducation => 'শিক্ষা';

  @override
  String get tTravel => 'ভ্রমণ';

  @override
  String get statusOnline => 'অনলাইন';

  @override
  String get statusBusy => 'ব্যস্ত';

  @override
  String get statusOffline => 'অফলাইন';

  @override
  String get retry => 'পুনরায় চেষ্টা করুন';

  @override
  String get chatNow => 'এখন চ্যাট করুন';

  @override
  String get notifyMe => 'আমাকে অবহিত করুন';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'এই জ্যোতিষীর সাথে পরামর্শ করার জন্য এখনও সময় পাওয়া যাচ্ছে না।';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'আপনার প্রোফাইল সম্পূর্ণ করুন';

  @override
  String get addYourDateTimePlaceOf =>
      'আপনার জন্ম তারিখ, সময় ও স্থান যোগ করুন, যাতে জ্যোতিষী আপনাকে আরও স্পষ্ট গণনা দিতে পারেন।';

  @override
  String get completeProfile2 => 'সম্পূর্ণ প্রোফাইল';

  @override
  String get skipForNow => 'আপাতত এড়িয়ে যান';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'আমাদের কারণটি জানান (ঐচ্ছিক) — এটি আমাদের উন্নতি করতে সাহায্য করে।';

  @override
  String get reasonOptional => 'কারণ (ঐচ্ছিক)';

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get unfollow => 'আনফলো করুন';

  @override
  String get s21kReviews => '(২.১ হাজার রিভিউ)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'উপহার';

  @override
  String get store => 'দোকান';

  @override
  String get joinLiveSession => 'লাইভ সেশনে যোগ দিন';

  @override
  String get youLlBeNotified => 'আপনাকে জানানো হবে।';

  @override
  String get thisStoreHasNoItemsYet => 'এই দোকানে এখনও কোনো পণ্য নেই।';

  @override
  String get filters => 'ফিল্টার';

  @override
  String get reset => 'রিসেট';

  @override
  String get onlineNowOnly => 'এখন শুধুমাত্র অনলাইনে';

  @override
  String get applyFilters => 'ফিল্টার প্রয়োগ করুন';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'এই জ্যোতিষীকে উপহার দেওয়া সম্ভব নয়।';

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
  String get recharge => 'রিচার্জ';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'পরিমাণ';

  @override
  String get min1Max100 => 'সর্বনিম্ন ১ সর্বোচ্চ ১০০';

  @override
  String get comingSoon => 'শীঘ্রই আসছে';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'আপনার জন্য রিমাইন্ডার সেট করা হয়েছে';

  @override
  String get suggestedForYou => 'আপনার জন্য প্রস্তাবিত';

  @override
  String get couldNotSendImage => 'ছবি পাঠানো যায়নি';

  @override
  String get endConsultation => 'পরামর্শ শেষ?';

  @override
  String get thisWillEndTheChatAnd =>
      'এর মাধ্যমে চ্যাটটি শেষ হবে এবং বিলিং বন্ধ হয়ে যাবে।';

  @override
  String get keepChatting => 'কথা বলতে থাকুন';

  @override
  String get end => 'শেষ';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'সুইচ';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'অডিও কলে সুইচ করুন';

  @override
  String get switchToVideoCall => 'ভিডিও কলে সুইচ করুন';

  @override
  String get endConsultation2 => 'পরামর্শ শেষ করুন';

  @override
  String get sendAGift => 'একটি উপহার পাঠান';

  @override
  String get sayHello => 'শুভেচ্ছা জানাবেন 🙏';

  @override
  String get typeAMessage => 'একটি বার্তা টাইপ করুন…';

  @override
  String get recommendedProduct => 'সুপারিশকৃত পণ্য';

  @override
  String get view => 'দেখুন';

  @override
  String get connecting => 'সংযোগ স্থাপন…';

  @override
  String get myConsultations => 'আমার পরামর্শ';

  @override
  String get noConsultationsYet => 'এখনো কোনো আলোচনা হয়নি';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'চ্যাট দেখুন';

  @override
  String get historyExpired => 'ইতিহাসের মেয়াদ শেষ হয়ে গেছে';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'জ্যোতিষীকে ফোন করা';

  @override
  String get cancelRequest => 'অনুরোধ বাতিল করুন';

  @override
  String get notNow => 'এখন নয়';

  @override
  String get thanksForYourFeedback => 'আপনার মতামতের জন্য ধন্যবাদ!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'জমা দেওয়া যায়নি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get consultationEnded => 'পরামর্শ শেষ হয়েছে';

  @override
  String get hopeYouGotTheClarityYou =>
      'আশা করি, আপনি যে স্পষ্টতা চেয়েছিলেন তা পেয়েছেন।';

  @override
  String get shareYourExperienceOptional =>
      'আপনার অভিজ্ঞতা শেয়ার করুন (ঐচ্ছিক)';

  @override
  String get howWasTheCallQuality => 'কলের মান কেমন ছিল?';

  @override
  String get skip => 'এড়িয়ে যান';

  @override
  String get submit => 'জমা দিন';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get viewProfile => 'প্রোফাইল দেখুন';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'তৈরি করেছেন';

  @override
  String get devifai => 'দেবীফএআই';

  @override
  String get withLabel => 'ভালোবাসা সহ';

  @override
  String get leavingSoSoon => 'এত তাড়াতাড়ি চলে যাচ্ছ?';

  @override
  String get stayLoggedIn => 'লগ ইন থাকুন';

  @override
  String get logOutAnyway => 'যাইহোক লগ আউট করুন';

  @override
  String get noNearbyAstrologersYet => 'এখনো আশেপাশে কোনো জ্যোতিষী নেই';

  @override
  String get bookAPooja => 'পূজা বুক করুন';

  @override
  String get panditLedPoojasAtYourChosen =>
      'আপনার নির্বাচিত তারিখে পণ্ডিত পরিচালিত পূজা';

  @override
  String get back => 'ফিরে যান';

  @override
  String get connectingToLive => 'সরাসরি সংযোগ স্থাপন…';

  @override
  String get live => 'সরাসরি';

  @override
  String get thisLiveHasEnded => 'এই লাইভটি শেষ হয়েছে।';

  @override
  String get backToLive => 'লাইভে ফিরে যান';

  @override
  String get sayHelloBeTheFirstTo => 'হ্যালো বলুন 👋 সবার আগে মন্তব্য করুন';

  @override
  String get aiPollLive => 'এআই পোল · লাইভ';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'একটি মন্তব্য যোগ করুন…';

  @override
  String get send => 'পাঠান';

  @override
  String get liveNow => 'এখন সরাসরি সম্প্রচারিত হচ্ছে';

  @override
  String get searchByAstrologerName => 'জ্যোতিষীর নাম দিয়ে অনুসন্ধান করুন';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'রিফ্রেশ';

  @override
  String get join => 'যোগদান করুন';

  @override
  String get clearAllNotifications => 'সব নোটিফিকেশন মুছে ফেলবেন?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'এটি আপনার সমস্ত নোটিফিকেশন স্থায়ীভাবে মুছে দেবে।';

  @override
  String get clearAll => 'সব পরিষ্কার করুন';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get markAllRead => 'সবগুলো পড়া হয়েছে চিহ্নিত করুন।';

  @override
  String get noNotifications => 'কোন বিজ্ঞপ্তি নেই';

  @override
  String get youReAllCaughtUp => 'আপনি সবকিছু জেনে গেছেন।';

  @override
  String get nameIsRequired => 'নাম আবশ্যক';

  @override
  String get enterAValidPhone => 'একটি বৈধ ফোন নম্বর প্রবেশ করান';

  @override
  String get bookingConfirmed => 'বুকিং নিশ্চিত হয়েছে 🎉';

  @override
  String get bookingFailedPleaseTryAgain =>
      'বুকিং ব্যর্থ হয়েছে, অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get addMoneyToContinue => 'চালিয়ে যেতে টাকা যোগ করুন';

  @override
  String get addMoney => 'টাকা যোগ করুন';

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
  String get specialInstructionsOptional => 'বিশেষ নির্দেশাবলী (ঐচ্ছিক)';

  @override
  String get poojaDetails => 'পূজার বিবরণ';

  @override
  String get price => 'মূল্য';

  @override
  String get bookNow => 'এখনই বুক করুন';

  @override
  String get aboutThisPooja => 'এই পূজা সম্পর্কে';

  @override
  String get ourPanditWillCallYou => 'আমাদের পণ্ডিত আপনাকে ফোন করবেন।';

  @override
  String get beforeThePoojaToConfirmThe =>
      'পূজার আগে, সময় এবং আপনার সংকল্পের বিবরণ নিশ্চিত করতে হবে।';

  @override
  String get howItWorks => 'এটি কীভাবে কাজ করে';

  @override
  String get filterPoojas => 'পূজা ফিল্টার করুন';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'ন্যূনতম সমর্থিত ব্যক্তি';

  @override
  String get apply => 'আবেদন করুন';

  @override
  String get searchPoojas => 'পূজা অনুসন্ধান করুন…';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String get referEarn => 'রেফার করুন ও আয় করুন';

  @override
  String get couldNotLoadTryAgain => 'লোড করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'আপনার রেফারেল কোড';

  @override
  String get codeCopied => 'কোড কপি করা হয়েছে';

  @override
  String get shareEarn => 'শেয়ার করুন ও আয় করুন';

  @override
  String get haveAFriendSCode => 'আপনার কি বন্ধুর কোড আছে?';

  @override
  String get enterReferralCode => 'রেফারেল কোড প্রবেশ করান';

  @override
  String get aReferralCodeIsAppliedTo =>
      'আপনার অ্যাকাউন্টে একটি রেফারেল কোড যুক্ত করা হয়েছে।';

  @override
  String get feedbackSubmitted => 'মতামত জমা দেওয়া হয়েছে';

  @override
  String get feedback => 'প্রতিক্রিয়া';

  @override
  String get applicationSubmitted => 'আবেদন জমা দেওয়া হয়েছে';

  @override
  String get astrologerRegistration => 'জ্যোতিষী নিবন্ধন';

  @override
  String get joinRudragangaAsAnAstrologer =>
      'জ্যোতিষী হিসেবে রুদ্রগঙ্গার সাথে যোগ দিন।';

  @override
  String get tellUsAboutYourselfOurTeam =>
      'আপনার সম্পর্কে আমাদের জানান — আমাদের টিম বিষয়টি পর্যালোচনা করে আপনার সাথে যোগাযোগ করবে।';

  @override
  String get aboutUs => 'আমাদের সম্পর্কে';

  @override
  String get rudraganga => 'রুদ্রগানের প্রতি';

  @override
  String get astrologyWellness => 'জ্যোতিষশাস্ত্র ও সুস্থতা';

  @override
  String get v100MadeWithDevotion => 'v1.0.0 · নিষ্ঠার সাথে নির্মিত';

  @override
  String get thanksForYourRating => 'আপনার রেটিং-এর জন্য ধন্যবাদ!';

  @override
  String get rateRudraganga => 'রুদ্রগঙ্গাকে রেট দিন';

  @override
  String get howIsYourExperience => 'আপনার অভিজ্ঞতা কেমন?';

  @override
  String get writeAReviewOptional => 'একটি পর্যালোচনা লিখুন (ঐচ্ছিক)';

  @override
  String get saved => 'সংরক্ষিত';

  @override
  String get notificationSetting => 'বিজ্ঞপ্তি সেটিং';

  @override
  String get howOften => 'কত ঘন ঘন?';

  @override
  String get topicsYouCareAbout => 'আপনার পছন্দের বিষয়গুলো';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get allSet => 'সবকিছু প্রস্তুত ✨';

  @override
  String get setPreferences => 'পছন্দ নির্ধারণ করুন';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get bundlesCombos => 'বান্ডেল এবং কম্বো';

  @override
  String get noCombosRightNow => 'এই মুহূর্তে কোনো কম্বো নেই';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'কার্ট';

  @override
  String get clear => 'পরিষ্কার';

  @override
  String get yourCartIsEmpty => 'আপনার কার্ট খালি আছে';

  @override
  String get browseProductsAndAddThemHere =>
      'পণ্যগুলো ব্রাউজ করুন এবং এখানে যোগ করুন';

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
      'অনুগ্রহ করে একটি ডেলিভারি ঠিকানা যোগ করুন';

  @override
  String get checkout => 'চেকআউট';

  @override
  String get addNewAddress => 'নতুন ঠিকানা যোগ করুন';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'অপসারণ করুন';

  @override
  String get enterCouponCode => 'কুপন কোড লিখুন';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'উপলব্ধ অফার';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'প্রয়োগ করা হয়েছে';

  @override
  String get nothingToCheckout => 'চেকআউট করার কিছু নেই';

  @override
  String get orderPlaced => 'অর্ডার দেওয়া হয়েছে!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'কেনাকাটা চালিয়ে যান';

  @override
  String get yourOrders => 'আপনার অর্ডার';

  @override
  String get noOrdersYet => 'এখনো কোনো অর্ডার আসেনি';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'স্টোর থেকে কিছু কিনলে আপনার অর্ডারগুলো এখানে দেখা যাবে।';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'ইনভয়েসটি এখনও তৈরি হচ্ছে। কিছুক্ষণ পর আবার চেষ্টা করুন।';

  @override
  String get couldNotOpenTheInvoice => 'চালানটি খোলা যায়নি';

  @override
  String get thanksOurTeamWillReachOut =>
      'ধন্যবাদ! আমাদের টিম এই অর্ডারটির বিষয়ে আপনার সাথে যোগাযোগ করবে।';

  @override
  String get orderDetails => 'অর্ডারের বিবরণ';

  @override
  String get needHelp => 'সাহায্য প্রয়োজন';

  @override
  String get needHelpWithThisOrder => 'এই অর্ডারটি নিয়ে সাহায্য প্রয়োজন?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'চালান';

  @override
  String get download => 'ডাউনলোড করুন';

  @override
  String get needHelp2 => 'সাহায্য প্রয়োজন';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'কী ভুল হয়েছিল?';

  @override
  String get describeTheIssue => 'সমস্যাটি বর্ণনা করুন';

  @override
  String get tellUsWhatHappenedSoWe =>
      'কী ঘটেছে তা আমাদের জানান, যাতে আমরা সাহায্য করতে পারি…';

  @override
  String get submitRequest => 'অনুরোধ জমা দিন';

  @override
  String get addedToCart => 'কার্টে যোগ করা হয়েছে';

  @override
  String get productUnavailable => 'পণ্যটি অনুপলব্ধ';

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
  String get fewItemsLeft => 'কয়েকটি জিনিস বাকি আছে';

  @override
  String get description => 'বর্ণনা';

  @override
  String get frequentlyBoughtTogether => 'প্রায়শই একসাথে কেনা হয়';

  @override
  String get viewAll => 'সব দেখুন';

  @override
  String get addToCart => 'কার্টে যোগ করুন';

  @override
  String get buyNow => 'এখনই কিনুন';

  @override
  String get searchProducts => 'পণ্য অনুসন্ধান করুন…';

  @override
  String get noProductsFound => 'কোন পণ্য খুঁজে পাওয়া যায়নি';

  @override
  String get priceRange => 'মূল্যসীমা (₹)';

  @override
  String get min => 'মিনিট';

  @override
  String get max => 'ম্যাক্স';

  @override
  String get inStockOnly => 'শুধুমাত্র স্টকে আছে';

  @override
  String get sortBy => 'অনুসারে সাজান';

  @override
  String get addDeliveryAddress => 'ডেলিভারি ঠিকানা যোগ করুন';

  @override
  String get setAsDefaultAddress => 'ডিফল্ট ঠিকানা হিসাবে সেট করুন';

  @override
  String get saveAddress => 'ঠিকানা সংরক্ষণ করুন';

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
  String get fewLeft => 'অল্প কয়েকজন বাকি আছে';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'বিনামূল্যে ডেলিভারি';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'এখানে এখনও কিছু নেই';

  @override
  String get loadingSecurePayment => 'নিরাপদ পেমেন্ট লোড হচ্ছে…';

  @override
  String get couldNotStartRecharge => 'রিচার্জ শুরু করা যায়নি';

  @override
  String get paymentSuccessful => 'পেমেন্ট সফল হয়েছে 🎉';

  @override
  String get paymentWasNotCompleted => 'পেমেন্ট সম্পন্ন হয়নি';

  @override
  String get couldNotStartRechargeTryAgain =>
      'রিচার্জ শুরু করা যায়নি, আবার চেষ্টা করুন।';

  @override
  String get wallet => 'ওয়ালেট';

  @override
  String get availableBalance => 'উপলব্ধ ব্যালেন্স';

  @override
  String get useItForPoojasConsultations =>
      'পূজা ও পরামর্শের জন্য এটি ব্যবহার করুন';

  @override
  String get instantTopUp => 'তাৎক্ষণিক টপ-আপ';

  @override
  String get noRechargePacksAvailableRightNow =>
      'এই মুহূর্তে কোনো রিচার্জ প্যাক উপলব্ধ নেই।';

  @override
  String get transactions => 'লেনদেন';

  @override
  String get endOfTransactions => '— লেনদেনের সমাপ্তি —';

  @override
  String get youGet => 'আপনি পান';

  @override
  String packBonusBonus(Object bonus) {
    return '+₹$bonus bonus';
  }

  @override
  String payPackAmount(Object amount) {
    return 'Pay ₹$amount';
  }

  @override
  String get rudra => 'রুদ্র';

  @override
  String get ganga => 'হাঁটা';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get astrologer => 'জ্যোতিষী';

  @override
  String get seeker => 'অনুসন্ধানকারী';

  @override
  String get free => 'বিনামূল্যে';

  @override
  String get jan => 'জানুয়ারি';

  @override
  String get feb => 'ফেব্রুয়ারি';

  @override
  String get mar => 'মার্চ';

  @override
  String get apr => 'এপ্রিল';

  @override
  String get may => 'মে';

  @override
  String get jun => 'জুন';

  @override
  String get jul => 'জুলাই';

  @override
  String get aug => 'আগস্ট';

  @override
  String get sep => 'সেপ্টেম্বর';

  @override
  String get oct => 'অক্টোবর';

  @override
  String get nov => 'নভেম্বর';

  @override
  String get dec => 'ডিসেম্বর';

  @override
  String get english => 'ইংরেজি';

  @override
  String get all => 'সব';

  @override
  String get vedic => 'বৈদিক';

  @override
  String get tarot => 'ট্যারোট';

  @override
  String get numerology => 'সংখ্যাতত্ত্ব';

  @override
  String get vastu => 'বিরুদ্ধে';

  @override
  String get palmistry => 'হস্তরেখা বিদ্যা';

  @override
  String get kp => 'কেপি';

  @override
  String get love => 'ভালোবাসা';

  @override
  String get taraAi => 'দেশের এআই';

  @override
  String get instantVedicAnswers247 => 'তাৎক্ষণিক বৈদিক উত্তর • ২৪×৭';

  @override
  String get allLanguages => 'সকল ভাষা';

  @override
  String get jyotiAi => 'Jyoti AI';

  @override
  String get loveCareerGuidance => 'প্রেম ও কর্মজীবনের দিকনির্দেশনা';

  @override
  String get hindiEnglish => 'হিন্দি, ইংরেজি';

  @override
  String get veduAi => 'ভেদু এআই';

  @override
  String get remediesPredictions => 'প্রতিকার ও ভবিষ্যদ্বাণী';

  @override
  String get couldNotLoadAstrologers => 'জ্যোতিষীদের লোড করা যায়নি';

  @override
  String get aiAstrologers => 'এআই জ্যোতিষীরা';

  @override
  String get featuredAstrologers => 'বিশিষ্ট জ্যোতিষীরা';

  @override
  String get astrologers => 'জ্যোতিষীরা';

  @override
  String get searchAiAstrologers => 'এআই জ্যোতিষীদের খুঁজুন…';

  @override
  String get searchAstrologersByName => 'নাম দিয়ে জ্যোতিষী খুঁজুন…';

  @override
  String get aiChat => 'এআই চ্যাট';

  @override
  String get noAstrologersMatch => 'কোন জ্যোতিষীর সাথেই মেলে না';

  @override
  String get noAstrologersYet => 'এখনো কোনো জ্যোতিষী নেই';

  @override
  String get couldnTSetTheReminderPlease =>
      'রিমাইন্ডারটি সেট করা যায়নি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get ai => 'এআই';

  @override
  String get live2 => 'লাইভ';

  @override
  String get online => 'অনলাইন';

  @override
  String get busy => 'ব্যস্ত';

  @override
  String get offline => 'অফলাইন';

  @override
  String get chat => 'চ্যাট';

  @override
  String get call => 'কল';

  @override
  String get video => 'ভিডিও';

  @override
  String get notEnoughBalanceToStartPlease =>
      'শুরু করার জন্য পর্যাপ্ত ব্যালেন্স নেই। অনুগ্রহ করে রিচার্জ করুন।';

  @override
  String get couldNotStartTheConsultationPlease =>
      'পরামর্শ শুরু করা যায়নি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get share => 'শেয়ার';

  @override
  String get follow => 'অনুসরণ করুন';

  @override
  String get chats => 'চ্যাট';

  @override
  String get calls => 'কল';

  @override
  String get videos => 'ভিডিও';

  @override
  String get gifts => 'উপহার';

  @override
  String get languages => 'ভাষা';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'তারা হাজার হাজার অন্বেষণকারীকে কর্মজীবন, বিবাহ, অর্থ এবং জীবন-পথ সংক্রান্ত প্রশ্নে পথ দেখিয়েছেন।';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'তাদের পাঠ শাস্ত্রীয় বৈদিক নীতিমালার সাথে বাস্তবসম্মত ও সহানুভূতিপূর্ণ নির্দেশনার সমন্বয় ঘটায় — যা আপনাকে সাহায্য করে';

  @override
  String get findClarityAndActionableRemediesFor =>
      'ভবিষ্যতের জন্য স্পষ্ট ধারণা এবং কার্যকর প্রতিকার খুঁজুন।';

  @override
  String get giftsReceived => 'প্রাপ্ত উপহার';

  @override
  String get reviews => 'পর্যালোচনা';

  @override
  String get weLlNotifyYouTheMoment =>
      'তারা খালি হওয়া মাত্রই আমরা আপনাকে জানিয়ে দেব।';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'তারা অনলাইনে আসা মাত্রই আমরা আপনাকে জানিয়ে দেব।';

  @override
  String get getAHeadsUpTheMoment =>
      'উপলব্ধ হওয়ার সাথে সাথেই আগাম খবর পেয়ে যান।';

  @override
  String get couldNotLoadThisStore => 'এই স্টোরটি লোড করা যায়নি';

  @override
  String get products => 'পণ্য';

  @override
  String get poojas => 'পূজায়';

  @override
  String get book => 'বই';

  @override
  String get buy => 'কিনুন';

  @override
  String get lalKitab => 'লাল কিতাব';

  @override
  String get hindi => 'না';

  @override
  String get bengali => 'বাংলা';

  @override
  String get tamil => 'তামিল';

  @override
  String get marathi => 'মারাঠি';

  @override
  String get punjabi => 'পাঞ্জাবি';

  @override
  String get telugu => 'তেলুগু';

  @override
  String get expertise => 'বিশেষজ্ঞতা';

  @override
  String get couldNotLoadGifts => 'উপহার লোড করা যায়নি';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'ব্যালেন্স পর্যাপ্ত নয়। উপহার পাঠাতে টাকা যোগ করুন।';

  @override
  String get couldNotSendTheGiftPlease =>
      'উপহারটি পাঠানো যায়নি। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String get connecting2 => 'সংযোগ স্থাপন…';

  @override
  String get couldNotLoadThisChatHistory =>
      'এই চ্যাট ইতিহাসটি লোড করা সম্ভব হয়নি';

  @override
  String get thisChatHistoryIsNoLonger =>
      'এই চ্যাট ইতিহাসটি আর উপলব্ধ নেই\n(চ্যাটগুলো ৭ দিনের জন্য সংরক্ষিত থাকে)।';

  @override
  String get dailyFor14Days => 'প্রতিদিন · ১৪ দিনের জন্য';

  @override
  String get dailyMantra => 'দৈনিক মন্ত্র';

  @override
  String get reminder => 'অনুস্মারক';

  @override
  String get audio => 'অডিও';

  @override
  String get couldNotLoadYourConsultations =>
      'আপনার পরামর্শগুলো লোড করা যায়নি';

  @override
  String get missed => 'মিস করা হয়েছে';

  @override
  String get declined => 'প্রত্যাখ্যাত';

  @override
  String get cancelled => 'বাতিল করা হয়েছে';

  @override
  String get lowBalance => 'কম ব্যালেন্স';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'আপনার পরামর্শ চালু রাখতে এখনই রিচার্জ করুন। পেমেন্ট করার সময়েও আপনার চ্যাট খোলা থাকবে।';

  @override
  String get duration => 'সময়কাল';

  @override
  String get coinsUsed => 'ব্যবহৃত মুদ্রা';

  @override
  String get guest => 'অতিথি';

  @override
  String get changeLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get chooseYourKundli => 'আপনার কুন্ডলী বেছে নিন';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'আপনার ওয়ালেট, রাশিফল এবং সংরক্ষিত তথ্য সুরক্ষিত থাকে — কিন্তু লগ আউট করলে আপনি আপনার দৈনিক রাশিফল, অফার এবং রিমাইন্ডারগুলো মিস করবেন। তারকাদের সাথে সংযুক্ত থাকতে চান? ✨';

  @override
  String get offers => 'অফার';

  @override
  String get dailyPanchang => 'দৈনিক পঞ্চাঙ্গ';

  @override
  String get talkToAstrologer => 'জ্যোতিষীর সাথে কথা বলুন';

  @override
  String get brihatKundli => 'বৃহৎ কুন্ডলী';

  @override
  String get dailyNotes => 'দৈনিক নোট';

  @override
  String get askAQuestion => 'একটি প্রশ্ন জিজ্ঞাসা করুন';

  @override
  String get free50Pages => 'বিনামূল্যে ৫০+ পৃষ্ঠা';

  @override
  String get freeReport => 'বিনামূল্যে প্রতিবেদন';

  @override
  String get freeMatrimony => 'বিনামূল্যে বিবাহ';

  @override
  String get matrimony => 'বিবাহ';

  @override
  String get loveMatch => 'প্রেমের জুটি';

  @override
  String get horoscope => 'রাশিফল';

  @override
  String get dailyHoroscope => 'দৈনিক রাশিফল';

  @override
  String get vedicAstrology => 'বৈদিক জ্যোতিষশাস্ত্র';

  @override
  String get acharyaVeda => 'আচার্য বেদ';

  @override
  String get panditRohan => 'পণ্ডিত রোহান';

  @override
  String get guruMaya => 'ভার্চুয়াল শিক্ষক';

  @override
  String get jayaShastri => 'জয়া শাস্ত্রী';

  @override
  String get devSharma => 'দেব শর্মা';

  @override
  String get sureshG => 'সুরেশ জি.';

  @override
  String get lataP => 'পি. বছর';

  @override
  String get kiranB => 'কিরণ বি.';

  @override
  String get mohanT => 'মোহন টি.';

  @override
  String get anilJoshi => 'অনিল জোশী';

  @override
  String get meeraDevi => 'মীরা দেবী';

  @override
  String get raviKumar => 'রবি কুমার';

  @override
  String get sunitaRao => 'সুনিতা রাও';

  @override
  String get bengaluruKarnataka => 'বেঙ্গালুরু, কর্ণাটক';

  @override
  String get locating => 'অবস্থান নির্ণয় করা হচ্ছে…';

  @override
  String get festivalOffer => 'উৎসবের অফার';

  @override
  String get upTo30OffOnGemstones => 'রত্নপাথরের উপর ৩০% পর্যন্ত ছাড়';

  @override
  String get talkToTopAstrologers => 'সেরা জ্যোতিষীদের সাথে কথা বলুন';

  @override
  String get firstConsultationSpecial => 'প্রথম পরামর্শের জন্য বিশেষ অফার';

  @override
  String get rudrakshaCollection => 'রুদ্রাক্ষ সংগ্রহ';

  @override
  String get authenticEnergised => 'খাঁটি ও প্রাণবন্ত';

  @override
  String get resumeSession => 'সেশন পুনরায় শুরু করুন';

  @override
  String get home => 'হোম';

  @override
  String get aiAstro => 'এআই অ্যাস্ট্রো';

  @override
  String get ask => 'জিজ্ঞাসা করুন';

  @override
  String get history => 'ইতিহাস';

  @override
  String get seeAll2 => 'সব দেখুন';

  @override
  String get s1AcceptanceOfTheseTerms => '১. এই শর্তাবলীর স্বীকৃতি';

  @override
  String get termsOfService2 => 'পরিষেবার শর্তাবলী';

  @override
  String get lastUpdated26June2026 => 'সর্বশেষ হালনাগাদ: ২৬ জুন ২০২৬';

  @override
  String get rudragangaProvidesAstrologySpiritualAndWellness =>
      'রুদ্রগঙ্গা দিকনির্দেশনা এবং ব্যক্তিগত উন্নতির জন্য জ্যোতিষ, আধ্যাত্মিক এবং সুস্থতা বিষয়ক পরামর্শ প্রদান করেন।';

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'শুধুমাত্র প্রতিফলন। আমাদের পরিষেবা পেশাদার চিকিৎসা, আইনি, আর্থিক পরিষেবার বিকল্প নয়।';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'অথবা মনস্তাত্ত্বিক পরামর্শ। অ্যাপটি ব্যবহার করার জন্য আপনার বয়স অবশ্যই ১৮ বা তার বেশি হতে হবে।';

  @override
  String get byCreatingAnAccountOrUsing =>
      'একটি অ্যাকাউন্ট তৈরি করে অথবা রুদ্রগঙ্গা মোবাইল অ্যাপ্লিকেশন এবং সংশ্লিষ্ট পরিষেবাগুলি (';

  @override
  String get servicesYouAgreeToBeBound =>
      '“পরিষেবাসমূহ”), আপনি এই পরিষেবার শর্তাবলী এবং আমাদের গোপনীয়তা নীতি ও ফেরত নীতি দ্বারা আবদ্ধ হতে সম্মত হন।';

  @override
  String get policyIfYouDoNotAgree =>
      'নীতিমালা। আপনি সম্মত না হলে, অনুগ্রহ করে পরিষেবাগুলি ব্যবহার করবেন না।';

  @override
  String get s2EligibilityYourAccount => '২. যোগ্যতা ও আপনার অ্যাকাউন্ট';

  @override
  String get youMustBeAtLeast18 =>
      'আপনার বয়স কমপক্ষে ১৮ বছর হতে হবে এবং আইনত চুক্তি করার যোগ্য হতে হবে।';

  @override
  String get youRegisterWithAPhoneNumber =>
      'আপনি এককালীন পাসওয়ার্ড (OTP) দ্বারা যাচাইকৃত একটি ফোন নম্বর দিয়ে নিবন্ধন করেন। সেই নম্বর এবং ডিভাইসটির অ্যাক্সেস সুরক্ষিত রাখার দায়িত্ব আপনার।';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'আপনি সঠিক তথ্য প্রদান করতে সম্মত হচ্ছেন, যার মধ্যে জন্ম সংক্রান্ত তথ্যও অন্তর্ভুক্ত, যদি আপনি রিডিংয়ের জন্য তা শেয়ার করতে চান। আপনার অ্যাকাউন্টের অধীনে সমস্ত কার্যকলাপের জন্য আপনি দায়ী থাকবেন।';

  @override
  String get s3TheServicesWeOffer => '৩. আমাদের প্রদত্ত সেবাসমূহ';

  @override
  String get rudragangaConnectsYouWithVerifiedAstrologers =>
      'রুদ্রগঙ্গা আপনাকে অডিও কল ও ভিডিও কলের মাধ্যমে পরামর্শের জন্য যাচাইকৃত জ্যোতিষীদের সাথে সংযুক্ত করে।';

  @override
  String get andChatAndOffersRelatedFeatures =>
      'এবং চ্যাট, এবং এটি কুন্ডলী তৈরি ও মেলানো, একজন এআই জ্যোতিষীর মতো সম্পর্কিত বৈশিষ্ট্যগুলিও প্রদান করে।';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'দৈনিক রাশিফল, পূজা বুকিং, আধ্যাত্মিক পণ্যের দোকান, উপহার প্রদান এবং বৈবাহিক মিলন।';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'যেকোনো বৈশিষ্ট্য বা জ্যোতিষীর প্রাপ্যতা যেকোনো সময় পরিবর্তিত হতে পারে।';

  @override
  String get s4WalletPricingBilling => '৪. ওয়ালেট, মূল্য নির্ধারণ ও বিলিং';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'পরামর্শের জন্য আগে থেকেই অর্থ পরিশোধ করতে হয়। সংযোগ করার আগে আপনি অ্যাপের ভেতরের ওয়ালেটে টাকা জমা করেন এবং জ্যোতিষী ও পরিষেবার জন্য দেখানো হারে প্রতি মিনিটের জন্য অর্থ প্রদান করেন।';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'জ্যোতিষী সম্মতি দিলে এবং সেশনটি সংযুক্ত হলে বিলিং শুরু হয়। সংযোগ হওয়ার সাথে সাথেই প্রথম মিনিটের জন্য চার্জ করা হয় এবং পরবর্তী প্রতিটি মিনিটের জন্য তার শুরুতে চার্জ করা হয়। সেশন চলাকালীন একটি লাইভ মিটার দেখানো হয় এবং আপনার ব্যালেন্স কমে গেলে সেশনটি স্বয়ংক্রিয়ভাবে শেষ হয়ে যায়।';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'আমাদের পেমেন্ট পার্টনার (PayU) পেমেন্ট প্রক্রিয়া করে থাকে। আমরা কার্ডের সম্পূর্ণ বিবরণ সংরক্ষণ করি না।';

  @override
  String get walletBalancesAreForUseWithin =>
      'ওয়ালেট ব্যালেন্স শুধুমাত্র সার্ভিসগুলোর মধ্যেই ব্যবহার করা যাবে। প্রযোজ্য ক্ষেত্রে, রিফান্ড আমাদের রিফান্ড পলিসি দ্বারা পরিচালিত হবে।';

  @override
  String get pricesAreInIndianRupeesInr =>
      'দাম ভারতীয় রুপিতে (INR) দেওয়া হয়েছে এবং এতে প্রযোজ্য কর অন্তর্ভুক্ত থাকতে পারে।';

  @override
  String get s5AcceptableUse => '৫. গ্রহণযোগ্য ব্যবহার';

  @override
  String get youAgreeNotTo => 'আপনি এতে সম্মত হচ্ছেন যে:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'জ্যোতিষী বা কর্মীদের হয়রানি, গালিগালাজ, হুমকি দেওয়া, অথবা তাদের সাথে যৌনতাপূর্ণ বা বেআইনি বিষয়বস্তু শেয়ার করা।';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'কোনো পরিষেবা বা অর্থ ফেরত পাওয়ার উদ্দেশ্যে অন্য কোনো ব্যক্তির ছদ্মবেশ ধারণ করা, অথবা মিথ্যা তথ্য প্রদান করা।';

  @override
  String get attemptToTakeAConsultationOff =>
      'ফি এড়ানোর জন্য প্ল্যাটফর্মের বাইরে পরামর্শ নেওয়ার চেষ্টা, অথবা ব্যক্তিগত যোগাযোগের বিবরণ চাওয়া।';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'পরিষেবা বা এর নিরাপত্তায় হস্তক্ষেপ করা, তথ্য সংগ্রহ করা, বা বিঘ্ন ঘটানোর চেষ্টা করা।';

  @override
  String get s6AstrologersOnThePlatform => '৬. প্ল্যাটফর্মে থাকা জ্যোতিষীরা';

  @override
  String get astrologersAreIndependentPractitionersWhoAre =>
      'জ্যোতিষীরা হলেন স্বাধীন পেশাজীবী, যাঁদের পরিচয় যাচাই করা হয়েছে এবং রুদ্রগঙ্গ কর্তৃক অনুমোদিত।';

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'পরামর্শ দেওয়ার আগে, তারা আমাদের নির্ধারিত সীমার মধ্যে নিজেদের মিনিট-প্রতি ভাড়া নির্ধারণ করে।';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'পরামর্শের সময় প্রদত্ত মতামত ও নির্দেশনা ব্যক্তিগত জ্যোতিষীর নিজস্ব, অন্য কারো নয়।';

  @override
  String get ofRudragangaWeAreNotResponsible =>
      'রুদ্রগঙ্গা। পরামর্শের ভিত্তিতে আপনার নেওয়া কোনো সিদ্ধান্তের জন্য আমরা দায়ী নই।';

  @override
  String get s7RecordingsContent => '৭. রেকর্ডিং ও বিষয়বস্তু';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'গুণমান, নিরাপত্তা এবং বিরোধ নিষ্পত্তির স্বার্থে অডিও এবং ভিডিও পরামর্শ রেকর্ড করা হতে পারে।';

  @override
  String get consentToSuchRecordingByStarting =>
      'সেশন শুরু করার মাধ্যমে এই ধরনের রেকর্ডিং-এ সম্মতি দিন। চ্যাট কথোপকথনগুলি সংরক্ষণ করা হয় যাতে আপনি সেগুলি পুনরায় দেখতে পারেন।';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'তাদের। এই ডেটা কীভাবে পরিচালনা করা হয়, তা জানতে আমাদের গোপনীয়তা নীতি দেখুন।';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '৮. দাবিত্যাগ ও দায়ের সীমাবদ্ধতা';

  @override
  String get theServicesAreProvidedAsIs =>
      'এই পরিষেবাগুলি নির্দেশনা এবং বিনোদন-সংলগ্ন ব্যক্তিগত আত্ম-প্রতিফলনের জন্য ‘যেমন আছে তেমন’ ভিত্তিতে প্রদান করা হয়।';

  @override
  String get rudragangaMakesNoGuaranteeAboutThe =>
      'রুদ্রগঙ্গা কোনো ভবিষ্যদ্বাণী বা প্রতিকারের নির্ভুলতার বিষয়ে কোনো নিশ্চয়তা প্রদান করে না। সর্বোচ্চ সীমা পর্যন্ত';

  @override
  String get permittedByLawRudragangaSTotal =>
      'আইন দ্বারা অনুমোদিত হলে, আপনার পরিষেবা ব্যবহারের ফলে উদ্ভূত রুদ্রগঙ্গার মোট দায় সীমাবদ্ধ থাকবে';

  @override
  String get theAmountYouPaidIntoYour =>
      'যে ঘটনার কারণে দাবিটি উত্থাপিত হয়েছে, তার আগের ৩০ দিনের মধ্যে আপনি আপনার ওয়ালেটে যে পরিমাণ অর্থ জমা করেছিলেন। আমরা';

  @override
  String get areNotLiableForIndirectOr =>
      'পরোক্ষ বা আনুষঙ্গিক ক্ষতির জন্য দায়ী নয়।';

  @override
  String get s9SuspensionTermination => '৯. স্থগিতকরণ ও বরখাস্তকরণ';

  @override
  String get weMaySuspendOrTerminateYour =>
      'আপনি যদি এই শর্তাবলী লঙ্ঘন করেন, প্রতারণার চেষ্টা করেন বা এর অপব্যবহার করেন, তাহলে আমরা আপনার অ্যাকাউন্ট স্থগিত বা বাতিল করতে পারি।';

  @override
  String get servicesYouMayStopUsingThe =>
      'পরিষেবাসমূহ। আপনি যেকোনো সময় পরিষেবা ব্যবহার করা বন্ধ করতে পারেন। কিছু শর্তাবলী (অর্থ প্রদানের বাধ্যবাধকতা,';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'দাবিত্যাগ এবং দায়বদ্ধতার সীমাবদ্ধতাগুলো চুক্তি বাতিলের পরেও কার্যকর থাকবে।';

  @override
  String get s10ChangesToTheseTerms => '১০. এই শর্তাবলীতে পরিবর্তন';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'আমরা সময়ে সময়ে এই শর্তাবলী হালনাগাদ করতে পারি। গুরুত্বপূর্ণ পরিবর্তনগুলো অ্যাপে অথবা ইমেলের মাধ্যমে জানানো হবে।';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'উপরের “সর্বশেষ হালনাগাদ” তারিখটি আপডেট করা হচ্ছে। পরিবর্তনের পর এর ব্যবহার অব্যাহত রাখার অর্থ হলো আপনি পরিবর্তনগুলো মেনে নিচ্ছেন।';

  @override
  String get s11ContactUs => '১১. আমাদের সাথে যোগাযোগ করুন';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'এই শর্তাবলী সম্পর্কে কোনো প্রশ্ন আছে? আমাদের ওয়েবসাইটে বা অ্যাপে থাকা যোগাযোগ ফর্মের মাধ্যমে আমাদের সাথে যোগাযোগ করুন।';

  @override
  String get helpSupportSection => 'সহায়তা ও সমর্থন বিভাগ।';

  @override
  String get privacyPolicy2 => 'গোপনীয়তা নীতি';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'আপনার জন্ম সংক্রান্ত তথ্য, পরামর্শ এবং আলাপচারিতা একান্তই আপনার ব্যক্তিগত। এই নীতিতে ব্যাখ্যা করা হয়েছে আমরা কী...';

  @override
  String get collectWhyAndTheControlYou =>
      'সংগ্রহ করুন, কেন, এবং এর ওপর আপনার নিয়ন্ত্রণ।';

  @override
  String get s1InformationWeCollect => '১. আমরা যে তথ্য সংগ্রহ করি';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'অ্যাকাউন্টের তথ্য: আপনার নাম, ফোন নম্বর (ওটিপি দ্বারা যাচাইকৃত), এবং ইমেল (যদি দেওয়া থাকে)।';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'জন্মের বিবরণ: জন্ম তারিখ, সময় এবং স্থান যা আপনি কুন্ডলী ও গণনার জন্য জানাতে চান।';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'পরামর্শ সংক্রান্ত তথ্য: চ্যাট বার্তা এবং প্রযোজ্য ক্ষেত্রে অডিও/ভিডিও কল রেকর্ডিং।';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'পেমেন্টের তথ্য: ওয়ালেট লেনদেন এবং পেমেন্ট রেফারেন্স। কার্ডের বিবরণ আমাদের পেমেন্ট পার্টনার (PayU) দ্বারা পরিচালিত হয়; আমরা সম্পূর্ণ কার্ড নম্বর সংরক্ষণ করি না।';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'ডিভাইস ও ব্যবহারের ডেটা: ডিভাইসের ধরন, অপারেটিং সিস্টেম, আপনার আইপি অ্যাড্রেস থেকে প্রাপ্ত আনুমানিক অবস্থান, পরিদর্শিত পৃষ্ঠা এবং কার্যকলাপ, যা পরিষেবাগুলি পরিচালনা ও উন্নত করতে ব্যবহৃত হয়।';

  @override
  String get s2HowWeUseIt => '২. আমরা কীভাবে এটি ব্যবহার করি';

  @override
  String get toCreateAndSecureYourAccount =>
      'আপনার অ্যাকাউন্ট তৈরি ও সুরক্ষিত করতে এবং আপনার পরিচয় যাচাই করতে।';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'আপনাকে জ্যোতিষীদের সাথে সংযোগ স্থাপন করতে এবং পরামর্শ, কুন্ডলী, রাশিফল ও অন্যান্য পরিষেবা প্রদান করতে।';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'ওয়ালেট রিচার্জ, মিনিট-ভিত্তিক বিলিং, পেমেন্ট প্রদান এবং অর্ডার পূরণের কাজ সম্পাদন করা।';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'সহায়তা প্রদান করা, জালিয়াতি ও অপব্যবহার প্রতিরোধ করা এবং আইনগত বাধ্যবাধকতা পূরণ করা।';

  @override
  String get toUnderstandAndImproveHowThe =>
      'অ্যাপ এবং ওয়েবসাইট ব্যবহারের পদ্ধতি বোঝা এবং তার উন্নতি সাধন করা।';

  @override
  String get s3WhenWeShareInformation => '৩. যখন আমরা তথ্য শেয়ার করি';

  @override
  String get weDoNotSellYourPersonal =>
      'আমরা আপনার ব্যক্তিগত তথ্য বিক্রি করি না। আমরা শুধুমাত্র নিম্নলিখিত ক্ষেত্রে এটি শেয়ার করি:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'আপনি যে জ্যোতিষীর সাথে পরামর্শ করেন, তাকে শুধু গণনার জন্য প্রয়োজনীয় তথ্যই দেওয়া হয় (যেমন: আপনার জন্ম বিবরণ এবং কথ্য ভাষা)।';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'যেসব পরিষেবা প্রদানকারী আমাদের কার্যক্রম পরিচালনায় সহায়তা করে — যেমন পেমেন্ট প্রসেসিং (পেইউ), ক্লাউড হোস্টিং ও স্টোরেজ, যোগাযোগ (ওটিপি-র জন্য হোয়াটসঅ্যাপ/এসএমএস), এবং নোটিফিকেশন — তাদের সাথে গোপনীয়তা বজায় রাখার বাধ্যবাধকতা রয়েছে।';

  @override
  String get whenRequiredByLawOrTo =>
      'আইন দ্বারা আবশ্যক হলে, অথবা ব্যবহারকারী ও রুদ্রগঙ্গার অধিকার, নিরাপত্তা ও সম্পত্তি রক্ষার জন্য।';

  @override
  String get s4ConsultationRecordingsChats => '৪. পরামর্শের রেকর্ডিং ও চ্যাট';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'গুণমান, নিরাপত্তা এবং সুরক্ষার স্বার্থে অডিও এবং ভিডিও পরামর্শ রেকর্ড করা হতে পারে এবং চ্যাট সংরক্ষণ করা হয়।';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'বিরোধ নিষ্পত্তি। আপনি অ্যাপে আপনার চ্যাটের ইতিহাস পর্যালোচনা করতে পারেন। রেকর্ডিংগুলো সংরক্ষিত থাকে।';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'নীচে বর্ণিত এবং শুধুমাত্র সহায়তা, নিরাপত্তা বা আইনি কারণে প্রয়োজন হলেই প্রবেশযোগ্য।';

  @override
  String get s5AnalyticsCookies => '৫. অ্যানালিটিক্স ও কুকিজ';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'আমাদের ওয়েবসাইট পুনরায় ভিজিট শনাক্ত করতে এবং ব্যবহারকারীর কার্যকলাপ পরিমাপ করতে একটি ফার্স্ট-পার্টি কুকি/আইডেন্টিফায়ার ব্যবহার করে।';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'ল্যান্ডিং পেজের পারফরম্যান্স (যেমন কোন সেকশনগুলোতে ক্লিক করা হচ্ছে), এবং সাইন-আপগুলোকে মার্কেটিংয়ের সাথে যুক্ত করা।';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'প্রচারাভিযান। অভিজ্ঞতা উন্নত করার জন্য এটি সমষ্টিগতভাবে ব্যবহৃত হয়। আমরা আনুমানিক শহর/অঞ্চল নির্ণয় করি।';

  @override
  String get fromYourIpAddressWeDo =>
      'আপনার আইপি অ্যাড্রেস থেকে; আমরা অ্যানালিটিক্সের জন্য সুনির্দিষ্ট জিপিএস অবস্থান ব্যবহার করি না।';

  @override
  String get s6DataRetention => '৬. ডেটা সংরক্ষণ';

  @override
  String get weKeepYourInformationForAs =>
      'আপনার অ্যাকাউন্ট সক্রিয় থাকা পর্যন্ত এবং পরিষেবা প্রদানের জন্য প্রয়োজন অনুসারে আমরা আপনার তথ্য সংরক্ষণ করি।';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'পরিষেবা প্রদান, আইনি বাধ্যবাধকতা পালন, বিরোধ নিষ্পত্তি এবং আমাদের চুক্তি কার্যকর করার জন্য। আপনি পারেন';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'আপনার অ্যাকাউন্ট এবং সংশ্লিষ্ট ব্যক্তিগত তথ্য মুছে ফেলার অনুরোধ করুন, যা আইনগতভাবে সংরক্ষিত থাকবে।';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'প্রয়োজনীয়তা (উদাহরণস্বরূপ, হিসাবরক্ষণ এবং করের জন্য আমাদের অবশ্যই লেনদেনের রেকর্ড রাখতে হবে)।';

  @override
  String get s7Security => '৭. নিরাপত্তা';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'আমরা শিল্প-মানসম্মত ব্যবস্থা ব্যবহার করি — স্থানান্তরের সময় এনক্রিপশন, প্রবেশাধিকার নিয়ন্ত্রণ এবং সুরক্ষিত';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'আপনার তথ্য সুরক্ষিত রাখার জন্য পরিকাঠামো। তথ্য প্রেরণ বা সংরক্ষণের কোনো পদ্ধতিই সম্পূর্ণ নিরাপদ নয়।';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'সুরক্ষিত, তাই আমরা সম্পূর্ণ নিরাপত্তার নিশ্চয়তা দিতে পারি না।';

  @override
  String get s8YourRightsChoices => '৮. আপনার অধিকার ও পছন্দসমূহ';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'অ্যাপে আপনার প্রোফাইল ও জন্ম সংক্রান্ত তথ্য দেখুন, সংশোধন করুন বা আপডেট করুন।';

  @override
  String get requestACopyOrDeletionOf =>
      'আপনার ব্যক্তিগত তথ্যের অনুলিপি পেতে বা তা মুছে ফেলার জন্য আমাদের সাথে যোগাযোগ করুন।';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'আপনার ডিভাইস বা অ্যাপ সেটিংসে প্রচারমূলক বিজ্ঞপ্তি বন্ধ করুন।';

  @override
  String get s9Children => '৯. শিশুরা';

  @override
  String get theServicesAreIntendedForUsers =>
      'এই পরিষেবাগুলি ১৮ বছর বা তার বেশি বয়সী ব্যবহারকারীদের জন্য উদ্দিষ্ট। আমরা জেনেশুনে কারো কাছ থেকে ডেটা সংগ্রহ করি না।';

  @override
  String get anyoneUnder18IfYouBelieve =>
      '১৮ বছরের কম বয়সী যে কেউ। যদি আপনার মনে হয় কোনো অপ্রাপ্তবয়স্ক এই পরিষেবাগুলি ব্যবহার করেছে, তাহলে অনুগ্রহ করে আমাদের সাথে যোগাযোগ করুন যাতে আমরা তা সরিয়ে ফেলতে পারি।';

  @override
  String get s10ChangesToThisPolicy => '১০. এই নীতিতে পরিবর্তন';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'আমরা এই নীতিটি আপডেট করতে পারি। গুরুত্বপূর্ণ পরিবর্তনগুলো অ্যাপে অথবা আপডেট করার মাধ্যমে জানানো হবে।';

  @override
  String get lastUpdatedDateAbove =>
      'উপরে “সর্বশেষ হালনাগাদ” তারিখ দেওয়া আছে।';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'গোপনীয়তা সংক্রান্ত প্রশ্ন বা ডেটার অনুরোধের জন্য, আমাদের ওয়েবসাইটে থাকা যোগাযোগ ফর্মের মাধ্যমে অথবা আমাদের সাথে যোগাযোগ করুন।';

  @override
  String get appSHelpSupportSection => 'অ্যাপের হেল্প অ্যান্ড সাপোর্ট সেকশন।';

  @override
  String get s2026Rudraganga18ForGuidanceAnd =>
      '© ২০২৬ রুদ্রগঙ্গা · ১৮+ · নির্দেশনা ও কল্যাণের জন্য • পেশাদারী পরামর্শের বিকল্প নয়।';

  @override
  String get widthDeviceWidthInitialScale1 =>
      'প্রস্থ=ডিভাইসের প্রস্থ, প্রাথমিক স্কেল=১, সর্বোচ্চ স্কেল=১';

  @override
  String get segoeUi => 'সেগো UI';

  @override
  String get vote => 'ভোট';

  @override
  String get couldnTLoadLiveSessions => 'লাইভ সেশন লোড করা যায়নি';

  @override
  String get noOneIsLiveRightNow => 'এই মুহূর্তে কেউ লাইভে নেই।';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'যখন কোনো জ্যোতিষী লাইভে আসবেন, তখন তাঁকে এখানে দেখা যাবে। রিফ্রেশ করতে নিচে টানুন — অথবা নোটিফিকেশনের জন্য অপেক্ষা করুন।';

  @override
  String get justNow => 'এইমাত্র';

  @override
  String get couldNotLoad => 'লোড করা যায়নি';

  @override
  String get continueLabel => 'চালিয়ে যান';

  @override
  String get openSettings => 'সেটিংস খুলুন';

  @override
  String get somePermissionsAreBlockedTapA =>
      'কিছু অনুমতি ব্লক করা আছে। ব্লক করা আইটেমটিতে ট্যাপ করে (অথবা “সেটিংস খুলুন”) সেটি সক্রিয় করুন, তারপর এখানে ফিরে আসুন।';

  @override
  String get thesePermissionsAreRequiredToUse =>
      'রুদ্রগঙ্গা ব্যবহার করার জন্য এই অনুমতিগুলো প্রয়োজন। অনুমতিটি দেওয়ার জন্য অপেক্ষারত যেকোনো আইটেমে ট্যাপ করুন।';

  @override
  String get settings2 => 'সেটিংস';

  @override
  String get allow => 'অনুমতি দিন';

  @override
  String get blockedEnableItInSettings =>
      'ব্লক করা আছে — সেটিংসে এটি চালু করুন।';

  @override
  String get allowsUpTo => 'অনুমতি দেয় পর্যন্ত';

  @override
  String get bookingFailed => 'বুকিং ব্যর্থ হয়েছে';

  @override
  String get yourDetails => 'আপনার বিবরণ';

  @override
  String get fromYourProfile => 'আপনার প্রোফাইল থেকে';

  @override
  String get familyMembers => 'পরিবারের সদস্যরা';

  @override
  String get addMember => 'সদস্য যোগ করুন';

  @override
  String get addAnother => 'আরেকটি যোগ করুন';

  @override
  String get preferredDateOptional => 'পছন্দের তারিখ (ঐচ্ছিক)';

  @override
  String get anyDate => 'যেকোনো তারিখ';

  @override
  String get bookNowFree => 'এখনই বুক করুন (বিনামূল্যে)';

  @override
  String get couldNotLoadThisPooja => 'এই পূজাটি লোড করা যায়নি';

  @override
  String get forLabel => 'জন্য';

  @override
  String get s1Person => '১ জন';

  @override
  String get bookShareDetails => 'বুক করুন এবং বিস্তারিত শেয়ার করুন';

  @override
  String get confirmYourBookingWithTheNames =>
      'যাদের জন্য পূজাটি করা হবে, তাদের নাম উল্লেখ করে আপনার বুকিং নিশ্চিত করুন।';

  @override
  String get panditCoordinates => 'পণ্ডিত স্থানাঙ্ক';

  @override
  String get aVerifiedPanditCallsToFix =>
      'একজন যাচাইকৃত পণ্ডিত সময় ঠিক করতে এবং সামগ্রীর ব্যবস্থা করতে ফোন করেন।';

  @override
  String get poojaPerformed => 'পূজা করা হয়েছিল';

  @override
  String get sankalpIsTakenInYourFamily =>
      'পরিবারের নামে সংকল্প গ্রহণ করা হয় এবং প্রযোজ্য ক্ষেত্রে পরে প্রসাদ বিতরণ করা হয়।';

  @override
  String get couldNotLoadPoojas => 'পূজা লোড করা যায়নি';

  @override
  String get any => 'যেকোনো';

  @override
  String get noPoojasHere => 'এখানে কোনো পূজা নেই';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'বর্তমান ফিল্টারগুলোর সাথে কিছুই মিলছে না।';

  @override
  String get noPoojasAvailableYet => 'এখনও কোনো পূজা উপলব্ধ নেই';

  @override
  String get showAllPoojas => 'সমস্ত পূজা দেখান';

  @override
  String get tapToViewDetailsBook => 'বিস্তারিত দেখতে ও বুক করতে ট্যাপ করুন';

  @override
  String get appliedYouBothEarnOnYour =>
      'প্রয়োগ করা হয়েছে! আপনারা দুজনেই আপনাদের প্রথম রিচার্জে উপার্জন করবেন।';

  @override
  String get shareYourCode => 'আপনার কোড শেয়ার করুন';

  @override
  String get sendYourCodeToFriendsVia =>
      'আপনার কোডটি বন্ধুদের কাছে WhatsApp, SMS বা যেকোনো মাধ্যমে পাঠিয়ে দিন।';

  @override
  String get friendSignsUp => 'বন্ধু সাইন আপ করে';

  @override
  String get theyEnterYourCodeInRefer =>
      'সাইন আপ করার পর তারা আপনার কোডটি রেফার অ্যান্ড আর্ন-এ প্রবেশ করায়।';

  @override
  String get feedbackReceived => 'মতামত পাওয়া গেছে ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'ধন্যবাদ — আমাদের দল বিষয়টি খতিয়ে দেখবে।';

  @override
  String get fullName => 'পুরো নাম';

  @override
  String get email => 'ইমেল';

  @override
  String get phoneNumber => 'ফোন নম্বর';

  @override
  String get message => 'বার্তা';

  @override
  String get requiredLabel => 'প্রয়োজনীয়';

  @override
  String get applicationReceived => 'আবেদন গৃহীত হয়েছে ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'আমাদের দল আপনার জ্যোতিষীর প্রোফাইল সম্পর্কে জানতে আপনার সাথে যোগাযোগ করবে।';

  @override
  String get enter10Digits => '১০টি সংখ্যা লিখুন';

  @override
  String get aboutYouBioExpertiseExperience =>
      'আপনার সম্পর্কে (জীবনবৃত্তান্ত, দক্ষতা, অভিজ্ঞতা)';

  @override
  String get rudragangaConnectsYouWithTrustedVedic =>
      'কর্মজীবন সংক্রান্ত পরামর্শের জন্য রুদ্রগঙ্গা আপনাকে বিশ্বস্ত বৈদিক জ্যোতিষীদের সাথে সংযুক্ত করে।';

  @override
  String get marriageFinanceHealthAndLifeS =>
      'বিয়ে, অর্থ, স্বাস্থ্য এবং জীবনের বড় বড় প্রশ্ন — চ্যাট, কল এবং ভিডিওর মাধ্যমে।';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'আপনার বিনামূল্যে কুন্ডলী, দৈনিক রাশিফল, ঘটকালি, পূজা ও প্রতিকার—সবকিছু এক জায়গায় পেয়ে যান।\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'আমাদের লক্ষ্য হলো খাঁটি ও সহানুভূতিপূর্ণ আধ্যাত্মিক নির্দেশনা সকলের জন্য সহজলভ্য করা।';

  @override
  String get inYourOwnLanguage => 'আপনার নিজের ভাষায়।';

  @override
  String get verifiedExperiencedAstrologers => 'যাচাইকৃত, অভিজ্ঞ জ্যোতিষীরা';

  @override
  String get privateSecureConsultations => 'ব্যক্তিগত ও সুরক্ষিত পরামর্শ';

  @override
  String get availableIn6IndianLanguages => '৬টি ভারতীয় ভাষায় উপলব্ধ';

  @override
  String get thanksForRatingUs => 'আমাদেরকে রেটিং দেওয়ার জন্য ধন্যবাদ ✓';

  @override
  String get yourFeedbackHelpsRudragangaGrow =>
      'আপনার মতামত রুদ্রগঙ্গার বিকাশে সাহায্য করে।';

  @override
  String get onceInADay => 'দিনে একবার';

  @override
  String get twiceInADay => 'দিনে দুইবার';

  @override
  String get asManyTimesAsItComes => 'যতবারই এটা আসে';

  @override
  String get never => 'কখনো না';

  @override
  String get cricket => 'ক্রিকেট';

  @override
  String get shareMarket => 'শেয়ার বাজার';

  @override
  String get bollywood => 'বলিউড';

  @override
  String get newMagazine => 'নতুন ম্যাগাজিন';

  @override
  String get festivals => 'উৎসব';

  @override
  String get notificationsUpdated => 'বিজ্ঞপ্তিগুলো হালনাগাদ করা হয়েছে ✓';

  @override
  String get youLlHearFromUsBased =>
      'আপনার পছন্দের উপর ভিত্তি করে আমরা আপনার সাথে যোগাযোগ করব।';

  @override
  String get yourChartsWillNowFollowYour =>
      'আপনার চার্টগুলো এখন আপনার নির্বাচিত শৈলী অনুসরণ করবে।';

  @override
  String get chartStyle => 'চার্ট শৈলী';

  @override
  String get northIndian => 'উত্তর ভারতীয়';

  @override
  String get southIndian => 'দক্ষিণ ভারতীয়';

  @override
  String get monthSystem => 'মাসিক ব্যবস্থা';

  @override
  String get amanta => 'উপপত্নী';

  @override
  String get purnimanta => 'পূর্ণিমন্তা';

  @override
  String get darkMode => 'ডার্ক মোড';

  @override
  String get off => 'বন্ধ';

  @override
  String get onLabel => 'চালু';

  @override
  String get useDeviceSettings => 'ডিভাইস সেটিংস ব্যবহার করুন';

  @override
  String get ayanamsa => 'আয়ানামসা';

  @override
  String get nCLahiri => 'এন.সি. লাহিড়ী';

  @override
  String get kpNew => 'কেপি নিউ';

  @override
  String get kpOld => 'কেপি ওল্ড';

  @override
  String get raman => 'রমন';

  @override
  String get kpKhullar => 'কেপি খুল্লার';

  @override
  String get subtotal => 'উপমোট';

  @override
  String get youSave => 'আপনি বাঁচান';

  @override
  String get total => 'মোট';

  @override
  String get deliveryAddress => 'ডেলিভারি ঠিকানা';

  @override
  String get orderSummary => 'অর্ডারের সারাংশ';

  @override
  String get couponsOffers => 'কুপন ও অফার';

  @override
  String get billDetails => 'বিলের বিবরণ';

  @override
  String get address => 'ঠিকানা';

  @override
  String get productDiscount => 'পণ্যের ছাড়';

  @override
  String get itemsSubtotal => 'আইটেমগুলির উপমোট';

  @override
  String get delivery => 'ডেলিভারি';

  @override
  String get free2 => 'বিনামূল্যে';

  @override
  String get toPay => 'পরিশোধ করতে';

  @override
  String get dMmmYyyyHMmA => 'd MMM yyyy, h:mm a';

  @override
  String get couldNotDownloadInvoice => 'চালান ডাউনলোড করা যায়নি';

  @override
  String get orderNotFound => 'অর্ডারটি খুঁজে পাওয়া যায়নি';

  @override
  String get activityTimeline => 'কার্যকলাপের সময়রেখা';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM yyyy · h:mm a';

  @override
  String get totalPaid => 'মোট পরিশোধিত';

  @override
  String get orderPlaced2 => 'অর্ডার দেওয়া হয়েছে';

  @override
  String get dMmmHMmA => 'd MMM, h:mm a';

  @override
  String get generating => 'তৈরি হচ্ছে…';

  @override
  String get pleaseDescribeTheIssue => 'অনুগ্রহ করে সমস্যাটি বর্ণনা করুন।';

  @override
  String get couldNotLoadProducts => 'পণ্য লোড করা যায়নি';

  @override
  String get newest => 'নতুনতম';

  @override
  String get priceLowHigh => 'মূল্য: কম→বেশি';

  @override
  String get priceHighLow => 'দাম: বেশি→কম';

  @override
  String get topRated => 'শীর্ষ রেটপ্রাপ্ত';

  @override
  String get s6DigitPin => '৬-সংখ্যার পিন';

  @override
  String get addressLine1 => 'ঠিকানা লাইন ১ *';

  @override
  String get addressLine2 => 'ঠিকানা লাইন ২';

  @override
  String get city => 'শহর *';

  @override
  String get state => 'রাজ্য *';

  @override
  String get pinCode => 'পিন কোড *';

  @override
  String get payment => 'পেমেন্ট';

  @override
  String get pooja => 'পূজা';

  @override
  String get shop => 'দোকান';

  @override
  String get securePayment => 'নিরাপদ পেমেন্ট';

  @override
  String get noTransactionsMatchTheseFilters =>
      'এই ফিল্টারগুলির সাথে কোনও লেনদেন মেলে না।';

  @override
  String get noTransactionsYet => 'এখনো কোনো লেনদেন হয়নি';

  @override
  String get moneyAdded => 'টাকা যোগ করা হয়েছে';

  @override
  String get poojaBooking => 'পূজা বুকিং';

  @override
  String get videoCall => 'ভিডিও কল';

  @override
  String get shopOrder => 'দোকানের অর্ডার';

  @override
  String get refund => 'ফেরত';

  @override
  String get bonus => 'বোনাস';

  @override
  String get credited => 'কৃতিত্ব দেওয়া হয়েছে';

  @override
  String get debited => 'ডেবিট করা হয়েছে';

  @override
  String get rg => 'আরজি';

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
