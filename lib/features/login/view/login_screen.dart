import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums/sizes.dart';
import '../../../core/decoration/text_styles.dart';
import '../../../core/extensions/color/color_extensions.dart';
import '../../../core/extensions/context/responsiveness_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/extensions/string/string_util_extensions.dart';
import '../../../core/theme/color/l_colors.dart';
import '../constants/login_texts.dart';
import '../utilities/listen_login_value.dart';
import '../view-model/login_view_model.dart';

part '../utilities/custom_login_theme.dart';

/// Login screen of the app.
/// Used [AnimatedLogin] package developed by Bahrican Yesil.
class LoginScreen extends StatelessWidget
    with LoginTextMixin, ListenLoginValue, CustomLoginTheme {
  /// Default constructor for login screen.
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginViewModel model = context.read<LoginViewModel>();
    return AnimatedLogin(
      onLogin: (LoginData data) async =>
          model.authOperation(model.onLogin(data)),
      onSignup: (SignUpData data) async =>
          model.authOperation(model.onSignup(data)),
      onForgotPassword: (String email) =>
          model.onForgotPassword(email, context),
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
      changeLangDefaultOnPressed: () async => model.operation?.cancel(),
    );
  }
}
