import 'package:demo_app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome $name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: "Enter username", labelText: "Username")),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password")),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 40 : 150,
                      height: 40,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 40 : 8)),
                    ),
                  )
                  // ElevatedButton(
                  //     style: TextButton.styleFrom(minimumSize: Size(150, 35)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: Text('Login'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
