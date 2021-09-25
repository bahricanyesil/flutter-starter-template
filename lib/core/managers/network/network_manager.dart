import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../base/model/base_models_shelf.dart';
import '../../constants/constants_shelf.dart';
import '../../extensions/enum/enum_extensions.dart';
import '../../models/models_shelf.dart';
import 'authentication/service/authentication_services_shelf.dart';
import 'l_network_manager.dart';

part 'network_manager_operations.dart';

// ignore: prefer_mixin
class NetworkManager extends INetworkManager with DioMixin implements Dio {
  factory NetworkManager() => _instance;
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  NetworkManager._init() {
    options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: 'application/json',
    );
    interceptors.add(InterceptorsWrapper());
    _authenticationService = AuthenticationService(networkManager: this);
    httpClientAdapter =
        kIsWeb ? BrowserHttpClientAdapter() : DefaultHttpClientAdapter();
  }

  late IAuthenticationService _authenticationService;

  @override
  Future<IResponseModel<R>>
      send<R extends BaseModel<R>, T extends BaseModel<T>>(
    String path, {
    required RequestTypes type,
    required R parseModel,
    T? body,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
  }) async {
    try {
      if (requireAuth && !await _tokenCheck()) return unauthenticatedError<R>();
      final Response<Map<String, dynamic>> response = await request(
        path,
        data: body,
        options: Options(method: type.value),
        queryParameters: queryParameters,
      );
      return successReturn<R>(response, parseModel);
    } on DioError catch (error) {
      return errorReturn<R>(error);
    } on Exception catch (_) {
      return ResponseModel<R>(
        error: ErrorModel(customMessage: 'Exception Is Occurred'),
      );
    }
  }

  @override
  IResponseModel<R> successReturn<R extends BaseModel<R>>(
    Response<Map<String, dynamic>> response,
    R parseModel,
  ) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.accepted:
        final R? responseModel = responseParser<R>(parseModel, response);
        if (responseModel != null) return ResponseModel<R>(data: responseModel);
        return _defaultRes<R>('Unexpected Return Type.');
      default:
        return _defaultRes<R>('Undetermined Error Is Occurred');
    }
  }

  @override
  IResponseModel<R> errorReturn<R extends BaseModel<R>>(DioError error) {
    String? errorMessage;
    try {
      final Map<String, dynamic>? data = error.response?.data;
      if (data != null) {
        final List<ResponseBodyModel> resModels = _parseErrors(data);
        if (resModels.isNotEmpty) errorMessage = resModels[0].message?.en;
      }
      errorMessage ??= error.response?.data.toString();
    } on Exception catch (err) {
      errorMessage = err.toString();
    }
    return _defaultRes(errorMessage ?? 'Unknown Error', dioError: error);
  }

  List<ResponseBodyModel> _parseErrors(Map<String, dynamic> body) =>
      (body['errors'] as List<dynamic>?)
          ?.map<ResponseBodyModel>(
              (dynamic json) => const ResponseBodyModel().fromJson(json))
          .toList() ??
      <ResponseBodyModel>[];

  static ResponseModel<R> _defaultRes<R>(
    String message, {
    DioError? dioError,
  }) =>
      ResponseModel<R>(
        error: ErrorModel(customMessage: message, dioError: dioError),
      );
}
