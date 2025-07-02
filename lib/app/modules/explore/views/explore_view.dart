import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobile/app/modules/explore/views/categories_view.dart';
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
          Obx(() => LiquidPullToRefresh(
                backgroundColor: Colors.white54,
                color: Colors.grey[100],
                onRefresh: () async {
                  await _exploreController.loadDataForHomePage();
                },
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _exploreController.catsWithProducts.length,
                    itemBuilder: (context, index_cats) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text:
                                        "${_exploreController.catsWithProducts[index_cats].name} ",
                                    children: [
                                      TextSpan(
                                          text: "(-20%)",
                                          style: TextStyle(
                                              color: MAIN_APP_COLOR,
                                              fontSize: 16))
                                    ],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  style: TextStyle(),
                                  textAlign: TextAlign.start,
                                  "${_exploreController.catsWithProducts[index_cats].description}",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.width * 0.50 + 90,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                itemBuilder: (context, index) {
                                  var productImage = Image.network(
                                    fit: BoxFit.cover,
                                    "$server_scheme://$host/api/product/media/${_exploreController.catsWithProducts[index_cats].products[index].sId}",
                                    width: context.width * 0.35,
                                    height: context.height * 0.25,
                                  );
                                  return SizedBox(
                                    width: context.width * 0.35,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(ProductView(),
                                                    arguments: {
                                                      "productInfo":
                                                          _exploreController
                                                              .catsWithProducts[
                                                                  index_cats]
                                                              .products[index],
                                                      "productImage":
                                                          productImage
                                                    });
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: productImage,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 16,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              }),
                                        ),
                                        Text(
                                          "${_exploreController.catsWithProducts[index_cats].products[index].name}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "xof ${_exploreController.catsWithProducts[index_cats].products[index].price} par Kg",
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 20,
                                    ),
                                itemCount: _exploreController
                                    .catsWithProducts[index_cats]
                                    .products
                                    .length),
                          ),
                        ],
                      );
                    }),
              )),
          CategoriesView(),
          Center(
            child: Text("Hahahaha"),
          )
        ]),
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
