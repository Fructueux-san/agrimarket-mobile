import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import "package:mobile/commons/configs.dart" as conf;

class FavoriteProvider extends GetConnect {
  final _storage = Get.find<StorageService>();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> farmerInfo(String farmerId) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/farmer/$farmerId";
    var res = get(url, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }

  Future<Response> getUserFavs() async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/products-favlist";
    var res = get(url, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }
}
