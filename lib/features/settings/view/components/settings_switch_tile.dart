part of '../settings_screen.dart';

class _SettingsSwitchTile extends StatefulWidget {
  const _SettingsSwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);
  final Widget icon;

  final Widget title;

  final Widget subtitle;

  @override
  State<_SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<_SettingsSwitchTile> {
  bool isSwitched = false;
  late SettingsLocalManager manager;
  final SettingsOptions key = SettingsOptions.theme;

  @override
  void initState() {
    super.initState();
    manager = SettingsLocalManager.instance;
    final AppThemes? storedTheme =
        manager.get(key)?.toEnum<AppThemes>(AppThemes.values);
    isSwitched = storedTheme == AppThemes.dark;
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(highlightColor: context.primaryLightColor),
        child: SwitchListTile(
          title: _leading,
          value: isSwitched,
          contentPadding: context.verticalPadding(Sizes.extremeLow),
          activeTrackColor: context.primaryLightColor.darken(.1),
          inactiveTrackColor: context.primaryLightColor.lighten(.03),
          inactiveThumbColor: context.primaryColor,
          activeColor: context.primaryColor.darken(.01),
          onChanged: (bool val) {
            context.read<ThemeProvider>().switchTheme();
            setState(() => isSwitched = !isSwitched);
          },
        ),
      );

  Widget get _leading => Row(
        children: <Widget>[
          Padding(
            padding: context.horizontalPadding(Sizes.low),
            child: widget.icon,
          ),
          _titleAndSubtitle,
        ],
      );

  Widget get _titleAndSubtitle => Padding(
        padding: context.leftPadding(Sizes.low),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.title,
            SizedBox(height: context.height * .6),
            widget.subtitle
          ],
        ),
      );
}
