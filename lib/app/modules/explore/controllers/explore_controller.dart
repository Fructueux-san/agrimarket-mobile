import 'package:flutter/cupertino.dart';
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
  RxInt totalProductsCount = 0.obs;
  RxBool allProductsIsLoading = false.obs;

  RxList<CategoryModel> catsWithProducts = <CategoryModel>[].obs;
  RxList<ProductModel> userFavorites = <ProductModel>[].obs;
  //FavoriteController _favoriteController = FavoriteController();

  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxInt limit = 10.obs;
  final ScrollController allProductScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    /*getUserFavoriteProducts();
    loadCategories();
    loadDataForHomePage();
    getAllProducts();*/
    loadData();
    allProductScrollController.addListener(() {
      loadMoreDataForAllProductPage();
    });
  }

  Future loadData() async {
    await loadDataForHomePage();
    await loadCategories();
    await getUserFavoriteProducts();
    await getAllProducts();
  }

  @override
  void onReady() {
    super.onReady();
    //_favoriteController.userFavsFarmersInformations();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> loadDataForHomePage() async {
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

  Future<void> getUserFavoriteProducts() async {
    // On send la requête
    var res = await _exploreProvider.getUserFavs();
    if (res.statusCode == 200) {
      List favsProducts = [];
      favsProducts.assignAll(res.body);
      userFavorites.assignAll(
          favsProducts.map((json) => ProductModel.fromJson(json)).toList());
      //print("USER FAVORITES");
      //print(userFavorites);
    } else {
      if (res.bodyString!.contains("message") == true) {
        Get.snackbar("Erreur", "Impossible de récupérer les favories");
      }
    }
  }

  Future<void> getAllProducts() async {
    allProductsIsLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 3));
      var res = await _exploreProvider.allPaginatedProduct(
          limit.value, allProducts.length);
      if (res.statusCode == 200) {
        List l = [];
        l.assignAll(res.body['products']);
        totalProductsCount.value = res.body['totalItems'];
        //print(res.body['products']);
        allProducts.addAll(l.map((e) => ProductModel.fromJson(e)).toList());
      } else {
        Get.snackbar('Error', "Impossible de récupérer la liste des produits");
      }
    } catch (e) {
      Get.snackbar("Erreur", "Erreur de connexion serveur.");
    } finally {
      allProductsIsLoading.value = false;
    }
  }

  Future<void> loadMoreDataForAllProductPage() async {
    if (!allProductsIsLoading.value &&
        allProductScrollController.position.pixels >=
            allProductScrollController.position.maxScrollExtent - 100 &&
        totalProductsCount.value > allProducts.length) {
      getAllProducts();
    }
  }
}
