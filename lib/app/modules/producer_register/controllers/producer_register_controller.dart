import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/login/views/login_view.dart';
import 'package:mobile/app/modules/producer_register/providers/producer_register_provider.dart';

class ProducerRegisterController extends GetxController {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final telephone = TextEditingController();
  final password = TextEditingController();
  final passwordRepeat = TextEditingController();
  final owner = TextEditingController();
  final address = TextEditingController();
  final userType = "PRODUCER";
  final bio = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  final _provider = ProducerRegisterProvider();

  void register() async {
    if (password.text != passwordRepeat.text) {
      Get.snackbar('Erreur', 'Les mots de passe ne correspondent pas');
      return;
    }

    if (formKey.currentState!.validate()) {
      // On prépare les données
      Map userData = {
        "fullname": fullname.text,
        "email": email.text,
        "telephone": telephone.text,
        "password": password.text,
        "password_repeat": passwordRepeat.text,
        "owner": owner.text,
        "address": address.text,
        "user_type": userType,
        "bio": bio.text,
      };

      print(userData);
      var res = await _provider.register(userData);
      if (res.statusCode == 200 || res.statusCode == 201) {
        Get.snackbar("Agrimarket +", "Votre compte a bien été créer");
        Get.to(() => LoginView());
      } else {
        Get.snackbar("Error", "Une erreur s'est produite");
      }
    } else {
      Get.snackbar("Agrimarket +", "Formulaire imcomplet",
          messageText: Text(
            "Remplissez convenablement le formulaire",
            style: TextStyle(color: Colors.red),
          ));
    }
  }

  @override
  void onClose() {
    fullname.dispose();
    email.dispose();
    telephone.dispose();
    password.dispose();
    passwordRepeat.dispose();
    owner.dispose();
    address.dispose();
    bio.dispose();
    super.onClose();
  }
}
