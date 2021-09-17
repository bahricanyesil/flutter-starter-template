import '../../base/model/base_model.dart';

import '../../constants/enums/local_manager_keys.dart';

abstract class ILocalManager {
  Future<void> initPrefs();

  Future<int> getInt(LocalManagerKeys key);
  Future<bool> setInt(LocalManagerKeys key, int value);

  Future<String> getString(LocalManagerKeys key);
  Future<void> setString(LocalManagerKeys key, String value);

  Future<void> setBool(LocalManagerKeys key, bool value);
  Future<bool> getBool(LocalManagerKeys key);

  Future<T> getModel<T>(BaseModel<T> T, LocalManagerKeys key);
  Future<void> setModel<T>(BaseModel<T> sampleModel, LocalManagerKeys key);

  Future<List<T>> getList<T>(BaseModel<T> sampleModel, LocalManagerKeys key);
  Future<void> setList<T>(List<BaseModel<T>> modelList, LocalManagerKeys key);

  Future<void> clearAll();
}
