import 'package:dio/dio.dart';

import '../../base/model/base_models_shelf.dart';
import '../../constants/enums/request_types.dart';
import '../../models/error/error_model.dart';
import '../../models/response/l_response_model.dart';
import '../local/local_manager.dart';

abstract class INetworkManager {
  LocalManager localManager = LocalManager.instance;

  Future<IResponseModel<R>>
      send<R extends BaseModel<R>, T extends BaseModel<T>>(
    String path, {
    required RequestTypes type,
    required R parseModel,
    T? body,
    Map<String, Object>? queryParameters,
    bool requireAuth,
  });

  IResponseModel<R> successReturn<R extends BaseModel<R>>(
    Response<Map<String, dynamic>> response,
    R parseModel,
  );

  IResponseModel<R> errorReturn<R extends BaseModel<R>>(DioError error);

  IResponseModel<R> unauthenticatedError<R>() => ResponseModel<R>(
        error: ErrorModel(
          customMessage: 'Token is not valid anymore.',
          isAuthentication: false,
        ),
      );

  R? responseParser<R>(
      BaseModel<R> model, Response<Map<String, dynamic>> response) {
    if (response.data == null) return null;
    return model.fromJson(response.data!);
  }
}
