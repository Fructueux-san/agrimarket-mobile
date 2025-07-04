import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import "package:mobile/commons/configs.dart" as conf;

class CartProvider extends GetConnect {
  final _storage = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> addProductToCart(data) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/cart/add/${data['productId']}";
    var toSend = {
      'userId': _storage.getKeyValue('userId'),
      'quantity': data['quantity'],
      'price': data['price'],
      'productId': data['productId']
    };
    var res = post(url, toSend, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }

  Future<Response> removeFromCart(String productId) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/cart/remove-element/${productId}";
    var res = delete(url, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      'token': _storage.getToken() ?? ""
    });
    return res;
  }

  Future<Response> getAllElements() async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/cart/all";
    var res = get(url, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "token": _storage.getToken() ?? ""
    });
    return res;
  }

  Future<Response> dropCart() async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/cart/del/all";
    var res = delete(url, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      'token': _storage.getToken() ?? ""
    });
    return res;
  }
}
