abstract class ILocalStorageService {
  Future<bool> saveModel<T>(String key, T model);
  Future<bool> saveBooleanValue(String key, bool value);
  Future<String> readStringValue(String key);
  Future<bool> readBoolValue(String key);
}