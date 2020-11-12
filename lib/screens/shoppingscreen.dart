import 'dart:io';

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

class Shopping extends StatefulWidget {
  static int selectedIndex = 1;
  static int selectedBottom = 0;

  // Future<Products> products;

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping>
    with SingleTickerProviderStateMixin {
  Animation animationOpacity;
  AnimationController animationController;
  int selectedSticky = 0;
  Future<CouintAPI> couintApi;
  int selectedIndex = 0;

  List<Data> stickyProducts;

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
                          selectedIndex: Shopping.selectedIndex,
                          onChanged: (id) {
                            setState(() {
                              Shopping.selectedIndex = id;
                              stickyProducts = snapshot.data.products.data
                                  .where((Data element) =>
                                      element.market_id ==
                                      Shopping.selectedIndex)
                                  .toList();
                            });
                          },
                        ),
                        content: ProductWidget(
                            animationOpacity: animationOpacity,
                            products: stickyProducts!=null ?stickyProducts:snapshot.data.products.data))
                  ]),
                  bottomNavigationBar: myBottomNavigationBar())
              : Center(child: CircularProgressIndicator());
        });
  }
}
