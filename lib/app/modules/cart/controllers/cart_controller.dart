import 'package:get/get.dart';
import 'package:mobile/app/modules/cart/providers/cart_provider.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 0.obs;
  final _provider = CartProvider();

  RxList cartElements = [].obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initData() async {
    await getUserCartElements();
  }

  void increment() => count.value++;

  void addToCart(Map element) async {
    var res = await _provider.addProductToCart(element);
    if (res.statusCode == 200) {
      Get.snackbar("Agrimarket +", res.body['message']);
    } else {
      Get.snackbar("Agrimarket + error", "Impossible d'ajouter au panier");
    }
  }

  void removeFromCart(String productId) async {
    var res = await _provider.removeFromCart(productId);
    if (res.statusCode == 200) {
      Get.snackbar("Agrimarket +", res.body['message']);
    } else {
      Get.snackbar("Agrimarket + error", "Impossible d'ajouter au panier");
    }
  }

  Future<void> getUserCartElements() async {
    var res = await _provider.getAllElements();
    if (res.statusCode == 200) {
      print('CART ELEMENTS');
      print(res.body);
      if (res.body != null) {
        cartElements.assignAll(res.body);
      }
    } else {
      print(res.body);
      print(res.statusCode);
      Get.snackbar("Agrimarket + error",
          "Impossible de récupérer les éléments du panier");
    }
  }
}
