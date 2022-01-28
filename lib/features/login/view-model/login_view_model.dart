import 'dart:async';

import 'package:animated_login/animated_login.dart';
import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/context/language_helpers.dart';
import '../../../core/extensions/string/string_util_extensions.dart';
import '../../../core/extensions/string/type_conversion_extensions.dart';
import '../../../core/managers/navigation/navigation_shelf.dart';
import '../../../core/providers/providers_shelf.dart';
import '../../../product/constants/enums/language_options.dart';

/// View model to manage the data in the login screen.
class LoginViewModel extends BaseViewModel {
  /// Current authentication mode of the Login Screen.
  AuthMode currentMode = AuthMode.login;
  late NavigationManager _navigator;

  /// Changes the auth mode.
  void changeAuth(AuthMode newMode) {
    currentMode = newMode;
    notifyListeners();
  }

  /// All language options available in the app.
  List<LanguageOption> languageOptions(BuildContext context) {
    const List<Locale> locales = LanguageProvider.supportedLocales;
    final List<LanguageOption> languageOptions = List<LanguageOption>.generate(
        locales.length, (int i) => _option(locales[i].languageCode, context));
    return languageOptions;
  }

  static LanguageOption _option(String key, BuildContext context) =>
      LanguageOption(
        value: context.tr(key),
        code: key.toUpperCase(),
        iconPath: key.langPng,
      );

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> get socialLogins => <SocialLogin>[
        SocialLogin(
            callback: () async => _socialCallback('Google'),
            iconPath: 'google'.iconPng),
        SocialLogin(
            callback: () async => _socialCallback('Facebook'),
            iconPath: 'facebook'.iconPng),
        SocialLogin(
            callback: () async => _socialCallback('LinkedIn'),
            iconPath: 'linkedin'.iconPng),
      ];

  /// Callback to change language on user action.
  Future<void> languageChange(
      LanguageOption? _language, BuildContext context) async {
    final LanguageOptions? lang =
        _language?.code.toEnum<LanguageOptions>(LanguageOptions.values);
    if (lang != null) {
      await context.read<LanguageProvider>().setLanguage(lang);
    }
  }

  /// Returns the current language of the app.
  LanguageOption? currentLanguage(BuildContext context) {
    final LanguageOptions lang = context.watch<LanguageProvider>().language;
    final LanguageOption? packageLang = languageOptions(context)
        .firstWhereOrNull((LanguageOption opt) =>
            opt.code.toLowerCase() == lang.name.toLowerCase());
    return packageLang;
  }

  /// Cancelable operation
  CancelableOperation<dynamic>? operation;

  /// Auth operation wrapper to make it cancelable.
  Future<String?> authOperation(Future<String?> func) async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(func);
    final String? res = await operation?.valueOrCancellation();
    if ((operation?.isCompleted ?? false) && res == null) {
      await _navigateToHome();
    }
    return res;
  }

  /// Login action will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return null;
  }

  /// Signup action will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return null;
  }

  Future<String?> _socialCallback(String type) async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_socialLogin(type));
    final String? res = await operation?.valueOrCancellation();
    if ((operation?.isCompleted ?? false) && res == null) {
      await _navigateToHome();
    }
    return res;
  }

  /// Social login callback example.
  Future<String?> _socialLogin(String type) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return null;
  }

  /// Function to perform when clicked on forgot password
  Future<String?> onForgotPassword(String email, BuildContext context) async {
    await operation?.cancel();
    await _navigateToHome();
    return null;
  }

  Future<void> _navigateToHome() async =>
      _navigator.setNewRoutePath(ScreenConfig.home());

  @override
  FutureOr<void> init() {
    _navigator = NavigationManager.instance;
  }
}
