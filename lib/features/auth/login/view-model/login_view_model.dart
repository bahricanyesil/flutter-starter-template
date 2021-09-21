import '../../../../core/base/view-model/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  static const String screenName = 'Login Screen';

  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
