import 'package:template/core/models/error/error_model.dart';
import 'package:template/core/models/response/l_response_model.dart';

import '../../../core/base/view-model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel();

  @override
  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> request() async {
    await apiRequestLoading(func: at, afterRequest: afrequest);
  }

  Future<void> afrequest() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<IResponseModel<dynamic>> at() async {
    await Future.delayed(Duration(seconds: 2));
    return ResponseModel<ErrorModel>(
        error: ErrorModel(customMessage: 'adsasd'));
  }
}
