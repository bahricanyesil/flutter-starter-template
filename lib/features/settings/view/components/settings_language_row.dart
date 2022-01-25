part of '../settings_screen.dart';

class _SettingsLanguageRow extends StatefulWidget {
  const _SettingsLanguageRow({Key? key}) : super(key: key);

  @override
  State<_SettingsLanguageRow> createState() => _SettingsLanguageRowState();
}

class _SettingsLanguageRowState extends State<_SettingsLanguageRow> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = SettingsTexts.languageOptions
        .indexOf(context.read<LanguageProvider>().language.name);
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: context.horizontalPadding(Sizes.high),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<CustomCheckboxTile>.generate(
            SettingsTexts.languageOptions.length,
            (int i) {
              final String langCode = SettingsTexts.languageOptions[i];
              return CustomCheckboxTile(
                onTap: (bool val) => _onTap(val, langCode, i),
                forcedValue: selectedIndex == i,
                customChild: _languageOption(selectedIndex == i, langCode),
              );
            },
          ),
        ),
      );

  void _onTap(bool val, String langCode, int i) {
    final LanguageOptions? language = langCode.toEnum(LanguageOptions.values);
    if (language != null) {
      context.read<LanguageProvider>().setLanguage(language);
      setState(() => selectedIndex = i);
    }
  }

  Widget _languageOption(bool selected, String langCode) => Row(
        children: <Widget>[
          Image.asset(langCode.langPng, height: context.height * 2.2),
          SizedBox(width: context.width * 2),
          BaseText(
            langCode,
            textAlign: TextAlign.left,
            style: TextStyles(context).subBodyStyle(
              color: selected ? context.primaryColor : null,
              fontWeight: selected ? FontWeight.w600 : null,
              fontSizeFactor: selected ? 5.1 : null,
            ),
          )
        ],
      );
}
