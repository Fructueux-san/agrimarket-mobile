import 'package:get/get.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/favorite/providers/favorite_provider.dart';

class FavoriteController extends GetxController {
  final count = 0.obs;
  final _provider = FavoriteProvider();

  RxList<ProductModel> userFavorites = <ProductModel>[].obs;
  RxMap<String, Map<String, dynamic>> userFavsFarmersInformations =
      <String, Map<String, dynamic>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    await getUserFavoriteProducts();
    await getFarmersInformationForFavorites();
  }

  void increment() => count.value++;

  Future<Map<String, dynamic>> getFarmerInformation(String farmerId) async {
    final res = await _provider.farmerInfo(farmerId);
    print("farmers");
    print(res.bodyString);
    if (res.statusCode == 200) {
      return Map<String, dynamic>.from(res.body);
    } else {
      return {
        "email": "inconnu",
        "fullname": "inconnu",
        "owner": "inconnu",
        "city": null,
        "address": "inconnu",
        "bio": "Pas de bio"
      };
    }
  }

  Future<void> getFarmersInformationForFavorites() async {
    for (var product in userFavorites) {
      final info = await getFarmerInformation(product.farmerId!);
      userFavsFarmersInformations[product.farmerId!] = info;
    }
  }

  Future<void> getUserFavoriteProducts() async {
    final res = await _provider.getUserFavs();
    if (res.statusCode == 200) {
      final List favsProducts = res.body;
      userFavorites.assignAll(
        favsProducts.map((json) => ProductModel.fromJson(json)).toList(),
      );
    } else {
      Get.snackbar("Erreur", "Impossible de récupérer les favoris");
    }
  }
}
