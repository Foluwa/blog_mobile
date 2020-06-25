import 'package:flutter/material.dart';
import 'pages/Auth/LoginPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFFB415B), fontFamily: "Ubuntu"),
      home: LoginPage(),
    );
  }
}
