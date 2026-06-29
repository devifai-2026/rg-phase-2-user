import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_as.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('as'),
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
    Locale('pa')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Astrology & Wellness'**
  String get tagline;

  /// No description provided for @splashBlessing.
  ///
  /// In en, this message translates to:
  /// **'Your journey to clarity begins here'**
  String get splashBlessing;

  /// No description provided for @authWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get authWelcomeTitle;

  /// No description provided for @authWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in or create your account with your phone number'**
  String get authWelcomeSubtitle;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'10-digit mobile number'**
  String get phoneHint;

  /// No description provided for @phoneCountryCode.
  ///
  /// In en, this message translates to:
  /// **'+91'**
  String get phoneCountryCode;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @sendOtpButton.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtpButton;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your number'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to {phone}'**
  String otpSubtitle(String phone);

  /// No description provided for @otpLabel.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otpLabel;

  /// No description provided for @verifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify & continue'**
  String get verifyButton;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendOtp;

  /// No description provided for @resendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendOtpIn(int seconds);

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get changeNumber;

  /// No description provided for @termsNotice.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Terms & Privacy Policy'**
  String get termsNotice;

  /// No description provided for @acceptPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get acceptPrefix;

  /// No description provided for @acceptAnd.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get acceptAnd;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @errInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit phone number'**
  String get errInvalidPhone;

  /// No description provided for @errInvalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code'**
  String get errInvalidOtp;

  /// No description provided for @errGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errGeneric;

  /// No description provided for @errNetwork.
  ///
  /// In en, this message translates to:
  /// **'No connection. Check your internet and try again.'**
  String get errNetwork;

  /// No description provided for @otpSent.
  ///
  /// In en, this message translates to:
  /// **'OTP sent'**
  String get otpSent;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed in'**
  String get loginSuccess;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Namaste, {name}'**
  String homeWelcome(String name);

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @onbTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about you'**
  String get onbTitle;

  /// No description provided for @onbSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us personalise your readings. None of it is required — you can skip and finish later.'**
  String get onbSubtitle;

  /// No description provided for @onbName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get onbName;

  /// No description provided for @onbAddPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get onbAddPhoto;

  /// No description provided for @onbChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get onbChangePhoto;

  /// No description provided for @onbGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get onbGender;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @onbDob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get onbDob;

  /// No description provided for @onbTob.
  ///
  /// In en, this message translates to:
  /// **'Time of birth'**
  String get onbTob;

  /// No description provided for @onbDontKnowTime.
  ///
  /// In en, this message translates to:
  /// **'I don\'t know my time of birth'**
  String get onbDontKnowTime;

  /// No description provided for @onbPob.
  ///
  /// In en, this message translates to:
  /// **'Place of birth'**
  String get onbPob;

  /// No description provided for @onbPobHint.
  ///
  /// In en, this message translates to:
  /// **'Search your birth city'**
  String get onbPobHint;

  /// No description provided for @onbLanguage.
  ///
  /// In en, this message translates to:
  /// **'Preferred language'**
  String get onbLanguage;

  /// No description provided for @onbSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get onbSelectDate;

  /// No description provided for @onbSelectTime.
  ///
  /// In en, this message translates to:
  /// **'Select time'**
  String get onbSelectTime;

  /// No description provided for @onbSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get onbSkip;

  /// No description provided for @onbFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get onbFinish;

  /// No description provided for @onbSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved'**
  String get onbSaved;

  /// No description provided for @completeProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile'**
  String get completeProfile;

  /// No description provided for @completeProfileCta.
  ///
  /// In en, this message translates to:
  /// **'Finish setup'**
  String get completeProfileCta;

  /// No description provided for @permTitle.
  ///
  /// In en, this message translates to:
  /// **'A few permissions'**
  String get permTitle;

  /// No description provided for @permSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We need these so calls, alerts and photos work smoothly. You can change them anytime in Settings.'**
  String get permSubtitle;

  /// No description provided for @permNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permNotifications;

  /// No description provided for @permNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Consultation alerts, order updates and reminders'**
  String get permNotificationsDesc;

  /// No description provided for @permMic.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get permMic;

  /// No description provided for @permMicDesc.
  ///
  /// In en, this message translates to:
  /// **'For voice calls with astrologers'**
  String get permMicDesc;

  /// No description provided for @permCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get permCamera;

  /// No description provided for @permCameraDesc.
  ///
  /// In en, this message translates to:
  /// **'For video calls and uploading photos'**
  String get permCameraDesc;

  /// No description provided for @permPhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get permPhotos;

  /// No description provided for @permPhotosDesc.
  ///
  /// In en, this message translates to:
  /// **'To set your profile picture'**
  String get permPhotosDesc;

  /// No description provided for @permAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get permAllow;

  /// No description provided for @permContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get permContinue;

  /// No description provided for @permLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get permLocation;

  /// No description provided for @permLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Find astrologers near you'**
  String get permLocationDesc;

  /// No description provided for @secFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured Astrologers'**
  String get secFeatured;

  /// No description provided for @secNearby.
  ///
  /// In en, this message translates to:
  /// **'Nearby Astrologers'**
  String get secNearby;

  /// No description provided for @secCallChat.
  ///
  /// In en, this message translates to:
  /// **'Call & Chat'**
  String get secCallChat;

  /// No description provided for @secAiAstro.
  ///
  /// In en, this message translates to:
  /// **'AI Astrologers'**
  String get secAiAstro;

  /// No description provided for @secProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get secProducts;

  /// No description provided for @secVideos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get secVideos;

  /// No description provided for @secLessons.
  ///
  /// In en, this message translates to:
  /// **'Astrology lessons'**
  String get secLessons;

  /// No description provided for @secOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get secOthers;

  /// No description provided for @secHistory.
  ///
  /// In en, this message translates to:
  /// **'Your Consultations'**
  String get secHistory;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @basedOnLocation.
  ///
  /// In en, this message translates to:
  /// **'Based on your location'**
  String get basedOnLocation;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App with Friends'**
  String get shareApp;

  /// No description provided for @startReadingHint.
  ///
  /// In en, this message translates to:
  /// **'No consultations yet. Start your first reading.'**
  String get startReadingHint;

  /// No description provided for @startBtn.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startBtn;

  /// No description provided for @namaste.
  ///
  /// In en, this message translates to:
  /// **'Namaste'**
  String get namaste;

  /// No description provided for @kFreeKundli.
  ///
  /// In en, this message translates to:
  /// **'Free Kundli'**
  String get kFreeKundli;

  /// No description provided for @kMatching.
  ///
  /// In en, this message translates to:
  /// **'Matching'**
  String get kMatching;

  /// No description provided for @kBrihat.
  ///
  /// In en, this message translates to:
  /// **'Brihat Kundli'**
  String get kBrihat;

  /// No description provided for @kKundliAi.
  ///
  /// In en, this message translates to:
  /// **'Kundli AI+'**
  String get kKundliAi;

  /// No description provided for @tCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get tCareer;

  /// No description provided for @tMarriage.
  ///
  /// In en, this message translates to:
  /// **'Marriage'**
  String get tMarriage;

  /// No description provided for @tFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get tFinance;

  /// No description provided for @tHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get tHealth;

  /// No description provided for @tEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get tEducation;

  /// No description provided for @tTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get tTravel;

  /// No description provided for @statusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// No description provided for @statusBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get statusBusy;

  /// No description provided for @statusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get statusOffline;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @chatNow.
  ///
  /// In en, this message translates to:
  /// **'Chat Now'**
  String get chatNow;

  /// No description provided for @notifyMe.
  ///
  /// In en, this message translates to:
  /// **'Notify me'**
  String get notifyMe;

  /// No description provided for @weLlLetYouKnowWhen.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when {name} is {reason}.'**
  String weLlLetYouKnowWhen(Object name, Object reason);

  /// No description provided for @thisAstrologerIsNotAvailableTo.
  ///
  /// In en, this message translates to:
  /// **'This astrologer is not available to consult yet.'**
  String get thisAstrologerIsNotAvailableTo;

  /// No description provided for @youNeedAtLeastRateperminFor.
  ///
  /// In en, this message translates to:
  /// **'You need at least ₹{ratePerMin} for one minute. Please recharge.'**
  String youNeedAtLeastRateperminFor(Object ratePerMin);

  /// No description provided for @completeYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile'**
  String get completeYourProfile;

  /// No description provided for @addYourDateTimePlaceOf.
  ///
  /// In en, this message translates to:
  /// **'Add your date, time & place of birth so the astrologer can give you a clearer reading.'**
  String get addYourDateTimePlaceOf;

  /// No description provided for @completeProfile2.
  ///
  /// In en, this message translates to:
  /// **'Complete profile'**
  String get completeProfile2;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @unfollowWidgetName.
  ///
  /// In en, this message translates to:
  /// **'Unfollow {name}?'**
  String unfollowWidgetName(Object name);

  /// No description provided for @tellUsWhyOptionalItHelps.
  ///
  /// In en, this message translates to:
  /// **'Tell us why (optional) — it helps us improve.'**
  String get tellUsWhyOptionalItHelps;

  /// No description provided for @reasonOptional.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get reasonOptional;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @unfollow.
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get unfollow;

  /// No description provided for @s21kReviews.
  ///
  /// In en, this message translates to:
  /// **'  (2.1k reviews)'**
  String get s21kReviews;

  /// No description provided for @followersFollowers.
  ///
  /// In en, this message translates to:
  /// **'{followers} followers'**
  String followersFollowers(Object followers);

  /// No description provided for @gift.
  ///
  /// In en, this message translates to:
  /// **'Gift'**
  String get gift;

  /// No description provided for @store.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get store;

  /// No description provided for @joinLiveSession.
  ///
  /// In en, this message translates to:
  /// **'Join live session'**
  String get joinLiveSession;

  /// No description provided for @youLlBeNotified.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be notified'**
  String get youLlBeNotified;

  /// No description provided for @thisStoreHasNoItemsYet.
  ///
  /// In en, this message translates to:
  /// **'This store has no items yet.'**
  String get thisStoreHasNoItemsYet;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @onlineNowOnly.
  ///
  /// In en, this message translates to:
  /// **'Online now only'**
  String get onlineNowOnly;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply filters'**
  String get applyFilters;

  /// No description provided for @giftingUnavailableForThisAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Gifting unavailable for this astrologer.'**
  String get giftingUnavailableForThisAstrologer;

  /// No description provided for @needTotalcostYourBalanceIsWallet.
  ///
  /// In en, this message translates to:
  /// **'Need ₹{totalCost} — your balance is ₹{balance}. Please recharge.'**
  String needTotalcostYourBalanceIsWallet(Object totalCost, Object balance);

  /// No description provided for @sentQtyGiftNameToWidget.
  ///
  /// In en, this message translates to:
  /// **'Sent {_qty} {name} to {astrologerName} 🎁'**
  String sentQtyGiftNameToWidget(
      Object _qty, Object name, Object astrologerName);

  /// No description provided for @sendAGiftToWidgetAstrologername.
  ///
  /// In en, this message translates to:
  /// **'Send a gift to {astrologerName}'**
  String sendAGiftToWidgetAstrologername(Object astrologerName);

  /// No description provided for @balanceContextWatchWalletproviderBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance: ₹{balance}'**
  String balanceContextWatchWalletproviderBalance(Object balance);

  /// No description provided for @recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get recharge;

  /// No description provided for @gTokencostTk.
  ///
  /// In en, this message translates to:
  /// **'{tokenCost} tk'**
  String gTokencostTk(Object tokenCost);

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @min1Max100.
  ///
  /// In en, this message translates to:
  /// **'Min 1 · Max 100'**
  String get min1Max100;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @summaryFromAstrologername.
  ///
  /// In en, this message translates to:
  /// **'Summary from {astrologerName}'**
  String summaryFromAstrologername(Object astrologerName);

  /// No description provided for @remindersSetForYou.
  ///
  /// In en, this message translates to:
  /// **'Reminders set for you'**
  String get remindersSetForYou;

  /// No description provided for @suggestedForYou.
  ///
  /// In en, this message translates to:
  /// **'Suggested for you'**
  String get suggestedForYou;

  /// No description provided for @couldNotSendImage.
  ///
  /// In en, this message translates to:
  /// **'Could not send image'**
  String get couldNotSendImage;

  /// No description provided for @endConsultation.
  ///
  /// In en, this message translates to:
  /// **'End consultation?'**
  String get endConsultation;

  /// No description provided for @thisWillEndTheChatAnd.
  ///
  /// In en, this message translates to:
  /// **'This will end the chat and stop billing.'**
  String get thisWillEndTheChatAnd;

  /// No description provided for @keepChatting.
  ///
  /// In en, this message translates to:
  /// **'Keep chatting'**
  String get keepChatting;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @switchToType0TouppercaseType.
  ///
  /// In en, this message translates to:
  /// **'Switch to {toUpperCase}{substring}?'**
  String switchToType0TouppercaseType(Object toUpperCase, Object substring);

  /// No description provided for @yourChatWillEndAndA.
  ///
  /// In en, this message translates to:
  /// **'Your chat will end and a new {type} consultation will start at the {type2} rate.'**
  String yourChatWillEndAndA(Object type, Object type2);

  /// No description provided for @switchLabel.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get switchLabel;

  /// No description provided for @couldNotSwitchETostring.
  ///
  /// In en, this message translates to:
  /// **'Could not switch: {toString}'**
  String couldNotSwitchETostring(Object toString);

  /// No description provided for @switchToAudioCall.
  ///
  /// In en, this message translates to:
  /// **'Switch to audio call'**
  String get switchToAudioCall;

  /// No description provided for @switchToVideoCall.
  ///
  /// In en, this message translates to:
  /// **'Switch to video call'**
  String get switchToVideoCall;

  /// No description provided for @endConsultation2.
  ///
  /// In en, this message translates to:
  /// **'End consultation'**
  String get endConsultation2;

  /// No description provided for @sendAGift.
  ///
  /// In en, this message translates to:
  /// **'Send a gift'**
  String get sendAGift;

  /// No description provided for @sayHello.
  ///
  /// In en, this message translates to:
  /// **'Say hello 🙏'**
  String get sayHello;

  /// No description provided for @typeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message…'**
  String get typeAMessage;

  /// No description provided for @recommendedProduct.
  ///
  /// In en, this message translates to:
  /// **'Recommended product'**
  String get recommendedProduct;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting…'**
  String get connecting;

  /// No description provided for @myConsultations.
  ///
  /// In en, this message translates to:
  /// **'My consultations'**
  String get myConsultations;

  /// No description provided for @noConsultationsYet.
  ///
  /// In en, this message translates to:
  /// **'No consultations yet'**
  String get noConsultationsYet;

  /// No description provided for @typelabelSTypeConsultation.
  ///
  /// In en, this message translates to:
  /// **'{type} consultation'**
  String typelabelSTypeConsultation(Object type);

  /// No description provided for @viewChat.
  ///
  /// In en, this message translates to:
  /// **'View chat'**
  String get viewChat;

  /// No description provided for @historyExpired.
  ///
  /// In en, this message translates to:
  /// **'History expired'**
  String get historyExpired;

  /// No description provided for @connectingYourSTypeConsultation.
  ///
  /// In en, this message translates to:
  /// **'Connecting your {type} consultation…'**
  String connectingYourSTypeConsultation(Object type);

  /// No description provided for @ringingTheAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Ringing the astrologer'**
  String get ringingTheAstrologer;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get cancelRequest;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @thanksForYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback!'**
  String get thanksForYourFeedback;

  /// No description provided for @couldNotSubmitPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Could not submit. Please try again.'**
  String get couldNotSubmitPleaseTryAgain;

  /// No description provided for @consultationEnded.
  ///
  /// In en, this message translates to:
  /// **'Consultation ended'**
  String get consultationEnded;

  /// No description provided for @hopeYouGotTheClarityYou.
  ///
  /// In en, this message translates to:
  /// **'Hope you got the clarity you sought.'**
  String get hopeYouGotTheClarityYou;

  /// No description provided for @shareYourExperienceOptional.
  ///
  /// In en, this message translates to:
  /// **'Share your experience (optional)'**
  String get shareYourExperienceOptional;

  /// No description provided for @howWasTheCallQuality.
  ///
  /// In en, this message translates to:
  /// **'How was the call quality?'**
  String get howWasTheCallQuality;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get viewProfile;

  /// No description provided for @vAppversion.
  ///
  /// In en, this message translates to:
  /// **'v{_appVersion}'**
  String vAppversion(Object _appVersion);

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made by '**
  String get madeBy;

  /// No description provided for @devifai.
  ///
  /// In en, this message translates to:
  /// **'DevifAI'**
  String get devifai;

  /// No description provided for @withLabel.
  ///
  /// In en, this message translates to:
  /// **' with ❤️'**
  String get withLabel;

  /// No description provided for @leavingSoSoon.
  ///
  /// In en, this message translates to:
  /// **'Leaving so soon?'**
  String get leavingSoSoon;

  /// No description provided for @stayLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Stay logged in'**
  String get stayLoggedIn;

  /// No description provided for @logOutAnyway.
  ///
  /// In en, this message translates to:
  /// **'Log out anyway'**
  String get logOutAnyway;

  /// No description provided for @noNearbyAstrologersYet.
  ///
  /// In en, this message translates to:
  /// **'No nearby astrologers yet'**
  String get noNearbyAstrologersYet;

  /// No description provided for @bookAPooja.
  ///
  /// In en, this message translates to:
  /// **'Book a Pooja'**
  String get bookAPooja;

  /// No description provided for @panditLedPoojasAtYourChosen.
  ///
  /// In en, this message translates to:
  /// **'Pandit-led poojas at your chosen date'**
  String get panditLedPoojasAtYourChosen;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @connectingToLive.
  ///
  /// In en, this message translates to:
  /// **'Connecting to live…'**
  String get connectingToLive;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get live;

  /// No description provided for @thisLiveHasEnded.
  ///
  /// In en, this message translates to:
  /// **'This live has ended'**
  String get thisLiveHasEnded;

  /// No description provided for @backToLive.
  ///
  /// In en, this message translates to:
  /// **'Back to Live'**
  String get backToLive;

  /// No description provided for @sayHelloBeTheFirstTo.
  ///
  /// In en, this message translates to:
  /// **'Say hello 👋  Be the first to comment'**
  String get sayHelloBeTheFirstTo;

  /// No description provided for @aiPollLive.
  ///
  /// In en, this message translates to:
  /// **'AI Poll · live'**
  String get aiPollLive;

  /// No description provided for @totalVotes.
  ///
  /// In en, this message translates to:
  /// **'{total} votes'**
  String totalVotes(Object total);

  /// No description provided for @addAComment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment…'**
  String get addAComment;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @liveNow.
  ///
  /// In en, this message translates to:
  /// **'Live now'**
  String get liveNow;

  /// No description provided for @searchByAstrologerName.
  ///
  /// In en, this message translates to:
  /// **'Search by astrologer name'**
  String get searchByAstrologerName;

  /// No description provided for @noLiveAstrologerNamedSearchText.
  ///
  /// In en, this message translates to:
  /// **'No live astrologer named “{trim}”'**
  String noLiveAstrologerNamedSearchText(Object trim);

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// No description provided for @clearAllNotifications.
  ///
  /// In en, this message translates to:
  /// **'Clear all notifications?'**
  String get clearAllNotifications;

  /// No description provided for @thisPermanentlyDeletesAllYourNotifications.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes all your notifications.'**
  String get thisPermanentlyDeletesAllYourNotifications;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllRead;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @youReAllCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up.'**
  String get youReAllCaughtUp;

  /// No description provided for @nameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameIsRequired;

  /// No description provided for @enterAValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone'**
  String get enterAValidPhone;

  /// No description provided for @bookingConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Booking confirmed 🎉'**
  String get bookingConfirmed;

  /// No description provided for @bookingFailedPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Booking failed, please try again'**
  String get bookingFailedPleaseTryAgain;

  /// No description provided for @addMoneyToContinue.
  ///
  /// In en, this message translates to:
  /// **'Add money to continue'**
  String get addMoneyToContinue;

  /// No description provided for @addMoney.
  ///
  /// In en, this message translates to:
  /// **'Add money'**
  String get addMoney;

  /// No description provided for @bookWidgetPoojaName.
  ///
  /// In en, this message translates to:
  /// **'Book {name}'**
  String bookWidgetPoojaName(Object name);

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @addThePeopleThisPoojaIs.
  ///
  /// In en, this message translates to:
  /// **'Add the people this pooja is performed for (up to {_maxPersons}). Fill one before adding the next.'**
  String addThePeopleThisPoojaIs(Object _maxPersons);

  /// No description provided for @memberEKey1Name.
  ///
  /// In en, this message translates to:
  /// **'Member {key} name'**
  String memberEKey1Name(Object key);

  /// No description provided for @specialInstructionsOptional.
  ///
  /// In en, this message translates to:
  /// **'Special instructions (optional)'**
  String get specialInstructionsOptional;

  /// No description provided for @poojaDetails.
  ///
  /// In en, this message translates to:
  /// **'Pooja details'**
  String get poojaDetails;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @bookNow.
  ///
  /// In en, this message translates to:
  /// **'Book now'**
  String get bookNow;

  /// No description provided for @aboutThisPooja.
  ///
  /// In en, this message translates to:
  /// **'About this pooja'**
  String get aboutThisPooja;

  /// No description provided for @ourPanditWillCallYou.
  ///
  /// In en, this message translates to:
  /// **'Our pandit will call you'**
  String get ourPanditWillCallYou;

  /// No description provided for @beforeThePoojaToConfirmThe.
  ///
  /// In en, this message translates to:
  /// **'Before the pooja, to confirm the timing and your sankalp details.'**
  String get beforeThePoojaToConfirmThe;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get howItWorks;

  /// No description provided for @filterPoojas.
  ///
  /// In en, this message translates to:
  /// **'Filter poojas'**
  String get filterPoojas;

  /// No description provided for @maxBudgetMaxpriceRound.
  ///
  /// In en, this message translates to:
  /// **'Max budget · ₹{round}'**
  String maxBudgetMaxpriceRound(Object round);

  /// No description provided for @minPersonsSupported.
  ///
  /// In en, this message translates to:
  /// **'Min persons supported'**
  String get minPersonsSupported;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @searchPoojas.
  ///
  /// In en, this message translates to:
  /// **'Search poojas…'**
  String get searchPoojas;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @referEarn.
  ///
  /// In en, this message translates to:
  /// **'Refer & Earn'**
  String get referEarn;

  /// No description provided for @couldNotLoadTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Could not load. Try again.'**
  String get couldNotLoadTryAgain;

  /// No description provided for @shareEarnIReward.
  ///
  /// In en, this message translates to:
  /// **'Share & earn ₹{reward}'**
  String shareEarnIReward(Object reward);

  /// No description provided for @youGetIRewardOnYour.
  ///
  /// In en, this message translates to:
  /// **'You get ₹{reward} on your friend’s first recharge — and they get ₹{reward2} too.'**
  String youGetIRewardOnYour(Object reward, Object reward2);

  /// No description provided for @yourReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Your referral code'**
  String get yourReferralCode;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied'**
  String get codeCopied;

  /// No description provided for @shareEarn.
  ///
  /// In en, this message translates to:
  /// **'Share & earn'**
  String get shareEarn;

  /// No description provided for @haveAFriendSCode.
  ///
  /// In en, this message translates to:
  /// **'Have a friend’s code?'**
  String get haveAFriendSCode;

  /// No description provided for @enterReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Enter referral code'**
  String get enterReferralCode;

  /// No description provided for @aReferralCodeIsAppliedTo.
  ///
  /// In en, this message translates to:
  /// **'A referral code is applied to your account.'**
  String get aReferralCodeIsAppliedTo;

  /// No description provided for @feedbackSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Feedback submitted'**
  String get feedbackSubmitted;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @applicationSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Application submitted'**
  String get applicationSubmitted;

  /// No description provided for @astrologerRegistration.
  ///
  /// In en, this message translates to:
  /// **'Astrologer Registration'**
  String get astrologerRegistration;

  /// No description provided for @joinRudragangaAsAnAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Join Rudraganga as an astrologer'**
  String get joinRudragangaAsAnAstrologer;

  /// No description provided for @tellUsAboutYourselfOurTeam.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself — our team will review and reach out.'**
  String get tellUsAboutYourselfOurTeam;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @rudraganga.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga'**
  String get rudraganga;

  /// No description provided for @astrologyWellness.
  ///
  /// In en, this message translates to:
  /// **'Astrology & Wellness'**
  String get astrologyWellness;

  /// No description provided for @v100MadeWithDevotion.
  ///
  /// In en, this message translates to:
  /// **'v1.0.0  ·  Made with devotion'**
  String get v100MadeWithDevotion;

  /// No description provided for @thanksForYourRating.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your rating!'**
  String get thanksForYourRating;

  /// No description provided for @rateRudraganga.
  ///
  /// In en, this message translates to:
  /// **'Rate Rudraganga'**
  String get rateRudraganga;

  /// No description provided for @howIsYourExperience.
  ///
  /// In en, this message translates to:
  /// **'How is your experience?'**
  String get howIsYourExperience;

  /// No description provided for @writeAReviewOptional.
  ///
  /// In en, this message translates to:
  /// **'Write a review (optional)'**
  String get writeAReviewOptional;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @notificationSetting.
  ///
  /// In en, this message translates to:
  /// **'Notification Setting'**
  String get notificationSetting;

  /// No description provided for @howOften.
  ///
  /// In en, this message translates to:
  /// **'How often?'**
  String get howOften;

  /// No description provided for @topicsYouCareAbout.
  ///
  /// In en, this message translates to:
  /// **'Topics you care about'**
  String get topicsYouCareAbout;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @allSet.
  ///
  /// In en, this message translates to:
  /// **'All set ✨'**
  String get allSet;

  /// No description provided for @setPreferences.
  ///
  /// In en, this message translates to:
  /// **'Set Preferences'**
  String get setPreferences;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @bundlesCombos.
  ///
  /// In en, this message translates to:
  /// **'Bundles & Combos'**
  String get bundlesCombos;

  /// No description provided for @noCombosRightNow.
  ///
  /// In en, this message translates to:
  /// **'No combos right now'**
  String get noCombosRightNow;

  /// No description provided for @addComboBIBundleprice.
  ///
  /// In en, this message translates to:
  /// **'Add combo · ₹{bundlePrice}'**
  String addComboBIBundleprice(Object bundlePrice);

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @browseProductsAndAddThemHere.
  ///
  /// In en, this message translates to:
  /// **'Browse products and add them here'**
  String get browseProductsAndAddThemHere;

  /// No description provided for @walletBalanceAddTotalBalanceTo.
  ///
  /// In en, this message translates to:
  /// **'Wallet ₹{balance} · add ₹{balance2} to checkout'**
  String walletBalanceAddTotalBalanceTo(Object balance, Object balance2);

  /// No description provided for @walletBalance.
  ///
  /// In en, this message translates to:
  /// **'Wallet: ₹{balance}'**
  String walletBalance(Object balance);

  /// No description provided for @couponTrimmedAppliedResDiscountOff.
  ///
  /// In en, this message translates to:
  /// **'Coupon {trimmed} applied · ₹{discount} off'**
  String couponTrimmedAppliedResDiscountOff(Object trimmed, Object discount);

  /// No description provided for @pleaseAddADeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Please add a delivery address'**
  String get pleaseAddADeliveryAddress;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add new address'**
  String get addNewAddress;

  /// No description provided for @appliedCodeAppliedAppliedDiscountOff.
  ///
  /// In en, this message translates to:
  /// **'{code} applied · ₹{discount} off'**
  String appliedCodeAppliedAppliedDiscountOff(Object code, Object discount);

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @enterCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Enter coupon code'**
  String get enterCouponCode;

  /// No description provided for @viewAllCouponsLength.
  ///
  /// In en, this message translates to:
  /// **'View all ({length})'**
  String viewAllCouponsLength(Object length);

  /// No description provided for @availableOffers.
  ///
  /// In en, this message translates to:
  /// **'Available offers'**
  String get availableOffers;

  /// No description provided for @minOrderCpMinordervalue.
  ///
  /// In en, this message translates to:
  /// **'Min order ₹{minOrderValue}'**
  String minOrderCpMinordervalue(Object minOrderValue);

  /// No description provided for @applied.
  ///
  /// In en, this message translates to:
  /// **'Applied'**
  String get applied;

  /// No description provided for @nothingToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Nothing to checkout'**
  String get nothingToCheckout;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed!'**
  String get orderPlaced;

  /// No description provided for @totalPaidFromYourWalletYour.
  ///
  /// In en, this message translates to:
  /// **'₹{total} paid from your wallet. Your order is confirmed and will be on its way soon.'**
  String totalPaidFromYourWalletYour(Object total);

  /// No description provided for @orderOrderidLength6OrderidSubstring.
  ///
  /// In en, this message translates to:
  /// **'Order #{orderId}'**
  String orderOrderidLength6OrderidSubstring(Object orderId);

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get continueShopping;

  /// No description provided for @yourOrders.
  ///
  /// In en, this message translates to:
  /// **'Your Orders'**
  String get yourOrders;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get noOrdersYet;

  /// No description provided for @yourOrdersWillAppearHereOnce.
  ///
  /// In en, this message translates to:
  /// **'Your orders will appear here once you buy something from the store.'**
  String get yourOrdersWillAppearHereOnce;

  /// No description provided for @invoiceIsStillBeingGeneratedTry.
  ///
  /// In en, this message translates to:
  /// **'Invoice is still being generated. Try again shortly.'**
  String get invoiceIsStillBeingGeneratedTry;

  /// No description provided for @couldNotOpenTheInvoice.
  ///
  /// In en, this message translates to:
  /// **'Could not open the invoice'**
  String get couldNotOpenTheInvoice;

  /// No description provided for @thanksOurTeamWillReachOut.
  ///
  /// In en, this message translates to:
  /// **'Thanks! Our team will reach out about this order.'**
  String get thanksOurTeamWillReachOut;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get orderDetails;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help'**
  String get needHelp;

  /// No description provided for @needHelpWithThisOrder.
  ///
  /// In en, this message translates to:
  /// **'Need help with this order?'**
  String get needHelpWithThisOrder;

  /// No description provided for @placedOnDate.
  ///
  /// In en, this message translates to:
  /// **'Placed on {date}'**
  String placedOnDate(Object date);

  /// No description provided for @invoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoice;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @needHelp2.
  ///
  /// In en, this message translates to:
  /// **'Need help'**
  String get needHelp2;

  /// No description provided for @orderWidgetOrderno.
  ///
  /// In en, this message translates to:
  /// **'Order #{orderNo}'**
  String orderWidgetOrderno(Object orderNo);

  /// No description provided for @whatWentWrong.
  ///
  /// In en, this message translates to:
  /// **'What went wrong?'**
  String get whatWentWrong;

  /// No description provided for @describeTheIssue.
  ///
  /// In en, this message translates to:
  /// **'Describe the issue'**
  String get describeTheIssue;

  /// No description provided for @tellUsWhatHappenedSoWe.
  ///
  /// In en, this message translates to:
  /// **'Tell us what happened so we can help…'**
  String get tellUsWhatHappenedSoWe;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get submitRequest;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'Added to cart'**
  String get addedToCart;

  /// No description provided for @productUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Product unavailable'**
  String get productUnavailable;

  /// No description provided for @pDiscountpercentOff.
  ///
  /// In en, this message translates to:
  /// **'{discountPercent}% OFF'**
  String pDiscountpercentOff(Object discountPercent);

  /// No description provided for @pReviewcountReviews.
  ///
  /// In en, this message translates to:
  /// **'{reviewCount} reviews'**
  String pReviewcountReviews(Object reviewCount);

  /// No description provided for @pDiscountpercentOff2.
  ///
  /// In en, this message translates to:
  /// **'{discountPercent}% off'**
  String pDiscountpercentOff2(Object discountPercent);

  /// No description provided for @fewItemsLeft.
  ///
  /// In en, this message translates to:
  /// **'Few items left'**
  String get fewItemsLeft;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @frequentlyBoughtTogether.
  ///
  /// In en, this message translates to:
  /// **'Frequently bought together'**
  String get frequentlyBoughtTogether;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products…'**
  String get searchProducts;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price range (₹)'**
  String get priceRange;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @inStockOnly.
  ///
  /// In en, this message translates to:
  /// **'In stock only'**
  String get inStockOnly;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @addDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Add delivery address'**
  String get addDeliveryAddress;

  /// No description provided for @setAsDefaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Set as default address'**
  String get setAsDefaultAddress;

  /// No description provided for @saveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save address'**
  String get saveAddress;

  /// No description provided for @codeCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Code {code}'**
  String codeCouponCode(Object code);

  /// No description provided for @saveBundleYousave.
  ///
  /// In en, this message translates to:
  /// **'SAVE ₹{youSave}'**
  String saveBundleYousave(Object youSave);

  /// No description provided for @bundleProductsLengthItemsCombo.
  ///
  /// In en, this message translates to:
  /// **'{length} items combo'**
  String bundleProductsLengthItemsCombo(Object length);

  /// No description provided for @bundleDiscountpercentOff.
  ///
  /// In en, this message translates to:
  /// **'{discountPercent}% off'**
  String bundleDiscountpercentOff(Object discountPercent);

  /// No description provided for @fewLeft.
  ///
  /// In en, this message translates to:
  /// **'Few left'**
  String get fewLeft;

  /// No description provided for @savePSaveamount.
  ///
  /// In en, this message translates to:
  /// **'Save ₹{saveAmount}'**
  String savePSaveamount(Object saveAmount);

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get freeDelivery;

  /// No description provided for @searchWidgetTitleTolowercase.
  ///
  /// In en, this message translates to:
  /// **'Search {toLowerCase}…'**
  String searchWidgetTitleTolowercase(Object toLowerCase);

  /// No description provided for @nothingHereYet.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get nothingHereYet;

  /// No description provided for @loadingSecurePayment.
  ///
  /// In en, this message translates to:
  /// **'Loading secure payment…'**
  String get loadingSecurePayment;

  /// No description provided for @couldNotStartRecharge.
  ///
  /// In en, this message translates to:
  /// **'Could not start recharge'**
  String get couldNotStartRecharge;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment successful 🎉'**
  String get paymentSuccessful;

  /// No description provided for @paymentWasNotCompleted.
  ///
  /// In en, this message translates to:
  /// **'Payment was not completed'**
  String get paymentWasNotCompleted;

  /// No description provided for @couldNotStartRechargeTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Could not start recharge, try again'**
  String get couldNotStartRechargeTryAgain;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get availableBalance;

  /// No description provided for @useItForPoojasConsultations.
  ///
  /// In en, this message translates to:
  /// **'use it for poojas & consultations'**
  String get useItForPoojasConsultations;

  /// No description provided for @instantTopUp.
  ///
  /// In en, this message translates to:
  /// **'instant top-up'**
  String get instantTopUp;

  /// No description provided for @noRechargePacksAvailableRightNow.
  ///
  /// In en, this message translates to:
  /// **'No recharge packs available right now.'**
  String get noRechargePacksAvailableRightNow;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @endOfTransactions.
  ///
  /// In en, this message translates to:
  /// **'— end of transactions —'**
  String get endOfTransactions;

  /// No description provided for @youGet.
  ///
  /// In en, this message translates to:
  /// **'You get'**
  String get youGet;

  /// No description provided for @packBonusBonus.
  ///
  /// In en, this message translates to:
  /// **'+₹{bonus} bonus'**
  String packBonusBonus(Object bonus);

  /// No description provided for @payPackAmount.
  ///
  /// In en, this message translates to:
  /// **'Pay ₹{amount}'**
  String payPackAmount(Object amount);

  /// No description provided for @rudra.
  ///
  /// In en, this message translates to:
  /// **'Rudra'**
  String get rudra;

  /// No description provided for @ganga.
  ///
  /// In en, this message translates to:
  /// **'ganga'**
  String get ganga;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @astrologer.
  ///
  /// In en, this message translates to:
  /// **'Astrologer'**
  String get astrologer;

  /// No description provided for @seeker.
  ///
  /// In en, this message translates to:
  /// **'Seeker'**
  String get seeker;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @jan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get jan;

  /// No description provided for @feb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get feb;

  /// No description provided for @mar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get mar;

  /// No description provided for @apr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get apr;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @jun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get jun;

  /// No description provided for @jul.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get jul;

  /// No description provided for @aug.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get aug;

  /// No description provided for @sep.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get sep;

  /// No description provided for @oct.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get oct;

  /// No description provided for @nov.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get nov;

  /// No description provided for @dec.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get dec;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @vedic.
  ///
  /// In en, this message translates to:
  /// **'Vedic'**
  String get vedic;

  /// No description provided for @tarot.
  ///
  /// In en, this message translates to:
  /// **'Tarot'**
  String get tarot;

  /// No description provided for @numerology.
  ///
  /// In en, this message translates to:
  /// **'Numerology'**
  String get numerology;

  /// No description provided for @vastu.
  ///
  /// In en, this message translates to:
  /// **'Vastu'**
  String get vastu;

  /// No description provided for @palmistry.
  ///
  /// In en, this message translates to:
  /// **'Palmistry'**
  String get palmistry;

  /// No description provided for @kp.
  ///
  /// In en, this message translates to:
  /// **'KP'**
  String get kp;

  /// No description provided for @love.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get love;

  /// No description provided for @taraAi.
  ///
  /// In en, this message translates to:
  /// **'Tara AI'**
  String get taraAi;

  /// No description provided for @instantVedicAnswers247.
  ///
  /// In en, this message translates to:
  /// **'Instant Vedic answers • 24×7'**
  String get instantVedicAnswers247;

  /// No description provided for @allLanguages.
  ///
  /// In en, this message translates to:
  /// **'All languages'**
  String get allLanguages;

  /// No description provided for @jyotiAi.
  ///
  /// In en, this message translates to:
  /// **'Jyoti AI'**
  String get jyotiAi;

  /// No description provided for @loveCareerGuidance.
  ///
  /// In en, this message translates to:
  /// **'Love & career guidance'**
  String get loveCareerGuidance;

  /// No description provided for @hindiEnglish.
  ///
  /// In en, this message translates to:
  /// **'Hindi, English'**
  String get hindiEnglish;

  /// No description provided for @veduAi.
  ///
  /// In en, this message translates to:
  /// **'Vedu AI'**
  String get veduAi;

  /// No description provided for @remediesPredictions.
  ///
  /// In en, this message translates to:
  /// **'Remedies & predictions'**
  String get remediesPredictions;

  /// No description provided for @couldNotLoadAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Could not load astrologers'**
  String get couldNotLoadAstrologers;

  /// No description provided for @aiAstrologers.
  ///
  /// In en, this message translates to:
  /// **'AI Astrologers'**
  String get aiAstrologers;

  /// No description provided for @featuredAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Featured Astrologers'**
  String get featuredAstrologers;

  /// No description provided for @astrologers.
  ///
  /// In en, this message translates to:
  /// **'Astrologers'**
  String get astrologers;

  /// No description provided for @searchAiAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Search AI astrologers…'**
  String get searchAiAstrologers;

  /// No description provided for @searchAstrologersByName.
  ///
  /// In en, this message translates to:
  /// **'Search astrologers by name…'**
  String get searchAstrologersByName;

  /// No description provided for @aiChat.
  ///
  /// In en, this message translates to:
  /// **'AI Chat'**
  String get aiChat;

  /// No description provided for @noAstrologersMatch.
  ///
  /// In en, this message translates to:
  /// **'No astrologers match'**
  String get noAstrologersMatch;

  /// No description provided for @noAstrologersYet.
  ///
  /// In en, this message translates to:
  /// **'No astrologers yet'**
  String get noAstrologersYet;

  /// No description provided for @couldnTSetTheReminderPlease.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t set the reminder. Please try again.'**
  String get couldnTSetTheReminderPlease;

  /// No description provided for @ai.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get ai;

  /// No description provided for @live2.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live2;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @busy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get busy;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @notEnoughBalanceToStartPlease.
  ///
  /// In en, this message translates to:
  /// **'Not enough balance to start. Please recharge.'**
  String get notEnoughBalanceToStartPlease;

  /// No description provided for @couldNotStartTheConsultationPlease.
  ///
  /// In en, this message translates to:
  /// **'Could not start the consultation. Please try again.'**
  String get couldNotStartTheConsultationPlease;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @gifts.
  ///
  /// In en, this message translates to:
  /// **'Gifts'**
  String get gifts;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @theyHaveGuidedThousandsOfSeekers.
  ///
  /// In en, this message translates to:
  /// **'they have guided thousands of seekers through career, marriage, finance and life-path questions. '**
  String get theyHaveGuidedThousandsOfSeekers;

  /// No description provided for @theirReadingsBlendClassicalVedicPrinciples.
  ///
  /// In en, this message translates to:
  /// **'Their readings blend classical Vedic principles with practical, compassionate guidance — helping you '**
  String get theirReadingsBlendClassicalVedicPrinciples;

  /// No description provided for @findClarityAndActionableRemediesFor.
  ///
  /// In en, this message translates to:
  /// **'find clarity and actionable remedies for the road ahead.'**
  String get findClarityAndActionableRemediesFor;

  /// No description provided for @giftsReceived.
  ///
  /// In en, this message translates to:
  /// **'Gifts received'**
  String get giftsReceived;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @weLlNotifyYouTheMoment.
  ///
  /// In en, this message translates to:
  /// **'We\'ll notify you the moment they\'re free.'**
  String get weLlNotifyYouTheMoment;

  /// No description provided for @weLlNotifyYouTheMoment2.
  ///
  /// In en, this message translates to:
  /// **'We\'ll notify you the moment they\'re online.'**
  String get weLlNotifyYouTheMoment2;

  /// No description provided for @getAHeadsUpTheMoment.
  ///
  /// In en, this message translates to:
  /// **'Get a heads-up the moment they’re available.'**
  String get getAHeadsUpTheMoment;

  /// No description provided for @couldNotLoadThisStore.
  ///
  /// In en, this message translates to:
  /// **'Could not load this store'**
  String get couldNotLoadThisStore;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @poojas.
  ///
  /// In en, this message translates to:
  /// **'Poojas'**
  String get poojas;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @lalKitab.
  ///
  /// In en, this message translates to:
  /// **'Lal Kitab'**
  String get lalKitab;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get hindi;

  /// No description provided for @bengali.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get bengali;

  /// No description provided for @tamil.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get tamil;

  /// No description provided for @marathi.
  ///
  /// In en, this message translates to:
  /// **'Marathi'**
  String get marathi;

  /// No description provided for @punjabi.
  ///
  /// In en, this message translates to:
  /// **'Punjabi'**
  String get punjabi;

  /// No description provided for @telugu.
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get telugu;

  /// No description provided for @expertise.
  ///
  /// In en, this message translates to:
  /// **'Expertise'**
  String get expertise;

  /// No description provided for @couldNotLoadGifts.
  ///
  /// In en, this message translates to:
  /// **'Could not load gifts'**
  String get couldNotLoadGifts;

  /// No description provided for @notEnoughBalanceAddMoneyTo.
  ///
  /// In en, this message translates to:
  /// **'Not enough balance. Add money to send gifts.'**
  String get notEnoughBalanceAddMoneyTo;

  /// No description provided for @couldNotSendTheGiftPlease.
  ///
  /// In en, this message translates to:
  /// **'Could not send the gift. Please try again.'**
  String get couldNotSendTheGiftPlease;

  /// No description provided for @connecting2.
  ///
  /// In en, this message translates to:
  /// **'CONNECTING…'**
  String get connecting2;

  /// No description provided for @couldNotLoadThisChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Could not load this chat history'**
  String get couldNotLoadThisChatHistory;

  /// No description provided for @thisChatHistoryIsNoLonger.
  ///
  /// In en, this message translates to:
  /// **'This chat history is no longer available\n(chats are kept for 7 days).'**
  String get thisChatHistoryIsNoLonger;

  /// No description provided for @dailyFor14Days.
  ///
  /// In en, this message translates to:
  /// **'Daily · for 14 days'**
  String get dailyFor14Days;

  /// No description provided for @dailyMantra.
  ///
  /// In en, this message translates to:
  /// **'Daily mantra'**
  String get dailyMantra;

  /// No description provided for @reminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminder;

  /// No description provided for @audio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// No description provided for @couldNotLoadYourConsultations.
  ///
  /// In en, this message translates to:
  /// **'Could not load your consultations'**
  String get couldNotLoadYourConsultations;

  /// No description provided for @missed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get missed;

  /// No description provided for @declined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declined;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @lowBalance.
  ///
  /// In en, this message translates to:
  /// **'Low balance'**
  String get lowBalance;

  /// No description provided for @rechargeNowToKeepYourConsultation.
  ///
  /// In en, this message translates to:
  /// **'Recharge now to keep your consultation going. Your chat stays open while you pay.'**
  String get rechargeNowToKeepYourConsultation;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @coinsUsed.
  ///
  /// In en, this message translates to:
  /// **'Coins used'**
  String get coinsUsed;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @chooseYourKundli.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Kundli'**
  String get chooseYourKundli;

  /// No description provided for @yourWalletReadingsAndSavedDetails.
  ///
  /// In en, this message translates to:
  /// **'Your wallet, readings and saved details stay safe — but logging out means missing your daily horoscope, offers and reminders. Stay connected with the stars? ✨'**
  String get yourWalletReadingsAndSavedDetails;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @dailyPanchang.
  ///
  /// In en, this message translates to:
  /// **'Daily Panchang'**
  String get dailyPanchang;

  /// No description provided for @talkToAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Talk to Astrologer'**
  String get talkToAstrologer;

  /// No description provided for @brihatKundli.
  ///
  /// In en, this message translates to:
  /// **'Brihat Kundli'**
  String get brihatKundli;

  /// No description provided for @dailyNotes.
  ///
  /// In en, this message translates to:
  /// **'Daily Notes'**
  String get dailyNotes;

  /// No description provided for @askAQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask A Question'**
  String get askAQuestion;

  /// No description provided for @free50Pages.
  ///
  /// In en, this message translates to:
  /// **'Free 50+ Pages'**
  String get free50Pages;

  /// No description provided for @freeReport.
  ///
  /// In en, this message translates to:
  /// **'Free Report'**
  String get freeReport;

  /// No description provided for @freeMatrimony.
  ///
  /// In en, this message translates to:
  /// **'Free Matrimony'**
  String get freeMatrimony;

  /// No description provided for @matrimony.
  ///
  /// In en, this message translates to:
  /// **'Matrimony'**
  String get matrimony;

  /// No description provided for @loveMatch.
  ///
  /// In en, this message translates to:
  /// **'Love Match'**
  String get loveMatch;

  /// No description provided for @horoscope.
  ///
  /// In en, this message translates to:
  /// **'Horoscope'**
  String get horoscope;

  /// No description provided for @dailyHoroscope.
  ///
  /// In en, this message translates to:
  /// **'Daily Horoscope'**
  String get dailyHoroscope;

  /// No description provided for @vedicAstrology.
  ///
  /// In en, this message translates to:
  /// **'Vedic astrology'**
  String get vedicAstrology;

  /// No description provided for @acharyaVeda.
  ///
  /// In en, this message translates to:
  /// **'Acharya Veda'**
  String get acharyaVeda;

  /// No description provided for @panditRohan.
  ///
  /// In en, this message translates to:
  /// **'Pandit Rohan'**
  String get panditRohan;

  /// No description provided for @guruMaya.
  ///
  /// In en, this message translates to:
  /// **'Guru Maya'**
  String get guruMaya;

  /// No description provided for @jayaShastri.
  ///
  /// In en, this message translates to:
  /// **'Jaya Shastri'**
  String get jayaShastri;

  /// No description provided for @devSharma.
  ///
  /// In en, this message translates to:
  /// **'Dev Sharma'**
  String get devSharma;

  /// No description provided for @sureshG.
  ///
  /// In en, this message translates to:
  /// **'Suresh G.'**
  String get sureshG;

  /// No description provided for @lataP.
  ///
  /// In en, this message translates to:
  /// **'Lata P.'**
  String get lataP;

  /// No description provided for @kiranB.
  ///
  /// In en, this message translates to:
  /// **'Kiran B.'**
  String get kiranB;

  /// No description provided for @mohanT.
  ///
  /// In en, this message translates to:
  /// **'Mohan T.'**
  String get mohanT;

  /// No description provided for @anilJoshi.
  ///
  /// In en, this message translates to:
  /// **'Anil Joshi'**
  String get anilJoshi;

  /// No description provided for @meeraDevi.
  ///
  /// In en, this message translates to:
  /// **'Meera Devi'**
  String get meeraDevi;

  /// No description provided for @raviKumar.
  ///
  /// In en, this message translates to:
  /// **'Ravi Kumar'**
  String get raviKumar;

  /// No description provided for @sunitaRao.
  ///
  /// In en, this message translates to:
  /// **'Sunita Rao'**
  String get sunitaRao;

  /// No description provided for @bengaluruKarnataka.
  ///
  /// In en, this message translates to:
  /// **'Bengaluru, Karnataka'**
  String get bengaluruKarnataka;

  /// No description provided for @locating.
  ///
  /// In en, this message translates to:
  /// **'Locating…'**
  String get locating;

  /// No description provided for @festivalOffer.
  ///
  /// In en, this message translates to:
  /// **'Festival offer'**
  String get festivalOffer;

  /// No description provided for @upTo30OffOnGemstones.
  ///
  /// In en, this message translates to:
  /// **'Up to 30% off on gemstones'**
  String get upTo30OffOnGemstones;

  /// No description provided for @talkToTopAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Talk to top astrologers'**
  String get talkToTopAstrologers;

  /// No description provided for @firstConsultationSpecial.
  ///
  /// In en, this message translates to:
  /// **'First consultation special'**
  String get firstConsultationSpecial;

  /// No description provided for @rudrakshaCollection.
  ///
  /// In en, this message translates to:
  /// **'Rudraksha collection'**
  String get rudrakshaCollection;

  /// No description provided for @authenticEnergised.
  ///
  /// In en, this message translates to:
  /// **'Authentic & energised'**
  String get authenticEnergised;

  /// No description provided for @resumeSession.
  ///
  /// In en, this message translates to:
  /// **'Resume session'**
  String get resumeSession;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @aiAstro.
  ///
  /// In en, this message translates to:
  /// **'AI Astro'**
  String get aiAstro;

  /// No description provided for @ask.
  ///
  /// In en, this message translates to:
  /// **'Ask'**
  String get ask;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @seeAll2.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll2;

  /// No description provided for @s1AcceptanceOfTheseTerms.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of these terms'**
  String get s1AcceptanceOfTheseTerms;

  /// No description provided for @termsOfService2.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService2;

  /// No description provided for @lastUpdated26June2026.
  ///
  /// In en, this message translates to:
  /// **'Last updated: 26 June 2026'**
  String get lastUpdated26June2026;

  /// No description provided for @rudragangaProvidesAstrologySpiritualAndWellness.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga provides astrology, spiritual, and wellness consultations for guidance and personal '**
  String get rudragangaProvidesAstrologySpiritualAndWellness;

  /// No description provided for @reflectionOnlyOurServicesAreNot.
  ///
  /// In en, this message translates to:
  /// **'reflection only. Our services are not a substitute for professional medical, legal, financial, '**
  String get reflectionOnlyOurServicesAreNot;

  /// No description provided for @orPsychologicalAdviceYouMustBe.
  ///
  /// In en, this message translates to:
  /// **'or psychological advice. You must be 18 or older to use the app.'**
  String get orPsychologicalAdviceYouMustBe;

  /// No description provided for @byCreatingAnAccountOrUsing.
  ///
  /// In en, this message translates to:
  /// **'By creating an account or using the Rudraganga mobile application and related services (the '**
  String get byCreatingAnAccountOrUsing;

  /// No description provided for @servicesYouAgreeToBeBound.
  ///
  /// In en, this message translates to:
  /// **'“Services”), you agree to be bound by these Terms of Service and our Privacy Policy and Refund '**
  String get servicesYouAgreeToBeBound;

  /// No description provided for @policyIfYouDoNotAgree.
  ///
  /// In en, this message translates to:
  /// **'Policy. If you do not agree, please do not use the Services.'**
  String get policyIfYouDoNotAgree;

  /// No description provided for @s2EligibilityYourAccount.
  ///
  /// In en, this message translates to:
  /// **'2. Eligibility & your account'**
  String get s2EligibilityYourAccount;

  /// No description provided for @youMustBeAtLeast18.
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old and legally able to enter a contract.'**
  String get youMustBeAtLeast18;

  /// No description provided for @youRegisterWithAPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'You register with a phone number verified by a one-time password (OTP). You are responsible for keeping access to that number and device secure.'**
  String get youRegisterWithAPhoneNumber;

  /// No description provided for @youAgreeToProvideAccurateInformation.
  ///
  /// In en, this message translates to:
  /// **'You agree to provide accurate information, including birth details where you choose to share them for a reading. You are responsible for all activity under your account.'**
  String get youAgreeToProvideAccurateInformation;

  /// No description provided for @s3TheServicesWeOffer.
  ///
  /// In en, this message translates to:
  /// **'3. The services we offer'**
  String get s3TheServicesWeOffer;

  /// No description provided for @rudragangaConnectsYouWithVerifiedAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga connects you with verified astrologers for consultations by audio call, video call, '**
  String get rudragangaConnectsYouWithVerifiedAstrologers;

  /// No description provided for @andChatAndOffersRelatedFeatures.
  ///
  /// In en, this message translates to:
  /// **'and chat, and offers related features such as kundli generation and matching, an AI astrologer, '**
  String get andChatAndOffersRelatedFeatures;

  /// No description provided for @dailyHoroscopesPoojaBookingsAStore.
  ///
  /// In en, this message translates to:
  /// **'daily horoscopes, pooja bookings, a store for spiritual products, gifting, and matrimony matching. '**
  String get dailyHoroscopesPoojaBookingsAStore;

  /// No description provided for @availabilityOfAnyFeatureOrAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Availability of any feature or astrologer may change at any time.'**
  String get availabilityOfAnyFeatureOrAstrologer;

  /// No description provided for @s4WalletPricingBilling.
  ///
  /// In en, this message translates to:
  /// **'4. Wallet, pricing & billing'**
  String get s4WalletPricingBilling;

  /// No description provided for @consultationsArePrepaidYouAddFunds.
  ///
  /// In en, this message translates to:
  /// **'Consultations are prepaid. You add funds to an in-app wallet and pay per minute at the rate shown for the astrologer and service before you connect.'**
  String get consultationsArePrepaidYouAddFunds;

  /// No description provided for @billingBeginsWhenTheAstrologerAccepts.
  ///
  /// In en, this message translates to:
  /// **'Billing begins when the astrologer accepts and the session connects. The first minute is charged on connect, and each further minute is charged at its start. A live meter is shown during the session, and the session ends automatically if your balance runs low.'**
  String get billingBeginsWhenTheAstrologerAccepts;

  /// No description provided for @paymentsAreProcessedByOurPayment.
  ///
  /// In en, this message translates to:
  /// **'Payments are processed by our payment partner (PayU). We do not store full card details.'**
  String get paymentsAreProcessedByOurPayment;

  /// No description provided for @walletBalancesAreForUseWithin.
  ///
  /// In en, this message translates to:
  /// **'Wallet balances are for use within the Services. Refunds, where applicable, are governed by our Refund Policy.'**
  String get walletBalancesAreForUseWithin;

  /// No description provided for @pricesAreInIndianRupeesInr.
  ///
  /// In en, this message translates to:
  /// **'Prices are in Indian Rupees (INR) and may include applicable taxes.'**
  String get pricesAreInIndianRupeesInr;

  /// No description provided for @s5AcceptableUse.
  ///
  /// In en, this message translates to:
  /// **'5. Acceptable use'**
  String get s5AcceptableUse;

  /// No description provided for @youAgreeNotTo.
  ///
  /// In en, this message translates to:
  /// **'You agree not to:'**
  String get youAgreeNotTo;

  /// No description provided for @harassAbuseThreatenOrShareSexually.
  ///
  /// In en, this message translates to:
  /// **'Harass, abuse, threaten, or share sexually explicit or unlawful content with astrologers or staff.'**
  String get harassAbuseThreatenOrShareSexually;

  /// No description provided for @impersonateAnyPersonOrProvideFalse.
  ///
  /// In en, this message translates to:
  /// **'Impersonate any person, or provide false information to obtain a service or refund.'**
  String get impersonateAnyPersonOrProvideFalse;

  /// No description provided for @attemptToTakeAConsultationOff.
  ///
  /// In en, this message translates to:
  /// **'Attempt to take a consultation off-platform to avoid fees, or solicit personal contact details.'**
  String get attemptToTakeAConsultationOff;

  /// No description provided for @interfereWithScrapeOrAttemptTo.
  ///
  /// In en, this message translates to:
  /// **'Interfere with, scrape, or attempt to disrupt the Services or their security.'**
  String get interfereWithScrapeOrAttemptTo;

  /// No description provided for @s6AstrologersOnThePlatform.
  ///
  /// In en, this message translates to:
  /// **'6. Astrologers on the platform'**
  String get s6AstrologersOnThePlatform;

  /// No description provided for @astrologersAreIndependentPractitionersWhoAre.
  ///
  /// In en, this message translates to:
  /// **'Astrologers are independent practitioners who are identity-verified and approved by Rudraganga '**
  String get astrologersAreIndependentPractitionersWhoAre;

  /// No description provided for @beforeTheyCanOfferConsultationsThey.
  ///
  /// In en, this message translates to:
  /// **'before they can offer consultations. They set their own per-minute fares within limits we define. '**
  String get beforeTheyCanOfferConsultationsThey;

  /// No description provided for @opinionsAndGuidanceSharedDuringA.
  ///
  /// In en, this message translates to:
  /// **'Opinions and guidance shared during a consultation are those of the individual astrologer and not '**
  String get opinionsAndGuidanceSharedDuringA;

  /// No description provided for @ofRudragangaWeAreNotResponsible.
  ///
  /// In en, this message translates to:
  /// **'of Rudraganga. We are not responsible for any decision you make based on a consultation.'**
  String get ofRudragangaWeAreNotResponsible;

  /// No description provided for @s7RecordingsContent.
  ///
  /// In en, this message translates to:
  /// **'7. Recordings & content'**
  String get s7RecordingsContent;

  /// No description provided for @forQualitySafetyAndDisputeResolution.
  ///
  /// In en, this message translates to:
  /// **'For quality, safety, and dispute resolution, audio and video consultations may be recorded. You '**
  String get forQualitySafetyAndDisputeResolution;

  /// No description provided for @consentToSuchRecordingByStarting.
  ///
  /// In en, this message translates to:
  /// **'consent to such recording by starting a session. Chat conversations are stored so you can revisit '**
  String get consentToSuchRecordingByStarting;

  /// No description provided for @themSeeOurPrivacyPolicyFor.
  ///
  /// In en, this message translates to:
  /// **'them. See our Privacy Policy for how this data is handled.'**
  String get themSeeOurPrivacyPolicyFor;

  /// No description provided for @s8DisclaimerLimitationOfLiability.
  ///
  /// In en, this message translates to:
  /// **'8. Disclaimer & limitation of liability'**
  String get s8DisclaimerLimitationOfLiability;

  /// No description provided for @theServicesAreProvidedAsIs.
  ///
  /// In en, this message translates to:
  /// **'The Services are provided “as is” for guidance and entertainment-adjacent personal reflection. '**
  String get theServicesAreProvidedAsIs;

  /// No description provided for @rudragangaMakesNoGuaranteeAboutThe.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga makes no guarantee about the accuracy of any prediction or remedy. To the maximum extent '**
  String get rudragangaMakesNoGuaranteeAboutThe;

  /// No description provided for @permittedByLawRudragangaSTotal.
  ///
  /// In en, this message translates to:
  /// **'permitted by law, Rudraganga’s total liability arising from your use of the Services is limited to '**
  String get permittedByLawRudragangaSTotal;

  /// No description provided for @theAmountYouPaidIntoYour.
  ///
  /// In en, this message translates to:
  /// **'the amount you paid into your wallet in the 30 days before the event giving rise to the claim. We '**
  String get theAmountYouPaidIntoYour;

  /// No description provided for @areNotLiableForIndirectOr.
  ///
  /// In en, this message translates to:
  /// **'are not liable for indirect or consequential losses.'**
  String get areNotLiableForIndirectOr;

  /// No description provided for @s9SuspensionTermination.
  ///
  /// In en, this message translates to:
  /// **'9. Suspension & termination'**
  String get s9SuspensionTermination;

  /// No description provided for @weMaySuspendOrTerminateYour.
  ///
  /// In en, this message translates to:
  /// **'We may suspend or terminate your account if you breach these terms, attempt fraud, or misuse the '**
  String get weMaySuspendOrTerminateYour;

  /// No description provided for @servicesYouMayStopUsingThe.
  ///
  /// In en, this message translates to:
  /// **'Services. You may stop using the Services at any time. Some provisions (payment obligations, '**
  String get servicesYouMayStopUsingThe;

  /// No description provided for @disclaimersAndLimitationsOfLiabilitySurvive.
  ///
  /// In en, this message translates to:
  /// **'disclaimers, and limitations of liability) survive termination.'**
  String get disclaimersAndLimitationsOfLiabilitySurvive;

  /// No description provided for @s10ChangesToTheseTerms.
  ///
  /// In en, this message translates to:
  /// **'10. Changes to these terms'**
  String get s10ChangesToTheseTerms;

  /// No description provided for @weMayUpdateTheseTermsFrom.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms from time to time. Material changes will be notified in the app or by '**
  String get weMayUpdateTheseTermsFrom;

  /// No description provided for @updatingTheLastUpdatedDateAbove.
  ///
  /// In en, this message translates to:
  /// **'updating the “Last updated” date above. Continued use after changes means you accept them.'**
  String get updatingTheLastUpdatedDateAbove;

  /// No description provided for @s11ContactUs.
  ///
  /// In en, this message translates to:
  /// **'11. Contact us'**
  String get s11ContactUs;

  /// No description provided for @questionsAboutTheseTermsReachUs.
  ///
  /// In en, this message translates to:
  /// **'Questions about these terms? Reach us through the contact form on our website or in the app’s '**
  String get questionsAboutTheseTermsReachUs;

  /// No description provided for @helpSupportSection.
  ///
  /// In en, this message translates to:
  /// **'Help & Support section.'**
  String get helpSupportSection;

  /// No description provided for @privacyPolicy2.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy2;

  /// No description provided for @yourBirthDetailsConsultationsAndChats.
  ///
  /// In en, this message translates to:
  /// **'Your birth details, consultations, and chats are personal to you. This policy explains what we '**
  String get yourBirthDetailsConsultationsAndChats;

  /// No description provided for @collectWhyAndTheControlYou.
  ///
  /// In en, this message translates to:
  /// **'collect, why, and the control you have over it.'**
  String get collectWhyAndTheControlYou;

  /// No description provided for @s1InformationWeCollect.
  ///
  /// In en, this message translates to:
  /// **'1. Information we collect'**
  String get s1InformationWeCollect;

  /// No description provided for @accountInformationYourNamePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Account information: your name, phone number (verified by OTP), and email if provided.'**
  String get accountInformationYourNamePhoneNumber;

  /// No description provided for @birthDetailsDateTimeAndPlace.
  ///
  /// In en, this message translates to:
  /// **'Birth details: date, time, and place of birth that you choose to share for kundli and readings.'**
  String get birthDetailsDateTimeAndPlace;

  /// No description provided for @consultationDataChatMessagesAndAudio.
  ///
  /// In en, this message translates to:
  /// **'Consultation data: chat messages, and audio/video call recordings where applicable.'**
  String get consultationDataChatMessagesAndAudio;

  /// No description provided for @paymentDataWalletTransactionsAndPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment data: wallet transactions and payment references. Card details are handled by our payment partner (PayU); we do not store full card numbers.'**
  String get paymentDataWalletTransactionsAndPayment;

  /// No description provided for @deviceUsageDataDeviceTypeOperating.
  ///
  /// In en, this message translates to:
  /// **'Device & usage data: device type, operating system, approximate location derived from your IP address, pages visited, and interactions, used to operate and improve the Services.'**
  String get deviceUsageDataDeviceTypeOperating;

  /// No description provided for @s2HowWeUseIt.
  ///
  /// In en, this message translates to:
  /// **'2. How we use it'**
  String get s2HowWeUseIt;

  /// No description provided for @toCreateAndSecureYourAccount.
  ///
  /// In en, this message translates to:
  /// **'To create and secure your account and verify your identity.'**
  String get toCreateAndSecureYourAccount;

  /// No description provided for @toConnectYouWithAstrologersAnd.
  ///
  /// In en, this message translates to:
  /// **'To connect you with astrologers and deliver consultations, kundli, horoscopes, and other features.'**
  String get toConnectYouWithAstrologersAnd;

  /// No description provided for @toProcessWalletRechargesPerMinute.
  ///
  /// In en, this message translates to:
  /// **'To process wallet recharges, per-minute billing, payouts, and order fulfilment.'**
  String get toProcessWalletRechargesPerMinute;

  /// No description provided for @toProvideSupportPreventFraudAnd.
  ///
  /// In en, this message translates to:
  /// **'To provide support, prevent fraud and abuse, and meet legal obligations.'**
  String get toProvideSupportPreventFraudAnd;

  /// No description provided for @toUnderstandAndImproveHowThe.
  ///
  /// In en, this message translates to:
  /// **'To understand and improve how the app and website are used.'**
  String get toUnderstandAndImproveHowThe;

  /// No description provided for @s3WhenWeShareInformation.
  ///
  /// In en, this message translates to:
  /// **'3. When we share information'**
  String get s3WhenWeShareInformation;

  /// No description provided for @weDoNotSellYourPersonal.
  ///
  /// In en, this message translates to:
  /// **'We do not sell your personal information. We share it only:'**
  String get weDoNotSellYourPersonal;

  /// No description provided for @withTheAstrologerYouConsultLimited.
  ///
  /// In en, this message translates to:
  /// **'With the astrologer you consult, limited to what is needed for the reading (e.g. your birth details and chat).'**
  String get withTheAstrologerYouConsultLimited;

  /// No description provided for @withServiceProvidersWhoHelpUs.
  ///
  /// In en, this message translates to:
  /// **'With service providers who help us operate — payment processing (PayU), cloud hosting and storage, communications (WhatsApp/SMS for OTP), and notifications — under confidentiality obligations.'**
  String get withServiceProvidersWhoHelpUs;

  /// No description provided for @whenRequiredByLawOrTo.
  ///
  /// In en, this message translates to:
  /// **'When required by law, or to protect the rights, safety, and property of users and Rudraganga.'**
  String get whenRequiredByLawOrTo;

  /// No description provided for @s4ConsultationRecordingsChats.
  ///
  /// In en, this message translates to:
  /// **'4. Consultation recordings & chats'**
  String get s4ConsultationRecordingsChats;

  /// No description provided for @audioAndVideoConsultationsMayBe.
  ///
  /// In en, this message translates to:
  /// **'Audio and video consultations may be recorded, and chats are stored, for quality, safety, and '**
  String get audioAndVideoConsultationsMayBe;

  /// No description provided for @disputeResolutionYouCanReviewYour.
  ///
  /// In en, this message translates to:
  /// **'dispute resolution. You can review your chat history in the app. Recordings are retained as '**
  String get disputeResolutionYouCanReviewYour;

  /// No description provided for @describedBelowAndAccessedOnlyWhen.
  ///
  /// In en, this message translates to:
  /// **'described below and accessed only when needed for support, safety, or legal reasons.'**
  String get describedBelowAndAccessedOnlyWhen;

  /// No description provided for @s5AnalyticsCookies.
  ///
  /// In en, this message translates to:
  /// **'5. Analytics & cookies'**
  String get s5AnalyticsCookies;

  /// No description provided for @ourWebsiteUsesAFirstParty.
  ///
  /// In en, this message translates to:
  /// **'Our website uses a first-party cookie/identifier to recognise return visits, measure how the '**
  String get ourWebsiteUsesAFirstParty;

  /// No description provided for @landingPagePerformsSuchAsWhich.
  ///
  /// In en, this message translates to:
  /// **'landing page performs (such as which sections are clicked), and attribute sign-ups to marketing '**
  String get landingPagePerformsSuchAsWhich;

  /// No description provided for @campaignsThisIsUsedInAggregate.
  ///
  /// In en, this message translates to:
  /// **'campaigns. This is used in aggregate to improve the experience. We derive approximate city/region '**
  String get campaignsThisIsUsedInAggregate;

  /// No description provided for @fromYourIpAddressWeDo.
  ///
  /// In en, this message translates to:
  /// **'from your IP address; we do not use precise GPS location for analytics.'**
  String get fromYourIpAddressWeDo;

  /// No description provided for @s6DataRetention.
  ///
  /// In en, this message translates to:
  /// **'6. Data retention'**
  String get s6DataRetention;

  /// No description provided for @weKeepYourInformationForAs.
  ///
  /// In en, this message translates to:
  /// **'We keep your information for as long as your account is active and as needed to provide the '**
  String get weKeepYourInformationForAs;

  /// No description provided for @servicesComplyWithLegalObligationsResolve.
  ///
  /// In en, this message translates to:
  /// **'Services, comply with legal obligations, resolve disputes, and enforce our agreements. You may '**
  String get servicesComplyWithLegalObligationsResolve;

  /// No description provided for @requestDeletionOfYourAccountAnd.
  ///
  /// In en, this message translates to:
  /// **'request deletion of your account and associated personal data, subject to legal retention '**
  String get requestDeletionOfYourAccountAnd;

  /// No description provided for @requirementsForExampleTransactionRecordsWe.
  ///
  /// In en, this message translates to:
  /// **'requirements (for example, transaction records we must keep for accounting and tax).'**
  String get requirementsForExampleTransactionRecordsWe;

  /// No description provided for @s7Security.
  ///
  /// In en, this message translates to:
  /// **'7. Security'**
  String get s7Security;

  /// No description provided for @weUseIndustryStandardMeasuresEncryption.
  ///
  /// In en, this message translates to:
  /// **'We use industry-standard measures — encryption in transit, access controls, and secure '**
  String get weUseIndustryStandardMeasuresEncryption;

  /// No description provided for @infrastructureToProtectYourInformationNo.
  ///
  /// In en, this message translates to:
  /// **'infrastructure — to protect your information. No method of transmission or storage is completely '**
  String get infrastructureToProtectYourInformationNo;

  /// No description provided for @secureSoWeCannotGuaranteeAbsolute.
  ///
  /// In en, this message translates to:
  /// **'secure, so we cannot guarantee absolute security.'**
  String get secureSoWeCannotGuaranteeAbsolute;

  /// No description provided for @s8YourRightsChoices.
  ///
  /// In en, this message translates to:
  /// **'8. Your rights & choices'**
  String get s8YourRightsChoices;

  /// No description provided for @accessCorrectOrUpdateYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Access, correct, or update your profile and birth details in the app.'**
  String get accessCorrectOrUpdateYourProfile;

  /// No description provided for @requestACopyOrDeletionOf.
  ///
  /// In en, this message translates to:
  /// **'Request a copy or deletion of your personal data by contacting us.'**
  String get requestACopyOrDeletionOf;

  /// No description provided for @optOutOfPromotionalNotificationsIn.
  ///
  /// In en, this message translates to:
  /// **'Opt out of promotional notifications in your device or app settings.'**
  String get optOutOfPromotionalNotificationsIn;

  /// No description provided for @s9Children.
  ///
  /// In en, this message translates to:
  /// **'9. Children'**
  String get s9Children;

  /// No description provided for @theServicesAreIntendedForUsers.
  ///
  /// In en, this message translates to:
  /// **'The Services are intended for users aged 18 and above. We do not knowingly collect data from '**
  String get theServicesAreIntendedForUsers;

  /// No description provided for @anyoneUnder18IfYouBelieve.
  ///
  /// In en, this message translates to:
  /// **'anyone under 18. If you believe a minor has used the Services, please contact us so we can remove it.'**
  String get anyoneUnder18IfYouBelieve;

  /// No description provided for @s10ChangesToThisPolicy.
  ///
  /// In en, this message translates to:
  /// **'10. Changes to this policy'**
  String get s10ChangesToThisPolicy;

  /// No description provided for @weMayUpdateThisPolicyMaterial.
  ///
  /// In en, this message translates to:
  /// **'We may update this policy. Material changes will be notified in the app or by updating the '**
  String get weMayUpdateThisPolicyMaterial;

  /// No description provided for @lastUpdatedDateAbove.
  ///
  /// In en, this message translates to:
  /// **'“Last updated” date above.'**
  String get lastUpdatedDateAbove;

  /// No description provided for @forPrivacyQuestionsOrDataRequests.
  ///
  /// In en, this message translates to:
  /// **'For privacy questions or data requests, reach us via the contact form on our website or the '**
  String get forPrivacyQuestionsOrDataRequests;

  /// No description provided for @appSHelpSupportSection.
  ///
  /// In en, this message translates to:
  /// **'app’s Help & Support section.'**
  String get appSHelpSupportSection;

  /// No description provided for @s2026Rudraganga18ForGuidanceAnd.
  ///
  /// In en, this message translates to:
  /// **'Â© 2026 Rudraganga Â· 18+ Â· For guidance and wellbeing â\nnot a substitute for professional advice.'**
  String get s2026Rudraganga18ForGuidanceAnd;

  /// No description provided for @widthDeviceWidthInitialScale1.
  ///
  /// In en, this message translates to:
  /// **'width=device-width, initial-scale=1, maximum-scale=1'**
  String get widthDeviceWidthInitialScale1;

  /// No description provided for @segoeUi.
  ///
  /// In en, this message translates to:
  /// **'Segoe UI'**
  String get segoeUi;

  /// No description provided for @vote.
  ///
  /// In en, this message translates to:
  /// **'Vote'**
  String get vote;

  /// No description provided for @couldnTLoadLiveSessions.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t load live sessions'**
  String get couldnTLoadLiveSessions;

  /// No description provided for @noOneIsLiveRightNow.
  ///
  /// In en, this message translates to:
  /// **'No one is live right now'**
  String get noOneIsLiveRightNow;

  /// No description provided for @whenAnAstrologerGoesLiveThey.
  ///
  /// In en, this message translates to:
  /// **'When an astrologer goes live, they’ll appear here. Pull down to refresh — or watch for a notification.'**
  String get whenAnAstrologerGoesLiveThey;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @couldNotLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load'**
  String get couldNotLoad;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @somePermissionsAreBlockedTapA.
  ///
  /// In en, this message translates to:
  /// **'Some permissions are blocked. Tap a blocked item (or “Open Settings”) and enable it, then return here.'**
  String get somePermissionsAreBlockedTapA;

  /// No description provided for @thesePermissionsAreRequiredToUse.
  ///
  /// In en, this message translates to:
  /// **'These permissions are required to use Rudraganga. Tap any pending item to grant it.'**
  String get thesePermissionsAreRequiredToUse;

  /// No description provided for @settings2.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings2;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @blockedEnableItInSettings.
  ///
  /// In en, this message translates to:
  /// **'Blocked — enable it in Settings'**
  String get blockedEnableItInSettings;

  /// No description provided for @allowsUpTo.
  ///
  /// In en, this message translates to:
  /// **'allows up to'**
  String get allowsUpTo;

  /// No description provided for @bookingFailed.
  ///
  /// In en, this message translates to:
  /// **'Booking failed'**
  String get bookingFailed;

  /// No description provided for @yourDetails.
  ///
  /// In en, this message translates to:
  /// **'Your details'**
  String get yourDetails;

  /// No description provided for @fromYourProfile.
  ///
  /// In en, this message translates to:
  /// **'From your profile'**
  String get fromYourProfile;

  /// No description provided for @familyMembers.
  ///
  /// In en, this message translates to:
  /// **'Family members'**
  String get familyMembers;

  /// No description provided for @addMember.
  ///
  /// In en, this message translates to:
  /// **'Add member'**
  String get addMember;

  /// No description provided for @addAnother.
  ///
  /// In en, this message translates to:
  /// **'Add another'**
  String get addAnother;

  /// No description provided for @preferredDateOptional.
  ///
  /// In en, this message translates to:
  /// **'Preferred date (optional)'**
  String get preferredDateOptional;

  /// No description provided for @anyDate.
  ///
  /// In en, this message translates to:
  /// **'Any date'**
  String get anyDate;

  /// No description provided for @bookNowFree.
  ///
  /// In en, this message translates to:
  /// **'Book now (Free)'**
  String get bookNowFree;

  /// No description provided for @couldNotLoadThisPooja.
  ///
  /// In en, this message translates to:
  /// **'Could not load this pooja'**
  String get couldNotLoadThisPooja;

  /// No description provided for @forLabel.
  ///
  /// In en, this message translates to:
  /// **'For'**
  String get forLabel;

  /// No description provided for @s1Person.
  ///
  /// In en, this message translates to:
  /// **'1 person'**
  String get s1Person;

  /// No description provided for @bookShareDetails.
  ///
  /// In en, this message translates to:
  /// **'Book & share details'**
  String get bookShareDetails;

  /// No description provided for @confirmYourBookingWithTheNames.
  ///
  /// In en, this message translates to:
  /// **'Confirm your booking with the names the pooja is performed for.'**
  String get confirmYourBookingWithTheNames;

  /// No description provided for @panditCoordinates.
  ///
  /// In en, this message translates to:
  /// **'Pandit coordinates'**
  String get panditCoordinates;

  /// No description provided for @aVerifiedPanditCallsToFix.
  ///
  /// In en, this message translates to:
  /// **'A verified pandit calls to fix the time and arrange the samagri.'**
  String get aVerifiedPanditCallsToFix;

  /// No description provided for @poojaPerformed.
  ///
  /// In en, this message translates to:
  /// **'Pooja performed'**
  String get poojaPerformed;

  /// No description provided for @sankalpIsTakenInYourFamily.
  ///
  /// In en, this message translates to:
  /// **'Sankalp is taken in your family’s names, and prasad is shared afterwards where applicable.'**
  String get sankalpIsTakenInYourFamily;

  /// No description provided for @couldNotLoadPoojas.
  ///
  /// In en, this message translates to:
  /// **'Could not load poojas'**
  String get couldNotLoadPoojas;

  /// No description provided for @any.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get any;

  /// No description provided for @noPoojasHere.
  ///
  /// In en, this message translates to:
  /// **'No poojas here'**
  String get noPoojasHere;

  /// No description provided for @nothingMatchesTheCurrentFilters.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches the current filters'**
  String get nothingMatchesTheCurrentFilters;

  /// No description provided for @noPoojasAvailableYet.
  ///
  /// In en, this message translates to:
  /// **'No poojas available yet'**
  String get noPoojasAvailableYet;

  /// No description provided for @showAllPoojas.
  ///
  /// In en, this message translates to:
  /// **'Show all poojas'**
  String get showAllPoojas;

  /// No description provided for @tapToViewDetailsBook.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details & book'**
  String get tapToViewDetailsBook;

  /// No description provided for @appliedYouBothEarnOnYour.
  ///
  /// In en, this message translates to:
  /// **'Applied! You both earn on your first recharge.'**
  String get appliedYouBothEarnOnYour;

  /// No description provided for @shareYourCode.
  ///
  /// In en, this message translates to:
  /// **'Share your code'**
  String get shareYourCode;

  /// No description provided for @sendYourCodeToFriendsVia.
  ///
  /// In en, this message translates to:
  /// **'Send your code to friends via WhatsApp, SMS, anywhere.'**
  String get sendYourCodeToFriendsVia;

  /// No description provided for @friendSignsUp.
  ///
  /// In en, this message translates to:
  /// **'Friend signs up'**
  String get friendSignsUp;

  /// No description provided for @theyEnterYourCodeInRefer.
  ///
  /// In en, this message translates to:
  /// **'They enter your code in Refer & Earn after signing up.'**
  String get theyEnterYourCodeInRefer;

  /// No description provided for @feedbackReceived.
  ///
  /// In en, this message translates to:
  /// **'Feedback received ✓'**
  String get feedbackReceived;

  /// No description provided for @thanksOurTeamWillLookInto.
  ///
  /// In en, this message translates to:
  /// **'Thanks — our team will look into it.'**
  String get thanksOurTeamWillLookInto;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @requiredLabel.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredLabel;

  /// No description provided for @applicationReceived.
  ///
  /// In en, this message translates to:
  /// **'Application received ✓'**
  String get applicationReceived;

  /// No description provided for @ourTeamWillReachOutAbout.
  ///
  /// In en, this message translates to:
  /// **'Our team will reach out about your astrologer profile.'**
  String get ourTeamWillReachOutAbout;

  /// No description provided for @enter10Digits.
  ///
  /// In en, this message translates to:
  /// **'Enter 10 digits'**
  String get enter10Digits;

  /// No description provided for @aboutYouBioExpertiseExperience.
  ///
  /// In en, this message translates to:
  /// **'About you (bio, expertise, experience)'**
  String get aboutYouBioExpertiseExperience;

  /// No description provided for @rudragangaConnectsYouWithTrustedVedic.
  ///
  /// In en, this message translates to:
  /// **'Rudraganga connects you with trusted Vedic astrologers for guidance on career, '**
  String get rudragangaConnectsYouWithTrustedVedic;

  /// No description provided for @marriageFinanceHealthAndLifeS.
  ///
  /// In en, this message translates to:
  /// **'marriage, finance, health and life’s big questions — over chat, call and video. '**
  String get marriageFinanceHealthAndLifeS;

  /// No description provided for @getYourFreeKundliDailyHoroscope.
  ///
  /// In en, this message translates to:
  /// **'Get your free kundli, daily horoscope, matchmaking, pujas and remedies, all in one place.\n\n'**
  String get getYourFreeKundliDailyHoroscope;

  /// No description provided for @ourMissionIsToMakeAuthentic.
  ///
  /// In en, this message translates to:
  /// **'Our mission is to make authentic, compassionate spiritual guidance accessible to everyone, '**
  String get ourMissionIsToMakeAuthentic;

  /// No description provided for @inYourOwnLanguage.
  ///
  /// In en, this message translates to:
  /// **'in your own language.'**
  String get inYourOwnLanguage;

  /// No description provided for @verifiedExperiencedAstrologers.
  ///
  /// In en, this message translates to:
  /// **'Verified, experienced astrologers'**
  String get verifiedExperiencedAstrologers;

  /// No description provided for @privateSecureConsultations.
  ///
  /// In en, this message translates to:
  /// **'Private & secure consultations'**
  String get privateSecureConsultations;

  /// No description provided for @availableIn6IndianLanguages.
  ///
  /// In en, this message translates to:
  /// **'Available in 6 Indian languages'**
  String get availableIn6IndianLanguages;

  /// No description provided for @thanksForRatingUs.
  ///
  /// In en, this message translates to:
  /// **'Thanks for rating us ✓'**
  String get thanksForRatingUs;

  /// No description provided for @yourFeedbackHelpsRudragangaGrow.
  ///
  /// In en, this message translates to:
  /// **'Your feedback helps Rudraganga grow.'**
  String get yourFeedbackHelpsRudragangaGrow;

  /// No description provided for @onceInADay.
  ///
  /// In en, this message translates to:
  /// **'Once in a day'**
  String get onceInADay;

  /// No description provided for @twiceInADay.
  ///
  /// In en, this message translates to:
  /// **'Twice in a day'**
  String get twiceInADay;

  /// No description provided for @asManyTimesAsItComes.
  ///
  /// In en, this message translates to:
  /// **'As many times as it comes'**
  String get asManyTimesAsItComes;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @cricket.
  ///
  /// In en, this message translates to:
  /// **'Cricket'**
  String get cricket;

  /// No description provided for @shareMarket.
  ///
  /// In en, this message translates to:
  /// **'Share Market'**
  String get shareMarket;

  /// No description provided for @bollywood.
  ///
  /// In en, this message translates to:
  /// **'Bollywood'**
  String get bollywood;

  /// No description provided for @newMagazine.
  ///
  /// In en, this message translates to:
  /// **'New Magazine'**
  String get newMagazine;

  /// No description provided for @festivals.
  ///
  /// In en, this message translates to:
  /// **'Festivals'**
  String get festivals;

  /// No description provided for @notificationsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Notifications updated ✓'**
  String get notificationsUpdated;

  /// No description provided for @youLlHearFromUsBased.
  ///
  /// In en, this message translates to:
  /// **'You\'ll hear from us based on your choices.'**
  String get youLlHearFromUsBased;

  /// No description provided for @yourChartsWillNowFollowYour.
  ///
  /// In en, this message translates to:
  /// **'Your charts will now follow your chosen style.'**
  String get yourChartsWillNowFollowYour;

  /// No description provided for @chartStyle.
  ///
  /// In en, this message translates to:
  /// **'Chart style'**
  String get chartStyle;

  /// No description provided for @northIndian.
  ///
  /// In en, this message translates to:
  /// **'North Indian'**
  String get northIndian;

  /// No description provided for @southIndian.
  ///
  /// In en, this message translates to:
  /// **'South Indian'**
  String get southIndian;

  /// No description provided for @monthSystem.
  ///
  /// In en, this message translates to:
  /// **'Month system'**
  String get monthSystem;

  /// No description provided for @amanta.
  ///
  /// In en, this message translates to:
  /// **'Amanta'**
  String get amanta;

  /// No description provided for @purnimanta.
  ///
  /// In en, this message translates to:
  /// **'Purnimanta'**
  String get purnimanta;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @onLabel.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get onLabel;

  /// No description provided for @useDeviceSettings.
  ///
  /// In en, this message translates to:
  /// **'Use device settings'**
  String get useDeviceSettings;

  /// No description provided for @ayanamsa.
  ///
  /// In en, this message translates to:
  /// **'Ayanamsa'**
  String get ayanamsa;

  /// No description provided for @nCLahiri.
  ///
  /// In en, this message translates to:
  /// **'N.C. Lahiri'**
  String get nCLahiri;

  /// No description provided for @kpNew.
  ///
  /// In en, this message translates to:
  /// **'KP New'**
  String get kpNew;

  /// No description provided for @kpOld.
  ///
  /// In en, this message translates to:
  /// **'KP Old'**
  String get kpOld;

  /// No description provided for @raman.
  ///
  /// In en, this message translates to:
  /// **'Raman'**
  String get raman;

  /// No description provided for @kpKhullar.
  ///
  /// In en, this message translates to:
  /// **'KP Khullar'**
  String get kpKhullar;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @youSave.
  ///
  /// In en, this message translates to:
  /// **'You save'**
  String get youSave;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get deliveryAddress;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order summary'**
  String get orderSummary;

  /// No description provided for @couponsOffers.
  ///
  /// In en, this message translates to:
  /// **'Coupons & offers'**
  String get couponsOffers;

  /// No description provided for @billDetails.
  ///
  /// In en, this message translates to:
  /// **'Bill details'**
  String get billDetails;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @productDiscount.
  ///
  /// In en, this message translates to:
  /// **'Product discount'**
  String get productDiscount;

  /// No description provided for @itemsSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Items subtotal'**
  String get itemsSubtotal;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @free2.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get free2;

  /// No description provided for @toPay.
  ///
  /// In en, this message translates to:
  /// **'To pay'**
  String get toPay;

  /// No description provided for @dMmmYyyyHMmA.
  ///
  /// In en, this message translates to:
  /// **'d MMM yyyy, h:mm a'**
  String get dMmmYyyyHMmA;

  /// No description provided for @couldNotDownloadInvoice.
  ///
  /// In en, this message translates to:
  /// **'Could not download invoice'**
  String get couldNotDownloadInvoice;

  /// No description provided for @orderNotFound.
  ///
  /// In en, this message translates to:
  /// **'Order not found'**
  String get orderNotFound;

  /// No description provided for @activityTimeline.
  ///
  /// In en, this message translates to:
  /// **'Activity timeline'**
  String get activityTimeline;

  /// No description provided for @eeeDMmmYyyyHMm.
  ///
  /// In en, this message translates to:
  /// **'EEE, d MMM yyyy · h:mm a'**
  String get eeeDMmmYyyyHMm;

  /// No description provided for @totalPaid.
  ///
  /// In en, this message translates to:
  /// **'Total paid'**
  String get totalPaid;

  /// No description provided for @orderPlaced2.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get orderPlaced2;

  /// No description provided for @dMmmHMmA.
  ///
  /// In en, this message translates to:
  /// **'d MMM, h:mm a'**
  String get dMmmHMmA;

  /// No description provided for @generating.
  ///
  /// In en, this message translates to:
  /// **'Generating…'**
  String get generating;

  /// No description provided for @pleaseDescribeTheIssue.
  ///
  /// In en, this message translates to:
  /// **'Please describe the issue'**
  String get pleaseDescribeTheIssue;

  /// No description provided for @couldNotLoadProducts.
  ///
  /// In en, this message translates to:
  /// **'Could not load products'**
  String get couldNotLoadProducts;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;

  /// No description provided for @priceLowHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low→High'**
  String get priceLowHigh;

  /// No description provided for @priceHighLow.
  ///
  /// In en, this message translates to:
  /// **'Price: High→Low'**
  String get priceHighLow;

  /// No description provided for @topRated.
  ///
  /// In en, this message translates to:
  /// **'Top rated'**
  String get topRated;

  /// No description provided for @s6DigitPin.
  ///
  /// In en, this message translates to:
  /// **'6-digit PIN'**
  String get s6DigitPin;

  /// No description provided for @addressLine1.
  ///
  /// In en, this message translates to:
  /// **'Address line 1 *'**
  String get addressLine1;

  /// No description provided for @addressLine2.
  ///
  /// In en, this message translates to:
  /// **'Address line 2'**
  String get addressLine2;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City *'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State *'**
  String get state;

  /// No description provided for @pinCode.
  ///
  /// In en, this message translates to:
  /// **'PIN code *'**
  String get pinCode;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @pooja.
  ///
  /// In en, this message translates to:
  /// **'Pooja'**
  String get pooja;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @securePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure payment'**
  String get securePayment;

  /// No description provided for @noTransactionsMatchTheseFilters.
  ///
  /// In en, this message translates to:
  /// **'No transactions match these filters'**
  String get noTransactionsMatchTheseFilters;

  /// No description provided for @noTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get noTransactionsYet;

  /// No description provided for @moneyAdded.
  ///
  /// In en, this message translates to:
  /// **'Money added'**
  String get moneyAdded;

  /// No description provided for @poojaBooking.
  ///
  /// In en, this message translates to:
  /// **'Pooja booking'**
  String get poojaBooking;

  /// No description provided for @videoCall.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get videoCall;

  /// No description provided for @shopOrder.
  ///
  /// In en, this message translates to:
  /// **'Shop order'**
  String get shopOrder;

  /// No description provided for @refund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get refund;

  /// No description provided for @bonus.
  ///
  /// In en, this message translates to:
  /// **'Bonus'**
  String get bonus;

  /// No description provided for @credited.
  ///
  /// In en, this message translates to:
  /// **'Credited'**
  String get credited;

  /// No description provided for @debited.
  ///
  /// In en, this message translates to:
  /// **'Debited'**
  String get debited;

  /// No description provided for @rg.
  ///
  /// In en, this message translates to:
  /// **'RG'**
  String get rg;

  /// No description provided for @aExperienceyearsYrsExp.
  ///
  /// In en, this message translates to:
  /// **'{experienceYears} yrs exp'**
  String aExperienceyearsYrsExp(Object experienceYears);

  /// No description provided for @weLlLetYouKnowWhen2.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when {name} is {reason}.'**
  String weLlLetYouKnowWhen2(Object name, Object reason);

  /// No description provided for @priceMin.
  ///
  /// In en, this message translates to:
  /// **'₹{price}/min'**
  String priceMin(Object price);

  /// No description provided for @n1000000Tostringasfixed1M.
  ///
  /// In en, this message translates to:
  /// **'{toStringAsFixed}M'**
  String n1000000Tostringasfixed1M(Object toStringAsFixed);

  /// No description provided for @n1000Tostringasfixed1K.
  ///
  /// In en, this message translates to:
  /// **'{toStringAsFixed}k'**
  String n1000Tostringasfixed1K(Object toStringAsFixed);

  /// No description provided for @nameIsATrustedAstrologerWith.
  ///
  /// In en, this message translates to:
  /// **'{name} is a trusted astrologer with deep expertise in {desc}. Over years of practice on the platform, '**
  String nameIsATrustedAstrologerWith(Object name, Object desc);

  /// No description provided for @chatMin.
  ///
  /// In en, this message translates to:
  /// **'₹{chat}/min'**
  String chatMin(Object chat);

  /// No description provided for @callMin.
  ///
  /// In en, this message translates to:
  /// **'₹{call}/min'**
  String callMin(Object call);

  /// No description provided for @videoMin.
  ///
  /// In en, this message translates to:
  /// **'₹{video}/min'**
  String videoMin(Object video);

  /// No description provided for @widgetNameIsLive.
  ///
  /// In en, this message translates to:
  /// **'{name} is live'**
  String widgetNameIsLive(Object name);

  /// No description provided for @widgetNameIsInASession.
  ///
  /// In en, this message translates to:
  /// **'{name} is in a session right now'**
  String widgetNameIsInASession(Object name);

  /// No description provided for @widgetNameIsOfflineRightNow.
  ///
  /// In en, this message translates to:
  /// **'{name} is offline right now'**
  String widgetNameIsOfflineRightNow(Object name);

  /// No description provided for @storeFollowers1000Tostringasfixed1K.
  ///
  /// In en, this message translates to:
  /// **'{toStringAsFixed}k'**
  String storeFollowers1000Tostringasfixed1K(Object toStringAsFixed);

  /// No description provided for @maxPriceMaxpriceRoundMin.
  ///
  /// In en, this message translates to:
  /// **'Max price · ₹{round}/min'**
  String maxPriceMaxpriceRoundMin(Object round);

  /// No description provided for @sendTotalTokens.
  ///
  /// In en, this message translates to:
  /// **'Send · {total} tokens'**
  String sendTotalTokens(Object total);

  /// No description provided for @sTypeTouppercaseLive.
  ///
  /// In en, this message translates to:
  /// **'{toUpperCase} · LIVE'**
  String sTypeTouppercaseLive(Object toUpperCase);

  /// No description provided for @widgetAstrologernameChatHistory.
  ///
  /// In en, this message translates to:
  /// **'{astrologerName} · chat history'**
  String widgetAstrologernameChatHistory(Object astrologerName);

  /// No description provided for @dailyAtRTimeofdayFor14.
  ///
  /// In en, this message translates to:
  /// **'Daily at {timeOfDay} · for 14 days'**
  String dailyAtRTimeofdayFor14(Object timeOfDay);

  /// No description provided for @onRDate.
  ///
  /// In en, this message translates to:
  /// **'On {date}'**
  String onRDate(Object date);

  /// No description provided for @durSDurationsecSTotalamountCoins.
  ///
  /// In en, this message translates to:
  /// **'{durationSec} · {totalAmount} coins'**
  String durSDurationsecSTotalamountCoins(
      Object durationSec, Object totalAmount);

  /// No description provided for @aboutMinutesleftMinLeft.
  ///
  /// In en, this message translates to:
  /// **'About {minutesLeft} min left'**
  String aboutMinutesleftMinLeft(Object minutesLeft);

  /// No description provided for @nearbyPermissionPerm.
  ///
  /// In en, this message translates to:
  /// **'[nearby] permission = {perm}'**
  String nearbyPermissionPerm(Object perm);

  /// No description provided for @nearbyGetcurrentpositionFailedETryingLast.
  ///
  /// In en, this message translates to:
  /// **'[nearby] getCurrentPosition failed: {e} — trying last known'**
  String nearbyGetcurrentpositionFailedETryingLast(Object e);

  /// No description provided for @nearbyPositionPosLatitudePosLongitude.
  ///
  /// In en, this message translates to:
  /// **'[nearby] position = {latitude}, {longitude}'**
  String nearbyPositionPosLatitudePosLongitude(
      Object latitude, Object longitude);

  /// No description provided for @nearbyReversegeocodeCityCity.
  ///
  /// In en, this message translates to:
  /// **'[nearby] reverseGeocode city = \"{city}\"'**
  String nearbyReversegeocodeCityCity(Object city);

  /// No description provided for @nearbyResolveErrorE.
  ///
  /// In en, this message translates to:
  /// **'[nearby] resolve error: {e}'**
  String nearbyResolveErrorE(Object e);

  /// No description provided for @resumeSessionClock.
  ///
  /// In en, this message translates to:
  /// **'Resume · {clock}'**
  String resumeSessionClock(Object clock);

  /// No description provided for @rateperminMin.
  ///
  /// In en, this message translates to:
  /// **'₹{ratePerMin}/min'**
  String rateperminMin(Object ratePerMin);

  /// No description provided for @checkYourConnectionAndTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.\n({error})'**
  String checkYourConnectionAndTryAgain(Object error);

  /// No description provided for @diffInminutesMAgo.
  ///
  /// In en, this message translates to:
  /// **'{inMinutes}m ago'**
  String diffInminutesMAgo(Object inMinutes);

  /// No description provided for @diffInhoursHAgo.
  ///
  /// In en, this message translates to:
  /// **'{inHours}h ago'**
  String diffInhoursHAgo(Object inHours);

  /// No description provided for @diffIndaysDAgo.
  ///
  /// In en, this message translates to:
  /// **'{inDays}d ago'**
  String diffIndaysDAgo(Object inDays);

  /// No description provided for @thisPoojaCostsWidgetPoojaBaseprice.
  ///
  /// In en, this message translates to:
  /// **'This pooja costs ₹{basePrice}. Your wallet doesn’t have enough balance — add money and try again.'**
  String thisPoojaCostsWidgetPoojaBaseprice(Object basePrice);

  /// No description provided for @payWidgetPoojaBasepriceBook.
  ///
  /// In en, this message translates to:
  /// **'Pay ₹{basePrice} & Book'**
  String payWidgetPoojaBasepriceBook(Object basePrice);

  /// No description provided for @upToPMaxpersons.
  ///
  /// In en, this message translates to:
  /// **'Up to {maxPersons}'**
  String upToPMaxpersons(Object maxPersons);

  /// No description provided for @aSacredPNamePerformedBy.
  ///
  /// In en, this message translates to:
  /// **'A sacred {name} performed by experienced pandits. Book a slot and our team will reach out to coordinate the details and timing.'**
  String aSacredPNamePerformedBy(Object name);

  /// No description provided for @upToPoojaMaxpersons.
  ///
  /// In en, this message translates to:
  /// **'up to {maxPersons}'**
  String upToPoojaMaxpersons(Object maxPersons);

  /// No description provided for @earnIRewardOnRudraganga.
  ///
  /// In en, this message translates to:
  /// **'Earn ₹{reward} on Rudraganga'**
  String earnIRewardOnRudraganga(Object reward);

  /// No description provided for @bothEarnIReward.
  ///
  /// In en, this message translates to:
  /// **'Both earn ₹{reward}'**
  String bothEarnIReward(Object reward);

  /// No description provided for @onTheirFirstWalletRechargeYou.
  ///
  /// In en, this message translates to:
  /// **'On their first wallet recharge, you both get ₹{reward} instantly.'**
  String onTheirFirstWalletRechargeYou(Object reward);

  /// No description provided for @rechargeTotalBalance.
  ///
  /// In en, this message translates to:
  /// **'Recharge ₹{balance}'**
  String rechargeTotalBalance(Object balance);

  /// No description provided for @itemTotalMrpQtycount.
  ///
  /// In en, this message translates to:
  /// **'Item total (MRP) · {qtyCount}'**
  String itemTotalMrpQtycount(Object qtyCount);

  /// No description provided for @couponAppliedCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon ({code})'**
  String couponAppliedCode(Object code);

  /// No description provided for @placeOrderTotal.
  ///
  /// In en, this message translates to:
  /// **'Place Order · ₹{total}'**
  String placeOrderTotal(Object total);

  /// No description provided for @pPriceWasPMrp.
  ///
  /// In en, this message translates to:
  /// **'₹{price} (was ₹{mrp})'**
  String pPriceWasPMrp(Object price, Object mrp);

  /// No description provided for @pNamePricelineUrl.
  ///
  /// In en, this message translates to:
  /// **'{name} â {priceLine}\n{url}'**
  String pNamePricelineUrl(Object name, Object priceLine, Object url);

  /// No description provided for @ytWebviewErrorEErrorcodeE.
  ///
  /// In en, this message translates to:
  /// **'YT webview error: {errorCode} {description}'**
  String ytWebviewErrorEErrorcodeE(Object errorCode, Object description);

  /// No description provided for @rgpayHttpErrorEResponseStatuscode.
  ///
  /// In en, this message translates to:
  /// **'RGPAY http error: {statusCode}'**
  String rgpayHttpErrorEResponseStatuscode(Object statusCode);

  /// No description provided for @rgpayResourceErrorEErrorcodeE.
  ///
  /// In en, this message translates to:
  /// **'RGPAY resource error: {errorCode} {description}'**
  String rgpayResourceErrorEErrorcodeE(Object errorCode, Object description);
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'as',
        'bn',
        'en',
        'hi',
        'mr',
        'pa'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'as':
      return L10nAs();
    case 'bn':
      return L10nBn();
    case 'en':
      return L10nEn();
    case 'hi':
      return L10nHi();
    case 'mr':
      return L10nMr();
    case 'pa':
      return L10nPa();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
