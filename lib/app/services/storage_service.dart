import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  dynamic getKeyValue(String key) => _prefs.get(key);

  void setKeyStringValue(String key, String value) =>
      _prefs.setString(key, value);

  void deleteKey(String key) => _prefs.remove(key);

  void saveToken(String token) => _prefs.setString("token", token);

  String? getToken() => _prefs.getString("token");

  void removeToken() => _prefs.remove("token");

  void clearPrefs() => _prefs.clear();
}
