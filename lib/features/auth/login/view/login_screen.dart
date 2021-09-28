import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/context_extensions_shelf.dart';
import '../../../../core/theme/color/color_manager.dart';
import '../../../../core/widgets/buttons/rounded_button.dart';
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

  @override
  void initState() {
    super.initState();
    model = context.read<LoginViewModel>();
    WidgetsBinding.instance!.addPostFrameCallback(
        (Duration ts) => model.initializeAnimations(this));
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<LoginViewModel>(bodyBuilder: bodyBuilder);

  Widget bodyBuilder(BuildContext context) {
    final AnimationController controller = model.animationController;
    final AnimationController scaleController = model.scaleAnimationController;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => Stack(
        children: <Widget>[
          Image.asset('assets/images/auth/login_bg.png', fit: BoxFit.fill),
          Container(color: AppColors.lightSeaColor.withOpacity(.84)),
          _rightTransformWidget(),
          _leftTransformWidget(),
          Positioned(
            bottom: 10,
            left: 400,
            child: TextButton(
                child: Text('Animate'),
                onPressed: () {
                  scaleController.forward().then(
                        (void value) => scaleController.reverse(),
                      );
                  controller.isCompleted
                      ? controller.reverse()
                      : controller.forward();
                }),
          ),
        ],
      ),
    );
  }

  Widget _leftTransformWidget() => Transform.translate(
        offset: Offset(model.leftWidgetAnimation.value, 0),
        child: Container(
          transform: Matrix4.diagonal3Values(model.scaleAnimation.value, 1, 1),
          width: context.width * 50,
          height: context.height * 100,
          child: _welcomeTexts(),
        ),
      );

  Widget _rightTransformWidget() => Transform.translate(
        offset: Offset(model.rightWidgetAnimation.value, 0),
        child: Container(
          transform: Matrix4.diagonal3Values(model.scaleAnimation.value, 1, 1),
          width: context.width * (600 / 8),
          height: context.height * 100,
          color: Colors.white,
          child: _formColumn(),
        ),
      );

  Widget _welcomeTexts() => Padding(
        padding: context.horizontalHigh,
        child: Column(
          children: <Widget>[
            const Spacer(flex: 5),
            Expanded(
              flex: 3,
              child: BaseText(model.title, style: context.headline1),
            ),
            SizedBox(height: context.height * 4),
            Expanded(
              flex: 2,
              child: BaseText(model.description, style: context.headline2),
            ),
            SizedBox(height: context.height * 6),
            Expanded(
              flex: 2,
              child: RoundedButton(
                buttonText: model.buttonText,
                onPressed: () {},
                borderColor: Colors.white,
                backgroundColor: context.primaryColor.withOpacity(.8),
                width: context.width * 25,
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      );

  Widget _formColumn() => Padding(
        padding: context.horizontalHigh,
        child: Column(
          children: <Widget>[
            const Spacer(flex: 2),
            Expanded(
              flex: 3,
              child: BaseText(
                model.formTitle,
                style: context.headline1.copyWith(color: context.primaryColor),
              ),
            ),
            SizedBox(height: context.height * 4),
            Expanded(
              flex: 2,
              child: BaseText(model.description, style: context.headline2),
            ),
            SizedBox(height: context.height * 6),
            Expanded(
              flex: 2,
              child: RoundedButton(
                buttonText: model.buttonText,
                onPressed: () {},
                backgroundColor: context.primaryColor.withOpacity(.8),
                width: context.width * 25,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
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
