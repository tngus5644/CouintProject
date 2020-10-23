import 'file:///D:/FLUTTERPROJECT/couintproject/lib/screens/home.dart';
import 'package:couintproject/screens/paymentlistscreen.dart';
import 'package:couintproject/screens/couponscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


///라우트를 통해 페이지 이동
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'couintProject',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/coupon': (context) => CouponPoint(),
        '/payment': (context) => PaymentList()
      },
    );
  }
}
