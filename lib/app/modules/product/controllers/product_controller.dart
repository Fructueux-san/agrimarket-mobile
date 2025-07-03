import 'package:get/get.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/product/providers/product_provider.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  final count = 0.obs;
  final _provider = ProductProvider();
  final _exploreController = Get.find<ExploreController>();
  @override
  void onInit() {
    super.onInit();
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

  Future<bool> addToFavorites(String productId) async {
    var resp = await _provider.addToFavorites(productId);
    if (resp.statusCode == 200) {
      _exploreController.getUserFavoriteProducts();

      Get.snackbar("Okay", "Ajouté dans vos favoris avec succès !");
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeFromFavorites(String productId) async {
    var resp = await _provider.removeFromFavorites(productId);
    if (resp.statusCode == 200) {
      _exploreController.getUserFavoriteProducts();
      Get.snackbar("Okay", "Le produit a bien été retiré de vos favoris");

      return true;
    } else {
      return false;
    }
  }

  bool productInFavs(productid) {
    return _exploreController.userFavorites
        .any((ProductModel p) => p.sId == productid);
  }
}
