import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllProductView extends GetView {
  const AllProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllProductView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
