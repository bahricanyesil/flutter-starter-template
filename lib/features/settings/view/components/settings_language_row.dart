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
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<CustomCheckboxTile>.generate(
          SettingsTexts.languageOptions.length,
          (int i) {
            final String langCode = SettingsTexts.languageOptions[i];
            return CustomCheckboxTile(
              onTap: (bool val) => _onTap(val, langCode, i),
              forcedValue: selectedIndex == i,
              text: langCode,
            );
          },
        ),
      );

  void _onTap(bool val, String langCode, int i) {
    final LanguageOptions? language = langCode.toEnum(LanguageOptions.values);
    if (language != null) {
      context.read<LanguageProvider>().setLanguage(language);
      setState(() => selectedIndex = i);
    }
  }
}
