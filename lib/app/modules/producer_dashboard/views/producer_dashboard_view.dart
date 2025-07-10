import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/producer_dashboard/views/producer_drawer_view.dart';
import 'package:mobile/app/modules/producer_dashboard/views/producer_orders_list_view.dart';
import 'package:mobile/app/modules/producer_dashboard/views/producer_products_list_view.dart';
import 'package:mobile/app/modules/producer_dashboard/views/producer_stats_view.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/producer_dashboard_controller.dart';

class ProducerDashboardView extends GetView<ProducerDashboardController> {
  ProducerDashboardView({super.key});
  final _controller = Get.find<ProducerDashboardController>();
  List<Widget> pages = [
    ProducerProductsListView(),
    ProducerOrdersListView(),
    ProducerStatsView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('ProducerDashboardView'),

        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_outlined))
        ],
      ),
      drawer: ProducerDrawerView(),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: _controller.selectedIndex.value,
              onTap: _controller.changeIndex,
              iconSize: 30,
              elevation: 30,
              selectedItemColor: MAIN_APP_COLOR,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.view_list,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(Icons.view_list),
                    label: "Mes produits"),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.checklist,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(Icons.checklist),
                    label: "Commandes"),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.stacked_line_chart,
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    icon: Icon(Icons.stacked_line_chart),
                    label: "Stats")
              ])),
      body: Obx(() => pages[_controller.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
