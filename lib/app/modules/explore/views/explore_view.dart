import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/explore/views/all_product_view.dart';
import 'package:mobile/app/modules/explore/views/categories_view.dart';
import 'package:mobile/app/modules/explore/views/foryou_view.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  ExploreView({super.key});

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
                  icon: Icon(Icons.all_inclusive_rounded),
                  text: "Nos produits",
                )
              ]),
        ),
        body: TabBarView(
            children: [ForyouView(), CategoriesView(), AllProductView()]),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/pomme.png",
            width: context.width * 0.35,
          ),
        ],
      ),
    );
  }
}
