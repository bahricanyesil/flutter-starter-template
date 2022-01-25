import 'package:intl/intl.dart';

/// Extensions on [DateTime] objects.
extension DateTimeExtension on DateTime {
  /// Gets the date-month format for the [DateTime].
  String get dm => DateFormat('d MMMM').format(this);

  /// Gets the date-month-year format for the [DateTime].
  String get dmy => DateFormat('d MMMM yyyy').format(this);

  /// Gets the date-month-year-hour-min format for the [DateTime].
  String get dmyhm => DateFormat('d MMMM yyyy HH:mm').format(this);

  /// Gets the date-month-year-hour-min-second format for the [DateTime].
  String get dmyhms => DateFormat('d MMMM yyyy HH:mm:ss').format(this);
}
