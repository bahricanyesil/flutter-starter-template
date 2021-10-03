import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/context_extensions_shelf.dart';
import '../../../../core/extensions/string/image_path_extensions.dart';
import '../../../../core/theme/color/color_manager.dart';
import '../../../../core/widgets/widgets_shelf.dart';
import '../view-model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late LoginViewModel model;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration ts) =>
        context.read<LoginViewModel>().initializeAnimations(this));
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<LoginViewModel>(bodyBuilder: bodyBuilder, resize: false);

  Widget bodyBuilder(BuildContext context) {
    model = context.read<LoginViewModel>();
    return AnimatedBuilder(
      animation: model.animationController,
      builder: (_, __) => Stack(
        children: <Widget>[
          _backgroundImage,
          Container(color: AppColors.lightSeaColor.withOpacity(.7)),
          _leftTransformWidget,
          _rightTransformWidget,
        ],
      ),
    );
  }

  Widget get _backgroundImage => Image.asset(
        'assets/images/auth/${model.isLandscape ? 'login_bg_vertical.png' : 'login_bg.png'}',
        fit: BoxFit.fill,
      );

  Widget get _leftTransformWidget => Transform.translate(
        offset: Offset(context.width * model.leftWidgetAnimation.value, 0),
        child: Transform(
          transform: Matrix4.diagonal3Values(model.scaleAnimation.value, 1, 1),
          child: Container(
            color: AppColors.lightSeaColor
                .withOpacity(model.animationController.value <= .4 ? .7 : 1),
            width: context.width * 40,
            height: context.height * 100,
            child: _welcomeTexts,
          ),
        ),
      );

  Widget get _rightTransformWidget => Transform.translate(
        offset: Offset(context.width * model.rightWidgetAnimation.value, 0),
        child: Transform(
          transform: Matrix4.diagonal3Values(model.scaleAnimation.value, 1, 1),
          child: Container(
            width: context.width * 60,
            height: context.height * 100,
            color: Colors.white,
            child: _formColumn,
          ),
        ),
      );

  Widget get _welcomeTexts => Padding(
        padding: context.horizontalMedHigh,
        child: Column(
          children: <Widget>[
            const Spacer(flex: 10),
            Expanded(
              flex: 6,
              child: BaseText(model.title, style: context.headline1),
            ),
            SizedBox(height: context.height * 4),
            Expanded(flex: 4, child: _description),
            SizedBox(height: context.height * 6),
            Expanded(flex: 3, child: _changeActionButton),
            const Spacer(flex: 10),
          ],
        ),
      );

  Widget get _description => NotFittedText(
        model.description,
        maxLines: 2,
        style: context.headline4,
      );

  Widget get _changeActionButton => RoundedButton(
        buttonText: model.reverseButtonText,
        onPressed: model.animate,
        borderColor: Colors.white,
        backgroundColor: context.primaryColor.withOpacity(.8),
        width: context.width * 15,
      );

  Widget get _formColumn => Transform.translate(
        offset: Offset(context.width * model.offsetAnimation.value, 0),
        child: Padding(
          padding: context.horizontalHigh,
          child: Column(
            children: <Widget>[
              const Spacer(flex: 2),
              Expanded(flex: 3, child: _formTitle),
              SizedBox(height: context.height * 2),
              Expanded(child: _socialLoginOptions),
              SizedBox(height: context.height * 8),
              Expanded(flex: 2, child: _useEmailText),
              SizedBox(height: context.height * 2),
              Expanded(flex: 15, child: _form),
              SizedBox(height: context.height * 3),
              Expanded(flex: 3, child: _actionButton),
              const Spacer(flex: 2),
            ],
          ),
        ),
      );

  Widget get _formTitle => BaseText(
        model.formTitle,
        style: context.headline1.copyWith(color: context.primaryColor),
      );

  Widget get _socialLoginOptions => Wrap(
        spacing: context.width * 2,
        alignment: WrapAlignment.center,
        children: _socialLoginButtons,
      );

  Widget get _useEmailText => BaseText(
        model.useEmailText,
        style: context.headline6.copyWith(color: Colors.black),
      );

  List<Widget> get _socialLoginButtons => List<Widget>.generate(
        model.socialLoginIcons.length,
        (int index) => CircleWidget(
          onTap: model.socialLoginActions[index],
          child: model.socialLoginIcons[index].pngAuth,
        ),
      );

  Widget get _actionButton => RoundedButton(
        buttonText: model.buttonText,
        onPressed: () {},
        backgroundColor: context.primaryColor.withOpacity(.8),
        width: context.width * 25,
      );

  Form get _form => Form(
        key: model.formKey,
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: context.height * 2,
          children: <Widget>[
            CustomTextFormField(
              controller: model.nameController,
              hintText: 'Name',
              prefixIcon: Icons.person_outline,
            ),
            CustomTextFormField(
              controller: model.emailController,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
            ),
            _lastFormElement,
          ],
        ),
      );

  Widget get _lastFormElement => model.isForwardAnimation
      ? ObscuredTextFormField(
          controller: model.passwordController,
          hintText: 'Password',
          prefixIcon: Icons.password_outlined,
        )
      : Padding(
          padding: context.topMed,
          child: const BaseText(
            LangKeys.forgotPassword,
            color: Colors.black87,
          ),
        );
}
