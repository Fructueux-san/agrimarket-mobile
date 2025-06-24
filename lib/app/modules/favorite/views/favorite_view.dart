import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
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
                hintText: "Rechercher un producteur ..."),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Récement",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(246, 246, 246, 1),
                  border: Border.all(color: Color.fromRGBO(156, 156, 156, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/fruits_basket.png",
                    scale: 2.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Panier de fruits chic",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "By Chicance fruity",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "cmd: x1 le 12-03-2025",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Total : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "6500 xof",
                                style: TextStyle(
                                    color: Color.fromRGBO(83, 177, 117, 1)))
                          ]))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Color.fromRGBO(83, 177, 117, 1)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(246, 246, 246, 1),
                  border: Border.all(color: Color.fromRGBO(156, 156, 156, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/ginger.png",
                    scale: 2.2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "13 épices",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "By Spicy Master",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "cmd: x1 le 12-03-2025",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Total : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: "6500 xof",
                                style: TextStyle(
                                    color: Color.fromRGBO(83, 177, 117, 1)))
                          ]))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Color.fromRGBO(83, 177, 117, 1)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Voir plus",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Vos producteurs",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Vous les avez apprécier. Soyez coll en partageant à vos amis",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
