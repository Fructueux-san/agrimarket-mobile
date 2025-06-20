import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/login/views/login_view.dart';

import '../controllers/crossroads_controller.dart';

class CrossroadsView extends GetView<CrossroadsController> {
  const CrossroadsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            fit: BoxFit.fitHeight,
            "images/image_carrefour.jpg",
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "images/logo_complet_white.png",
                scale: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => LoginView());
                      }, // Envoyer la requête de login
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 15, bottom: 15)),
                      child: Text(
                        "Client",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
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
                        "Producteur",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}
