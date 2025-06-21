import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/product/views/product_view.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Rechercher ..."),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Offres exclusives",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 220,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, count) {
                    return InkWell(
                      onTap: () {
                        print("tap on it");
                        // On va sur la page de présentation du produit
                        Get.to(() => ProductView());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xD0CECEFF)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  "images/pomme.png",
                                  scale: 3,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pomme rouge",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "BenBio labs",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("XOF 1200, kg"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(83, 177, 117, 1)),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        weight: 20,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ceci pourrait vous intéresser",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 220,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, count) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xD0CECEFF)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                "images/ginger.png",
                                scale: 3,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pomme rouge",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "BenBio labs",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("XOF 1200, kg"),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(83, 177, 117, 1)),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      weight: 20,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
