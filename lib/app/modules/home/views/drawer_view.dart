import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_controller.dart';
import 'package:mobile/app/services/storage_service.dart';

class DrawerView extends GetView {
  DrawerView({super.key});
  final _homeController = HomeController();
  //final storage = Get.put(StorageService());
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage("images/avatar.png"),
                  ),
                  Obx(() => IconButton(
                      onPressed: () {
                        _homeController.toggleTheme();
                      },
                      icon: _homeController.mainTheme.value == 'dark'
                          ? Icon(Icons.sunny)
                          : Icon(Icons.dark_mode_sharp)))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${storage.getKeyValue('fullname')}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "@${storage.getKeyValue('email')}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
