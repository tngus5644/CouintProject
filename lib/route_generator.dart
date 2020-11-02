
import 'package:couintproject/screens/couponscreen.dart';
import 'package:couintproject/screens/home.dart';
import 'package:couintproject/screens/paymentlistscreen.dart';
import 'package:couintproject/screens/profilescreen.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/coupon':

        return MaterialPageRoute(builder: (_) => CouponPoint());

      case '/payment':
        return MaterialPageRoute(builder: (_) => PaymentList());
      case '/profile':
        return MaterialPageRoute(builder: (_) => SignInWidget());


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
