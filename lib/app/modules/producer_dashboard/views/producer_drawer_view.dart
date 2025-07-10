import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/account/views/account_view.dart';
import 'package:mobile/app/modules/crossroads/views/crossroads_view.dart';
import 'package:mobile/app/modules/login/controllers/login_controller.dart';
import 'package:mobile/app/services/storage_service.dart';

class ProducerDrawerView extends GetView {
  ProducerDrawerView({super.key});
  final storage = Get.find<StorageService>();
  final _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage("images/avatar.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${storage.getKeyValue('fullname')}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
          ListTile(
            leading: Icon(Icons.person_outline_rounded),
            title: Text("Mon compte"),
            onTap: () => {Get.to(AccountView())},
          ),
          /*ListTile(
            leading: Icon(Icons.category),
            title: Text("Catégories"),
          ),*/
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text("Paramètres"),
            onTap: () {
              //Get.to(SettingsView());
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Partager l'app",
            ),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_rounded)),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Deconnexion",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () async {
              var res = await _loginController.logout();
              storage.clearPrefsForLogout();
              if (res == true) {
                //Get.offAndToNamed("/login");
                Get.snackbar("Deconnexion", "A bientôt !");
              } else {
                Get.snackbar("Erreur", "Quelque chose n'a pas fonctionné.");
              }
              Get.offAll(() => CrossroadsView());
            },
          )
        ],
      ),
    );
  }
}
