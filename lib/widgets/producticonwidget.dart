import 'package:flutter/material.dart';
import 'package:couintproject/models/markets.dart';
import 'package:couintproject/screens/shoppingscreen.dart';
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
    return buildSelectedMarkets(context);
  }

  Container buildSelectedMarkets(BuildContext context)  {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 0.5),
          color:
          widget.markets.selected
              ? Colors.blueAccent[50]
              : Colors.blueAccent,),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onPressed(widget.markets.id);
            Shopping.selectedIndex = widget.markets.id;

          });
        },
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color:
              widget.markets.selected
                  ? Colors.blueAccent[50]
                  : Colors.blueAccent,
            ),
            child: Row(children: <Widget>[
              Hero(
                tag: widget.heroTag + widget.markets.id.toString(),
                child:
                    FlatButton(
                      child: Text(widget.markets.name,
                          style: TextStyle(color: Colors.white)),
                    ),
              )
            ])),
      ),
    );
  }
}
//   Image.network('https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg')
