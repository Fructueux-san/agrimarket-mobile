import 'package:get/get.dart';
import 'package:mobile/app/modules/explore/providers/explore_provider.dart';

class ExploreController extends GetxController {
  //TODO: Implement ExploreController

  final count = 0.obs;
  final _exploreProvider = ExploreProvider();
  List categories = [].obs;
  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  @override
  void onReady() {
    loadCategories();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<List> loadCategories() async {
    // On récupère la liste des catégories.
    var res = await _exploreProvider.getAllCategories();
    print(res.bodyString);
    if (res.statusCode == null) {
      Get.snackbar("Erreur", "Vérifiez votre connexion internet.");
    } else {
      if (res.statusCode == 200) {
        //categories = res.body;
        categories.assignAll(res.body);
      } else {
        if (res.bodyString!.contains("message") == true) {
          Get.snackbar("Erreur", res.body['message']);
        }
      }
    }
    return categories;
  }
}
