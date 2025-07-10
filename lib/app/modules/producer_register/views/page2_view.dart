import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/producer_register/controllers/producer_register_controller.dart';

class Page2View extends GetView {
  Page2View({super.key});
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
                    "... dernière ligne droite",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cher producteur, fournissez les informations pour terminer',
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
                        controller: _registerController.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Votre email",
                            fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Adresse email nécessaire."
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _registerController.password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                            fillColor: Colors.grey[200]),
                        validator: (v) {
                          return v == "" || v == null
                              ? "Entrez votre mot de passe"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                          controller: _registerController.passwordRepeat,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Votre mot de passe encore",
                              fillColor: Colors.grey[200]),
                          validator: (v) {
                            return v == "" || v == null
                                ? "Confirmer le mot de passe"
                                : null;
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                          controller: _registerController.address,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Où habitez-vous ?",
                              fillColor: Colors.grey[200]),
                          validator: (v) {
                            return v == "" || v == null
                                ? "Merci de nous donner votre adresse."
                                : null;
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "En continuant vous agréer à nos, ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            TextSpan(
                                text: "termes de services ",
                                style: TextStyle(
                                    color: Color.fromRGBO(83, 177, 117, 1))),
                            TextSpan(
                                text: "et notre ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "politique de confidentialité. ",
                                style: TextStyle(
                                    color: Color.fromRGBO(83, 177, 117, 1))),
                          ])),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
