import '../../extensions/string/util_extensions.dart';

class StringValidations {
  final String text;
  const StringValidations(this.text);

  bool get isValidEmail {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(text);
  }

  bool get isValidName {
    final RegExp nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))*[A-Za-z]+\.?\s*.{2,}$");
    return nameRegExp.hasMatch(text.trToEn);
  }

  bool get isValidPassword {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(text);
  }

  bool get isValidPhone {
    final RegExp phoneRegExp = RegExp(r'^\+?0[0-9]{10}$');
    return phoneRegExp.hasMatch(text);
  }
}
