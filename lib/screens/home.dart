import 'package:couintproject/screens/calendarscreen.dart';
import 'package:couintproject/widgets/SignInWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  static String token;
  static LoginState loginState;



  void initState() {
    loginState = LoginState(isLogin: false, email:'email', gender : 'gender', name : 'name');
  }

  @override
  Widget build(BuildContext context) {
    initState();
    print(LoginState().email);
    if(loginState.isLogin==true) return CalendarScreen();
    else return SignInWidget();
  }
}

class LoginState{
  bool isLogin;
  String email;
  String gender;
  String name;

  LoginState({this.isLogin, this.email, this.gender, this.name});
}

// Center(
// child: Image.network(
// 'https://couint.com/img/couint_logo8.png',
// color: Colors.blueAccent,
// ),
//
// );