import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProducerStatsView extends GetView {
  const ProducerStatsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProducerStatsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProducerStatsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
