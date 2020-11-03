import 'package:couintproject/screens/shoppingscreen.dart';
import 'package:couintproject/widgets/SignInWidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';




class Home extends StatelessWidget {
  static bool loginState = false;
  static String token;
  @override
  Widget build(BuildContext context) {

    if(loginState==true) return Shopping();
    else return SignInWidget();


  }

}


// Center(
// child: Image.network(
// 'https://couint.com/img/couint_logo8.png',
// color: Colors.blueAccent,
// ),
//
// );