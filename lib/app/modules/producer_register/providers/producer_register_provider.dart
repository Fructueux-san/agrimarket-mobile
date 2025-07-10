import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import "package:mobile/commons/configs.dart" as conf;

class ProducerRegisterProvider extends GetConnect {
  final _storage = Get.find<StorageService>();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> register(Map userData) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/register";
    var res = post(url, userData, headers: {
      'accept': "applications/json",
      "Content-Type": "Application/json"
    });
    return res;
  }
}
