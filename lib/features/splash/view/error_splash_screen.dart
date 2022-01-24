part of 'splash_screen.dart';

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.onPressed, Key? key}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: context.allPadding(Sizes.med),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _errorChildren(context),
          ),
        ),
      );

  List<Widget> _errorChildren(BuildContext context) => <Widget>[
        const BaseText(SplashTexts.error),
        SizedBox(height: context.height * 3),
        ElevatedTextButton(
          onPressed: onPressed,
          text: SplashTexts.retry,
        ),
      ];
}
