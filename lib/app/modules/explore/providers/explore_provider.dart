import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import 'package:mobile/commons/configs.dart' as conf;

class ExploreProvider extends GetConnect {
  final _storage = Get.find<StorageService>();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> getAllCategories() async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/category/all";
    var res = get(url, headers: {
      'accept': "applications/json",
      'token': await _storage.getKeyValue('token') ?? ""
    });
    return res;
  }

  Future<Response> explorationDataFetching({elementPerCats = 3}) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/explore-page?limit=$elementPerCats";
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
