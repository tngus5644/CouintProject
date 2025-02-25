import 'package:couintproject/route_generator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'config/app_config.dart' as config;

import 'package:flutter/material.dart';

void main() {
  KakaoContext.clientId = '4bbb077dbe7fa59050047e39f7bf0fad';
  KakaoContext.javascriptClientId = "d716358c3c4bbcc1ca7378671ad1e26e";

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'couintProject',

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      darkTheme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Colors.blueAccent,
        focusColor: config.Colors().accentColor(1),
        hintColor: config.Colors().secondColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline5: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
          headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blueAccent),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.blueAccent),
          headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Colors.blueAccent),
          headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.blueAccent),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.blueAccent),
          headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.blueAccent),
          bodyText1: TextStyle(fontSize: 10.0, color: Colors.blueAccent),
          bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.blueAccent),
          caption: TextStyle(fontSize: 12.0, color: Colors.blueAccent),
        ),
        // fontFamily: 'Poppins',
        // primaryColor: Color(0xFF252525),
        // brightness: Brightness.dark,
        // scaffoldBackgroundColor: Color(0xFF2C2C2C),
        // accentColor: config.Colors().mainDarkColor(1),
        // hintColor: config.Colors().secondDarkColor(1),
        // focusColor: config.Colors().accentDarkColor(1),
        // textTheme: TextTheme(
        //   button: TextStyle(color: Color(0xFF252525)),
        //   headline: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
        //   display1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
        //   display2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
        //   display3: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1)),
        //   display4: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1)),
        //   subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1)),
        //   title: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1)),
        //   body1: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
        //   body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1)),
        //   caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
        // ),
      ),
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        brightness: Brightness.light,
        accentColor: config.Colors().mainColor(1),
        focusColor: config.Colors().accentColor(1),
        hintColor: config.Colors().secondColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline5: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
          headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
          headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1)),
          headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainColor(1)),
          headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondColor(1)),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondColor(1)),
          headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: config.Colors().mainColor(1)),
          bodyText2: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1)),
          bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: config.Colors().secondColor(1)),
          caption: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(0.6)),
        ),
      ),

    );
  }
}
