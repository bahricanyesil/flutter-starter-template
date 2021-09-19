import '../../providers/lang/app_localizations.dart';

extension UtilExtension on String {
  String get tr => AppLocalizations.instance?.translate(this) ?? this;

  String get trToEn => replaceAll(RegExp('Ğ'), 'G')
      .replaceAll(RegExp('Ü'), 'U')
      .replaceAll(RegExp('Ş'), 'S')
      .replaceAll(RegExp('İ'), 'I')
      .replaceAll(RegExp('Ö'), 'O')
      .replaceAll(RegExp('Ç'), 'C')
      .replaceAll(RegExp('ğ'), 'g')
      .replaceAll(RegExp('ü'), 'u')
      .replaceAll(RegExp('ş'), 's')
      .replaceAll(RegExp('ı'), 'i')
      .replaceAll(RegExp('ö'), 'o')
      .replaceAll(RegExp('ç'), 'c');
}
