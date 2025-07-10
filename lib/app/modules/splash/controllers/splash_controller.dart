import 'package:get/get.dart';
import 'package:mobile/app/modules/crossroads/views/crossroads_view.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';
import 'package:mobile/app/modules/home/views/home_view.dart';
import 'package:mobile/app/modules/producer_dashboard/controllers/producer_dashboard_controller.dart';
import 'package:mobile/app/modules/producer_dashboard/views/producer_dashboard_view.dart';
import 'package:mobile/app/services/storage_service.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    navigateToHome();
    super.onReady();
  }

  Future navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final token = storage.getToken();
      storage.showUserInformation();
      final int exp = int.parse(storage.getKeyValue('exp'));
      if (token != null && exp < DateTime.now().millisecondsSinceEpoch) {
        Get.snackbar(
            "Hello ! ", "Bon retour, ${storage.getKeyValue("fullname")}");
        if (storage.getKeyValue("user_type") == 'CLIENT') {
          Get.put(HomeController());
          Get.put(ExploreController());
          Get.offAll(() => HomeView());
        } else {
          Get.put(ProducerDashboardController());
          Get.offAll(() => ProducerDashboardView());
        }
      } else {
        Get.offAll(() => CrossroadsView());
      }
    } catch (e) {
      print(e);
      Get.offAll(() => CrossroadsView());
    }

    //Get.to(() => LoginView());
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
