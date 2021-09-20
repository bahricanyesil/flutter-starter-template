import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/widgets/texts/base_text.dart';
import '../view-model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<HomeViewModel>(
        bodyBuilder: bodyBuilder,
      );

  Widget bodyBuilder(BuildContext context) =>
      const Center(child: BaseText(HomeViewModel.screenName));
}
