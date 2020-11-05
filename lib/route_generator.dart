
import 'package:couintproject/screens/couponscreen.dart';
import 'package:couintproject/screens/home.dart';
import 'package:couintproject/screens/shoppingscreen.dart';
import 'package:couintproject/screens/paymentlistscreen.dart';
import 'package:couintproject/screens/profilescreen.dart';
import 'package:couintproject/widgets/SignInWidget.dart';
import 'package:couintproject/widgets/SignUpWidget.dart';
import 'package:couintproject/widgets/WebViewWidget.dart';
import 'package:flutter/material.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/shopping':
        return MaterialPageRoute(builder: (_) => Shopping());
      case '/coupon':

        return MaterialPageRoute(builder: (_) => CouponPoint());

      case '/payment':
        return MaterialPageRoute(builder: (_) => PaymentList());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInWidget());
      case '/accountwebview':
        return MaterialPageRoute(builder: (_) => WebViewWidget());



      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
