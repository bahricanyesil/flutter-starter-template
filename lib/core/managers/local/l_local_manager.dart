abstract class ILocalManager {
  Future<void> initLocalStorage();

  Future<void> clearAll();
}
