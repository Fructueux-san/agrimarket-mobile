import 'package:get/get.dart';

import '../controllers/producer_register_controller.dart';

class ProducerRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProducerRegisterController>(
      () => ProducerRegisterController(),
    );
  }
}
