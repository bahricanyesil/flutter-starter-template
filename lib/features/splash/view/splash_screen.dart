import 'package:flutter/material.dart';
import '../../../core/constants/durations/durations.dart';

import '../../../core/constants/enums/sizes.dart';
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
  Widget build(BuildContext context) => FutureBuilder<bool>(
      future: _initialize,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && !_retrying) {
          return const HomeScreen();
        } else if (snapshot.hasError && !_retrying) {
          return _ErrorScreen(onPressed: _onRetry);
        }
        return const Scaffold(body: LoadingIndicator());
      });

  void _onRetry() {
    setState(() => _retrying = true);
    _initialize = _retryInitialization();
  }

  Future<bool> _initializeApp() async {
    // Example Error
    // await Future<void>.delayed(Durations.slowMed);
    // throw Error();
    await Future<void>.delayed(Durations.tooFast);
    return true;
  }

  Future<bool> _retryInitialization() async {
    await Future<void>.delayed(Durations.slowMed);
    _retrying = false;
    return true;
  }
}
