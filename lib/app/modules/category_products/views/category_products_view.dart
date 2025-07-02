import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/product/views/product_view.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/category_products_controller.dart';

class CategoryProductsView extends GetView<CategoryProductsController> {
  CategoryProductsView({super.key});
  final _categoryProductsController = Get.find<CategoryProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                tooltip: "Rechercher dans cette catégorie",
              )
            ],
            backgroundColor: MAIN_APP_COLOR,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(() => _categoryProductsController
                      .products.isNotEmpty
                  ? Image.network(
                      fit: BoxFit.cover,
                      "$server_scheme://$host/api/product/media/${_categoryProductsController.products.value[0].sId}")
                  : Container()),
              title: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${Get.arguments['name']}"),
                      _categoryProductsController.products.isEmpty
                          ? Text(
                              "Aucun produit à afficher",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          : Container()
                    ],
                  )),
            ),
          ),
          Obx(
            () => SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.white10)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 50,
                    width: 50,
                    child: Image.network(
                        fit: BoxFit.cover,
                        "$server_scheme://$host/api/product/media/${_categoryProductsController.products.value[index].sId}"),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_categoryProductsController.products[index].name}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        truncateText(
                            _categoryProductsController
                                    .products[index].description ??
                                "",
                            50),
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  trailing: Text(
                    "${_categoryProductsController.products[index].price} xof",
                    maxLines: 2,
                    style: TextStyle(
                        color: MAIN_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onTap: () {
                    Get.to(() => ProductView(), arguments: {
                      "productInfo": _categoryProductsController.products[index]
                    });
                  },
                );
              },
              childCount: _categoryProductsController.products.length,
            )),
          )
        ],
      ),
    );
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength).trimRight() + '...';
  }
}
