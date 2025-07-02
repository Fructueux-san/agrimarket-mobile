import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import 'package:mobile/commons/configs.dart';

class CategoryProductsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  final _storage = Get.find<StorageService>();

  Future<Response> getAllProductsInCategory(String categoryId) {
    var resp = get(
        '$server_scheme://$host/api/category/cat/$categoryId/all-products',
        headers: {'token': _storage.getToken() ?? ""},
        contentType: "application/json");
    return resp;
  }
}
