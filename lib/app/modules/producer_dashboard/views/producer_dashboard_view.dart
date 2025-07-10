import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/producer_dashboard_controller.dart';

class ProducerDashboardView extends GetView<ProducerDashboardController> {
  const ProducerDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProducerDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProducerDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
