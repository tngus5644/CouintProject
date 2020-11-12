import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:couintproject/models/products.dart';
import 'package:http/http.dart' as http;
import 'productgriditemwidget.dart';
import 'package:couintproject/screens/shoppingscreen.dart';

class ProductWidget extends StatefulWidget {
  Animation animationOpacity;
  ValueChanged<String> onChanged;
  List<Data> products;

  ProductWidget(
      {Key key, this.animationOpacity, this.products})
      : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FadeTransition(
      opacity: widget.animationOpacity,
      child: Container(
        child: new StaggeredGridView.countBuilder(
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductGridItemWidget(
              data: widget.products[index],
              heroTag: 'home_sticky_content',
            );
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
