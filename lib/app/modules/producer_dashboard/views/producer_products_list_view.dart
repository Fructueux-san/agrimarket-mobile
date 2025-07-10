import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProducerProductsListView extends GetView {
  const ProducerProductsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProducerProductsListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProducerProductsListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
