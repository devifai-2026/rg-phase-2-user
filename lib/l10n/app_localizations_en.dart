// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Astro App';

  @override
  String get tagline => 'Astrology & Wellness';

  @override
  String get splashBlessing => 'Your journey to clarity begins here';

  @override
  String get authWelcomeTitle => 'Welcome';

  @override
  String get authWelcomeSubtitle =>
      'Sign in or create your account with your phone number';

  @override
  String get phoneLabel => 'Phone number';

  @override
  String get phoneHint => '10-digit mobile number';

  @override
  String get phoneCountryCode => '+91';

  @override
  String get continueButton => 'Continue';

  @override
  String get sendOtpButton => 'Send OTP';

  @override
  String get otpTitle => 'Verify your number';

  @override
  String otpSubtitle(String phone) {
    return 'Enter the 6-digit code sent to $phone';
  }

  @override
  String get otpLabel => 'OTP';

  @override
  String get verifyButton => 'Verify & continue';

  @override
  String get resendOtp => 'Resend code';

  @override
  String resendOtpIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get changeNumber => 'Change number';

  @override
  String get termsNotice =>
      'By continuing you agree to our Terms & Privacy Policy';

  @override
  String get acceptPrefix => 'I agree to the';

  @override
  String get acceptAnd => 'and';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get errInvalidPhone => 'Enter a valid 10-digit phone number';

  @override
  String get errInvalidOtp => 'Enter the 6-digit code';

  @override
  String get errGeneric => 'Something went wrong. Please try again.';

  @override
  String get errNetwork => 'No connection. Check your internet and try again.';

  @override
  String get otpSent => 'OTP sent';

  @override
  String get loginSuccess => 'Signed in';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String homeWelcome(String name) {
    return 'Namaste, $name';
  }

  @override
  String get logout => 'Log out';

  @override
  String get onbTitle => 'Tell us about you';

  @override
  String get onbSubtitle =>
      'This helps us personalise your readings. None of it is required — you can skip and finish later.';

  @override
  String get onbName => 'Your name';

  @override
  String get onbAddPhoto => 'Add photo';

  @override
  String get onbChangePhoto => 'Change photo';

  @override
  String get onbGender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderOther => 'Other';

  @override
  String get onbDob => 'Date of birth';

  @override
  String get onbTob => 'Time of birth';

  @override
  String get onbDontKnowTime => 'I don\'t know my time of birth';

  @override
  String get onbPob => 'Place of birth';

  @override
  String get onbPobHint => 'Search your birth city';

  @override
  String get onbLanguage => 'Preferred language';

  @override
  String get onbSelectDate => 'Select date';

  @override
  String get onbSelectTime => 'Select time';

  @override
  String get onbSkip => 'Skip for now';

  @override
  String get onbFinish => 'Finish';

  @override
  String get onbSaved => 'Profile saved';

  @override
  String get completeProfile => 'Complete your profile';

  @override
  String get completeProfileCta => 'Finish setup';

  @override
  String get permTitle => 'A few permissions';

  @override
  String get permSubtitle =>
      'We need these so calls, alerts and photos work smoothly. You can change them anytime in Settings.';

  @override
  String get permNotifications => 'Notifications';

  @override
  String get permNotificationsDesc =>
      'Consultation alerts, order updates and reminders';

  @override
  String get permMic => 'Microphone';

  @override
  String get permMicDesc => 'For voice calls with astrologers';

  @override
  String get permCamera => 'Camera';

  @override
  String get permCameraDesc => 'For video calls and uploading photos';

  @override
  String get permPhotos => 'Photos';

  @override
  String get permPhotosDesc => 'To set your profile picture';

  @override
  String get permAllow => 'Allow access';

  @override
  String get permContinue => 'Continue';

  @override
  String get permLocation => 'Location';

  @override
  String get permLocationDesc => 'Find astrologers near you';

  @override
  String get secFeatured => 'Featured Astrologers';

  @override
  String get secNearby => 'Nearby Astrologers';

  @override
  String get secCallChat => 'Call & Chat';

  @override
  String get secAiAstro => 'AI Astrologers';

  @override
  String get secProducts => 'Products';

  @override
  String get secVideos => 'Videos';

  @override
  String get secLessons => 'Astrology lessons';

  @override
  String get secOthers => 'Others';

  @override
  String get secHistory => 'Your Consultations';

  @override
  String get seeAll => 'See all';

  @override
  String get basedOnLocation => 'Based on your location';

  @override
  String get shareApp => 'Share App with Friends';

  @override
  String get startReadingHint =>
      'No consultations yet. Start your first reading.';

  @override
  String get startBtn => 'Start';

  @override
  String get namaste => 'Namaste';

  @override
  String get kFreeKundli => 'Free Kundli';

  @override
  String get kMatching => 'Matching';

  @override
  String get kBrihat => 'Brihat Kundli';

  @override
  String get kKundliAi => 'Kundli AI+';

  @override
  String get tCareer => 'Career';

  @override
  String get tMarriage => 'Marriage';

  @override
  String get tFinance => 'Finance';

  @override
  String get tHealth => 'Health';

  @override
  String get tEducation => 'Education';

  @override
  String get tTravel => 'Travel';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusBusy => 'Busy';

  @override
  String get statusOffline => 'Offline';

  @override
  String get retry => 'Retry';

  @override
  String get chatNow => 'Chat Now';

  @override
  String get notifyMe => 'Notify me';

  @override
  String weLlLetYouKnowWhen(Object name, Object reason) {
    return 'We\'ll let you know when $name is $reason.';
  }

  @override
  String get thisAstrologerIsNotAvailableTo =>
      'This astrologer is not available to consult yet.';

  @override
  String youNeedAtLeastRateperminFor(Object ratePerMin) {
    return 'You need at least ₹$ratePerMin for one minute. Please recharge.';
  }

  @override
  String get completeYourProfile => 'Complete your profile';

  @override
  String get addYourDateTimePlaceOf =>
      'Add your date, time & place of birth so the astrologer can give you a clearer reading.';

  @override
  String get completeProfile2 => 'Complete profile';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String unfollowWidgetName(Object name) {
    return 'Unfollow $name?';
  }

  @override
  String get tellUsWhyOptionalItHelps =>
      'Tell us why (optional) — it helps us improve.';

  @override
  String get reasonOptional => 'Reason (optional)';

  @override
  String get cancel => 'Cancel';

  @override
  String get unfollow => 'Unfollow';

  @override
  String get s21kReviews => '  (2.1k reviews)';

  @override
  String followersFollowers(Object followers) {
    return '$followers followers';
  }

  @override
  String get gift => 'Gift';

  @override
  String get store => 'Store';

  @override
  String get joinLiveSession => 'Join live session';

  @override
  String get youLlBeNotified => 'You\'ll be notified';

  @override
  String get thisStoreHasNoItemsYet => 'This store has no items yet.';

  @override
  String get filters => 'Filters';

  @override
  String get reset => 'Reset';

  @override
  String get onlineNowOnly => 'Online now only';

  @override
  String get applyFilters => 'Apply filters';

  @override
  String get giftingUnavailableForThisAstrologer =>
      'Gifting unavailable for this astrologer.';

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
  String get recharge => 'Recharge';

  @override
  String gTokencostTk(Object tokenCost) {
    return '$tokenCost tk';
  }

  @override
  String get quantity => 'Quantity';

  @override
  String get min1Max100 => 'Min 1 · Max 100';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String summaryFromAstrologername(Object astrologerName) {
    return 'Summary from $astrologerName';
  }

  @override
  String get remindersSetForYou => 'Reminders set for you';

  @override
  String get suggestedForYou => 'Suggested for you';

  @override
  String get couldNotSendImage => 'Could not send image';

  @override
  String get endConsultation => 'End consultation?';

  @override
  String get thisWillEndTheChatAnd =>
      'This will end the chat and stop billing.';

  @override
  String get keepChatting => 'Keep chatting';

  @override
  String get end => 'End';

  @override
  String switchToType0TouppercaseType(Object toUpperCase, Object substring) {
    return 'Switch to $toUpperCase$substring?';
  }

  @override
  String yourChatWillEndAndA(Object type, Object type2) {
    return 'Your chat will end and a new $type consultation will start at the $type2 rate.';
  }

  @override
  String get switchLabel => 'Switch';

  @override
  String couldNotSwitchETostring(Object toString) {
    return 'Could not switch: $toString';
  }

  @override
  String get switchToAudioCall => 'Switch to audio call';

  @override
  String get switchToVideoCall => 'Switch to video call';

  @override
  String get endConsultation2 => 'End consultation';

  @override
  String get sendAGift => 'Send a gift';

  @override
  String get sayHello => 'Say hello 🙏';

  @override
  String get typeAMessage => 'Type a message…';

  @override
  String get recommendedProduct => 'Recommended product';

  @override
  String get view => 'View';

  @override
  String get connecting => 'Connecting…';

  @override
  String get myConsultations => 'My consultations';

  @override
  String get noConsultationsYet => 'No consultations yet';

  @override
  String typelabelSTypeConsultation(Object type) {
    return '$type consultation';
  }

  @override
  String get viewChat => 'View chat';

  @override
  String get historyExpired => 'History expired';

  @override
  String connectingYourSTypeConsultation(Object type) {
    return 'Connecting your $type consultation…';
  }

  @override
  String get ringingTheAstrologer => 'Ringing the astrologer';

  @override
  String get cancelRequest => 'Cancel request';

  @override
  String get notNow => 'Not now';

  @override
  String get thanksForYourFeedback => 'Thanks for your feedback!';

  @override
  String get couldNotSubmitPleaseTryAgain =>
      'Could not submit. Please try again.';

  @override
  String get consultationEnded => 'Consultation ended';

  @override
  String get hopeYouGotTheClarityYou => 'Hope you got the clarity you sought.';

  @override
  String get shareYourExperienceOptional => 'Share your experience (optional)';

  @override
  String get howWasTheCallQuality => 'How was the call quality?';

  @override
  String get skip => 'Skip';

  @override
  String get submit => 'Submit';

  @override
  String get close => 'Close';

  @override
  String get viewProfile => 'View profile';

  @override
  String vAppversion(Object _appVersion) {
    return 'v$_appVersion';
  }

  @override
  String get madeBy => 'Made by ';

  @override
  String get devifai => 'DevifAI';

  @override
  String get withLabel => ' with ❤️';

  @override
  String get leavingSoSoon => 'Leaving so soon?';

  @override
  String get stayLoggedIn => 'Stay logged in';

  @override
  String get logOutAnyway => 'Log out anyway';

  @override
  String get noNearbyAstrologersYet => 'No nearby astrologers yet';

  @override
  String get bookAPooja => 'Book a Pooja';

  @override
  String get panditLedPoojasAtYourChosen =>
      'Pandit-led poojas at your chosen date';

  @override
  String get back => 'Back';

  @override
  String get connectingToLive => 'Connecting to live…';

  @override
  String get live => 'LIVE';

  @override
  String get thisLiveHasEnded => 'This live has ended';

  @override
  String get backToLive => 'Back to Live';

  @override
  String get sayHelloBeTheFirstTo => 'Say hello 👋  Be the first to comment';

  @override
  String get aiPollLive => 'AI Poll · live';

  @override
  String totalVotes(Object total) {
    return '$total votes';
  }

  @override
  String get addAComment => 'Add a comment…';

  @override
  String get send => 'Send';

  @override
  String get liveNow => 'Live now';

  @override
  String get searchByAstrologerName => 'Search by astrologer name';

  @override
  String noLiveAstrologerNamedSearchText(Object trim) {
    return 'No live astrologer named “$trim”';
  }

  @override
  String get refresh => 'Refresh';

  @override
  String get join => 'Join';

  @override
  String get clearAllNotifications => 'Clear all notifications?';

  @override
  String get thisPermanentlyDeletesAllYourNotifications =>
      'This permanently deletes all your notifications.';

  @override
  String get clearAll => 'Clear all';

  @override
  String get notifications => 'Notifications';

  @override
  String get markAllRead => 'Mark all read';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get youReAllCaughtUp => 'You\'re all caught up.';

  @override
  String get nameIsRequired => 'Name is required';

  @override
  String get enterAValidPhone => 'Enter a valid phone';

  @override
  String get bookingConfirmed => 'Booking confirmed 🎉';

  @override
  String get bookingFailedPleaseTryAgain => 'Booking failed, please try again';

  @override
  String get addMoneyToContinue => 'Add money to continue';

  @override
  String get addMoney => 'Add money';

  @override
  String bookWidgetPoojaName(Object name) {
    return 'Book $name';
  }

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone';

  @override
  String addThePeopleThisPoojaIs(Object _maxPersons) {
    return 'Add the people this pooja is performed for (up to $_maxPersons). Fill one before adding the next.';
  }

  @override
  String memberEKey1Name(Object key) {
    return 'Member $key name';
  }

  @override
  String get specialInstructionsOptional => 'Special instructions (optional)';

  @override
  String get poojaDetails => 'Pooja details';

  @override
  String get price => 'Price';

  @override
  String get bookNow => 'Book now';

  @override
  String get aboutThisPooja => 'About this pooja';

  @override
  String get ourPanditWillCallYou => 'Our pandit will call you';

  @override
  String get beforeThePoojaToConfirmThe =>
      'Before the pooja, to confirm the timing and your sankalp details.';

  @override
  String get howItWorks => 'How it works';

  @override
  String get filterPoojas => 'Filter poojas';

  @override
  String maxBudgetMaxpriceRound(Object round) {
    return 'Max budget · ₹$round';
  }

  @override
  String get minPersonsSupported => 'Min persons supported';

  @override
  String get apply => 'Apply';

  @override
  String get searchPoojas => 'Search poojas…';

  @override
  String get myProfile => 'My Profile';

  @override
  String get referEarn => 'Refer & Earn';

  @override
  String get couldNotLoadTryAgain => 'Could not load. Try again.';

  @override
  String shareEarnIReward(Object reward) {
    return 'Share & earn ₹$reward';
  }

  @override
  String youGetIRewardOnYour(Object reward, Object reward2) {
    return 'You get ₹$reward on your friend’s first recharge — and they get ₹$reward2 too.';
  }

  @override
  String get yourReferralCode => 'Your referral code';

  @override
  String get codeCopied => 'Code copied';

  @override
  String get shareEarn => 'Share & earn';

  @override
  String get haveAFriendSCode => 'Have a friend’s code?';

  @override
  String get enterReferralCode => 'Enter referral code';

  @override
  String get aReferralCodeIsAppliedTo =>
      'A referral code is applied to your account.';

  @override
  String get feedbackSubmitted => 'Feedback submitted';

  @override
  String get feedback => 'Feedback';

  @override
  String get applicationSubmitted => 'Application submitted';

  @override
  String get astrologerRegistration => 'Astrologer Registration';

  @override
  String joinRudragangaAsAnAstrologer(String appName) {
    return 'Join $appName as an astrologer';
  }

  @override
  String get tellUsAboutYourselfOurTeam =>
      'Tell us about yourself — our team will review and reach out.';

  @override
  String get aboutUs => 'About Us';

  @override
  String rudraganga(String appName) {
    return '$appName';
  }

  @override
  String get astrologyWellness => 'Astrology & Wellness';

  @override
  String get v100MadeWithDevotion => 'v1.0.0  ·  Made with devotion';

  @override
  String get thanksForYourRating => 'Thanks for your rating!';

  @override
  String rateRudraganga(String appName) {
    return 'Rate $appName';
  }

  @override
  String get howIsYourExperience => 'How is your experience?';

  @override
  String get writeAReviewOptional => 'Write a review (optional)';

  @override
  String get saved => 'Saved';

  @override
  String get notificationSetting => 'Notification Setting';

  @override
  String get howOften => 'How often?';

  @override
  String get topicsYouCareAbout => 'Topics you care about';

  @override
  String get ok => 'OK';

  @override
  String get allSet => 'All set ✨';

  @override
  String get setPreferences => 'Set Preferences';

  @override
  String get save => 'Save';

  @override
  String get bundlesCombos => 'Bundles & Combos';

  @override
  String get noCombosRightNow => 'No combos right now';

  @override
  String addComboBIBundleprice(Object bundlePrice) {
    return 'Add combo · ₹$bundlePrice';
  }

  @override
  String get cart => 'Cart';

  @override
  String get clear => 'Clear';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get browseProductsAndAddThemHere =>
      'Browse products and add them here';

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
  String get pleaseAddADeliveryAddress => 'Please add a delivery address';

  @override
  String get checkout => 'Checkout';

  @override
  String get addNewAddress => 'Add new address';

  @override
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount) {
    return '$code applied · ₹$discount off';
  }

  @override
  String get remove => 'Remove';

  @override
  String get enterCouponCode => 'Enter coupon code';

  @override
  String viewAllCouponsLength(Object length) {
    return 'View all ($length)';
  }

  @override
  String get availableOffers => 'Available offers';

  @override
  String minOrderCpMinordervalue(Object minOrderValue) {
    return 'Min order ₹$minOrderValue';
  }

  @override
  String get applied => 'Applied';

  @override
  String get nothingToCheckout => 'Nothing to checkout';

  @override
  String get orderPlaced => 'Order placed!';

  @override
  String totalPaidFromYourWalletYour(Object total) {
    return '₹$total paid from your wallet. Your order is confirmed and will be on its way soon.';
  }

  @override
  String orderOrderidLength6OrderidSubstring(Object orderId) {
    return 'Order #$orderId';
  }

  @override
  String get continueShopping => 'Continue shopping';

  @override
  String get yourOrders => 'Your Orders';

  @override
  String get noOrdersYet => 'No orders yet';

  @override
  String get yourOrdersWillAppearHereOnce =>
      'Your orders will appear here once you buy something from the store.';

  @override
  String get invoiceIsStillBeingGeneratedTry =>
      'Invoice is still being generated. Try again shortly.';

  @override
  String get couldNotOpenTheInvoice => 'Could not open the invoice';

  @override
  String get thanksOurTeamWillReachOut =>
      'Thanks! Our team will reach out about this order.';

  @override
  String get orderDetails => 'Order details';

  @override
  String get needHelp => 'Need Help';

  @override
  String get needHelpWithThisOrder => 'Need help with this order?';

  @override
  String placedOnDate(Object date) {
    return 'Placed on $date';
  }

  @override
  String get invoice => 'Invoice';

  @override
  String get download => 'Download';

  @override
  String get needHelp2 => 'Need help';

  @override
  String orderWidgetOrderno(Object orderNo) {
    return 'Order #$orderNo';
  }

  @override
  String get whatWentWrong => 'What went wrong?';

  @override
  String get describeTheIssue => 'Describe the issue';

  @override
  String get tellUsWhatHappenedSoWe => 'Tell us what happened so we can help…';

  @override
  String get submitRequest => 'Submit request';

  @override
  String get addedToCart => 'Added to cart';

  @override
  String get productUnavailable => 'Product unavailable';

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
  String get fewItemsLeft => 'Few items left';

  @override
  String get description => 'Description';

  @override
  String get frequentlyBoughtTogether => 'Frequently bought together';

  @override
  String get viewAll => 'View all';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get searchProducts => 'Search products…';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get priceRange => 'Price range (₹)';

  @override
  String get min => 'Min';

  @override
  String get max => 'Max';

  @override
  String get inStockOnly => 'In stock only';

  @override
  String get sortBy => 'Sort by';

  @override
  String get addDeliveryAddress => 'Add delivery address';

  @override
  String get setAsDefaultAddress => 'Set as default address';

  @override
  String get saveAddress => 'Save address';

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
  String get fewLeft => 'Few left';

  @override
  String savePSaveamount(Object saveAmount) {
    return 'Save ₹$saveAmount';
  }

  @override
  String get freeDelivery => 'Free delivery';

  @override
  String searchWidgetTitleTolowercase(Object toLowerCase) {
    return 'Search $toLowerCase…';
  }

  @override
  String get nothingHereYet => 'Nothing here yet';

  @override
  String get loadingSecurePayment => 'Loading secure payment…';

  @override
  String get couldNotStartRecharge => 'Could not start recharge';

  @override
  String get paymentSuccessful => 'Payment successful 🎉';

  @override
  String get paymentWasNotCompleted => 'Payment was not completed';

  @override
  String get couldNotStartRechargeTryAgain =>
      'Could not start recharge, try again';

  @override
  String get wallet => 'Wallet';

  @override
  String get availableBalance => 'Available balance';

  @override
  String get useItForPoojasConsultations => 'use it for poojas & consultations';

  @override
  String get instantTopUp => 'instant top-up';

  @override
  String get noRechargePacksAvailableRightNow =>
      'No recharge packs available right now.';

  @override
  String get transactions => 'Transactions';

  @override
  String get endOfTransactions => '— end of transactions —';

  @override
  String get youGet => 'You get';

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
  String get about => 'About';

  @override
  String get astrologer => 'Astrologer';

  @override
  String get seeker => 'Seeker';

  @override
  String get free => 'Free';

  @override
  String get jan => 'Jan';

  @override
  String get feb => 'Feb';

  @override
  String get mar => 'Mar';

  @override
  String get apr => 'Apr';

  @override
  String get may => 'May';

  @override
  String get jun => 'Jun';

  @override
  String get jul => 'Jul';

  @override
  String get aug => 'Aug';

  @override
  String get sep => 'Sep';

  @override
  String get oct => 'Oct';

  @override
  String get nov => 'Nov';

  @override
  String get dec => 'Dec';

  @override
  String get english => 'English';

  @override
  String get all => 'All';

  @override
  String get vedic => 'Vedic';

  @override
  String get tarot => 'Tarot';

  @override
  String get numerology => 'Numerology';

  @override
  String get vastu => 'Vastu';

  @override
  String get palmistry => 'Palmistry';

  @override
  String get kp => 'KP';

  @override
  String get love => 'Love';

  @override
  String get taraAi => 'Tara AI';

  @override
  String get instantVedicAnswers247 => 'Instant Vedic answers • 24×7';

  @override
  String get allLanguages => 'All languages';

  @override
  String get jyotiAi => 'Jyoti AI';

  @override
  String get loveCareerGuidance => 'Love & career guidance';

  @override
  String get hindiEnglish => 'Hindi, English';

  @override
  String get veduAi => 'Vedu AI';

  @override
  String get remediesPredictions => 'Remedies & predictions';

  @override
  String get couldNotLoadAstrologers => 'Could not load astrologers';

  @override
  String get aiAstrologers => 'AI Astrologers';

  @override
  String get featuredAstrologers => 'Featured Astrologers';

  @override
  String get astrologers => 'Astrologers';

  @override
  String get searchAiAstrologers => 'Search AI astrologers…';

  @override
  String get searchAstrologersByName => 'Search astrologers by name…';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get noAstrologersMatch => 'No astrologers match';

  @override
  String get noAstrologersYet => 'No astrologers yet';

  @override
  String get couldnTSetTheReminderPlease =>
      'Couldn\'t set the reminder. Please try again.';

  @override
  String get ai => 'AI';

  @override
  String get live2 => 'Live';

  @override
  String get online => 'Online';

  @override
  String get busy => 'Busy';

  @override
  String get offline => 'Offline';

  @override
  String get chat => 'Chat';

  @override
  String get call => 'Call';

  @override
  String get video => 'Video';

  @override
  String get notEnoughBalanceToStartPlease =>
      'Not enough balance to start. Please recharge.';

  @override
  String get couldNotStartTheConsultationPlease =>
      'Could not start the consultation. Please try again.';

  @override
  String get share => 'Share';

  @override
  String get follow => 'Follow';

  @override
  String get chats => 'Chats';

  @override
  String get calls => 'Calls';

  @override
  String get videos => 'Videos';

  @override
  String get gifts => 'Gifts';

  @override
  String get languages => 'Languages';

  @override
  String get theyHaveGuidedThousandsOfSeekers =>
      'they have guided thousands of seekers through career, marriage, finance and life-path questions. ';

  @override
  String get theirReadingsBlendClassicalVedicPrinciples =>
      'Their readings blend classical Vedic principles with practical, compassionate guidance — helping you ';

  @override
  String get findClarityAndActionableRemediesFor =>
      'find clarity and actionable remedies for the road ahead.';

  @override
  String get giftsReceived => 'Gifts received';

  @override
  String get reviews => 'Reviews';

  @override
  String get weLlNotifyYouTheMoment =>
      'We\'ll notify you the moment they\'re free.';

  @override
  String get weLlNotifyYouTheMoment2 =>
      'We\'ll notify you the moment they\'re online.';

  @override
  String get getAHeadsUpTheMoment =>
      'Get a heads-up the moment they’re available.';

  @override
  String get couldNotLoadThisStore => 'Could not load this store';

  @override
  String get products => 'Products';

  @override
  String get poojas => 'Poojas';

  @override
  String get book => 'Book';

  @override
  String get buy => 'Buy';

  @override
  String get lalKitab => 'Lal Kitab';

  @override
  String get hindi => 'Hindi';

  @override
  String get bengali => 'Bengali';

  @override
  String get tamil => 'Tamil';

  @override
  String get marathi => 'Marathi';

  @override
  String get punjabi => 'Punjabi';

  @override
  String get telugu => 'Telugu';

  @override
  String get expertise => 'Expertise';

  @override
  String get couldNotLoadGifts => 'Could not load gifts';

  @override
  String get notEnoughBalanceAddMoneyTo =>
      'Not enough balance. Add money to send gifts.';

  @override
  String get couldNotSendTheGiftPlease =>
      'Could not send the gift. Please try again.';

  @override
  String get connecting2 => 'CONNECTING…';

  @override
  String get couldNotLoadThisChatHistory => 'Could not load this chat history';

  @override
  String get thisChatHistoryIsNoLonger =>
      'This chat history is no longer available\n(chats are kept for 7 days).';

  @override
  String get dailyFor14Days => 'Daily · for 14 days';

  @override
  String get dailyMantra => 'Daily mantra';

  @override
  String get reminder => 'Reminder';

  @override
  String get audio => 'Audio';

  @override
  String get couldNotLoadYourConsultations =>
      'Could not load your consultations';

  @override
  String get missed => 'Missed';

  @override
  String get declined => 'Declined';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get lowBalance => 'Low balance';

  @override
  String get rechargeNowToKeepYourConsultation =>
      'Recharge now to keep your consultation going. Your chat stays open while you pay.';

  @override
  String get sessionEndedLowBalance =>
      'Your balance ran out, so the consultation ended. Recharge to continue anytime.';

  @override
  String get couldNotLoadHoroscope =>
      'Couldn\'t load the horoscope. Please try again.';

  @override
  String get chooseSign => 'Change sign';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get totalScore => 'Overall score';

  @override
  String get luckyColor => 'Lucky colour';

  @override
  String get luckyNumber => 'Lucky number';

  @override
  String get lifeAreas => 'Life areas';

  @override
  String get todaysReading => 'Today\'s reading';

  @override
  String get career => 'Career';

  @override
  String get finances => 'Finances';

  @override
  String get health => 'Health';

  @override
  String get relationship => 'Relationship';

  @override
  String get family => 'Family';

  @override
  String get friends => 'Friends';

  @override
  String get travel => 'Travel';

  @override
  String get physique => 'Physique';

  @override
  String get statusLabel => 'Status';

  @override
  String get signAries => 'Aries';

  @override
  String get signTaurus => 'Taurus';

  @override
  String get signGemini => 'Gemini';

  @override
  String get signCancer => 'Cancer';

  @override
  String get signLeo => 'Leo';

  @override
  String get signVirgo => 'Virgo';

  @override
  String get signLibra => 'Libra';

  @override
  String get signScorpio => 'Scorpio';

  @override
  String get signSagittarius => 'Sagittarius';

  @override
  String get signCapricorn => 'Capricorn';

  @override
  String get signAquarius => 'Aquarius';

  @override
  String get signPisces => 'Pisces';

  @override
  String get couldNotLoadPanchang =>
      'Couldn\'t load the panchang. Please try again.';

  @override
  String get tithi => 'Tithi';

  @override
  String get nakshatra => 'Nakshatra';

  @override
  String get yoga => 'Yoga';

  @override
  String get karana => 'Karana';

  @override
  String get weekday => 'Weekday';

  @override
  String get inauspiciousTimes => 'Inauspicious times';

  @override
  String get rahuKaal => 'Rahu Kaal';

  @override
  String get gulikaKaal => 'Gulika Kaal';

  @override
  String get yamaganda => 'Yamaganda';

  @override
  String get duration => 'Duration';

  @override
  String get coinsUsed => 'Coins used';

  @override
  String get guest => 'Guest';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get chooseYourKundli => 'Choose Your Kundli';

  @override
  String get yourWalletReadingsAndSavedDetails =>
      'Your wallet, readings and saved details stay safe — but logging out means missing your daily horoscope, offers and reminders. Stay connected with the stars? ✨';

  @override
  String get offers => 'Offers';

  @override
  String get dailyPanchang => 'Daily Panchang';

  @override
  String get talkToAstrologer => 'Talk to Astrologer';

  @override
  String get brihatKundli => 'Brihat Kundli';

  @override
  String get dailyNotes => 'Daily Notes';

  @override
  String get askAQuestion => 'Ask A Question';

  @override
  String get free50Pages => 'Free 50+ Pages';

  @override
  String get freeReport => 'Free Report';

  @override
  String get freeMatrimony => 'Free Matrimony';

  @override
  String get matrimony => 'Matrimony';

  @override
  String get loveMatch => 'Love Match';

  @override
  String get horoscope => 'Horoscope';

  @override
  String get dailyHoroscope => 'Daily Horoscope';

  @override
  String get vedicAstrology => 'Vedic astrology';

  @override
  String get acharyaVeda => 'Acharya Veda';

  @override
  String get panditRohan => 'Pandit Rohan';

  @override
  String get guruMaya => 'Guru Maya';

  @override
  String get jayaShastri => 'Jaya Shastri';

  @override
  String get devSharma => 'Dev Sharma';

  @override
  String get sureshG => 'Suresh G.';

  @override
  String get lataP => 'Lata P.';

  @override
  String get kiranB => 'Kiran B.';

  @override
  String get mohanT => 'Mohan T.';

  @override
  String get anilJoshi => 'Anil Joshi';

  @override
  String get meeraDevi => 'Meera Devi';

  @override
  String get raviKumar => 'Ravi Kumar';

  @override
  String get sunitaRao => 'Sunita Rao';

  @override
  String get bengaluruKarnataka => 'Bengaluru, Karnataka';

  @override
  String get locating => 'Locating…';

  @override
  String get festivalOffer => 'Festival offer';

  @override
  String get upTo30OffOnGemstones => 'Up to 30% off on gemstones';

  @override
  String get talkToTopAstrologers => 'Talk to top astrologers';

  @override
  String get firstConsultationSpecial => 'First consultation special';

  @override
  String get rudrakshaCollection => 'Rudraksha collection';

  @override
  String get authenticEnergised => 'Authentic & energised';

  @override
  String get resumeSession => 'Resume session';

  @override
  String get home => 'Home';

  @override
  String get aiAstro => 'AI Astro';

  @override
  String get ask => 'Ask';

  @override
  String get history => 'History';

  @override
  String get seeAll2 => 'See all';

  @override
  String get s1AcceptanceOfTheseTerms => '1. Acceptance of these terms';

  @override
  String get termsOfService2 => 'Terms of Service';

  @override
  String get lastUpdated26June2026 => 'Last updated: 26 June 2026';

  @override
  String rudragangaProvidesAstrologySpiritualAndWellness(String appName) {
    return '$appName provides astrology, spiritual, and wellness consultations for guidance and personal ';
  }

  @override
  String get reflectionOnlyOurServicesAreNot =>
      'reflection only. Our services are not a substitute for professional medical, legal, financial, ';

  @override
  String get orPsychologicalAdviceYouMustBe =>
      'or psychological advice. You must be 18 or older to use the app.';

  @override
  String byCreatingAnAccountOrUsing(String appName) {
    return 'By creating an account or using the $appName mobile application and related services (the ';
  }

  @override
  String get servicesYouAgreeToBeBound =>
      '“Services”), you agree to be bound by these Terms of Service and our Privacy Policy and Refund ';

  @override
  String get policyIfYouDoNotAgree =>
      'Policy. If you do not agree, please do not use the Services.';

  @override
  String get s2EligibilityYourAccount => '2. Eligibility & your account';

  @override
  String get youMustBeAtLeast18 =>
      'You must be at least 18 years old and legally able to enter a contract.';

  @override
  String get youRegisterWithAPhoneNumber =>
      'You register with a phone number verified by a one-time password (OTP). You are responsible for keeping access to that number and device secure.';

  @override
  String get youAgreeToProvideAccurateInformation =>
      'You agree to provide accurate information, including birth details where you choose to share them for a reading. You are responsible for all activity under your account.';

  @override
  String get s3TheServicesWeOffer => '3. The services we offer';

  @override
  String rudragangaConnectsYouWithVerifiedAstrologers(String appName) {
    return '$appName connects you with verified astrologers for consultations by audio call, video call, ';
  }

  @override
  String get andChatAndOffersRelatedFeatures =>
      'and chat, and offers related features such as kundli generation and matching, an AI astrologer, ';

  @override
  String get dailyHoroscopesPoojaBookingsAStore =>
      'daily horoscopes, pooja bookings, a store for spiritual products, gifting, and matrimony matching. ';

  @override
  String get availabilityOfAnyFeatureOrAstrologer =>
      'Availability of any feature or astrologer may change at any time.';

  @override
  String get s4WalletPricingBilling => '4. Wallet, pricing & billing';

  @override
  String get consultationsArePrepaidYouAddFunds =>
      'Consultations are prepaid. You add funds to an in-app wallet and pay per minute at the rate shown for the astrologer and service before you connect.';

  @override
  String get billingBeginsWhenTheAstrologerAccepts =>
      'Billing begins when the astrologer accepts and the session connects. The first minute is charged on connect, and each further minute is charged at its start. A live meter is shown during the session, and the session ends automatically if your balance runs low.';

  @override
  String get paymentsAreProcessedByOurPayment =>
      'Payments are processed by our payment partner (PayU). We do not store full card details.';

  @override
  String get walletBalancesAreForUseWithin =>
      'Wallet balances are for use within the Services. Refunds, where applicable, are governed by our Refund Policy.';

  @override
  String get pricesAreInIndianRupeesInr =>
      'Prices are in Indian Rupees (INR) and may include applicable taxes.';

  @override
  String get s5AcceptableUse => '5. Acceptable use';

  @override
  String get youAgreeNotTo => 'You agree not to:';

  @override
  String get harassAbuseThreatenOrShareSexually =>
      'Harass, abuse, threaten, or share sexually explicit or unlawful content with astrologers or staff.';

  @override
  String get impersonateAnyPersonOrProvideFalse =>
      'Impersonate any person, or provide false information to obtain a service or refund.';

  @override
  String get attemptToTakeAConsultationOff =>
      'Attempt to take a consultation off-platform to avoid fees, or solicit personal contact details.';

  @override
  String get interfereWithScrapeOrAttemptTo =>
      'Interfere with, scrape, or attempt to disrupt the Services or their security.';

  @override
  String get s6AstrologersOnThePlatform => '6. Astrologers on the platform';

  @override
  String astrologersAreIndependentPractitionersWhoAre(String appName) {
    return 'Astrologers are independent practitioners who are identity-verified and approved by $appName ';
  }

  @override
  String get beforeTheyCanOfferConsultationsThey =>
      'before they can offer consultations. They set their own per-minute fares within limits we define. ';

  @override
  String get opinionsAndGuidanceSharedDuringA =>
      'Opinions and guidance shared during a consultation are those of the individual astrologer and not ';

  @override
  String ofRudragangaWeAreNotResponsible(String appName) {
    return 'of $appName. We are not responsible for any decision you make based on a consultation.';
  }

  @override
  String get s7RecordingsContent => '7. Recordings & content';

  @override
  String get forQualitySafetyAndDisputeResolution =>
      'For quality, safety, and dispute resolution, audio and video consultations may be recorded. You ';

  @override
  String get consentToSuchRecordingByStarting =>
      'consent to such recording by starting a session. Chat conversations are stored so you can revisit ';

  @override
  String get themSeeOurPrivacyPolicyFor =>
      'them. See our Privacy Policy for how this data is handled.';

  @override
  String get s8DisclaimerLimitationOfLiability =>
      '8. Disclaimer & limitation of liability';

  @override
  String get theServicesAreProvidedAsIs =>
      'The Services are provided “as is” for guidance and entertainment-adjacent personal reflection. ';

  @override
  String rudragangaMakesNoGuaranteeAboutThe(String appName) {
    return '$appName makes no guarantee about the accuracy of any prediction or remedy. To the maximum extent ';
  }

  @override
  String permittedByLawRudragangaSTotal(String appName) {
    return 'permitted by law, $appName’s total liability arising from your use of the Services is limited to ';
  }

  @override
  String get theAmountYouPaidIntoYour =>
      'the amount you paid into your wallet in the 30 days before the event giving rise to the claim. We ';

  @override
  String get areNotLiableForIndirectOr =>
      'are not liable for indirect or consequential losses.';

  @override
  String get s9SuspensionTermination => '9. Suspension & termination';

  @override
  String get weMaySuspendOrTerminateYour =>
      'We may suspend or terminate your account if you breach these terms, attempt fraud, or misuse the ';

  @override
  String get servicesYouMayStopUsingThe =>
      'Services. You may stop using the Services at any time. Some provisions (payment obligations, ';

  @override
  String get disclaimersAndLimitationsOfLiabilitySurvive =>
      'disclaimers, and limitations of liability) survive termination.';

  @override
  String get s10ChangesToTheseTerms => '10. Changes to these terms';

  @override
  String get weMayUpdateTheseTermsFrom =>
      'We may update these terms from time to time. Material changes will be notified in the app or by ';

  @override
  String get updatingTheLastUpdatedDateAbove =>
      'updating the “Last updated” date above. Continued use after changes means you accept them.';

  @override
  String get s11ContactUs => '11. Contact us';

  @override
  String get questionsAboutTheseTermsReachUs =>
      'Questions about these terms? Reach us through the contact form on our website or in the app’s ';

  @override
  String get helpSupportSection => 'Help & Support section.';

  @override
  String get privacyPolicy2 => 'Privacy Policy';

  @override
  String get yourBirthDetailsConsultationsAndChats =>
      'Your birth details, consultations, and chats are personal to you. This policy explains what we ';

  @override
  String get collectWhyAndTheControlYou =>
      'collect, why, and the control you have over it.';

  @override
  String get s1InformationWeCollect => '1. Information we collect';

  @override
  String get accountInformationYourNamePhoneNumber =>
      'Account information: your name, phone number (verified by OTP), and email if provided.';

  @override
  String get birthDetailsDateTimeAndPlace =>
      'Birth details: date, time, and place of birth that you choose to share for kundli and readings.';

  @override
  String get consultationDataChatMessagesAndAudio =>
      'Consultation data: chat messages, and audio/video call recordings where applicable.';

  @override
  String get paymentDataWalletTransactionsAndPayment =>
      'Payment data: wallet transactions and payment references. Card details are handled by our payment partner (PayU); we do not store full card numbers.';

  @override
  String get deviceUsageDataDeviceTypeOperating =>
      'Device & usage data: device type, operating system, approximate location derived from your IP address, pages visited, and interactions, used to operate and improve the Services.';

  @override
  String get s2HowWeUseIt => '2. How we use it';

  @override
  String get toCreateAndSecureYourAccount =>
      'To create and secure your account and verify your identity.';

  @override
  String get toConnectYouWithAstrologersAnd =>
      'To connect you with astrologers and deliver consultations, kundli, horoscopes, and other features.';

  @override
  String get toProcessWalletRechargesPerMinute =>
      'To process wallet recharges, per-minute billing, payouts, and order fulfilment.';

  @override
  String get toProvideSupportPreventFraudAnd =>
      'To provide support, prevent fraud and abuse, and meet legal obligations.';

  @override
  String get toUnderstandAndImproveHowThe =>
      'To understand and improve how the app and website are used.';

  @override
  String get s3WhenWeShareInformation => '3. When we share information';

  @override
  String get weDoNotSellYourPersonal =>
      'We do not sell your personal information. We share it only:';

  @override
  String get withTheAstrologerYouConsultLimited =>
      'With the astrologer you consult, limited to what is needed for the reading (e.g. your birth details and chat).';

  @override
  String get withServiceProvidersWhoHelpUs =>
      'With service providers who help us operate — payment processing (PayU), cloud hosting and storage, communications (WhatsApp/SMS for OTP), and notifications — under confidentiality obligations.';

  @override
  String whenRequiredByLawOrTo(String appName) {
    return 'When required by law, or to protect the rights, safety, and property of users and $appName.';
  }

  @override
  String get s4ConsultationRecordingsChats =>
      '4. Consultation recordings & chats';

  @override
  String get audioAndVideoConsultationsMayBe =>
      'Audio and video consultations may be recorded, and chats are stored, for quality, safety, and ';

  @override
  String get disputeResolutionYouCanReviewYour =>
      'dispute resolution. You can review your chat history in the app. Recordings are retained as ';

  @override
  String get describedBelowAndAccessedOnlyWhen =>
      'described below and accessed only when needed for support, safety, or legal reasons.';

  @override
  String get s5AnalyticsCookies => '5. Analytics & cookies';

  @override
  String get ourWebsiteUsesAFirstParty =>
      'Our website uses a first-party cookie/identifier to recognise return visits, measure how the ';

  @override
  String get landingPagePerformsSuchAsWhich =>
      'landing page performs (such as which sections are clicked), and attribute sign-ups to marketing ';

  @override
  String get campaignsThisIsUsedInAggregate =>
      'campaigns. This is used in aggregate to improve the experience. We derive approximate city/region ';

  @override
  String get fromYourIpAddressWeDo =>
      'from your IP address; we do not use precise GPS location for analytics.';

  @override
  String get s6DataRetention => '6. Data retention';

  @override
  String get weKeepYourInformationForAs =>
      'We keep your information for as long as your account is active and as needed to provide the ';

  @override
  String get servicesComplyWithLegalObligationsResolve =>
      'Services, comply with legal obligations, resolve disputes, and enforce our agreements. You may ';

  @override
  String get requestDeletionOfYourAccountAnd =>
      'request deletion of your account and associated personal data, subject to legal retention ';

  @override
  String get requirementsForExampleTransactionRecordsWe =>
      'requirements (for example, transaction records we must keep for accounting and tax).';

  @override
  String get s7Security => '7. Security';

  @override
  String get weUseIndustryStandardMeasuresEncryption =>
      'We use industry-standard measures — encryption in transit, access controls, and secure ';

  @override
  String get infrastructureToProtectYourInformationNo =>
      'infrastructure — to protect your information. No method of transmission or storage is completely ';

  @override
  String get secureSoWeCannotGuaranteeAbsolute =>
      'secure, so we cannot guarantee absolute security.';

  @override
  String get s8YourRightsChoices => '8. Your rights & choices';

  @override
  String get accessCorrectOrUpdateYourProfile =>
      'Access, correct, or update your profile and birth details in the app.';

  @override
  String get requestACopyOrDeletionOf =>
      'Request a copy or deletion of your personal data by contacting us.';

  @override
  String get optOutOfPromotionalNotificationsIn =>
      'Opt out of promotional notifications in your device or app settings.';

  @override
  String get s9Children => '9. Children';

  @override
  String get theServicesAreIntendedForUsers =>
      'The Services are intended for users aged 18 and above. We do not knowingly collect data from ';

  @override
  String get anyoneUnder18IfYouBelieve =>
      'anyone under 18. If you believe a minor has used the Services, please contact us so we can remove it.';

  @override
  String get s10ChangesToThisPolicy => '10. Changes to this policy';

  @override
  String get weMayUpdateThisPolicyMaterial =>
      'We may update this policy. Material changes will be notified in the app or by updating the ';

  @override
  String get lastUpdatedDateAbove => '“Last updated” date above.';

  @override
  String get forPrivacyQuestionsOrDataRequests =>
      'For privacy questions or data requests, reach us via the contact form on our website or the ';

  @override
  String get appSHelpSupportSection => 'app’s Help & Support section.';

  @override
  String s2026Rudraganga18ForGuidanceAnd(String appName) {
    return 'Â© 2026 $appName Â· 18+ Â· For guidance and wellbeing â\nnot a substitute for professional advice.';
  }

  @override
  String get widthDeviceWidthInitialScale1 =>
      'width=device-width, initial-scale=1, maximum-scale=1';

  @override
  String get segoeUi => 'Segoe UI';

  @override
  String get vote => 'Vote';

  @override
  String get couldnTLoadLiveSessions => 'Couldn’t load live sessions';

  @override
  String get noOneIsLiveRightNow => 'No one is live right now';

  @override
  String get whenAnAstrologerGoesLiveThey =>
      'When an astrologer goes live, they’ll appear here. Pull down to refresh — or watch for a notification.';

  @override
  String get justNow => 'Just now';

  @override
  String get couldNotLoad => 'Could not load';

  @override
  String get continueLabel => 'Continue';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get somePermissionsAreBlockedTapA =>
      'Some permissions are blocked. Tap a blocked item (or “Open Settings”) and enable it, then return here.';

  @override
  String thesePermissionsAreRequiredToUse(String appName) {
    return 'These permissions are required to use $appName. Tap any pending item to grant it.';
  }

  @override
  String get settings2 => 'Settings';

  @override
  String get allow => 'Allow';

  @override
  String get blockedEnableItInSettings => 'Blocked — enable it in Settings';

  @override
  String get allowsUpTo => 'allows up to';

  @override
  String get bookingFailed => 'Booking failed';

  @override
  String get yourDetails => 'Your details';

  @override
  String get fromYourProfile => 'From your profile';

  @override
  String get familyMembers => 'Family members';

  @override
  String get addMember => 'Add member';

  @override
  String get addAnother => 'Add another';

  @override
  String get preferredDateOptional => 'Preferred date (optional)';

  @override
  String get anyDate => 'Any date';

  @override
  String get bookNowFree => 'Book now (Free)';

  @override
  String get couldNotLoadThisPooja => 'Could not load this pooja';

  @override
  String get forLabel => 'For';

  @override
  String get s1Person => '1 person';

  @override
  String get bookShareDetails => 'Book & share details';

  @override
  String get confirmYourBookingWithTheNames =>
      'Confirm your booking with the names the pooja is performed for.';

  @override
  String get panditCoordinates => 'Pandit coordinates';

  @override
  String get aVerifiedPanditCallsToFix =>
      'A verified pandit calls to fix the time and arrange the samagri.';

  @override
  String get poojaPerformed => 'Pooja performed';

  @override
  String get sankalpIsTakenInYourFamily =>
      'Sankalp is taken in your family’s names, and prasad is shared afterwards where applicable.';

  @override
  String get couldNotLoadPoojas => 'Could not load poojas';

  @override
  String get any => 'Any';

  @override
  String get noPoojasHere => 'No poojas here';

  @override
  String get nothingMatchesTheCurrentFilters =>
      'Nothing matches the current filters';

  @override
  String get noPoojasAvailableYet => 'No poojas available yet';

  @override
  String get showAllPoojas => 'Show all poojas';

  @override
  String get tapToViewDetailsBook => 'Tap to view details & book';

  @override
  String get appliedYouBothEarnOnYour =>
      'Applied! You both earn on your first recharge.';

  @override
  String get shareYourCode => 'Share your code';

  @override
  String get sendYourCodeToFriendsVia =>
      'Send your code to friends via WhatsApp, SMS, anywhere.';

  @override
  String get friendSignsUp => 'Friend signs up';

  @override
  String get theyEnterYourCodeInRefer =>
      'They enter your code in Refer & Earn after signing up.';

  @override
  String get feedbackReceived => 'Feedback received ✓';

  @override
  String get thanksOurTeamWillLookInto =>
      'Thanks — our team will look into it.';

  @override
  String get fullName => 'Full name';

  @override
  String get email => 'Email';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get message => 'Message';

  @override
  String get requiredLabel => 'Required';

  @override
  String get applicationReceived => 'Application received ✓';

  @override
  String get ourTeamWillReachOutAbout =>
      'Our team will reach out about your astrologer profile.';

  @override
  String get enter10Digits => 'Enter 10 digits';

  @override
  String get aboutYouBioExpertiseExperience =>
      'About you (bio, expertise, experience)';

  @override
  String rudragangaConnectsYouWithTrustedVedic(String appName) {
    return '$appName connects you with trusted Vedic astrologers for guidance on career, ';
  }

  @override
  String get marriageFinanceHealthAndLifeS =>
      'marriage, finance, health and life’s big questions — over chat, call and video. ';

  @override
  String get getYourFreeKundliDailyHoroscope =>
      'Get your free kundli, daily horoscope, matchmaking, pujas and remedies, all in one place.\n\n';

  @override
  String get ourMissionIsToMakeAuthentic =>
      'Our mission is to make authentic, compassionate spiritual guidance accessible to everyone, ';

  @override
  String get inYourOwnLanguage => 'in your own language.';

  @override
  String get verifiedExperiencedAstrologers =>
      'Verified, experienced astrologers';

  @override
  String get privateSecureConsultations => 'Private & secure consultations';

  @override
  String get availableIn6IndianLanguages => 'Available in 6 Indian languages';

  @override
  String get thanksForRatingUs => 'Thanks for rating us ✓';

  @override
  String yourFeedbackHelpsRudragangaGrow(String appName) {
    return 'Your feedback helps $appName grow.';
  }

  @override
  String get onceInADay => 'Once in a day';

  @override
  String get twiceInADay => 'Twice in a day';

  @override
  String get asManyTimesAsItComes => 'As many times as it comes';

  @override
  String get never => 'Never';

  @override
  String get cricket => 'Cricket';

  @override
  String get shareMarket => 'Share Market';

  @override
  String get bollywood => 'Bollywood';

  @override
  String get newMagazine => 'New Magazine';

  @override
  String get festivals => 'Festivals';

  @override
  String get notificationsUpdated => 'Notifications updated ✓';

  @override
  String get youLlHearFromUsBased =>
      'You\'ll hear from us based on your choices.';

  @override
  String get yourChartsWillNowFollowYour =>
      'Your charts will now follow your chosen style.';

  @override
  String get chartStyle => 'Chart style';

  @override
  String get northIndian => 'North Indian';

  @override
  String get southIndian => 'South Indian';

  @override
  String get monthSystem => 'Month system';

  @override
  String get amanta => 'Amanta';

  @override
  String get purnimanta => 'Purnimanta';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get off => 'Off';

  @override
  String get onLabel => 'On';

  @override
  String get useDeviceSettings => 'Use device settings';

  @override
  String get ayanamsa => 'Ayanamsa';

  @override
  String get nCLahiri => 'N.C. Lahiri';

  @override
  String get kpNew => 'KP New';

  @override
  String get kpOld => 'KP Old';

  @override
  String get raman => 'Raman';

  @override
  String get kpKhullar => 'KP Khullar';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get youSave => 'You save';

  @override
  String get total => 'Total';

  @override
  String get deliveryAddress => 'Delivery address';

  @override
  String get orderSummary => 'Order summary';

  @override
  String get couponsOffers => 'Coupons & offers';

  @override
  String get billDetails => 'Bill details';

  @override
  String get address => 'Address';

  @override
  String get productDiscount => 'Product discount';

  @override
  String get itemsSubtotal => 'Items subtotal';

  @override
  String get delivery => 'Delivery';

  @override
  String get free2 => 'FREE';

  @override
  String get toPay => 'To pay';

  @override
  String get dMmmYyyyHMmA => 'd MMM yyyy, h:mm a';

  @override
  String get couldNotDownloadInvoice => 'Could not download invoice';

  @override
  String get orderNotFound => 'Order not found';

  @override
  String get activityTimeline => 'Activity timeline';

  @override
  String get eeeDMmmYyyyHMm => 'EEE, d MMM yyyy · h:mm a';

  @override
  String get totalPaid => 'Total paid';

  @override
  String get orderPlaced2 => 'Order placed';

  @override
  String get dMmmHMmA => 'd MMM, h:mm a';

  @override
  String get generating => 'Generating…';

  @override
  String get pleaseDescribeTheIssue => 'Please describe the issue';

  @override
  String get couldNotLoadProducts => 'Could not load products';

  @override
  String get newest => 'Newest';

  @override
  String get priceLowHigh => 'Price: Low→High';

  @override
  String get priceHighLow => 'Price: High→Low';

  @override
  String get topRated => 'Top rated';

  @override
  String get s6DigitPin => '6-digit PIN';

  @override
  String get addressLine1 => 'Address line 1 *';

  @override
  String get addressLine2 => 'Address line 2';

  @override
  String get city => 'City *';

  @override
  String get state => 'State *';

  @override
  String get pinCode => 'PIN code *';

  @override
  String get payment => 'Payment';

  @override
  String get pooja => 'Pooja';

  @override
  String get shop => 'Shop';

  @override
  String get securePayment => 'Secure payment';

  @override
  String get noTransactionsMatchTheseFilters =>
      'No transactions match these filters';

  @override
  String get noTransactionsYet => 'No transactions yet';

  @override
  String get moneyAdded => 'Money added';

  @override
  String get poojaBooking => 'Pooja booking';

  @override
  String get videoCall => 'Video call';

  @override
  String get shopOrder => 'Shop order';

  @override
  String get refund => 'Refund';

  @override
  String get bonus => 'Bonus';

  @override
  String get credited => 'Credited';

  @override
  String get debited => 'Debited';

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
  String get yourName => 'Your name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get runNumerology => 'Reveal my numbers';

  @override
  String get numerologyIntro =>
      'Discover the numbers that shape your destiny, personality and soul.';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get timeOfBirth => 'Time of birth';

  @override
  String get birthPlace => 'Birth place';

  @override
  String get manglikDosh => 'Manglik Dosh';

  @override
  String get compatibility => 'Compatibility';

  @override
  String get partner1 => 'Girl';

  @override
  String get partner2 => 'Boy';

  @override
  String get checkCompatibility => 'Check compatibility';

  @override
  String get checkManglik => 'Check Manglik Dosh';

  @override
  String get matchingIntro =>
      'Check marriage compatibility — Guna Milan, doshas and an overall score.';

  @override
  String get manglikIntro =>
      'Check whether Manglik (Mangal) dosha is present, and by how much.';

  @override
  String get fillBothPartners => 'Enter both partners’ birth details.';

  @override
  String get enterBirthDetails => 'Enter the birth details.';

  @override
  String get overallScore => 'Overall score';
}
