import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context/language_helpers.dart';

/// Collection of texts in the Login Screen.
mixin LoginTextMixin on Widget {
  /// Collection of [LoginTexts] to pass as parameter to [AnimatedLogin] widget.
  LoginTexts loginTexts(BuildContext context) => LoginTexts(
        nameHint: context.tr(_username),
        login: context.tr(_login),
        signUp: context.tr(_signup),
        forgotPassword: context.tr(_forgotPassword),
        emailHint: context.tr(_emailHint),
        welcome: context.tr(_welcome),
        welcomeBack: context.tr(_welcomeBack),
        confirmPasswordHint: context.tr(_confirmPasswordHint),
        alreadyHaveAnAccount: context.tr(_alreadyHaveAnAccount),
        chooseLanguageTitle: context.tr(_chooseLanguageTitle),
        dialogButtonText: context.tr(_dialogButtonText),
        loginFormTitle: context.tr(_loginFormTitle),
        loginUseEmail: context.tr(_loginUseEmail),
        notHaveAnAccount: context.tr(_notHaveAnAccount),
        passwordHint: context.tr(_passwordHint),
        passwordMatchingError: context.tr(_passwordMatchingError),
        signUpFormTitle: context.tr(_signupFormTitle),
        signUpUseEmail: context.tr(_signupUseEmail),
        welcomeBackDescription: context.tr(_welcomeBackDescription),
        welcomeDescription: context.tr(_welcomeDescription),
      );

  static const String _username = 'username';
  static const String _login = 'sign_in';
  static const String _signup = 'sign_up';
  static const String _forgotPassword = 'forgot_password';
  static const String _emailHint = 'email_hint';
  static const String _welcome = 'welcome';
  static const String _welcomeBack = 'welcome_back';
  static const String _confirmPasswordHint = 'confirm_password_hint';
  static const String _alreadyHaveAnAccount = 'already_have_an_account';
  static const String _chooseLanguageTitle = 'choose_language_title';
  static const String _dialogButtonText = 'dialog_button_text';
  static const String _loginFormTitle = 'sign_in_form_title';
  static const String _loginUseEmail = 'sign_in_use_email';
  static const String _notHaveAnAccount = 'not_have_an_account';
  static const String _passwordHint = 'password_hint';
  static const String _passwordMatchingError = 'password_matching_error';
  static const String _signupFormTitle = 'sign_up_form_title';
  static const String _signupUseEmail = 'sign_up_use_email';
  static const String _welcomeBackDescription = 'welcome_back_description';
  static const String _welcomeDescription = 'welcome_description';
}
