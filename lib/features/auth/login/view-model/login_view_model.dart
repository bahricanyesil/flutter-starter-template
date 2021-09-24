import 'package:dio/dio.dart';

import '../../../../core/base/view-model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  Future<void> request() async {
    try {
      final res = await Dio().put(
        'https://api.yesilhealth.com/api/users/signin',
        options: Options(contentType: 'application/json'),
        data: {"email": "bahrican@gmail.com", "password": "12314"},
      );
      print(res);
    } on DioError catch (err) {
      print(err);
    }
  }
}
