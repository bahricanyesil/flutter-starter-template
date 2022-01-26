import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/decoration/text_styles.dart';
import '../../../core/extensions/color/color_extensions.dart';
import '../../../core/extensions/context/responsiveness_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/extensions/string/string_util_extensions.dart';
import '../../../core/theme/color/l_colors.dart';
import '../constants/login_texts.dart';
import '../utilities/listen_login_value.dart';
import '../view-model/login_view_model.dart';

/// Login screen of the app.
/// Used [AnimatedLogin] package developed by Bahrican Yesil.
class LoginScreen extends StatelessWidget
    with LoginTextMixin, ListenLoginValue {
  /// Default constructor for login screen.
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginViewModel model = context.read<LoginViewModel>();
    return AnimatedLogin(
      ///TODO: Auth callbacks
      // onLogin: LoginFunctions(context).onLogin,
      // onSignup: LoginFunctions(context).onSignup,
      // onForgotPassword: LoginFunctions(context).onForgotPassword,
      socialLogins: model.socialLogins,
      logo: Image.asset('logo'.gif),
      loginDesktopTheme: _desktopTheme(context),
      loginMobileTheme: _mobileTheme(context),
      loginTexts: loginTexts(context),
      languageOptions: model.languageOptions(context),
      changeLanguageCallback: (LanguageOption? opt) =>
          model.languageChange(opt, context),
      selectedLanguage: model.currentLanguage(context),
      initialMode: listenAuthMode(context),
      onAuthModeChange: model.changeAuth,
    );
  }

  LoginViewTheme _desktopTheme(BuildContext context) =>
      _mobileTheme(context).copyWith(
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        formFieldHoverColor: context.primaryLightColor.lighten(.08),
        formFieldBackgroundColor: Colors.transparent,
        errorTextStyle: const TextStyle(color: AppColors.error),
        formElementsSpacing: context.height * 2.4,
      );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  LoginViewTheme _mobileTheme(BuildContext context) => LoginViewTheme(
      backgroundColor: context.primaryColor,
      formFieldBackgroundColor: AppColors.white,
      textFormStyle: TextStyles(context).subBodyStyle(color: AppColors.black),
      hintTextStyle: TextStyles(context)
          .subBodyStyle(color: AppColors.black, fontSizeFactor: 4.7),
      formElementsSpacing: context.height,
      socialLoginHoverColor: AppColors.white,
      dialogTheme: _dialogTheme(context),
      welcomeTitleStyle: TextStyles(context).titleStyle(
          color: AppColors.white, fontSizeFactor: 9.8, letterSpacing: 2.3),
      errorTextStyle: const TextStyle(color: AppColors.white),
      errorBorderColor: AppColors.error);

  AnimatedDialogTheme _dialogTheme(BuildContext context) => AnimatedDialogTheme(
        languageDialogTheme: LanguageDialogTheme(
          languageTextStyle: TextStyles(context)
              .bodyStyle(color: AppColors.black, fontSizeFactor: 5.4),
          selectedItemTextColor: AppColors.white,
          dialogOptionSize: Size(context.width * 14, context.height * 6),
        ),
      );
}
