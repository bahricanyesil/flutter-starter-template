import 'package:dio/dio.dart';
import '../../base/model/base_error.dart';

class ErrorModel implements IErrorModel {
  ErrorModel({
    DioError? dioError,
    String? customMessage,
    bool isAuthentication = false,
  })  : _dioError = dioError,
        _customMessage = customMessage,
        _isAuthentication = isAuthentication;

  final DioError? _dioError;
  final String? _customMessage;
  final bool _isAuthentication;

  @override
  String get errorMessage =>
      _customMessage ??
      _dioError?.response?.data ??
      'Undetermined Error Message';

  @override
  int get statusCode {
    if (_dioError?.response?.statusCode is int) {
      return _dioError!.response!.statusCode!;
    }
    return 500;
  }

  @override
  bool get isAuthenticationError => _isAuthentication;
}
