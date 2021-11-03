import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/constants/curves/custom_curves.dart';
import '../../../../core/constants/duration/durations.dart';
import '../../../../core/constants/lang/lang_keys.dart';

class LoginViewModel extends BaseViewModel {
  final Curve _curve = CustomCurves.fastMiddle;

  late final AnimationController animationController;
  late final Animation<double> leftWidgetAnimation;
  late final Animation<double> rightWidgetAnimation;
  late Animation<double> offsetAnimation;

  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String title = LangKeys.welcome;
  String description = LangKeys.welcomeDescription;
  String buttonText = LangKeys.signUp;
  String reverseButtonText = LangKeys.signIn;
  String formTitle = LangKeys.signUpFormTitle;
  String useEmailText = LangKeys.signUpUseEmail;

  List<Function()> socialLoginActions = <Function()>[
    _facebookLogin,
    _googleLogin,
    _linkedinLogin,
  ];
  List<String> socialLoginIcons = <String>['facebook', 'google', 'linkedin'];

  @override
  Future<void> init() async {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  bool get isForwardAnimation => animationController.value <= .5;
  bool get isReverseAnimation => animationController.value >= .5;

  void initializeAnimations(TickerProvider tickerProv) {
    scaleAnimationController =
        AnimationController(vsync: tickerProv, duration: Durations.fast);
    scaleAnimation = _animate(Tween<double>(begin: 1, end: 1.2),
        controller: scaleAnimationController);
    animationController =
        AnimationController(vsync: tickerProv, duration: Durations.normal);
    leftWidgetAnimation = _animate(Tween<double>(begin: 0, end: 60));
    rightWidgetAnimation = _animate(Tween<double>(begin: 40, end: 0));
    offsetAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        _tweenSequenceItem(end: 50),
        _tweenSequenceItem(begin: 50, end: 50, weight: 10),
        _tweenSequenceItem(begin: -50),
      ],
    ).animate(CurvedAnimation(parent: animationController, curve: _curve));
    _addAnimationListeners();
  }

  Animation<double> _animate(Tween<double> tween,
          {AnimationController? controller}) =>
      tween.animate(CurvedAnimation(
          parent: controller ?? animationController, curve: _curve));

  TweenSequenceItem<double> _tweenSequenceItem({
    double begin = 0,
    double end = 0,
    double weight = 30,
  }) =>
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: begin, end: end), weight: weight);

  void _addAnimationListeners() {
    animationController.addListener(() {
      if (isReverseAnimation && title != LangKeys.welcomeBack) {
        title = LangKeys.welcomeBack;
        description = LangKeys.welcomeBackDescription;
        buttonText = LangKeys.signIn;
        reverseButtonText = LangKeys.signUp;
        formTitle = LangKeys.signInFormTitle;
        useEmailText = LangKeys.signInUseEmail;
      } else if (isForwardAnimation && title != LangKeys.welcome) {
        title = LangKeys.welcome;
        description = LangKeys.welcomeDescription;
        buttonText = LangKeys.signUp;
        reverseButtonText = LangKeys.signIn;
        formTitle = LangKeys.signUpFormTitle;
        useEmailText = LangKeys.signUpUseEmail;
      }
    });
  }

  void animate() {
    scaleAnimationController
        .forward()
        .then((void value) => scaleAnimationController.reverse());
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
  }

  Future<void> request() async {
    try {
      final res = await Dio().request(
        'https://jetrikapi.azurewebsites.net/api/restaurantservices',
        options: Options(contentType: 'application/json', method: 'GET'),
        data: jsonEncode({"id": 1}),
      );
      print(res);
    } on DioError catch (err) {
      print(err.response);
    }
  }

  static void _facebookLogin() {}
  static void _googleLogin() {}
  static void _linkedinLogin() {}

  @override
  void disposeLocal() {
    animationController.dispose();
    scaleAnimationController.dispose();
    super.disposeLocal();
  }
}
