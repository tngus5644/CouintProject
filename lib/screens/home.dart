import 'package:flutter/material.dart';
import 'package:couintproject/widgets/HomeSliderWidget.dart';
import 'package:couintproject/widgets/productwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:couintproject/models/markets.dart';
import 'package:couintproject/widgets/producticonwidget.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../main.dart';


///Home Page



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      HomeSliderWidget(),
      // ProductWidget(),
      StickyHeader(
          header: Container(
              height: 50,
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text('Sticky Header')),
          content: Container(
            child: Image.network(
                'https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg',

                height: 10),

          )

      )
    ]);
  }
}

// Container(
// width: 100,

