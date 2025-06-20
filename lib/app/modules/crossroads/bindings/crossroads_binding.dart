import 'package:get/get.dart';

import '../controllers/crossroads_controller.dart';

class CrossroadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrossroadsController>(
      () => CrossroadsController(),
    );
  }
}
