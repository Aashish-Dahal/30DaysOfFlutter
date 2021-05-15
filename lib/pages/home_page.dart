import 'dart:convert';

import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/widgets/itemWidget.dart';
import 'package:demo_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson.toString());
    var productData = decodedData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Demo App",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                        child: GridTile(
                            header: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.blue),
                                child: Text(
                                  item.name,
                                  style: TextStyle(color: Colors.white),
                                )),
                            footer: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.black),
                                child: Text("\$${item.price.toString()}",
                                    style: TextStyle(color: Colors.white))),
                            child: Image.network(item.image)));
                    // ItemWidget(
                    //   item: CatalogModel.items[index],
                    // );
                  },
                )
              : LinearProgressIndicator(),
        ),
        drawer: MyDrawer());
  }
}
