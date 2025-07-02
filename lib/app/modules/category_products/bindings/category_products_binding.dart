import 'package:get/get.dart';
import 'package:mobile/app/modules/category_products/controllers/category_products_controller.dart';

class CategoryProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryProductsController>(
      () => CategoryProductsController(Get.parameters['category'] ?? ""),
      fenix: true,
    );
  }
}
