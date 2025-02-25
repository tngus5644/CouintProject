import 'package:couintproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/widgets/SocialMediaWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:couintproject/models/loginmodel.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({
    Key key,
  }) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool _showPassword = false;
  Future<String> futureToken;
  String token;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static String signInId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    print(Home.loginState.email);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 65, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text('Sign In',
                          style: Theme.of(context).textTheme.headline2),
                      SizedBox(height: 20),
                      TextField(
                        style: TextStyle(color: Theme.of(context).accentColor),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .merge(
                                TextStyle(color: Theme.of(context).accentColor),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          prefixIcon: Icon(Icons.home),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        style: TextStyle(color: Theme.of(context).accentColor),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .merge(
                                TextStyle(color: Theme.of(context).accentColor),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          prefixIcon: Icon(
                            Icons.home,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(_showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot your password ?',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(height: 30),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                        onPressed: () async {
                          futureToken = Future.value('fail');
                          futureToken = postLogIn(
                              'tngus5644@kakao.com', '00000000');
                          /// 변경할것

                          ///emailController.text,
                          ///passwordController.text

                          token = await futureToken;
                          if (token == 'postfail') {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("로그인 정보를 확인하세요.")),
                            );
                          } else {
                            Home.loginState.email = emailController.text;
                            Home.loginState.isLogin = true;
                            Home.token = token;

                            Navigator.of(context).popAndPushNamed('/calendar');
                          }
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline6.merge(
                                TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: StadiumBorder(),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Or using social media',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 20),
                      SocialMediaWidget()
                    ],
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6.merge(
                        TextStyle(color: Theme.of(context).primaryColor),
                      ),
                  children: [
                    TextSpan(text: 'Don\'t have an account ?'),
                    TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
