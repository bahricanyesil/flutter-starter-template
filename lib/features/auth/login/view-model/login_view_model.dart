import 'dart:async';

import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/widgets/dialogs/dialog_builder.dart';

class LoginViewModel extends BaseViewModel {
  late List<SocialLogin> socialLogins;

  @override
  FutureOr<void> init() {
    socialLogins = <SocialLogin>[
      _socialLogin('google'),
      _socialLogin('facebook'),
      _socialLogin('linkedin'),
    ];
  }

  SocialLogin _socialLogin(String type) => SocialLogin(
      iconPath: 'assets/images/auth/$type.png',
      callback: () async {
        DialogBuilder(context).showLoadingIndicator();
        await Future<void>.delayed(const Duration(seconds: 2));
        Navigator.of(context).pop();
        unawaited(DialogBuilder(context).showResultDialog('Successful login.'));
        return null;
      });

  /// Action will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    DialogBuilder(context).showLoadingIndicator();
    await Future<void>.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    unawaited(DialogBuilder(context).showResultDialog("""
    Successfully logged in.\n
    Email: ${loginData.email}\n
    Password: ${loginData.password}"""));
    return null;
  }

  /// Action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilder(context).showLoadingIndicator();
    await Future<void>.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    unawaited(DialogBuilder(context).showResultDialog("""
    Successfully signed up.\n
    Username: ${signupData.name}\n
    Email: ${signupData.email}\n
    Password: ${signupData.password}\n
    Confirm Password: ${signupData.confirmPassword}"""));
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password.
  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingIndicator();
    await Future<void>.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    unawaited(DialogBuilder(context)
        .showResultDialog('Successfully navigated. Email is $email'));
    return null;
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    DialogBuilder(context).showLoadingIndicator();
    await Future<void>.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    unawaited(DialogBuilder(context)
        .showResultDialog('Successfully logged in with $type.'));
    return null;
  }
}
