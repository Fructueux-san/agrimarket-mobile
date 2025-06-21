import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({super.key});

  final List<Item> _data = [
    Item(
        headerText: "Informations",
        expandedText:
            "La vie est belle. La vie, c'est comme du vélo, pour tenir en équilibre il faut avancer"),
    Item(
        headerText: "Apport nutritif",
        expandedText: "Pour la mise en oeuvre du PAG, bla bla, bla ..."),
    Item(headerText: "Review & Rating", expandedText: "Hehehe")
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        //title: const Text('ProductView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(child: Image.asset("images/pomme.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pomme",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Icon(Icons.favorite_outline)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "1 Kg",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "1",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Color.fromRGBO(83, 177, 117, 1),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "1200 xof",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey[110],
            ),
          ),
          Obx(() => ExpansionPanelList(
                children: _data.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(item.headerText),
                        );
                      },
                      body: ListTile(
                        title: Text(item.expandedText),
                      ));
                }).toList(),
                expansionCallback: (int index, bool isExpanded) {
                  _data[index].isExpanded = !isExpanded;
                },
              )),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15)),
            child: Text(
              "Ajouter au panier",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Item {
  Item(
      {required this.headerText,
      required this.expandedText,
      this.isExpanded = false});
  String headerText;
  String expandedText;
  bool isExpanded;
}
