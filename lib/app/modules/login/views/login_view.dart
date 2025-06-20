import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  var _isObscured = Rx<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(width: 40, "images/logo.png"),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cher client,',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Connectez-vous !",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Nous avons besoin de votre email et de votre mot de passe",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            child: Column(
                          children: [
                            TextFormField(
                              controller: _emailFieldController,
                              focusNode: _emailNode,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "email",
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Obx(() => TextFormField(
                                  controller: _passwordFieldController,
                                  focusNode: _passwordNode,
                                  keyboardType: TextInputType.text,
                                  obscureText: _isObscured.value,
                                  decoration: InputDecoration(
                                      hintText: "password",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            _isObscured.value =
                                                !_isObscured.value;
                                          },
                                          icon: _isObscured.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility))),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Mot de passe oublié ? Cliquez ici.",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {}, // Envoyer la requête de login
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 15, bottom: 15)),
                      child: Text(
                        "Se connecter",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Text("Agri Market +, tous droit reservé")
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
