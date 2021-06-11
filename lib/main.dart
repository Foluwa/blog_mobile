import 'package:blog_mobile/constants/Constants.dart';
import 'package:blog_mobile/pages/LaunchScreen.dart';
import 'package:blog_mobile/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: LaunchScreen(), //(), HomePage
    );
  }
}
