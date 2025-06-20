import 'package:get/get.dart';
import 'package:mobile/app/modules/login/views/login_view.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
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
    Get.to(() => LoginView());
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
