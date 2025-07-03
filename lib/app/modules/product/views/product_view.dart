import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/commons/configs.dart';
import 'package:mobile/commons/ui_element.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({super.key});

  var args = Get.arguments;

  final List<Item> _data = [
    Item(
        headerText: "Informations",
        expandedText:
            "La vie est belle. La vie, c'est comme du vélo, pour tenir en équilibre il faut avancer"),
    Item(
        headerText: "Apport nutritif",
        expandedText: "Pour la mise en oeuvre du PAG, bla bla, bla ..."),
    Item(headerText: "Review & Rating", expandedText: "Hehehe")
  ].obs;

  RxInt quantity = 1.obs;
  final _productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.purple[100],
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                fit: BoxFit.cover,
                "$server_scheme://$host/api/product/media/${Get.arguments['productInfo'].sId}",
                width: context.width * 0.35,
                height: context.height * 0.25,
              ),
              //title: Text(
              //  Get.arguments['productInfo'].name,
              //),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            maxLines: 3,
                            "${Get.arguments['productInfo'].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Obx(() => IconButton(
                            onPressed: () {
                              if (_productController.productInFavs(
                                  Get.arguments['productInfo'].sId)) {
                                _productController.removeFromFavorites(
                                    Get.arguments['productInfo'].sId);
                              } else {
                                _productController.addToFavorites(
                                    Get.arguments['productInfo'].sId);
                              }
                            },
                            icon: _productController.productInFavs(
                                    Get.arguments['productInfo'].sId)
                                ? Icon(
                                    Icons.favorite,
                                    color: MAIN_APP_COLOR,
                                  )
                                : Icon(Icons.favorite_outline)))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Get.arguments['productInfo'].description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "1 Kg",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (quantity.value > 1) {
                                quantity.value = quantity.value - 1;
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey,
                            )),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() => Text(
                                "$quantity",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              quantity.value++;
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color.fromRGBO(83, 177, 117, 1),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${Get.arguments['productInfo'].price} xof / Kg",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey[110],
                  ),
                ),
                Obx(() => ExpansionPanelList(
                      children: _data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(item.headerText),
                              );
                            },
                            body: ListTile(
                              title: Text(item.expandedText),
                            ));
                      }).toList(),
                      expansionCallback: (int index, bool isExpanded) {
                        _data[index].isExpanded = !isExpanded;
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                /*ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15)),
                  child: Text(
                    "Ajouter au panier",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )*/
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  "xof ${Get.arguments['productInfo'].price * quantity.value}",
                  style: TextStyle(
                      color: MAIN_APP_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
            CustomButton(
              title: "Panier",
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart,
                weight: 20,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        )),
      ),
    );
  }
}

class Item {
  Item(
      {required this.headerText,
      required this.expandedText,
      this.isExpanded = false});
  String headerText;
  String expandedText;
  bool isExpanded;
}
