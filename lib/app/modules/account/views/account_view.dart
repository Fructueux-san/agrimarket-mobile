import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  AccountView({super.key});
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre compte'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
            ),
          ),
          ListTile(
            title: const Text("Changer la photo de profile"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () async {},
          ),
          ListTile(
            title: Text("HOUETO"),
            subtitle: Text("Nom"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("surname", value: data["surname"]);
              //setState(() {});
            },
          ),
          ListTile(
            title: Text("Stanislas"),
            subtitle: Text("Prenom"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("name", value: data['name']);
              //setState(() {});
            },
          ),
          ListTile(
            title: Text("@${storage.getKeyValue("username")}"),
            subtitle: Text("Username"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("username", value: data['username']);
              //setState(() {});
            },
          ),
          ListTile(
            title: Text(storage.getKeyValue("email")),
            subtitle: Text("email"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("email", value: data['email']);
              //setState(() {});
            },
          ),
          ListTile(
            title: Text("J'aime la vie."),
            subtitle: Text("Bio"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("email", value: data['email']);
              //setState(() {});
            },
          ),
          ListTile(
            title: Text("Cotonou"),
            subtitle: Text("region"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("region", value: data['region']);
              //fetchData();
              //setState(() {});
            },
          ),
          ListTile(
            title: Text("560949448"),
            subtitle: Text("phone"),
            trailing: const Icon(Icons.mode_edit),
            onTap: () {
              //showDialogToModify("phone", value: data["phone"]);
              //setState(() {});
            },
          ),
        ]),
      ),
    );
  }
}
