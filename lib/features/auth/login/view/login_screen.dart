import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        bodyBuilder: bodyBuilder,
      );

  Widget bodyBuilder(BuildContext context) {
    final LoginViewModel loginViewModel = context.read<LoginViewModel>();
    return AnimatedLogin(
      onLogin: loginViewModel.onLogin,
      onSignup: loginViewModel.onSignup,
      onForgotPassword: loginViewModel.onForgotPassword,
      socialLogins: loginViewModel.socialLogins,
    );
  }
}
