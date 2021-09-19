import '../../base/model/base_model.dart';

import '../../constants/enums/local_manager_keys.dart';

abstract class ILocalManager {
  Future<void> initPrefs();

  int? getInt(LocalManagerKeys key);
  Future<bool> setInt(LocalManagerKeys key, int value);

  String? getString(LocalManagerKeys key);
  Future<void> setString(LocalManagerKeys key, String value);

  bool? getBool(LocalManagerKeys key);
  Future<void> setBool(LocalManagerKeys key, bool value);

  Future<T> getModel<T>(BaseModel<T> T, LocalManagerKeys key);
  Future<void> setModel<T>(BaseModel<T> sampleModel, LocalManagerKeys key);

  Future<List<T>> getList<T>(BaseModel<T> sampleModel, LocalManagerKeys key);
  Future<void> setList<T>(List<BaseModel<T>> modelList, LocalManagerKeys key);

  Future<void> clearAll();
}
