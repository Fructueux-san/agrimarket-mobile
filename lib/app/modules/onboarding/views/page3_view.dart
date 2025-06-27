import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile/commons/configs.dart';

class Page3View extends GetView {
  Page3View({super.key});
  final _onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset("images/fruits_basket.png"),
                SizedBox(
                  height: 30,
                ),
                Obx(() => _onboardingController.selectedCategories.isNotEmpty
                    ? Text(
                        "Nous en savons un peut plus sur vos goût et préférences.")
                    : Text(
                        "Vos goût et préférences seront pris en compte au fur et à mesure de votre utilisation de Agrimarket +")),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => Form(
                      key: _onboardingController.formKey.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*TextFormField(
                            controller: _onboardingController
                                .phoneNumberFieldController.value,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: "Téléphone",
                                prefixIcon: Icon(Icons.phone)),
                          ),*/
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller:
                                _onboardingController.cityFieldController.value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Votre ville",
                                prefixIcon: Icon(Icons.location_city_rounded)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _onboardingController
                                .adressFieldController.value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Addresse",
                                prefixIcon: Icon(Icons.location_on)),
                          )
                        ],
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Obx(() => Switch(
                        activeColor: MAIN_APP_COLOR,
                        value: _onboardingController.localisationOk.value,
                        onChanged: (value) {
                          _onboardingController.localisationOk.value =
                              !_onboardingController.localisationOk.value;
                        })),
                    Text("Activez votre localisation")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: MAIN_APP_COLOR,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                          overflow: TextOverflow.clip,
                          "Vous pouvez modifier les informations dans votre profile."),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
