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
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  '결제 내역',
                  style: TextStyle(fontSize: 40),
                ),
                width: 420,
                height: 60,
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              Container(
                  child: Text(
                '데이터가 없습니다.',
                style: TextStyle(fontSize: 40),
              )),
            ],
          )),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }
}
