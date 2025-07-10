import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/producer_register/views/page1_view.dart';
import 'package:mobile/app/modules/producer_register/views/page2_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/producer_register_controller.dart';

class ProducerRegisterView extends GetView<ProducerRegisterController> {
  ProducerRegisterView({super.key});
  final _controller = PageController();
  final _registerController = Get.find<ProducerRegisterController>();
  var onLastPage = false.obs;
  //final _producerRegisterController = ProducerRegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('ProducerRegisterView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              onLastPage.value = (index == 1);
            },
            controller: _controller,
            children: [Page1View(), Page2View()],
          ),
          Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => GestureDetector(
                      child: Text(
                        "Précédent",
                        style: TextStyle(
                            color:
                                onLastPage.value ? Colors.black : Colors.grey),
                      ),
                      onTap: () {
                        if (onLastPage.value == true) {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                    )),
                SmoothPageIndicator(controller: _controller, count: 2),
                Obx(() => onLastPage.value
                    ? GestureDetector(
                        child: Text("Terminer"),
                        onTap: () async {
                          _registerController.register();
                        },
                      )
                    : GestureDetector(
                        child: Text("Suivant"),
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
