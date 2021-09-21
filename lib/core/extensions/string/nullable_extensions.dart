import 'package:collection/collection.dart';
import '../enum/enum_extensions.dart';

extension NullableExtensions on String? {
  T? toEnum<T extends Enum>(List<T> values) =>
      values.firstWhereOrNull((T e) => e.value == this?.toLowerCase());
}
