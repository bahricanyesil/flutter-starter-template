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
    await Hive.openBox<dynamic>(_HiveBoxConfig.authentication);
    await Hive.openBox<String>(_HiveBoxConfig.userPreferences);
    _userPreferences = Hive.box<String>(_HiveBoxConfig.userPreferences);
    _authBox = Hive.box<dynamic>(_HiveBoxConfig.authentication);
  }

  @override
  Future<void> clearAll() async => Hive.deleteFromDisk();

  Box<HomeModel>? _homeModels;

  late final Box<dynamic> _authBox;

  late final Box<String> _userPreferences;

  Box<HomeModel> get homeModels =>
      _homeModels ??= Hive.box<HomeModel>(_HiveBoxConfig.homeModels);

  String? getUserPreference(UserPreferencesKeys key) =>
      _userPreferences.get(key.value);

  Future<void> setUserPreference(UserPreferencesKeys key, Enum data) async =>
      _userPreferences.put(key.value, data.value);

  dynamic getAuth(AuthKeys key) => _authBox.get(key.value);

  Future<void> setAuth(AuthKeys key, dynamic data) async =>
      _authBox.put(key.value, data);
}

class HiveTypeConfig {
  static const int homeModel = 0;
  static const int tokenResponse = 1;
}

class _HiveBoxConfig {
  static const String homeModels = 'home_models';
  static const String userPreferences = 'user_preferences';
  static const String authentication = 'authentication';
}
