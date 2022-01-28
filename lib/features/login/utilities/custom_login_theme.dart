part of '../view/login_screen.dart';

/// Contains various functions for customized themes.
mixin CustomLoginTheme {
  LoginViewTheme _desktopTheme(BuildContext context) =>
      _mobileTheme(context).copyWith(
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        formFieldHoverColor: context.primaryLightColor.lighten(.08),
        formFieldBackgroundColor: Colors.transparent,
        errorTextStyle: const TextStyle(color: AppColors.error),
        formElementsSpacing: context.responsiveSize * 2.4,
        spacingFormAndAction: context.responsiveSize * 4,
        dialogTheme: _dialogTheme(context)
            .copyWith(languageDialogTheme: _copyLanguageDialogTheme(context)),
        inputPadding:
            EdgeInsets.symmetric(vertical: context.responsiveSize * 4.5),
        loadingSocialButtonColor: context.primaryColor,
        loadingButtonColor: AppColors.white,
        loadingButtonSize: context.responsiveSize * 6,
      );

  LanguageDialogTheme? _copyLanguageDialogTheme(BuildContext context) =>
      _dialogTheme(context).languageDialogTheme?.copyWith(
            dialogOptionSize:
                Size(context.responsiveSize * 60, context.height * 7),
          );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  LoginViewTheme _mobileTheme(BuildContext context) => LoginViewTheme(
        backgroundColor: context.primaryColor,
        formFieldBackgroundColor: AppColors.white,
        textFormStyle: TextStyles(context).subBodyStyle(color: AppColors.black),
        hintTextStyle: TextStyles(context)
            .subBodyStyle(color: AppColors.black, fontSizeFactor: 4.7),
        formElementsSpacing: context.height,
        socialLoginHoverColor: AppColors.white,
        dialogTheme: _dialogTheme(context),
        welcomeTitleStyle: TextStyles(context).titleStyle(
            color: AppColors.white, fontSizeFactor: 9.8, letterSpacing: 2.3),
        errorTextStyle: const TextStyle(color: AppColors.white),
        errorBorderColor: AppColors.error,
        inputPadding: context.verticalPadding(Sizes.lowMed),
      );

  AnimatedDialogTheme _dialogTheme(BuildContext context) => AnimatedDialogTheme(
        languageDialogTheme: LanguageDialogTheme(
          languageTextStyle: TextStyles(context)
              .bodyStyle(color: AppColors.black, fontSizeFactor: 5.4),
          selectedItemTextColor: AppColors.white,
        ),
        contentPadding: context.bottomPadding(Sizes.low),
      );
}
