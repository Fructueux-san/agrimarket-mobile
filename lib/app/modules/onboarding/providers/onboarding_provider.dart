import 'package:get/get.dart';
import 'package:mobile/app/services/storage_service.dart';
import 'package:mobile/commons/configs.dart' as conf;

class OnboardingProvider extends GetConnect {
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> lastInformations(Map userInfos) {
    var res = post("${conf.baseurl}/api/user/complete-info", userInfos,
        headers: {
          "token": storage.getToken() ?? "",
        },
        contentType: "Application/json");
    return res;
  }
}
