import 'package:flutter/material.dart';

import '../../../core/constants/enums/view-enums/sizes.dart';
import '../../../core/extensions/context/responsiveness_extensions.dart';
import '../../../core/widgets/widgets_shelf.dart';
import '../../home/view/home_screen.dart';
import '../constants/splash_texts.dart';

part './error_splash_screen.dart';

/// Splash screen of the app.
class SplashScreen extends StatefulWidget {
  /// Default constructor for splash screen.
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashTexts {
  late Future<bool> _initialize;
  bool _retrying = false;

  @override
  void initState() {
    super.initState();
    _initialize = _initializeApp();
  }

  @override
  Widget build(BuildContext context) =>
      FutureBuilder<bool>(future: _initialize, builder: _builder);

  Widget _builder(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasData && !_retrying) {
      return const HomeScreen();
    } else if (snapshot.hasError && !_retrying) {
      return _ErrorScreen(onPressed: _onRetry);
    }
    return const Scaffold(body: LoadingIndicator());
  }

  void _onRetry() {
    _initialize = _retryInitialization();
    setState(() => _retrying = true);
  }

  Future<bool> _initializeApp() async => false;

  Future<bool> _retryInitialization() async {
    _retrying = false;
    return true;
  }
}
