/// Collection of texts in the settings screen.
mixin SettingsTexts {
  /// Key for the title of settings screen.
  static const String title = 'settings';

  /// Keys for language options.
  static const List<String> languageOptions = <String>['en', 'tr'];

  /// Information sentences wşth colored words in the settings screen.
  static const Map<String, List<String>> infoSentences = <String, List<String>>{
    'language_description': <String>['language'],
    'theme_description': <String>['theme', 'dark_mode'],
  };

  /// Social media accounts.
  static final List<SocialMediaModel> socialMediaAccounts = <SocialMediaModel>[
    SocialMediaModel(nameKey: 'email', link: _emailUri.toString()),
    const SocialMediaModel(
        nameKey: 'linkedin',
        link: 'https://tr.linkedin.com/in/bahrican-yesil-490151172'),
    const SocialMediaModel(
        nameKey: 'github', link: 'https://github.com/bahricanyesil'),
    const SocialMediaModel(
        nameKey: 'instagram', link: 'https://www.instagram.com/bahricanyesil/'),
    const SocialMediaModel(
        nameKey: 'twitter', link: 'https://twitter.com/bahricanyesil'),
  ];

  static Uri get _emailUri => Uri(
        scheme: 'mailto',
        path: 'bahricanyesil@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'From Flutter Starter Template',
        }),
      );

  static String? _encodeQueryParameters(Map<String, String> params) =>
      params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

  /// Made with 💙 by Bahrican Yesil.
  static const String madeBy = 'made_by';
}

/// Model for social media accounts.
class SocialMediaModel {
  /// Default constructor for [SocialMediaModel].
  const SocialMediaModel({required this.nameKey, required this.link});

  /// Key for the name of the social media type.
  final String nameKey;

  /// Link to the social media.
  final String link;
}
