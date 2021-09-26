import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  // late final TextEditingController emailController;
  // late final TextEditingController passwordController;
  // late final GlobalKey<FormState> formKey;

  @override
  Future<void> init() async {
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // formKey = GlobalKey<FormState>();
    await Future<void>.delayed(const Duration(seconds: 2));
  }

  Future<void> request() async {
    // try {
    //   final res = await Dio().put(
    //     'https://api.yesilhealth.com/api/users/signin',
    //     options: Options(contentType: 'application/json'),
    //     data: {"email": "bahrican@gmail.com", "password": "12314"},
    //   );
    //   print(res);
    // } on DioError catch (err) {
    //   print(err);
    // }
  }
}
