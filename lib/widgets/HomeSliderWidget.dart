import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:couintproject/models/markets.dart';

class HomeSliderWidget extends StatefulWidget {
  MarketList marketList;

  HomeSliderWidget({Key key, this.marketList}) : super(key: key);

  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget test = Image.network(
        'https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg');
    int current = 0;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          height: 250,
          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              current = index;
            });
          },
          items: [test],///market data 받아와서 넣어줄것
        ),
        Positioned(
            bottom: 0,
            right: 41,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.blueAccent),
                )
              ],
            ))
      ],
    );
  }
}
