import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mobile/app/modules/explore/controllers/explore_controller.dart';
import 'package:mobile/commons/configs.dart';

class CategoriesView extends GetView {
  CategoriesView({super.key});
  final _exploreController = Get.find<ExploreController>();
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
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
                return InkWell(
                  onTap: () {
                    /*Get.put(
                        CategoryProductsController(
                            _exploreController.categories[index]['_id']),
                        permanent: false);*/

                    Get.toNamed("/category-products",
                        parameters: {
                          'category': _exploreController.categories[index]
                              ['_id']
                        },
                        arguments: _exploreController.categories[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: CATEGORIES_COLORS_LIST[
                              Random().nextInt(CATEGORIES_COLORS_LIST.length)],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //height: Random().nextInt(100) + 70,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _exploreController.categories[index]['icon'] !=
                                null
                            ? Text(
                                _exploreController.categories[index]['name'] +
                                    _exploreController.categories[index]
                                        ['icon'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            : Text(
                                _exploreController.categories[index]['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                      )),
                    ),
                  ),
                );
              }),
        ));
  }
}
