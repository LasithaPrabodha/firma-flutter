import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = new FlutterSecureStorage();

  static Future<String> read(String key) async {
    return await storage.read(key: key);
  }
}
