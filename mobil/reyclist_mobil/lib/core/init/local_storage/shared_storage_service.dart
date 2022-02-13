import 'package:reyclist_mobil/core/init/local_storage/local_storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedStorage { login }

class SharedStorageService extends ILocalStorageService {
  static SharedStorageService? _instance;
  static SharedStorageService get instance => SharedStorageService._initialize();

  SharedPreferences? _preferences;

  Future<void> initializeSharedPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveBooleanValue(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  @override
  Future<bool> saveModel<T>(String key, T model) async {
    return true;
  }

  @override
  Future<String> readStringValue(String key) async {
    return _preferences?.getString(key) ?? '';
  }

  SharedStorageService._initialize();

  @override
  Future<bool> readBoolValue(String key) async => _preferences?.getBool(SharedStorage.login.name) ?? false;
}
