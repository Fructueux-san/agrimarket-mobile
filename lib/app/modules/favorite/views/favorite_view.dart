import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/product/controllers/product_controller.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({super.key});
  final _exploreController = Get.find<ExploreController>();
  final _favController = Get.find<FavoriteController>();
  final _productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                hintText: "Rechercher un producteur ..."),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => LiquidPullToRefresh(
            showChildOpacityTransition: false,
            backgroundColor: Colors.white24,
            color: Colors.grey,
            onRefresh: () async {
              _exploreController.getUserFavoriteProducts();
              await _favController.getUserFavoriteProducts();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Mes favoris",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          ProductModel product =
                              _exploreController.userFavorites[index];
                          return Obx(() => Dismissible(
                                background: Container(
                                  color: Colors.red,
                                  child: Icon(Icons.delete),
                                ),
                                key: ValueKey(
                                    _exploreController.userFavorites[index]),
                                onDismissed: (DismissDirection direction) {
                                  _productController
                                      .removeFromFavorites(product.sId!);
                                  _favController.getUserFavoriteProducts();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color.fromRGBO(246, 246, 246, 1),
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              156, 156, 156, 1))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            padding: EdgeInsets.all(10),
                                            height: 80,
                                            width: 80,
                                            child: Image.network(
                                              fit: BoxFit.cover,
                                              "$server_scheme://$host/api/product/media/${product.sId}",
                                              width: context.width * 0.35,
                                              height: context.height * 0.25,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${product.name}",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              Obx(() => Text(
                                                    "${_favController.userFavsFarmersInformations[product.farmerId]!['fullname']}",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )),
                                              //Text(
                                              //  "cmd: x1 le 12-03-2025",
                                              //  style: TextStyle(fontWeight: FontWeight.bold),
                                              // ),
                                              RichText(
                                                  text: TextSpan(
                                                      text: "Prix : ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      children: [
                                                    TextSpan(
                                                        text:
                                                            "${product.price} xof",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    83,
                                                                    177,
                                                                    117,
                                                                    1)))
                                                  ]))
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: IconButton(
                                            style: IconButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    83, 177, 117, 1)),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: _exploreController.userFavorites.length),
                    Obx(() => _exploreController.userFavorites.length > 2
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Voir plus",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        : Container()),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Vos producteurs",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Vous les avez apprécier. Soyez coll en partageant à vos amis",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
