import 'package:flutter/material.dart';
import 'package:couintproject/models/markets.dart';
import 'package:couintproject/screens/home.dart';
import 'package:couintproject/widgets/productwidget.dart';

class ProductIconWidget extends StatefulWidget {
  ValueChanged<int> onPressed;
  Markets markets;
  String heroTag;

  ProductIconWidget({Key key, this.onPressed, this.markets, this.heroTag})
      : super(key: key);

  @override
  _ProductIconWidgetState createState() => _ProductIconWidgetState();
}

class _ProductIconWidgetState extends State<ProductIconWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.orange, width: 0)),
      // margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: buildSelectedMarkets(context),
      // Image.network('https://couint.com/storage/' + widget.markets.image)
    );
  }

  Material buildSelectedMarkets(BuildContext context) {
    return Material(

      child: InkWell(
        splashColor: Colors.white,
        highlightColor: Colors.blueAccent,
        onTap: () {
          setState(() {
            print('widget tapped');
            widget.onPressed(widget.markets.id);
            Home.selectedIndex = widget.markets.id;
          });
        },
        child: AnimatedContainer(
            duration: Duration(seconds:1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: widget.markets.selected? Colors.lightBlueAccent: Colors.blueAccent,
            ),
            child: Row(children: <Widget>[
              Hero(
                tag: widget.heroTag + widget.markets.id.toString(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: Text(widget.markets.name,style: TextStyle(color: Colors.white)),
                    ),
                    // Padding (
                    //   padding : EdgeInsets.symmetric (horizontal : 10.0),
                    //   child : Container (
                    //     height : 1.0,
                    //     width : 50.0,
                    //     color : Colors.black,),),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
//   Image.network('https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg')
