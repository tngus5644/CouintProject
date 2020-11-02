import 'package:couintproject/models/fetchapi.dart';
import 'package:couintproject/screens/paymentlistscreen.dart';
import 'package:couintproject/screens/profilescreen.dart';

import 'package:flutter/material.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:couintproject/widgets/HomeSliderWidget.dart';
import 'package:couintproject/widgets/productwidget.dart';
import 'package:couintproject/widgets/mystickyheader.dart';
import 'package:couintproject/widgets/producticonwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:couintproject/models/markets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:couintproject/models/products.dart';
import 'package:http/http.dart' as http;
import 'package:couintproject/models/fetchapi.dart';

import '../main.dart';
import 'couponscreen.dart';

class Home extends StatefulWidget {
  static int selectedIndex = 1;
  static int selectedBottom = 0;

  // Future<Products> products;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation animationOpacity;
  AnimationController animationController;
  int selectedSticky = 0;
  Future<CouintAPI> couintApi;
  List<Data> dataList;
  int selectedIndex = 0;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    couintApi = fetchAPI(http.Client());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAPI(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Scaffold(
                  body: ListView(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    HomeSliderWidget(snapshot.data.markets),
                    StickyHeader(
                        header: MyStickyHeader(
                          marketList: snapshot.data.markets,
                          heroTag: 'home_sticky_header',
                          selectedIndex: Home.selectedIndex,
                          onChanged: (id) {
                            setState(() {
                              ///선택된 아이디만 받아줄수있는 로직 구현 필요.
                            });
                          },
                        ),
                        content: ProductWidget(
                          animationOpacity: animationOpacity,
                          selectedIndex: Home.selectedIndex,
                          products: snapshot.data.products,
                        ))
                  ]),
                  bottomNavigationBar: myBottomNavigationBar())
              : Center(
                  child: Image.network(
                  'https://couint.com/img/couint_logo8.png',
                  color: Colors.blueAccent,
                ));
        });
  }
}
