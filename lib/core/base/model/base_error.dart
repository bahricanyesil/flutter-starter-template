import 'package:dio/dio.dart';

// TODO(bahrican): Base folder will be reviewed

mixin IErrorModel {
  String errorMessage();
  int statusCode();
  bool isAuthenticated();
}

class BaseError with IErrorModel {
  BaseError(
      {DioError? dioError, String? customMessage, bool authenticated = true})
      : _dioError = dioError,
        _customMessage = customMessage,
        _authenticated = authenticated;

  final DioError? _dioError;
  final String? _customMessage;
  final bool _authenticated;

  @override
  String errorMessage() =>
      _customMessage ??
      _dioError?.response?.data ??
      'Undetermined Error Message';

  @override
  int statusCode() {
    if (_dioError?.response?.statusCode is int) {
      return _dioError!.response!.statusCode!;
    }
    return 500;
  }

  @override
  bool isAuthenticated() => _authenticated;
}
