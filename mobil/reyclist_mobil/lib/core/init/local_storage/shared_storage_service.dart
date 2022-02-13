import 'dart:convert';

import 'package:reyclist_mobil/core/init/local_storage/local_storage_manager.dart';
import 'package:reyclist_mobil/ui/login/model/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedEnum { login, user }

class SharedStorageService extends ILocalStorageService {
  static SharedStorageService? _instance;
  static SharedStorageService get instance => _instance ??= SharedStorageService._initialize();

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
    return await _preferences?.setString(key, jsonEncode(model)) ?? false;
  }

  @override
  T? readModel<T>(String key) {
    final response = _preferences?.getString(SharedEnum.user.name) ?? "";
    return jsonDecode(response).cast<T>();
  }

  @override
  Future<String> readStringValue(String key) async {
    return _preferences?.getString(key) ?? '';
  }

  SharedStorageService._initialize();

  @override
  Future<bool> readBoolValue(String key) async => _preferences?.getBool(SharedEnum.login.name) ?? false;
}
