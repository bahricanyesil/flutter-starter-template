import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/core/constants/curves/custom_curves.dart';
import 'package:template/core/constants/duration/durations.dart';
import 'package:template/core/theme/color/color_manager.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/context_extensions_shelf.dart';
import '../../../../core/extensions/string/image_path_extensions.dart';
import '../../../../core/widgets/text-form-fields/text_form_fields_shelf.dart';
import '../../../../core/widgets/texts/base_text.dart';
import '../view-model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final LoginViewModel model;
  late final AnimationController _animationController;
  late final Animation<double> leftWidgetAnimation;
  late final Animation<double> rightWidgetAnimation;
  final Curve _curve = CustomCurves.fastMiddle;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<double> _animation = Tween<double>(
    begin: .8,
    end: 1,
  ).animate(CurvedAnimation(parent: _controller, curve: _curve));

  @override
  void initState() {
    super.initState();
    model = context.read<LoginViewModel>();
    _animationController =
        AnimationController(vsync: this, duration: Durations.normal);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      leftWidgetAnimation = // ignore: prefer_int_literals
          Tween<double>(
        begin: 0,
        end: context.width * 60,
      ).animate(CurvedAnimation(parent: _animationController, curve: _curve));
      rightWidgetAnimation = // ignore: prefer_int_literals
          Tween<double>(
        begin: context.width * 40,
        end: 0,
      ).animate(CurvedAnimation(parent: _animationController, curve: _curve));
    });
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<LoginViewModel>(bodyBuilder: bodyBuilder);

  Widget bodyBuilder(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) => Stack(
          children: <Widget>[
            Image.asset('assets/images/auth/login_bg.png', fit: BoxFit.fill),
            _leftTransformWidget(),
            _rightTransformWidget(),
            // Positioned(
            //   bottom: 10,
            //   left: 400,
            //   child: TextButton(
            //       child: Text('Animate'),
            //       onPressed: () {
            //         _controller
            //             .forward()
            //             .whenComplete(() => _controller.reverse());
            //         _animationController.isCompleted
            //             ? _animationController.reverse()
            //             : _animationController.forward();
            //       }),
            // ),
          ],
        ),
      );

  Widget _leftTransformWidget() => Transform.translate(
        offset: Offset(leftWidgetAnimation.value, 0),
        child: Container(
          transform: Matrix4.diagonal3Values(_animation.value, 1, 1),
          width: context.width * 50,
          height: context.height * 100,
          color: AppColors.lightSeaColor.withOpacity(.84),
          child: _welcomeTexts(),
        ),
      );

  Widget _rightTransformWidget() => Transform.translate(
        offset: Offset(rightWidgetAnimation.value, 0),
        child: Container(
          transform: Matrix4.diagonal3Values(_animation.value, 1, 1),
          width: context.width * (600 / 8),
          height: context.height * 100,
          color: Colors.white,
        ),
      );

  Widget _welcomeTexts() => Column(
        children: <Widget>[
          const Spacer(flex: 5),
          Expanded(
              flex: 2,
              child: BaseText(LangKeys.welcome,
                  style: context.headline1.copyWith(color: Colors.white))),
          SizedBox(height: context.height * 2),
          Expanded(flex: 1, child: BaseText('ADasd', color: Colors.white)),
          SizedBox(height: context.height * 3),
          Expanded(flex: 2, child: BaseText('ADasd', color: Colors.white)),
          const Spacer(flex: 5),
        ],
      );

  // Form _getForm(BuildContext context) => Form(
  //       key: model.formKey,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           CustomTextFormField(
  //             controller: model.emailController,
  //             hintText: 'Email',
  //             prefixIcon: Icons.email_outlined,
  //           ),
  //           SizedBox(height: context.height * 4),
  //           ObscuredTextFormField(
  //             controller: model.passwordController,
  //             hintText: 'Password',
  //             prefixIcon: Icons.password_outlined,
  //           ),
  //         ],
  //       ),
  //     );
}
