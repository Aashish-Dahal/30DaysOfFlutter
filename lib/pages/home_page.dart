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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Demo App",
          ),
        ),
        body: Center(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
        drawer: MyDrawer());
  }
}
