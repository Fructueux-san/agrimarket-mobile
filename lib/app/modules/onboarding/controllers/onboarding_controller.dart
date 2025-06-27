import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/CategoryModel.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/home/views/home_view.dart';
import 'package:mobile/app/modules/onboarding/providers/onboarding_provider.dart';
import 'package:mobile/app/services/storage_service.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final count = 0.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final _exploreController = ExploreController();
  RxList<String> selectedCategories = <String>[].obs;

  final phoneNumberFieldController = TextEditingController().obs;
  final cityFieldController = TextEditingController().obs;
  final adressFieldController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;
  final localisationOk = false.obs;

  final _provider = OnboardingProvider();
  final _storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void loadCategories() async {
    var cats = await _exploreController.loadCategories();
    final List<CategoryModel> result =
        cats.map((json) => CategoryModel.fromJson(json)).toList();
    categories.assignAll(result);
  }

  void sendAdditionnalUserInformation(Map userInformations) async {
    var res = await _provider.lastInformations(userInformations);

    if (res.statusCode != null) {
      if (res.statusCode == 200) {
        Get.snackbar('Bienvenue !', "Préférences enrégistré avec succès.");
        Get.offAll(HomeView());
      } else {
        print(res.body);
        Get.snackbar("Erreur", "Une erreur s'est produite");
      }
    }else {
    Get.snackbar("Agrimarket +", "Impossible de finaliser. Vérifier votre connexion internet.");
    }
    // Get.offAll(HomeView());
  }
}
