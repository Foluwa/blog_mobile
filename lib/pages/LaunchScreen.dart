import 'package:blog_mobile/pages/SignIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds:
            new SignIn(), //OnBoardingPage(), BlogHomePage() SignIn
        title: Text(
          'Blog App Demo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print('Blog App Demo'),
        loaderColor: Colors.red);
  }
}
