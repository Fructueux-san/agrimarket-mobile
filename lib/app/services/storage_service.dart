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

  void clearPrefs() async => await _prefs.clear();

  void clearPrefsForLogout() async {
    await _prefs.remove("userId");
    await _prefs.remove("fullname");
    await _prefs.remove("email");
    await _prefs.remove("token");
    await _prefs.remove('exp');
    await _prefs.remove("user_type");
  }

  void showUserInformation() {
    print(_prefs.get("userId"));
    print(_prefs.get("fullname"));
    print(_prefs.get("email"));
    print(_prefs.get("exp"));
    print(_prefs.get("user_type"));
    print(_prefs.get("token"));
  }
}
