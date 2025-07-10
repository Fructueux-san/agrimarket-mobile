import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProducerOrdersListView extends GetView {
  const ProducerOrdersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProducerOrdersListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProducerOrdersListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
