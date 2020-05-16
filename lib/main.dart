import 'package:flutter/material.dart';
import 'package:flutterlogindemo/main_org.dart';
import 'login_signup_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return new MaterialApp(
      title: 'Flutter Login App',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginSignupPage(),
    );
  }
}
