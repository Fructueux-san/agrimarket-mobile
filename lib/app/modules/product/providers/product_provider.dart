import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import "package:mobile/commons/configs.dart" as conf;

class ProductProvider extends GetConnect {
  final _storage = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> addToFavorites(productId) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/add-to-fav/$productId";
    var res = get(url, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }

  Future<Response> removeFromFavorites(productId) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/rm-from-fav/$productId";
    var res = get(url, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }
}
