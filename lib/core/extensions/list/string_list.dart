extension StringListExtensions on List<String> {
  String get listToString {
    if (isEmpty) return '';
    sortAlphabetical();
    final StringBuffer buffer = StringBuffer(this[0]);
    for (int i = 1; i < length; i++) {
      buffer.write(', ${this[i]}');
    }
    return buffer.toString();
  }

  String get listToOrdered {
    if (isEmpty) return '';
    sortAlphabetical();
    final StringBuffer buffer = StringBuffer('1- ${this[0]}');
    for (int i = 1; i < length; i++) {
      buffer.write('\n${i + 1}- ${this[i]}');
    }
    return buffer.toString();
  }

  void sortAlphabetical() =>
      sort((String a, String b) => a.toLowerCase().compareTo(b.toLowerCase()));
}
