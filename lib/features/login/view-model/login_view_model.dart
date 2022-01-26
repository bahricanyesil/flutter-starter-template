import 'dart:async';

import 'package:animated_login/animated_login.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/context/language_helpers.dart';
import '../../../core/extensions/string/string_util_extensions.dart';
import '../../../core/extensions/string/type_conversion_extensions.dart';
import '../../../core/providers/providers_shelf.dart';
import '../../../product/constants/enums/language_options.dart';

/// View model to manage the data in the login screen.
class LoginViewModel extends BaseViewModel {
  /// Current authentication mode of the Login Screen.
  AuthMode currentMode = AuthMode.login;

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
  /// TODO: Icon paths
  List<SocialLogin> get socialLogins => <SocialLogin>[
        SocialLogin(callback: _googleLogin, iconPath: 'google'.iconPng),
        SocialLogin(callback: _facebookLogin, iconPath: 'facebook'.iconPng),
        SocialLogin(callback: _linkedinLogin, iconPath: 'linkedin'.iconPng),
      ];

  /// TODO: Social login services
  Future<String?> _googleLogin() async => '';
  Future<String?> _facebookLogin() async => '';
  Future<String?> _linkedinLogin() async => '';

  /// Callback to change language on user action.
  Future<void> languageChange(
      LanguageOption? _language, BuildContext context) async {
    final LanguageOptions? lang =
        _language?.code.toEnum<LanguageOptions>(LanguageOptions.values);
    if (lang != null) {
      await context.read<LanguageProvider>().setLanguage(lang);
    }
  }

  LanguageOption? currentLanguage(BuildContext context) {
    final LanguageOptions lang = context.watch<LanguageProvider>().language;
    final LanguageOption? packageLang = languageOptions(context)
        .firstWhereOrNull((LanguageOption opt) =>
            opt.code.toLowerCase() == lang.name.toLowerCase());
    return packageLang;
  }

  @override
  FutureOr<void> init() {}
}
