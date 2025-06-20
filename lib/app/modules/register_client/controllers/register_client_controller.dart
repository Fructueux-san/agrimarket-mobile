import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/register_client/providers/register_client_provider.dart';

class RegisterClientController extends GetxController {
  //TODO: Implement RegisterClientController

  final count = 0.obs;
  var registerClientProvider = RegisterClientProvider();
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

  Future<bool> register(userData) async {
    var res = await registerClientProvider.registerAPICall(userData);
    print(res.bodyString);
    if (res.statusCode == null) {
      Get.snackbar("Echec", "vérifier votre connexion internet.",
          colorText: Colors.red);
      return false;
    } else {
      if (res.statusCode == 201 || res.statusCode == 200) {
        Get.snackbar("Enregistrement", "Compte créer avec succès.");
        return true;
      } else {
        Get.snackbar('Echec Login', "",
            icon: Icon(
              Icons.warning,
              color: Colors.amber,
            ),
            messageText: Text(
              res.body['message'],
              style: TextStyle(color: Colors.red),
            ));
      }
    }
    return false;
  }
}
