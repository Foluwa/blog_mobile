import 'package:blog_mobile/constants/Constants.dart';
import 'package:blog_mobile/pages/LaunchScreen.dart';
import 'package:blog_mobile/provider/UserProvider.dart';
import 'package:blog_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: LaunchScreen(), //(), HomePage
      ),
    );
  }
}
