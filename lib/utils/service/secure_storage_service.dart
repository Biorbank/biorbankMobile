import 'dart:convert';

import 'package:biorbank/utils/helpers/func_helper.dart';
import 'package:biorbank/utils/service/logger_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  SecureStorageManager._();
  static final _androidOptions = AndroidOptions();
  static const _iosOptions = IOSOptions();
  // static final upgrader = Upgrader(debugDisplayAlways: true);

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Future<void> setStringList(String key, List<String> list) async {
    String data = serializeListToString(list);
    await setString(key, data);
  }

  Future<List<String>> getStringList(String key) async {
    var result = await getString(key);
    String data = result ?? "";
    return deserializeStringToList(data);
  }

  Future<void> setMap(String key, Map<String, dynamic> map) async {
    String data = json.encode(map);
    await setString(key, data);
  }

  Future<Map<String, dynamic>> getMap(String key) async {
    var result = await getString(key);
    String data = result ?? "";
    return json.decode(data);
  }

  Future<void> setString(String key, String value) async {
    return await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async =>
      await _secureStorage.read(key: key);
  Future<void> setBool(String key, bool value) async =>
      await _secureStorage.write(key: key, value: value.toString());

  Future<void> setInt(String key, int value) async =>
      await setString(key, value.toString());
  Future<int> getInt(String key) async {
    var result = await getString(key);
    String value = result ?? "0";
    return int.parse(value);
  }

  Future<bool?> getBool(String key) async {
    String? string = await _secureStorage.read(key: key);
    if (string == null) return null;
    if (string == 'true') {
      return true;
    } else if (string == 'false') {
      return false;
    } else {
      return null;
    }
  }

  Future<void> remove(String key) async =>
      await _secureStorage.delete(key: key);

  Future<bool> containsKey(String key) async =>
      await _secureStorage.containsKey(key: key);
}

class PrefixSecureStorageManager extends SecureStorageManager {
  late final String prefix;
  PrefixSecureStorageManager(String str) : super._() {
    prefix = "${str}_";
  }

  @override
  Future<void> setString(String key, String value) async {
    return super.setString(prefix + key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return super.getString(prefix + key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    return super.setBool(prefix + key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return super.getBool(prefix + key);
  }

  @override
  Future<void> remove(String key) async {
    return super.remove(prefix + key);
  }

  @override
  Future<bool> containsKey(String key) async {
    return super.containsKey(prefix + key);
  }

  Future<void> clearAll() async {
    Map<String, dynamic> value = await _secureStorage.readAll();
    await Future.wait(value.keys.map((key) {
      LogService.logger.i(key);
      if (key.startsWith(prefix)) {
        return _secureStorage.delete(key: key);
      }
      return Future.value();
    }));
  }
}
