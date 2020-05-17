//import 'package:flutter/material.dart';
//import 'package:flutterlogindemo/main_org.dart';
//import 'login_signup_page.dart';

import 'package:flutter/material.dart';
import 'package:flutterlogindemo/services/authentication.dart';
import 'package:flutterlogindemo/pages/root_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return new MaterialApp(
        title: 'Flutter Login App',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: new RootPage(auth: new Auth())
        // home: LoginSignupPage(),
        );
  }
}
