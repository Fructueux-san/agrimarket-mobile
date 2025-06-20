import 'package:get/get.dart';

import 'package:mobile/app/modules/home/controllers/bottomnav_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavController>(
      () => BottomnavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
