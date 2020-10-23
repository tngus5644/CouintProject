import 'package:flutter/material.dart';
import 'package:couintproject/models/markets.dart';

class ProductIconWidget extends StatefulWidget {
  ValueChanged<String> onPressed;
  Markets markets;
  String heroTag;
  ProductIconWidget({Key key, }) : super(key: key);

  @override
  _ProductIconWidgetState createState() => _ProductIconWidgetState();
}

class _ProductIconWidgetState extends State<ProductIconWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
        child: Text('빌드아이콘위젯'));
        // child: buildSelectedBrand(context) ,

  }

  InkWell buildSelectedBrand(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueAccent,
      highlightColor: Colors.white,
      onTap: () {
        setState(() {
          ///아이콘이 눌렸는지 상태 변환
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(50)),
          child: Row(children: <Widget>[
            Hero(
              tag: 'mytag',
              child: Image.network(
                  'https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg'),

            )
          ])),
    );
  }
}
//   Image.network('https://brandongaille.com/wp-content/uploads/2013/08/Starbucks-Company-Logo.jpg')
