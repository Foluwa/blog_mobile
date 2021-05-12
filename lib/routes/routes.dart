// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:maidoki/pages/Annoucements/Details/AnnoucementDetails.dart';


// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Getting args for navigator.pushNamed
//     final args = settings.arguments;
//     print("Route information: " + settings.name);
//     switch (settings.name) {
//       case '/':
//         return PageTransition(
//             type: PageTransitionType.bottomToTop, child: LaunchScreen());
//       case '/walkthrough':
//         return MaterialPageRoute(builder: (_) => WalkThroughPage());
//       case '/logout':
//         return PageTransition(
//             type: PageTransitionType.bottomToTop, child: SignIn());
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error Page'),
//         ),
//         body: Center(
//           child: Text('Error'),
//         ),
//       );
//     });
//   }
// }
