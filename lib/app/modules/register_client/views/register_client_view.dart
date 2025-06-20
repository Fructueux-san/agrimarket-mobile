import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/login/views/login_view.dart';

import '../controllers/register_client_controller.dart';

class RegisterClientView extends GetView<RegisterClientController> {
  RegisterClientView({super.key});
  final _fullnameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFielController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  final _phoneNumberFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _isPasswordObscured = true.obs;
  var _isPasswordRepeatObscured = true.obs;

  final _registerController = RegisterClientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Cher client, fournissez les informations pour continuer',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        )
                      ],
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _fullnameFieldController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Nom complet",
                              ),
                              validator: (v) {
                                return v == "" || v == null
                                    ? "Votre nom complet est nécessaire"
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _emailFieldController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                              ),
                              validator: (v) {
                                return v == "" || v == null
                                    ? "Renseigner votre adresse mail."
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _phoneNumberFieldController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Téléphone",
                              ),
                              validator: (v) {
                                return v == "" || v == null
                                    ? "Renseigner votre n° de tel."
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => TextFormField(
                                  controller: _passwordFielController,
                                  keyboardType: TextInputType.text,
                                  obscureText: _isPasswordObscured.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _isPasswordObscured.value =
                                              !_isPasswordObscured.value;
                                        },
                                        icon: _isPasswordObscured.value
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                    hintText: "password",
                                  ),
                                  validator: (v) {
                                    return v == "" || v == null
                                        ? "Créer votre mot de passe."
                                        : null;
                                  },
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => TextFormField(
                                  controller: _passwordRepeatController,
                                  keyboardType: TextInputType.text,
                                  obscureText: _isPasswordRepeatObscured.value,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _isPasswordRepeatObscured.value =
                                              !_isPasswordRepeatObscured.value;
                                        },
                                        icon: _isPasswordRepeatObscured.value
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                    hintText: "Confirmer le password",
                                  ),
                                  validator: (v) {
                                    return v == "" || v == null
                                        ? "Confirmer votre nouveau mot de passe"
                                        : null;
                                  },
                                )),
                          ],
                        )),
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
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var userData = {
                              "fullname": _fullnameFieldController.text,
                              "email": _emailFieldController.text,
                              "password": _passwordFielController.text,
                              "password_repeat": _passwordRepeatController.text,
                              "telephone": _phoneNumberFieldController.text,
                              "user_type": "CLIENT"
                            };
                            var registerResponse =
                                await _registerController.register(userData);
                            if (registerResponse == true) {
                              Get.offAll(() => LoginView());
                            }
                          }
                        }, // Envoyer la requête de login
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                            padding: EdgeInsets.only(
                                left: 70, right: 70, top: 15, bottom: 15)),
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Avez-vous déjà un compte ? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "Se connecter",
                                  style: TextStyle(
                                      color: Color.fromRGBO(83, 177, 117, 1)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => Get.offAll(() => LoginView())),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
