/// Extensions for [num] types to convert to a [String].
extension NumToStringExtensions on num {
  /// Deletes all trailing decimal zeros.
  String get delDecimalZeros {
    final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    final String stringForm = toString();
    if (stringForm.indexOf('.') < stringForm.length - 4) {
      return toStringAsFixed(4).replaceAll(regex, '');
    }
    return toString().replaceAll(regex, '');
  }
}
