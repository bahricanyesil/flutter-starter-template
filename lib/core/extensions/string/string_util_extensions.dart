/// Utility extensions for [String] class.
extension StringUtilExtensions on String {
  /// To use correct ellipsis behavior on text overflows.
  String get useCorrectEllipsis => replaceAll('', '\u200B');

  /// Returns the icon asset path for the given name.
  String get iconPng => 'assets/images/icons/$this.png';

  /// Puts comma for every 3 digits before the decimal points.
  String thousandComma({int fraction = 4}) {
    int dotIndex = indexOf('.');
    if (dotIndex == -1) dotIndex = length;
    final String afterDot = substring(dotIndex);
    final String beforeDot = substring(0, dotIndex);
    int index = beforeDot.length - 1;
    int counter = 1;
    String completeString = '';
    while (index >= 0) {
      completeString = beforeDot[index] + completeString;
      if (counter == 3 && index != 0) {
        completeString = ',$completeString';
        counter = 0;
      }
      index--;
      counter++;
    }
    int lastIndex = fraction + 1;
    if (lastIndex >= afterDot.length) {
      lastIndex = afterDot.length;
    }
    return completeString + (afterDot.substring(0, lastIndex));
  }
}
