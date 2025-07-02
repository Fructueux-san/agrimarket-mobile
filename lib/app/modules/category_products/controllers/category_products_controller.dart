import 'package:get/get.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/category_products/providers/category_products_provider.dart';

class CategoryProductsController extends GetxController {
  //TODO: Implement CategoryProductsController

  final count = 0.obs;
  final products = <ProductModel>[].obs;
  final _provider = CategoryProductsProvider();

  final String categoryId;
  CategoryProductsController(this.categoryId);
  @override
  void onInit() {
    super.onInit();
    print(categoryId);
    loadProducts(categoryId);
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

  Future loadProducts(String categoryId) async {
    print(categoryId);
    var res = await _provider.getAllProductsInCategory(categoryId);

    if (res.statusCode == null) {
      Get.snackbar("Erreur", "vérifier votre connexion internet.");
    } else {
      if (res.statusCode == 200) {
        print(res.body);
        List l = [];
        l.assignAll(res.body);
        final List<ProductModel> prod =
            l.map((json) => ProductModel.fromJson(json)).toList();
        products.assignAll(prod);
      } else {
        print(res.statusCode);
        Get.snackbar("Erreur", "Une erreur s'est produite.");
      }
    }
  }
}
