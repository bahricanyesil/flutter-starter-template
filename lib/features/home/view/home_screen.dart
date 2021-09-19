import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../view-model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<HomeViewModel>(
        bodyBuilder: bodyBuilder,
      );

  Widget bodyBuilder(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Expanded(
                flex: 4,
                child: TextButton(
                  child: Text('YEWSS', textAlign: TextAlign.center),
                  onPressed: () async =>
                      context.read<HomeViewModel>().request(),
                )),
            Spacer(flex: 5),
          ],
        ),
      );
}
