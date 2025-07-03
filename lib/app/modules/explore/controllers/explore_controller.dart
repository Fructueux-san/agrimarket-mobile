import 'package:get/get.dart';
import 'package:mobile/app/data/CategoryModel.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/crossroads/views/crossroads_view.dart';
import 'package:mobile/app/modules/explore/providers/explore_provider.dart';
import 'package:mobile/app/services/storage_service.dart';

class ExploreController extends GetxController {
  //TODO: Implement ExploreController

  final count = 0.obs;
  final _exploreProvider = ExploreProvider();
  final _storage = Get.find<StorageService>();
  List categories = [].obs;

  List categoriesWithProducts = [].obs;
  RxMap selectedCategory = {}.obs;

  RxList<CategoryModel> catsWithProducts = <CategoryModel>[].obs;
  RxList<ProductModel> userFavorites = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadDataForHomePage();
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

  Future loadDataForHomePage() async {
    var res = await _exploreProvider.explorationDataFetching(elementPerCats: 5);
    if (res.statusCode == null) {
      Get.snackbar('Erreur', "Vérifier votre connexion internet.");
    } else {
      if (res.statusCode == 200) {
        //print(res.body);
        categoriesWithProducts.assignAll(res.body);

        // On créer le mode objet
        final List<CategoryModel> cats = categoriesWithProducts
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        catsWithProducts.assignAll(cats);
      } else {
        if (res.statusCode == 401 || res.statusCode == 403) {
          _storage.clearPrefs();
          Get.snackbar("Connexion", "Veuillez vous connecter");
          Get.offAll(CrossroadsView());
        }
        if (res.bodyString!.contains("message") == true) {
          Get.snackbar("Erreur", res.body['message']);
        } else {
          Get.snackbar("Erreur", "Une erreur s'est produite.");
        }
      }
    }
  }

  Future<List> loadCategories() async {
    // On récupère la liste des catégories.
    var res = await _exploreProvider.getAllCategories();
    //print(res.bodyString);
    if (res.statusCode == null) {
      Get.snackbar("Erreur", "Vérifiez votre connexion internet.");
    } else {
      if (res.statusCode == 200) {
        //categories = res.body;
        categories.assignAll(res.body);
      } else {
        if (res.statusCode == 401 || res.statusCode == 403) {
          _storage.clearPrefs();
          Get.snackbar("Connexion", "Veuillez vous connecter");
          Get.offAll(CrossroadsView());
        }
        if (res.bodyString!.contains("message") == true) {
          Get.snackbar("Erreur", res.body['message']);
        }
      }
    }
    return categories;
  }

  void getUserFavoriteProducts() async {
    // On send la requête
    var res = await _exploreProvider.getUserFavs();
    if (res.statusCode == 200) {
      List favsProducts = [];
      favsProducts.assignAll(res.body);
      userFavorites.assignAll(
          favsProducts.map((json) => ProductModel.fromJson(json)).toList());
    } else {
      if (res.bodyString!.contains("message") == true) {
        Get.snackbar("Erreur", "Impossible de récupérer les favories");
      }
    }
  }
}
