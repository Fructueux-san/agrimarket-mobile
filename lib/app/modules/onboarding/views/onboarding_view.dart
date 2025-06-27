import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/onboarding/views/page1_view.dart';
import 'package:mobile/app/modules/onboarding/views/page2_view.dart';
import 'package:mobile/app/modules/onboarding/views/page3_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});
  // controller keep track on the page we're on
  final _controller = PageController();
  var userInformations = Get.arguments;
  var onLastPage = false.obs;
  final _onboardingController = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('OnboardingView'),
        centerTitle: true,
      ),*/
      body: Stack(children: [
        PageView(
          onPageChanged: (index) {
            onLastPage.value = (index == 2);
          },
          controller: _controller,
          children: [
            Page1View({userInformations: userInformations}),
            Page2View(),
            Page3View()
          ],
        ),
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text("Non"),
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                Obx(() => onLastPage.value
                    ? GestureDetector(
                        child: Text("Terminer"),
                        onTap: () {
                          var data = {
                            "id": Get.arguments['_id'],
                            "preferences":
                                _onboardingController.selectedCategories.value,
                            "city": _onboardingController
                                .cityFieldController.value.text,
                            "address": _onboardingController
                                .adressFieldController.value.text,
                            "localisationEnabled":
                                _onboardingController.localisationOk.value
                          };
                          print(data);
                          _onboardingController
                              .sendAdditionnalUserInformation(data);
                          // On marque le user comme ancien en base
                          // et on le renvoi sur la homepage
                        },
                      )
                    : GestureDetector(
                        child: Text("Suivant"),
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      )),
              ],
            )),
      ]),
    );
  }
}
