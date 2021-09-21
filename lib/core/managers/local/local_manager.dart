import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/model/home_models_shelf.dart';
import '../../constants/constants_shelf.dart';
import '../../extensions/enum/enum_extensions.dart';
import '../../models/authentication/refresh_token_response_model.dart';
import 'l_local_manager.dart';

class LocalManager implements ILocalManager {
  factory LocalManager() => _instance;
  static final LocalManager _instance = LocalManager._();
  static LocalManager get instance => _instance;
  LocalManager._();

  @override
  Future<void> initLocalStorage() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(HomeModelAdapter())
      ..registerAdapter(TokenResponseAdapter());
    await Hive.openBox<HomeModel>(_HiveBoxConfig.homeModels);
    await Hive.openBox<TokenResponse>(_HiveBoxConfig.tokenResponse);
    await Hive.openBox<String>(_HiveBoxConfig.userPreferences);
  }

  @override
  Future<void> clearAll() async => Hive.deleteFromDisk();

  Box<HomeModel>? _homeModels;

  Box<TokenResponse>? _tokenResponse;

  final Box<String> _userPreferences =
      Hive.box<String>(_HiveBoxConfig.userPreferences);

  Box<HomeModel> get homeModels =>
      _homeModels ??= Hive.box<HomeModel>(_HiveBoxConfig.homeModels);

  Box<TokenResponse> get tokenResponse =>
      _tokenResponse ??= Hive.box<TokenResponse>(_HiveBoxConfig.tokenResponse);

  String? getUserPreference(UserPreferencesKeys key) =>
      _userPreferences.get(key.toString());

  Future<void> setUserPreference(
    UserPreferencesKeys key,
    Enum enumValue,
  ) async =>
      _userPreferences.put(key.toString(), enumValue.value);
}

class HiveTypeConfig {
  static const int homeModel = 0;
  static const int tokenResponse = 1;
}

class _HiveBoxConfig {
  static const String homeModels = 'home_models';
  static const String userPreferences = 'user_preferences';
  static const String tokenResponse = 'refresh_token_response';
}
