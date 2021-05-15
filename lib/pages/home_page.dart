import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/widgets/itemWidget.dart';
import 'package:demo_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //variables in flutter
  final int days = 30;
  final String name = "Codeish";
  final bool isMale = true;
  final double pi = 3.14;
  final num = 134;
  final appName = "DemoApp";
  @override
  Widget build(BuildContext context) {
    final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Demo App",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: dumyList.length, //CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                  item: dumyList[index] //CatalogModel.items[index],
                  );
            },
          ),
        ),
        drawer: MyDrawer());
  }
}
