import 'package:demo_app/pages/cart_page.dart';
import 'package:demo_app/pages/home_page.dart';
import 'package:demo_app/utils/utils.dart';
import 'package:demo_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pages/Login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
