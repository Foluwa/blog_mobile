import 'package:blog_mobile/pages/Home/Home.dart';
import 'package:blog_mobile/pages/LaunchScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting args for navigator.pushNamed
    final args = settings.arguments;
    print("Route information: " + settings.name);
    switch (settings.name) {
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: LaunchScreen());
      case '/blog_home':
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: BlogHomePage());
      // case '/walkthrough':
      //   return MaterialPageRoute(builder: (_) => WalkThroughPage());
      // case '/logout':
      //   return PageTransition(
      //       type: PageTransitionType.bottomToTop, child: SignIn());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
