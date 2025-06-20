import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(83, 177, 117, 1),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logo_complet.png",
                    scale: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                      ),
                      Image.asset(
                        "images/consommons_mieux.png",
                        scale: 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
