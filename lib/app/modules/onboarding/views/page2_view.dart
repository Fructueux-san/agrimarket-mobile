import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:mobile/commons/configs.dart';

class Page2View extends GetView {
  Page2View({super.key});
  final _onboardingController = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RichText(
                  text: TextSpan(
                      text: "Dites-nous, ",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      children: [
                    TextSpan(
                        text: "ce qui vous parle",
                        style: TextStyle(
                            color: MAIN_APP_COLOR,
                            fontSize: 25,
                            fontWeight: FontWeight.bold))
                  ])),
            ),
            Obx(() {
              final categories = _onboardingController.categories;

              return Expanded(
                // ou Flexible si tu veux laisser un bouton en bas
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        category.name ?? '',
                        style: TextStyle(
                            color: MAIN_APP_COLOR, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(category.description ?? ''),
                      value: category.checked,
                      onChanged: (bool? value) {
                        if (value == true) {
                          // Vérifie qu'on n'en a pas déjà 3 de cochés
                          final selectedCount = categories
                              .where((cat) => cat.checked == true)
                              .length;

                          if (selectedCount >= 3) {
                            Get.snackbar(
                              "Limite atteinte",
                              "Vous ne pouvez choisir que 3 catégories maximum.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }
                          _onboardingController.selectedCategories.value
                              .add(category.sId!);
                        } else {
                          _onboardingController.selectedCategories
                              .remove(category.sId);
                        }

                        category.checked = value ?? false;
                        // Force une mise à jour pour déclencher Obx
                        categories[index] = category;
                        _onboardingController.categories.refresh();
                        _onboardingController.selectedCategories.refresh();
                      },
                    );
                  },
                ),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
