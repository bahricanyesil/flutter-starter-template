abstract class IErrorModel {
  String get errorMessage;
  int get statusCode;
  bool get isAuthenticationError;
}
