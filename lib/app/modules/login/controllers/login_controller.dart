import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/home/views/home_view.dart';
import 'package:mobile/app/modules/login/providers/login_provider.dart';
import 'package:mobile/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile/app/modules/onboarding/views/onboarding_view.dart';
import 'package:mobile/app/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  var loginProvider = LoginProvider();
  final storage = Get.find<StorageService>();
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
    prefs.setString("userId", userData['_id']);
    prefs.setString("fullname", userData['fullname']);
    prefs.setString("email", userData['email']);
    prefs.setString("token", userData['token']);
    prefs.setString('exp', userData['exp'].toString());
    prefs.setString("user_type", userData['type']);
  }

  Future<bool> logout() async {
    //final token = storage.getKeyValue("token");
    var res = await loginProvider.logoutAPICall();
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == null) {
      Get.snackbar("Echec", "vérifier votre connexion internet.");
      return false;
    } else {
      if (res.statusCode == 200) {
        Get.snackbar("Logout", "${res.body['message'] ?? 'Okay'}");
        return true;
      } else {
        Get.snackbar("Echec", "Une erreur s'est porduite.");
        return false;
      }
    }
  }

  Future<bool> login(Map<String, String> userData) async {
    var res = await loginProvider.loginAPICall(userData);
    if (res.statusCode == null) {
      Get.snackbar("Login error", "Check your internet network and retry.",
          colorText: Colors.red);
    } else {
      if (res.statusCode == 200) {
        print(res.body);
        Get.snackbar("Bienvenu ", "Connexion réussi !");
        saveUserData(res.body);

        // Check if it is the first connection
        if (res.body['firstTime'] == true) {
          Get.put(OnboardingController());
          Get.off(OnboardingView(), arguments: res.body);
        } else {
          Get.put(ExploreController());
          Get.offAll(HomeView());
        }

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
