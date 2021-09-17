import '../../base/model/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  BaseError? error;
}

class ResponseModel<T> implements IResponseModel<T> {
  const ResponseModel({this.data, this.error});

  @override
  final T? data;
  @override
  final BaseError? error;

  @override
  set data(T? _data) => data = _data;

  @override
  set error(BaseError? _error) => error = _error;
}
