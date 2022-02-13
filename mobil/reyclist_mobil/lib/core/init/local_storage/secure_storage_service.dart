import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reyclist_mobil/core/init/local_storage/local_storage_manager.dart';

class SecureStorageService extends ILocalStorageService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static SecureStorageService? _instance;
  static SecureStorageService get instance => SecureStorageService._initialize();

  @override
  Future<bool> saveBooleanValue(String key, bool value) async {
    await secureStorage.write(key: key, value: value.toString());
    return true;
  }

  @override
  Future<bool> saveModel<T>(String key, T model) async {
    return true;
  }

  SecureStorageService._initialize();

  @override
  Future<String> readStringValue(String value) async {
    return "";
  }

  @override
  Future<bool> readBoolValue(String key) async {
    return true;
  }
}
