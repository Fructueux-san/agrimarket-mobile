import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mobile/app/data/product_model.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/app/modules/product/controllers/product_controller.dart';
import 'package:mobile/app/modules/product/views/product_view.dart';
import 'package:mobile/commons/configs.dart';

class AllProductView extends GetView {
  AllProductView({super.key});
  final _exploreController = Get.find<ExploreController>();
  final _productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => MasonryGridView.builder(
            shrinkWrap: false,
            physics: AlwaysScrollableScrollPhysics(),
            controller: _exploreController.allProductScrollController,
            itemCount: _exploreController.allProducts.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              ProductModel product = _exploreController.allProducts[index];
              var productImage = Image.network(
                fit: BoxFit.cover,
                "$server_scheme://$host/api/product/media/${product.sId}",
                width: context.width * 0.35,
                height: context.height * 0.25,
              );
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: context.width * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => ProductView(), arguments: {
                                    "productInfo": product,
                                    "productImage": productImage
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: productImage,
                                ),
                              ),
                              Obx(() => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        if (_productController
                                            .productInFavs(product.sId)) {
                                          await _productController
                                              .removeFromFavorites(
                                                  product.sId!);
                                        } else {
                                          await _productController
                                              .addToFavorites(product.sId!);
                                        }
                                      },
                                      child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: _productController
                                                  .productInFavs(product.sId)
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
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
                    ),
                  ),
                  Obx(() => (index ==
                              _exploreController.allProducts.length - 1 &&
                          _exploreController.allProductsIsLoading.value == true)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: SpinKitCircle(
                                color: MAIN_APP_COLOR,
                                //size: 40,
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink())
                ],
              );
            })));
  }
}
