import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:mobile/app/services/storage_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final storage = Get.find<StorageService>();
  final exploreController = Get.put(ExploreController(), permanent: true);
  final favoritesController = Get.put(FavoriteController(), permanent: true);

  // final storage = Get.put(StorageService());
  var mainTheme = 'light'.obs;

  void increment() => count.value++;

  @override
  void onInit() {
    super.onInit();
    mainTheme.value = storage.getKeyValue('theme') ?? 'light';
  }

  @override
  void onReady() {
    super.onReady();
  }

  void toggleTheme() {
    var storage = Get.put(StorageService());
    if (storage.getKeyValue('theme') == 'dark') {
      storage.setKeyStringValue('theme', 'light');
      mainTheme.value = 'light';
      Get.changeTheme(ThemeData.light());
    } else {
      storage.setKeyStringValue('theme', 'dark');
      mainTheme.value = 'dark';
      Get.changeTheme(ThemeData.dark(useMaterial3: true));
    }
  }
}
