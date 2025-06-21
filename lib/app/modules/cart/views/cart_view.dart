import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon panier'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Liste scrollable
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("images/ginger.png", scale: 2.2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ginger special",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("1Kg, Price",
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove, color: Colors.grey),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
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
                            Text("100 xof",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
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
                  child: Text(
                    "Passer au paiement 1000 xof",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
