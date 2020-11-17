import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/models/markets.dart';

class HomeSliderWidget extends StatefulWidget {
  List<Markets> marketList;

  HomeSliderWidget(this.marketList, {Key key}) : super(key: key);

  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int _current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
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
              _current = index;
            });
          },
          items: widget.marketList.map<Widget>((Markets market) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://couint.com/storage/' + market.image),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      // BoxShadow(
                      //     color: Theme.of(context)
                      //         .hintColor
                      //         .withOpacity(0.2),
                      //     offset: Offset(0, 4),
                      //     blurRadius: 9)
                    ],
                  ),
                  child: Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 50,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 25,
          right: 41,
//          width: config.App(context).appWidth(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.marketList.map<Widget>((Markets market) {
              return Container(
                width: 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: _current == widget.marketList.indexOf(market)
                        ? Theme.of(context).hintColor
                        : Theme.of(context).hintColor.withOpacity(0.3)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
