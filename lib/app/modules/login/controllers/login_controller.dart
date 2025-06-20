import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/login/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  var loginProvider = LoginProvider();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void saveUserData(Map userData) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("fullname", userData['fullName']);
    prefs.setString("email", userData['email']);
    prefs.setString("token", userData['token']);
    prefs.setString("user_type", userData['typestan']);
  }

  Future<bool> login(Map<String, String> userData) async {
    var res = await loginProvider.loginAPICall(userData);
    if (res.statusCode == null) {
      Get.snackbar("Login error", "Check your internet network and retry.",
          colorText: Colors.red);
    } else {
      if (res.statusCode == 200) {
        Get.snackbar("Bienvenu ", "Connexion réussi !");
        Get.offNamed("/home");
        return true;
      } else if (res.statusCode! >= 400) {
        Get.snackbar('Echec Login', "",
            icon: Icon(
              Icons.warning,
              color: Colors.amber,
            ),
            messageText: Text(
              res.body['message'],
              style: TextStyle(color: Colors.red),
            ));
      } else {
        return false;
      }
    }
    return true;
  }
}
