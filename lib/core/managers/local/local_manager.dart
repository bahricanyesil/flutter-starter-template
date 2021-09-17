import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/local_manager_keys.dart';
import 'l_local_manager.dart';

class LocalManager implements ILocalManager {
  // TODO(bahrican): Replace with hive package
  // TODO(bahrican): Test the manager
  SharedPreferences? _prefs;

  factory LocalManager() => _instance;
  static final LocalManager _instance = LocalManager._init();
  static LocalManager get instance => _instance;

  LocalManager._init() {
    if (_prefs == null) {
      SharedPreferences.getInstance().then((SharedPreferences value) {
        _prefs = value;
      });
    }
  }

  @override
  Future<void> initPrefs() async =>
      _prefs ??= await SharedPreferences.getInstance();

  @override
  Future<int> getInt(LocalManagerKeys key) async =>
      _prefs?.getInt(key.toString()) ?? 0;

  @override
  Future<bool> setInt(LocalManagerKeys key, int value) async =>
      await _prefs?.setInt(key.toString(), value) ?? false;

  @override
  Future<String> getString(LocalManagerKeys key) async =>
      _prefs?.getString(key.toString()) ?? '';

  @override
  Future<bool> setString(LocalManagerKeys key, String value) async =>
      await _prefs?.setString(key.toString(), value) ?? false;

  @override
  Future<bool> getBool(LocalManagerKeys key) async =>
      _prefs?.getBool(key.toString()) ?? false;

  @override
  Future<bool> setBool(LocalManagerKeys key, bool value) async =>
      await _prefs?.setBool(key.toString(), value) ?? false;

  @override
  Future<List<T>> getList<T>(
      BaseModel<T> sampleModel, LocalManagerKeys key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final Map<String, dynamic> customMap =
        jsonDecode(preferences.getString(key.toString()) ?? '')
            as Map<String, dynamic>;
    return List<T>.from((customMap['list'] as List<Map<String, dynamic>>)
        .map((Map<String, dynamic> model) => sampleModel.fromJson(model)));
  }

  @override
  Future<void> setList<T>(
      List<BaseModel<T>> modelList, LocalManagerKeys key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String saveString = jsonEncode(modelList
            .map((BaseModel<T> model) => model.toJson())
            .toList() as List<T>)
        .toString();
    await preferences.setString(key.toString(), saveString);
  }

  @override
  Future<T> getModel<T>(BaseModel<T> model, LocalManagerKeys key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final Map<String, dynamic> customMap =
        jsonDecode(preferences.getString(key.toString()) ?? '');
    return model.fromJson(customMap);
  }

  @override
  Future<void> setModel<T>(BaseModel<T> model, LocalManagerKeys key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String saveString = jsonEncode(model.toJson());
    await preferences.setString(key.toString(), saveString);
  }

  @override
  Future<void> clearAll() async => await _prefs?.clear();
}
