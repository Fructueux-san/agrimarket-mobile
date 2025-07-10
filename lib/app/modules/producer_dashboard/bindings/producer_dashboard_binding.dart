import 'package:get/get.dart';

import '../controllers/producer_dashboard_controller.dart';

class ProducerDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProducerDashboardController>(
      () => ProducerDashboardController(),
    );
  }
}
