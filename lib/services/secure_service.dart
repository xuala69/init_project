import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<String> read(String key) async {
    var value = await _secureStorage.read(key: key);
    return value != null ? value : "";
  }
}
