import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/commons/configs.dart';

class Page1View extends GetView {
  Page1View(Map userInformations, {super.key});
  //final _onboardingController = Get.lazyPut(() => OnboardingController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: "Salutations, ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                  TextSpan(
                      text: Get.arguments['fullname'].toString(),
                      style: TextStyle(color: MAIN_APP_COLOR)),
                  TextSpan(
                    text: " !",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ])),
            //Text('Salutations, ' + Get.arguments['fullname'].toString()),
            Center(
              child:
                  Image.asset(key: UniqueKey(), "images/fruit-basket-pana.png"),
            ),
            Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
                "Nous allons recueillir vos préférences et d'autres informations pour une expérience optimale de AgriMarket +")
          ],
        ),
      ),
    );
  }
}
