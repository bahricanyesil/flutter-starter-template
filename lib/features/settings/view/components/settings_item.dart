part of '../settings_screen.dart';

class _SettingsItem extends StatelessWidget
    with SettingsTexts, ListenSettingsValue {
  const _SettingsItem({required this.settings, Key? key}) : super(key: key);
  final SettingsOptions settings;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          dense: true,
          child: settings.isExpansionTile
              ? _expansionTile(context)
              : _SettingsSwitchTile(
                  icon: _icon,
                  title: _title(context),
                  subtitle: _subtitle(context),
                ),
        ),
      );

  Widget _expansionTile(BuildContext context) => ExpansionTile(
        collapsedTextColor: context.primaryLightColor,
        collapsedIconColor: context.primaryLightColor,
        tilePadding: context.horizontalPadding(Sizes.low),
        leading: _icon,
        title: _title(context),
        subtitle: _subtitle(context),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: _children(context),
      );

  List<Widget> _children(BuildContext context) {
    switch (settings) {
      case SettingsOptions.language:
        return <Widget>[const _SettingsLanguageRow()];
      case SettingsOptions.info:
        return _infoTexts(context);
      case SettingsOptions.socialInfo:
        return _socialMedia(context);
      default:
        return <Widget>[];
    }
  }

  List<Widget> _socialMedia(BuildContext context) => <Widget>[
        Row(
          children: List<Widget>.generate(
              SettingsTexts.socialMediaAccounts.length,
              (int i) => _item(i, context)),
        )
      ];

  Widget _item(int i, BuildContext context) {
    final SocialMediaModel account = SettingsTexts.socialMediaAccounts[i];
    return Expanded(
      child: IconButton(
        padding: context.allPadding(Sizes.lowMed),
        onPressed: () async => launch(account.link),
        icon: Image.asset(
          account.nameKey.iconPng,
          color: _color(account.nameKey, context),
        ),
        splashRadius: 25,
      ),
    );
  }

  Color? _color(String accountName, BuildContext context) =>
      accountName == 'github' && context.read<ThemeProvider>().isDark
          ? AppColors.white
          : null;

  List<Widget> _infoTexts(BuildContext context) => List<Padding>.generate(
        SettingsTexts.infoSentences.keys.length,
        (int i) => Padding(
          padding: context.horizontalPadding(Sizes.lowMed),
          child: BulletColoredText(
            text: context.tr(SettingsTexts.infoSentences.keys.elementAt(i)),
            coloredTexts: _translatedValues(i, context),
          ),
        ),
      );

  List<String> _translatedValues(int i, BuildContext context) {
    final List<String> valueKeys =
        SettingsTexts.infoSentences.values.elementAt(i);
    final List<String> translatedValues = <String>[];
    for (int j = 0; j < valueKeys.length; j++) {
      translatedValues.add(context.tr(valueKeys[j]).toLowerCase());
    }
    return translatedValues;
  }

  Widget get _icon => PrimaryBaseIcon(settings.icon, sizeFactor: 9);

  Widget _title(BuildContext context) => BaseText(
        settings.title,
        textAlign: TextAlign.start,
        style: TextStyles(context).bodyStyle(),
      );

  Widget _subtitle(BuildContext context) => BaseText(
        settings.subtitle,
        textAlign: TextAlign.start,
        style: TextStyles(context).subtitleTextStyle(),
      );
}
