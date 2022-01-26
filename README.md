# flutter-starter-template
A boilerplate/starter project for quickly building mobile applications/websites with Flutter. You can use this template when you're starting a new project. It contains general concepts, you can customize it according to your needs.

You will get a comprehensive Flutter app that is configured based on the most frequent needs while developing a mobile app. The app comes with many built-in features, such as navigation manager (with Navigator 2.0), storage manager (with hive), multilanguage support, multi-theme support, atomic widgets, MVVM design pattern, base abstract classes, clean code principles, helpful extensions, and all other countless things that will help you to develop the best app according to your needs!

This template has been developed by Bahrican Yesil with real-time app experiences over time. It will continue to improve in time with new experiences, novel knowledge, and your valuable contributions. Get ready for more. Star it, contribute, and put it forward!

<br />

## Table of Contents

<!-- TABLE-OF-CONTENTS:START -->
- [Features](https://github.com/bahricanyesil/flutter-starter-template#features)
- [Project Structure](https://github.com/bahricanyesil/flutter-starter-template#project-structure)
- [Contributing](https://github.com/bahricanyesil/flutter-starter-template#contributing)
<!-- TABLE-OF-CONTENTS:END -->

<br />

## [Features](#features)

<!-- FEATURES:START -->
- [Multi-Language](https://github.com/bahricanyesil/flutter-starter-template#multi-language)
- [Multi-Theme](https://github.com/bahricanyesil/flutter-starter-template#multi-theme)
- [Initial App - Mobile/Web](https://github.com/bahricanyesil/flutter-starter-template#initial-app)
- [Base Model/View/View-Model](https://github.com/bahricanyesil/flutter-starter-template#base)
- [Constants and Decoration](https://github.com/bahricanyesil/flutter-starter-template#constants-and-decoration)
- [Extensions](https://github.com/bahricanyesil/flutter-starter-template#extensions)
- [Managers - Storage, Navigation and Network](https://github.com/bahricanyesil/flutter-starter-template#managers)
- [Providers](https://github.com/bahricanyesil/flutter-starter-template#providers)
- [Widgets](https://github.com/bahricanyesil/flutter-starter-template#widgets)
- [Splash](https://github.com/bahricanyesil/flutter-starter-template#splash)
- [Example Settings Screen](https://github.com/bahricanyesil/flutter-starter-template#example-settings-screen)
- [Example Home Screen](https://github.com/bahricanyesil/flutter-starter-template#example-home-screen)
- [Animated Login Screen](https://github.com/bahricanyesil/flutter-starter-template#animated-login)
<!-- FEATURES:END -->

<br />

## [Multi-Language](#multi-language)

- Multi-language support is implemented with [flutter_localizations SDK](https://docs.flutter.dev/development/accessibility-and-localization/internationalization) by following the base guideleness in the given link.
- You can refer to [this article](https://medium.com/flutter-community/flutter-internationalization-the-easy-way-using-provider-and-json-c47caa4212b2) to know more about the implementation details. Most of the things are similar to that approach.
- First of all, `WidgetsFlutterBinding.ensureInitialized();` line is added as the initial line of the main function. Refer to [this stackoverflow post](https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do) to learn the details of this line. 
- Secondly, according to the steps which are also indicated in the medium post, created an `AppLocalizations` class with `_AppLocalizationsDelegate`. Loading the corresponding json file for the current language, translating the key value, and etc. are performed with the help of this localization class.
- Then, created a provider class to manage the language changes, notify accordingly, store and fetch the last selected language and so on.
- Added an extra extension on "BuildContext" to translate texts with a shortcut. You can use `context.tr([key])` to get the translated value of the given key.
- Added supported locale info and other required parameters to the "MaterialApp" in the initial app files.
- Created example "tr.json" and "en.json" files to store key-value pairs for Turkish and English languages under the 'assets/lang/' path.

<br />

## [Multi-Theme](#multi-theme)

- Multi-theme support is implemented by firstly defining base abstract classes in the core folder. These abstract classes provide generic structure for any project that will be customizing them by extending.
- **Base Abstract Classes**:
  - **IColors**: Contains the base color parameters for the theme
  (e.g. scaffoldBackgroundColor, primaryColorLight)
  - **ITextTheme**: Contains the TextTheme customized according to the given primary and secondary text colors.
  - **ITheme**: Using the IColors and ITextTheme class instances, creates a complete `ThemeData`.
- An example use of these abstract classes for dark and light themes are provided under the 'product/theme/' path.
- Created a ThemeProvider similar to LanguageProvider to manage theme changes, notify accordingly, store and fetch the last selected theme preference and so on. 

<br />

## [Project Structure](#project-structure)

```js
├─ lib
│  ├─ core
│  │  ├─ base
│  │  │  ├─ model
│  │  │  │  └─ base_model.dart
│  │  │  ├─ view
│  │  │  │  └─ base_view.dart
│  │  │  └─ view-model
│  │  │     └─ base_view_model.dart
│  │  ├─ constants
│  │  │  ├─ border
│  │  │  │  ├─ border_constants.dart
│  │  │  │  ├─ border_radii.dart
│  │  │  │  └─ shape_borders.dart
│  │  │  ├─ durations
│  │  │  │  └─ durations.dart
│  │  │  ├─ enums
│  │  │  │  ├─ sizes.dart
│  │  │  │  ├─ text_color.dart
│  │  │  │  ├─ view_states.dart
│  │  │  │  └─ enums_shelf.dart
│  │  │  ├─ navigation
│  │  │  │  └─ navigation_constants.dart
│  │  │  ├─ tweens
│  │  │  │  └─ delay_tween.dart
│  │  │  └─ constants_shelf.dart
│  │  ├─ decoration
│  │  │  └─ text_styles.dart
│  │  ├─ extensions
│  │  │  ├─ color
│  │  │  │  └─ color_extensions.dart
│  │  │  ├─ context
│  │  │  │  ├─ language_helpers.dart
│  │  │  │  ├─ responsiveness_extensions.dart
│  │  │  │  ├─ theme_extensions.dart
│  │  │  │  └─ context_extensions_shelf.dart
│  │  │  ├─ date
│  │  │  │  └─ date_time_extensions.dart
│  │  │  ├─ num
│  │  │  │  └─ double_extensions.dart
│  │  │  ├─ string
│  │  │  │  ├─ string_util_extensions.dart
│  │  │  │  ├─ type_conversion_extensions.dart
│  │  │  │  └─ string_extensions_shelf.dart
│  │  │  ├─ text-style
│  │  │  │  ├─ text_align_extensions.dart
│  │  │  │  └─ decoration_extensions.dart
│  │  │  └─ extensions_shelf.dart
│  │  ├─ helpers
│  │  │  ├─ hasher.dart
│  │  │  └─ material_state_helper.dart
│  │  ├─ managers
│  │  │  ├─ navigation
│  │  │  │  ├─ navigation_manager.dart
│  │  │  │  ├─ route_info_parser.dart
│  │  │  │  ├─ screen_config.dart
│  │  │  │  └─ navigation_shelf.dart
│  │  │  └─ storage
│  │  │     └─ l_local_manager.dart
│  │  ├─ providers
│  │  │  ├─ language
│  │  │  │  ├─ app_localizations.dart
│  │  │  │  └─ language_provider.dart
│  │  │  ├─ theme
│  │  │  │  └─ theme_provider.dart
│  │  │  ├─ provider_list.dart
│  │  │  └─ providers_shelf.dart
│  │  ├─ theme
│  │  │  ├─ color
│  │  │  │  └─ l_colors.dart
│  │  │  ├─ text
│  │  │  │  └─ l_text_theme.dart
│  │  │  └─ l_theme.dart
│  │  └─ widgets
│  │  │  ├─ app-bar
│  │  │  │  └─ default_app_bar.dart
│  │  │  ├─ buttons
│  │  │  │  ├─ default_icon_button.dart
│  │  │  │  └─ elevated_text_button.dart
│  │  │  ├─ checkbox
│  │  │  │  └─ custom_checkbox.dart
│  │  │  ├─ divider
│  │  │  │  └─ custom_divider.dart
│  │  │  ├─ icons
│  │  │  │  └─ base_icon.dart
│  │  │  ├─ indicators
│  │  │  │  └─ loading_indicator.dart
│  │  │  ├─ slider
│  │  │  │  └─ customized_slider.dart
│  │  │  ├─ text
│  │  │  │  ├─ colored-text
│  │  │  │  │  ├─ bullet_colored_text.dart
│  │  │  │  │  └─ colored_text.dart
│  │  │  │  ├─ lined-text
│  │  │  │  │  └─ lined_text.dart
│  │  │  │  ├─ base_text.dart
│  │  │  │  ├─ not_fitted_text.dart
│  │  │  │  └─ text_widgets_shelf.dart
│  │  │  └─ widgets_shelf.dart
│  ├─ features
│  │  ├─ home
│  │  │  ├─ constants
│  │  │  │  └─ home_texts.dart
│  │  │  ├─ utilities
│  │  │  │  └─ listen_home_value.dart
│  │  │  ├─ view
│  │  │  │  ├─ components
│  │  │  │  │  └─ list_item.dart
│  │  │  │  └─ home_screen.dart
│  │  │  └─ view-model
│  │  │     └─ home_view_model.dart
│  │  ├─ settings
│  │  │  ├─ constants
│  │  │  │  └─ settings_texts.dart
│  │  │  ├─ view
│  │  │  │  ├─ components
│  │  │  │  │  ├─ settings_item.dart
│  │  │  │  │  ├─ settings_language_row.dart
│  │  │  │  │  └─ settings_switch_tile.dart
│  │  │  │  └─ settings_screen.dart
│  │  │  └─ view-model
│  │  │     └─ settings_view_model.dart
│  │  ├─ splash
│  │  │  ├─ constants
│  │  │  │  └─ splash_texts.dart
│  │  │  └─ view
│  │  │     ├─ error_splash_screen.dart
│  │  │     └─ splash_screen.dart
│  │  ├─ screens_shelf.dart
│  │  └─ view_models_shelf.dart
│  ├─ product
│  │  ├─ constants
│  │  │  └─ enums
│  │  │     ├─ app_themes.dart
│  │  │     ├─ language_options.dart
│  │  │     ├─ settings_enums.dart
│  │  │     └─ product_enums_shelf.dart
│  │  ├─ managers
│  │  │  └─ local-storage
│  │  │     ├─ settings
│  │  │     │  └─ settings_local_manager.dart
│  │  │     └─ hive_configs.dart
│  │  └─ theme
│  │     ├─ color
│  │     │  ├─ dark_colors.dart
│  │     │  └─ light_colors.dart
│  │     ├─ text
│  │     │  ├─ dark_text_theme.dart
│  │     │  └─ light_text_theme.dart
│  │     ├─ dark_theme.dart
│  │     └─ light_theme.dart
│  ├─ initial_app.dart
│  ├─ initial_web_app.dart
│  └─ main.dart
├─ android
├─ assets
│  ├─ images
│  │  ├─ icons
│  │  └─ languages
│  └─ lang
│  │  ├─ en.json
│  │  └─ tr.json
├─ ios
├─ web
├─ windows
├─ analysis_options.yaml
├─ pubspec.yaml
├─ README.md
├─ contributing.md
└─ .gitignore
```

<br />

## Contributing

Contributions are so important for both me and those who want to use this template. I will be very appreciative if you allocate time to push forward the template.

All help is welcomed but if you have questions, bug reports, issues, feature requests, pull requests, etc, please first refer to the [Contributing Guide](https://github.com/bahricanyesil/flutter-starter-template/blob/main/contributing.md).

If you like and benefit from this template, please give a [star on GitHub](https://github.com/bahricanyesil/flutter-starter-template/stargazers) to be able to reach more people!

## License

* MIT License


**THANK YOU!**
