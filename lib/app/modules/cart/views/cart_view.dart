import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/commons/configs.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  CartView({super.key});

  final _cartContoller = Get.find<CartController>();
  RxDouble totalPrice = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Mon panier'),
        centerTitle: true,
        backgroundColor: Colors.white10,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Liste scrollable
            Expanded(
              child: ListView.builder(
                itemCount: _cartContoller.cartElements.length,
                itemBuilder: (context, index) {
                  var element = _cartContoller.cartElements[index];
                  RxInt quantity = int.parse(
                          "${_cartContoller.cartElements[index]['quantity']}")
                      .toInt()
                      .obs;
                  return Dismissible(
                    background: Container(
                      color: Colors.red[300],
                      child: Icon(Icons.delete_rounded),
                    ),
                    key: ValueKey(_cartContoller.cartElements[index]),
                    onDismissed: (DismissDirection direction) {
                      _cartContoller.removeFromCart(element['product']['_id']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                fit: BoxFit.cover,
                                "$server_scheme://$host/api/product/media/${element['product']['_id']}",
                                width: context.width * 0.35,
                                height: context.height * 0.25,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${element['product']['name']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("1Kg, Price",
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (quantity.value > 1) {
                                          quantity.value--;
                                          element["quantity"] = quantity.value;
                                          _cartContoller.updateCartElement({
                                            "product": element['product']
                                                ['_id'],
                                            "quantity": quantity.value,
                                            "price": element["product"]
                                                    ['price'] *
                                                quantity.value
                                          });
                                        }

                                        _cartContoller.cartElements.refresh();
                                      },
                                      icon: Icon(Icons.remove,
                                          color: Colors.grey),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 15),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Obx(() => Text(
                                            "$quantity",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        quantity.value++;
                                        element["quantity"] = quantity.value;
                                        _cartContoller.updateCartElement({
                                          "productId": element['product']
                                              ['_id'],
                                          "quantity": quantity.value,
                                          "price": element["product"]['price'] *
                                              quantity.value
                                        });
                                        _cartContoller.cartElements.refresh();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Color.fromRGBO(83, 177, 117, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.close, size: 20),
                                ),
                                SizedBox(height: 20),
                                Obx(() => Text(
                                    "${element["product"]['price'] * quantity.value} xof",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bouton en bas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // action paiement
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Obx(() => Text(
                        "Passer au paiement ${_cartContoller.cartElements.fold(0, (sum, item) => sum + (int.parse("${item["product"]['price']}") * int.parse("${item["quantity"]}")))} xof",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
