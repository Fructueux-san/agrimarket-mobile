import 'package:get/get.dart';
import 'package:mobile/commons/configs.dart' as conf;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "/api/user/login";
  }

  Future<Response> loginAPICall(Map<String, String> userData) {
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/login";
    print(url);
    var res = post(url, userData, contentType: "Application/json");
    return res;
  }

  Future<Response> logoutAPICall() async {
    final prefs = await SharedPreferences.getInstance();
    var url =
        "${conf.server_scheme}://${conf.server}:${conf.server_port}/api/user/logout";
    print(url);
    var res = delete(url, headers: {
      "token": prefs.getString('token') ?? ""
    });
    return res;

  }
}
