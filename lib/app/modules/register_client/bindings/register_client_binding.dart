import 'package:get/get.dart';

import '../controllers/register_client_controller.dart';

class RegisterClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterClientController>(
      () => RegisterClientController(),
    );
  }
}
