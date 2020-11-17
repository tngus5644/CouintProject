
import 'package:couintproject/widgets/producticonwidget.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/models/markets.dart';

class MyStickyHeader extends StatefulWidget {
  String heroTag;
  ValueChanged<int> onChanged;
  int selectedIndex;
  List<Markets> marketList;

  MyStickyHeader({Key key, this.heroTag, this.selectedIndex, this.onChanged, this.marketList})
      : super(key: key);

  @override
  _MyStickyHeaderState createState() => _MyStickyHeaderState();
}

class _MyStickyHeaderState extends State<MyStickyHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.marketList.length,
                    itemBuilder: (context, index) {
                      double marginLeft;
                      (index == 0) ? marginLeft = 12 : marginLeft = 0;
                      return ProductIconWidget(
                        onPressed: (int id) {
                          setState(() {
                            selectById(widget.marketList, id);
                            widget.onChanged(id);
                            print(widget.marketList[0].selected);
                            print(widget.marketList[1].selected);
                            print(widget.marketList[2].selected);
                          });
                        },
                        markets: widget.marketList.elementAt(index),
                        heroTag: widget.heroTag,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  )),
            )
          ],
        ));
  }
}
