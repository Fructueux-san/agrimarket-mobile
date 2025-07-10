import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/producer_register/controllers/producer_register_controller.dart';

class Page1View extends GetView {
  Page1View({super.key});
  final _registerController = Get.find<ProducerRegisterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                "images/logo.png",
                scale: 3,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Créer votre compte",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Cher producteur, fournissez les informations pour continuer',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _registerController.formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _registerController.fullname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_2_rounded),
                            hintText: "Nom complet",
                            fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Comment vous appelez-vous ?"
                              : null;
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        controller: _registerController.owner,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city_rounded),
                            hintText: "Entreprise",
                            fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Nom de l'entreprise ou de votre ferme."
                              : null;
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    /*TextFormField(
                      controller: _registerController.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Votre email", fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Entrez votre mot de passe"
                              : null;
                        }
                    ),
                    SizedBox(
                      height: 15,
                    )*/
                    TextFormField(
                        controller: _registerController.telephone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_android_rounded),
                            hintText: "Téléphone",
                            fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Renseigner le numéro de téléphone"
                              : null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _registerController.bio,
                      keyboardType: TextInputType.text,
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                          prefix: Icon(Icons.info_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: "Votre bio ...",
                          fillColor: Colors.grey[200]),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
