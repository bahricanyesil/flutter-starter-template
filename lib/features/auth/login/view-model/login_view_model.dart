import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/constants/curves/custom_curves.dart';
import '../../../../core/constants/duration/durations.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/responsiveness_extension.dart';

class LoginViewModel extends BaseViewModel {
  final Curve _curve = CustomCurves.fastMiddle;
  late final AnimationController animationController;
  late final Animation<double> leftWidgetAnimation;
  late final Animation<double> rightWidgetAnimation;
  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;
  String title = LangKeys.welcome;
  String description = LangKeys.welcomeDescription;
  String buttonText = LangKeys.signUp;
  String formTitle = LangKeys.signUpFormTitle;
  String useEmailText = LangKeys.signUpUseEmail;

  @override
  Future<void> init() async {
    // await Future<void>.delayed(const Duration(seconds: 2));
  }

  void initializeAnimations(TickerProvider tickerProv) {
    scaleAnimationController =
        AnimationController(vsync: tickerProv, duration: Durations.fast);
    scaleAnimation = Tween<double>(
      begin: .8,
      end: 1,
    ).animate(CurvedAnimation(parent: scaleAnimationController, curve: _curve));
    animationController =
        AnimationController(vsync: tickerProv, duration: Durations.normal);
    leftWidgetAnimation = Tween<double>(
      begin: 0,
      end: context.width * 60,
    ).animate(CurvedAnimation(parent: animationController, curve: _curve));
    rightWidgetAnimation = Tween<double>(
      begin: context.width * 40,
      end: 0,
    ).animate(CurvedAnimation(parent: animationController, curve: _curve));
    _addAnimationListeners();
  }

  void _addAnimationListeners() {
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.forward &&
          animationController.value >= .5) {
        title = LangKeys.welcomeBack;
        description = LangKeys.welcomeBackDescription;
        buttonText = LangKeys.signIn;
        formTitle = LangKeys.signInFormTitle;
        useEmailText = LangKeys.signInUseEmail;
      } else if (animationController.status == AnimationStatus.reverse &&
          animationController.value <= .5) {
        title = LangKeys.welcome;
        description = LangKeys.welcomeDescription;
        buttonText = LangKeys.signUp;
        formTitle = LangKeys.signUpFormTitle;
        useEmailText = LangKeys.signUpUseEmail;
      }
    });
  }

  @override
  void disposeLocal() {
    animationController.dispose();
    scaleAnimationController.dispose();
    super.disposeLocal();
  }
}
