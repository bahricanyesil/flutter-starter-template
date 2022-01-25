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
        child: Padding(
          padding: context.allPadding(Sizes.low),
          child: Row(
            children: <Widget>[
              _icon,
              SizedBox(width: context.responsiveSize * 1.4),
              Expanded(child: _titleAndSubtitle),
              SizedBox(width: context.responsiveSize * 1.4),
              _switch,
            ],
          ),
        ),
      );

  Widget get _icon => Padding(
        padding: context.rightPadding(Sizes.extremeLow),
        child: widget.icon,
      );

  Widget get _titleAndSubtitle => Padding(
        padding: context.leftPadding(Sizes.low),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[widget.title, widget.subtitle],
        ),
      );

  Widget get _switch => Transform.scale(
        scale: context.responsiveSize / 3,
        child: Switch(
          value: isSwitched,
          onChanged: (bool val) {
            context.read<ThemeProvider>().switchTheme();
            setState(() => isSwitched = !isSwitched);
          },
          activeTrackColor: context.primaryLightColor.darken(.1),
          inactiveTrackColor: context.primaryLightColor.lighten(.03),
          inactiveThumbColor: context.primaryColor,
          activeColor: context.primaryColor.darken(.01),
        ),
      );
}
