import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/splash/views/splash_view.dart';
import 'package:mobile/app/services/storage_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageService().init());
  runApp(
    GetMaterialApp(
      title: "Application",
      //initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: SplashView(),
      theme: ThemeData(useMaterial3: true),
    ),
  );
}
