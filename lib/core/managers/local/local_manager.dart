import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/local_manager_keys.dart';
import 'l_local_manager.dart';

class LocalManager implements ILocalManager {
  // TODO(bahrican): Replace with hive package

  factory LocalManager() => _instance;
  static final LocalManager _instance = LocalManager._();
  static LocalManager get instance => _instance;

  static SharedPreferences? _prefs;

  LocalManager._();

  @override
  Future<void> initPrefs() async =>
      _prefs ??= await SharedPreferences.getInstance();

  @override
  int? getInt(LocalManagerKeys key) => _prefs?.getInt(key.toString());

  @override
  Future<bool> setInt(LocalManagerKeys key, int value) async =>
      await _prefs?.setInt(key.toString(), value) ?? false;

  @override
  String? getString(LocalManagerKeys key) => _prefs?.getString(key.toString());

  @override
  Future<bool> setString(LocalManagerKeys key, String value) async =>
      await _prefs?.setString(key.toString(), value) ?? false;

  @override
  bool? getBool(LocalManagerKeys key) => _prefs?.getBool(key.toString());

  @override
  Future<bool> setBool(LocalManagerKeys key, bool value) async =>
      await _prefs?.setBool(key.toString(), value) ?? false;

  @override
  Future<List<T>> getList<T>(
      BaseModel<T> sampleModel, LocalManagerKeys key) async {
    final Map<String, dynamic> customMap =
        await jsonDecode(_prefs?.getString(key.toString()) ?? '')
            as Map<String, dynamic>;
    return List<T>.from((customMap['list'] as List<Map<String, dynamic>>)
        .map((Map<String, dynamic> model) => sampleModel.fromJson(model)));
  }

  @override
  Future<void> setList<T>(
      List<BaseModel<T>> modelList, LocalManagerKeys key) async {
    final String saveString = jsonEncode(modelList
            .map((BaseModel<T> model) => model.toJson())
            .toList() as List<T>)
        .toString();
    await _prefs?.setString(key.toString(), saveString);
  }

  @override
  Future<T> getModel<T>(BaseModel<T> model, LocalManagerKeys key) async {
    final Map<String, dynamic> customMap =
        await jsonDecode(_prefs?.getString(key.toString()) ?? '');
    return model.fromJson(customMap);
  }

  @override
  Future<void> setModel<T>(BaseModel<T> model, LocalManagerKeys key) async {
    final String saveString = jsonEncode(model.toJson());
    await _prefs?.setString(key.toString(), saveString);
  }

  @override
  Future<void> clearAll() async => await _prefs?.clear();
}
