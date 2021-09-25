import 'package:template/features/home/model/home_model.dart';

import '../../../core/base/view-model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
