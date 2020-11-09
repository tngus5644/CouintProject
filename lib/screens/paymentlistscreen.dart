import 'package:couintproject/widgets/TopCenterContainer.dart';
import 'package:couintproject/widgets/WebViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:couintproject/screens/shoppingscreen.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          child: Column(
            children: [
              TopCenterContainer(),
              Container(
                  child: Text(
                '데이터가 없습니다.',
                style: TextStyle(fontSize: 40),
              )),
            ],
          )),
      // bottomNavigationBar: myBottomNavigationBar(),
      );
  }
}
