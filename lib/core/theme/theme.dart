import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primarySwatch: const MaterialColor(4285566687, <int, Color>{
    50: Color(0xffeaeffa),
    100: Color(0xffd5def6),
    200: Color(0xffacbdec),
    300: Color(0xff829ce3),
    400: Color(0xff587bda),
    500: Color(0xff2f5ad0),
    600: Color(0xff2548a7),
    700: Color(0xff1c367d),
    800: Color(0xff132453),
    900: Color(0xff09122a)
  }),
  brightness: Brightness.light,
  primaryColor: const Color(0xff708edf),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: const Color(0xfff6f4f4),
  primaryColorDark: const Color(0xff292929),
  canvasColor: const Color(0xff3D3D3F),
  scaffoldBackgroundColor: const Color(0xff3D3D3F),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  toggleableActiveColor: const Color(0xff2548a7),
  secondaryHeaderColor: const Color(0xffeaeffa),
  backgroundColor: const Color(0xff3D3D3F),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xff2f5ad0),
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  // TODO(bahrican): Fill the empty parameters
  // TODO(bahrican): Create a mechanism to create this file automatically.

  //  appBarTheme: ,
  //  applyElevationOverlayColor: ,
  //  bannerTheme: ,
  //  bottomAppBarTheme: ,
  //  bottomNavigationBarTheme: ,
  //  bottomSheetTheme: ,
  //  buttonBarTheme: ,
  //  cardTheme: ,
  //  checkboxTheme: ,
  //  colorScheme: ,
  //  cupertinoOverrideTheme: ,
  //  dataTableTheme: ,
  //  dividerTheme: ,
  //  elevatedButtonTheme: ,
  //  floatingActionButtonTheme: ,
  //  focusColor: ,
  //  fontFamily: ,
  //   hoverColor: ,
  //   materialTapTargetSize: ,
  //   navigationRailTheme: ,
  //   outlinedButtonTheme: ,
  //   pageTransitionsTheme: ,
  //   platform: ,
  //   popupMenuTheme: ,
  //   progressIndicatorTheme: ,
  //   radioTheme: ,
  //   shadowColor: ,
  //   splashFactory: ,
  //   snackBarTheme: ,
  //   switchTheme: ,
  //   textButtonTheme: ,
  //   textSelectionTheme: ,
  //   timePickerTheme: ,
  //   toggleButtonsTheme: ,
  //   tooltipTheme: ,
  //   typography: ,
  buttonTheme: const ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff708edf),
      primaryVariant: Color(0xff1c367d),
      secondary: Color(0xff2f5ad0),
      secondaryVariant: Color(0xff1c367d),
      surface: Color(0xffffffff),
      background: Color(0xffacbdec),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  textTheme: TextTheme(
    caption: const TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: const TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: const TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline1: TextStyle(
      letterSpacing: 1.2,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      letterSpacing: 1.2,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      letterSpacing: 1.2,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      letterSpacing: 1.2,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      letterSpacing: 1.2,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      letterSpacing: 1,
      color: theme.primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
  ),
  primaryTextTheme: const TextTheme(
    caption: TextStyle(
      color: Color(0xb3ffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xbbf6f4f4),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),
  sliderTheme: const SliderThemeData(
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbColor: MaterialStateProperty.all(const Color(0xff708edf)),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xb2ffffff),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3d708edf),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(
      side: BorderSide(
        width: 0,
      ),
    ),
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(side: BorderSide(width: 0)),
  ),
);
