import 'package:flutter/material.dart';

class CouponPoint extends StatefulWidget {
  @override
  _CouponPointState createState() => _CouponPointState();
}

class _CouponPointState extends State<CouponPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
            child: Text('couponPage'),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}
