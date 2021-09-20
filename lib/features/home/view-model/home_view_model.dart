import '../../../core/base/view-model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  static const String screenName = 'Home Screen';
  HomeViewModel();

  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
