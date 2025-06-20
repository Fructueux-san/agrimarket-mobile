import 'package:get/get.dart';
import 'package:mobile/commons/configs.dart' as conf;

class RegisterClientProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> registerAPICall(Map<String, String> userData) async {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/register";
    var res = post(url, userData, headers: {
      "Content-Type": "Application/json",
      "accept": "Application/json"
    });
    return res;
  }
}
