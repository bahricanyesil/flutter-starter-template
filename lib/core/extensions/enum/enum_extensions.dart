extension EnumValues on Enum {
  String get value => toString().split('.').last;
}
