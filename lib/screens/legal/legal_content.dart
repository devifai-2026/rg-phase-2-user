/// Canonical legal copy for the in-app Terms & Privacy screens. Mirrors the
/// backend-served pages (backend/public/terms.html, privacy.html) so the app and
/// website stay in sync. Keep these two in lock-step when either changes.

/// A block within a legal document: either a heading, paragraph, or bullet list.
class LegalBlock {
  final String? heading; // section heading (e.g. "1. Acceptance of these terms")
  final String? paragraph; // a paragraph of body text
  final List<String>? bullets; // a bulleted list
  const LegalBlock.heading(this.heading) : paragraph = null, bullets = null;
  const LegalBlock.paragraph(this.paragraph) : heading = null, bullets = null;
  const LegalBlock.bullets(this.bullets) : heading = null, paragraph = null;
}

class LegalDoc {
  final String title;
  final String lastUpdated;
  final String intro; // the highlighted note at the top
  final List<LegalBlock> blocks;
  const LegalDoc({required this.title, required this.lastUpdated, required this.intro, required this.blocks});
}

const termsDoc = LegalDoc(
  title: 'Terms of Service',
  lastUpdated: 'Last updated: 26 June 2026',
  intro:
      'Astro App provides astrology, spiritual, and wellness consultations for guidance and personal '
      'reflection only. Our services are not a substitute for professional medical, legal, financial, '
      'or psychological advice. You must be 18 or older to use the app.',
  blocks: [
    LegalBlock.heading('1. Acceptance of these terms'),
    LegalBlock.paragraph(
        'By creating an account or using the Astro App mobile application and related services (the '
        '“Services”), you agree to be bound by these Terms of Service and our Privacy Policy and Refund '
        'Policy. If you do not agree, please do not use the Services.'),
    LegalBlock.heading('2. Eligibility & your account'),
    LegalBlock.bullets([
      'You must be at least 18 years old and legally able to enter a contract.',
      'You register with a phone number verified by a one-time password (OTP). You are responsible for keeping access to that number and device secure.',
      'You agree to provide accurate information, including birth details where you choose to share them for a reading. You are responsible for all activity under your account.',
    ]),
    LegalBlock.heading('3. The services we offer'),
    LegalBlock.paragraph(
        'Astro App connects you with verified astrologers for consultations by audio call, video call, '
        'and chat, and offers related features such as kundli generation and matching, an AI astrologer, '
        'daily horoscopes, pooja bookings, a store for spiritual products, gifting, and matrimony matching. '
        'Availability of any feature or astrologer may change at any time.'),
    LegalBlock.heading('4. Wallet, pricing & billing'),
    LegalBlock.bullets([
      'Consultations are prepaid. You add funds to an in-app wallet and pay per minute at the rate shown for the astrologer and service before you connect.',
      'Billing begins when the astrologer accepts and the session connects. The first minute is charged on connect, and each further minute is charged at its start. A live meter is shown during the session, and the session ends automatically if your balance runs low.',
      'Payments are processed by our payment partner (PayU). We do not store full card details.',
      'Wallet balances are for use within the Services. Refunds, where applicable, are governed by our Refund Policy.',
      'Prices are in Indian Rupees (INR) and may include applicable taxes.',
    ]),
    LegalBlock.heading('5. Acceptable use'),
    LegalBlock.paragraph('You agree not to:'),
    LegalBlock.bullets([
      'Harass, abuse, threaten, or share sexually explicit or unlawful content with astrologers or staff.',
      'Impersonate any person, or provide false information to obtain a service or refund.',
      'Attempt to take a consultation off-platform to avoid fees, or solicit personal contact details.',
      'Interfere with, scrape, or attempt to disrupt the Services or their security.',
    ]),
    LegalBlock.heading('6. Astrologers on the platform'),
    LegalBlock.paragraph(
        'Astrologers are independent practitioners who are identity-verified and approved by Astro App '
        'before they can offer consultations. They set their own per-minute fares within limits we define. '
        'Opinions and guidance shared during a consultation are those of the individual astrologer and not '
        'of Astro App. We are not responsible for any decision you make based on a consultation.'),
    LegalBlock.heading('7. Recordings & content'),
    LegalBlock.paragraph(
        'For quality, safety, and dispute resolution, audio and video consultations may be recorded. You '
        'consent to such recording by starting a session. Chat conversations are stored so you can revisit '
        'them. See our Privacy Policy for how this data is handled.'),
    LegalBlock.heading('8. Disclaimer & limitation of liability'),
    LegalBlock.paragraph(
        'The Services are provided “as is” for guidance and entertainment-adjacent personal reflection. '
        'Astro App makes no guarantee about the accuracy of any prediction or remedy. To the maximum extent '
        'permitted by law, Astro App’s total liability arising from your use of the Services is limited to '
        'the amount you paid into your wallet in the 30 days before the event giving rise to the claim. We '
        'are not liable for indirect or consequential losses.'),
    LegalBlock.heading('9. Suspension & termination'),
    LegalBlock.paragraph(
        'We may suspend or terminate your account if you breach these terms, attempt fraud, or misuse the '
        'Services. You may stop using the Services at any time. Some provisions (payment obligations, '
        'disclaimers, and limitations of liability) survive termination.'),
    LegalBlock.heading('10. Changes to these terms'),
    LegalBlock.paragraph(
        'We may update these terms from time to time. Material changes will be notified in the app or by '
        'updating the “Last updated” date above. Continued use after changes means you accept them.'),
    LegalBlock.heading('11. Contact us'),
    LegalBlock.paragraph(
        'Questions about these terms? Reach us through the contact form on our website or in the app’s '
        'Help & Support section.'),
  ],
);

const privacyDoc = LegalDoc(
  title: 'Privacy Policy',
  lastUpdated: 'Last updated: 26 June 2026',
  intro:
      'Your birth details, consultations, and chats are personal to you. This policy explains what we '
      'collect, why, and the control you have over it.',
  blocks: [
    LegalBlock.heading('1. Information we collect'),
    LegalBlock.bullets([
      'Account information: your name, phone number (verified by OTP), and email if provided.',
      'Birth details: date, time, and place of birth that you choose to share for kundli and readings.',
      'Consultation data: chat messages, and audio/video call recordings where applicable.',
      'Payment data: wallet transactions and payment references. Card details are handled by our payment partner (PayU); we do not store full card numbers.',
      'Device & usage data: device type, operating system, approximate location derived from your IP address, pages visited, and interactions, used to operate and improve the Services.',
    ]),
    LegalBlock.heading('2. How we use it'),
    LegalBlock.bullets([
      'To create and secure your account and verify your identity.',
      'To connect you with astrologers and deliver consultations, kundli, horoscopes, and other features.',
      'To process wallet recharges, per-minute billing, payouts, and order fulfilment.',
      'To provide support, prevent fraud and abuse, and meet legal obligations.',
      'To understand and improve how the app and website are used.',
    ]),
    LegalBlock.heading('3. When we share information'),
    LegalBlock.paragraph('We do not sell your personal information. We share it only:'),
    LegalBlock.bullets([
      'With the astrologer you consult, limited to what is needed for the reading (e.g. your birth details and chat).',
      'With service providers who help us operate — payment processing (PayU), cloud hosting and storage, communications (WhatsApp/SMS for OTP), and notifications — under confidentiality obligations.',
      'When required by law, or to protect the rights, safety, and property of users and Astro App.',
    ]),
    LegalBlock.heading('4. Consultation recordings & chats'),
    LegalBlock.paragraph(
        'Audio and video consultations may be recorded, and chats are stored, for quality, safety, and '
        'dispute resolution. You can review your chat history in the app. Recordings are retained as '
        'described below and accessed only when needed for support, safety, or legal reasons.'),
    LegalBlock.heading('5. Analytics & cookies'),
    LegalBlock.paragraph(
        'Our website uses a first-party cookie/identifier to recognise return visits, measure how the '
        'landing page performs (such as which sections are clicked), and attribute sign-ups to marketing '
        'campaigns. This is used in aggregate to improve the experience. We derive approximate city/region '
        'from your IP address; we do not use precise GPS location for analytics.'),
    LegalBlock.heading('6. Data retention'),
    LegalBlock.paragraph(
        'We keep your information for as long as your account is active and as needed to provide the '
        'Services, comply with legal obligations, resolve disputes, and enforce our agreements. You may '
        'request deletion of your account and associated personal data, subject to legal retention '
        'requirements (for example, transaction records we must keep for accounting and tax).'),
    LegalBlock.heading('7. Security'),
    LegalBlock.paragraph(
        'We use industry-standard measures — encryption in transit, access controls, and secure '
        'infrastructure — to protect your information. No method of transmission or storage is completely '
        'secure, so we cannot guarantee absolute security.'),
    LegalBlock.heading('8. Your rights & choices'),
    LegalBlock.bullets([
      'Access, correct, or update your profile and birth details in the app.',
      'Request a copy or deletion of your personal data by contacting us.',
      'Opt out of promotional notifications in your device or app settings.',
    ]),
    LegalBlock.heading('9. Children'),
    LegalBlock.paragraph(
        'The Services are intended for users aged 18 and above. We do not knowingly collect data from '
        'anyone under 18. If you believe a minor has used the Services, please contact us so we can remove it.'),
    LegalBlock.heading('10. Changes to this policy'),
    LegalBlock.paragraph(
        'We may update this policy. Material changes will be notified in the app or by updating the '
        '“Last updated” date above.'),
    LegalBlock.heading('11. Contact us'),
    LegalBlock.paragraph(
        'For privacy questions or data requests, reach us via the contact form on our website or the '
        'app’s Help & Support section.'),
  ],
);
