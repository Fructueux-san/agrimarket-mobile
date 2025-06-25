import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/account/views/account_view.dart';
import 'package:mobile/app/modules/cart/views/cart_view.dart';
import 'package:mobile/app/modules/explore/views/explore_view.dart';
import 'package:mobile/app/modules/favorite/views/favorite_view.dart';
import 'package:mobile/app/modules/home/controllers/bottomnav_controller.dart';
import 'package:mobile/app/modules/home/views/drawer_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final _homeController = HomeController();
  List<Widget> pages = [
    ExploreView(),
    CartView(),
    FavoriteView(),
    AccountView()
  ];
  final BottomnavController bottomnavController =
      Get.put(BottomnavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 20,
            ),
          )
        ],
        //title: const Text('HomeView'),
        centerTitle: true,
      ),
      drawer: DrawerView(),
      body: Obx(() => pages[bottomnavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              iconSize: 30,
              fixedColor: Colors.black,
              backgroundColor: Colors.black,
              //selectedFontSize: 18,
              currentIndex: bottomnavController.selectedIndex.value,
              onTap: bottomnavController.changeIndex,
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.manage_search,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(
                      Icons.manage_search,
                      color: Colors.black,
                    ),
                    label: "Explore"),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.shopping_cart,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    label: "Panier"),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      color: Colors.black,
                    ),
                    label: "Favoris"),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.person_2_rounded,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(
                      Icons.person_2_rounded,
                      color: Colors.black,
                    ),
                    label: "Moi")
              ])),
    );
  }
}
