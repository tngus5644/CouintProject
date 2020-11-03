import 'package:couintproject/widgets/SocialMediaWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/widgets/SignInWidget.dart';
import 'package:couintproject/widgets/ProfileWidget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLogin = false;

  Widget build(BuildContext context) {
    return SignInWidget ();
;
  }
}
