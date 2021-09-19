import '../../base/model/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

class ResponseModel<T> implements IResponseModel<T> {
  const ResponseModel({this.data, this.error});

  @override
  final T? data;
  @override
  final IErrorModel? error;

  @override
  set data(T? _data) => data = _data;

  @override
  set error(IErrorModel? _error) => error = _error;
}
