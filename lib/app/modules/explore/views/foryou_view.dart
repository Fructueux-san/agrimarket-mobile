import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobile/app/data/CategoryModel.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/product/controllers/product_controller.dart';
import 'package:mobile/app/modules/product/views/product_view.dart';
import 'package:mobile/commons/configs.dart';

class ForyouView extends GetView {
  ForyouView({super.key});
  final ExploreController _exploreController = Get.find<ExploreController>();
  final _productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => LiquidPullToRefresh(
          backgroundColor: Colors.white54,
          color: Colors.grey[100],
          onRefresh: () async {
            await _exploreController.loadDataForHomePage();
          },
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _exploreController.catsWithProducts.length,
              itemBuilder: (context, indexCats) {
                CategoryModel category =
                    _exploreController.catsWithProducts[indexCats];
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
                              text: "${category.name} ",
                              children: [
                                TextSpan(
                                    text: "(-20%)",
                                    style: TextStyle(
                                        color: MAIN_APP_COLOR, fontSize: 16))
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
                            "${category.description}",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.width * 0.50 + 90,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          itemBuilder: (context, index) {
                            ProductModel product = category.products[index];
                            var productImage = Image.network(
                              fit: BoxFit.cover,
                              "$server_scheme://$host/api/product/media/${product.sId}",
                              width: context.width * 0.35,
                              height: context.height * 0.25,
                            );
                            return SizedBox(
                              width: context.width * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => ProductView(),
                                              arguments: {
                                                "productInfo": product,
                                                "productImage": productImage
                                              });
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: productImage,
                                        ),
                                      ),
                                      Obx(() => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () async {
                                                if (_productController
                                                    .productInFavs(
                                                        product.sId)) {
                                                  await _productController
                                                      .removeFromFavorites(
                                                          product.sId!);
                                                } else {
                                                  await _productController
                                                      .addToFavorites(
                                                          product.sId!);
                                                }
                                              },
                                              child: Container(
                                                  width: 35,
                                                  height: 35,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: _productController
                                                          .productInFavs(
                                                              product.sId)
                                                      ? Icon(
                                                          Icons.favorite,
                                                          color: MAIN_APP_COLOR,
                                                        )
                                                      : Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.red,
                                                        )),
                                            ),
                                          ))
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
                                    "${product.name}",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "xof ${product.price} par Kg",
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
                          itemCount: category.products.length),
                    ),
                  ],
                );
              }),
        ));
  }
}
