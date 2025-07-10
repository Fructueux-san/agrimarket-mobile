import 'package:get/get.dart';

class ProducerDashboardController extends GetxController {
  //TODO: Implement ProducerDashboardController

  final selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(int newIndex) {
    selectedIndex.value = newIndex;
  }
}
