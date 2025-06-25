import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobile/app/modules/product/views/product_view.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  ExploreView({super.key});
  final ExploreController _exploreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Rechercher ..."),
            ),
          ),
          centerTitle: true,
          bottom: ButtonsTabBar(
              backgroundColor: MAIN_APP_COLOR,
              unselectedBackgroundColor: Colors.grey[200],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              splashColor: Colors.lightGreen,
              // buttonMargin: EdgeInsets.all(20),
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              height: 40,
              labelSpacing: 10,
              tabs: [
                Tab(
                  icon: Icon(Icons.emoji_food_beverage_outlined),
                  text: "Pour vous",
                ),
                Tab(
                  icon: Icon(Icons.restaurant_menu_outlined),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.cloud),
                  text: "Pour nuage",
                )
              ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Offres exclusives",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, count) {
                        return InkWell(
                          onTap: () {
                            print("tap on it");
                            // On va sur la page de présentation du produit
                            Get.to(() => ProductView());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xD0CECEFF)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "images/pomme.png",
                                      scale: 3,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pomme rouge",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "BenBio labs",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("XOF 1200, kg"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  83, 177, 117, 1)),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            weight: 20,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ceci pourrait vous intéresser",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, count) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xD0CECEFF)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "images/ginger.png",
                                    scale: 3,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pomme rouge",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "BenBio labs",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("XOF 1200, kg"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        style: IconButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(
                                                83, 177, 117, 1)),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          weight: 20,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          LiquidPullToRefresh(
              onRefresh: () async {
                await _exploreController.loadCategories();
              },
              color: Colors.grey,
              height: 100,
              backgroundColor: Colors.white,
              animSpeedFactor: 2,
              showChildOpacityTransition: false,
              child: Obx(
                () => MasonryGridView.builder(
                    itemCount: _exploreController.categories.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: CATEGORIES_COLORS_LIST[Random()
                                  .nextInt(CATEGORIES_COLORS_LIST.length)],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: Random().nextInt(100) + 70,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                _exploreController.categories[index]['name'] +
                                    _exploreController.categories[index]
                                        ['icon']),
                          )),
                        ),
                      );
                    }),
              )),
          Center(
            child: Text("Hahahaha"),
          )
        ]),
      ),
    );
  }
}
