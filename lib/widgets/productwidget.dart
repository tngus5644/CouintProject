
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:couintproject/models/products.dart';
import 'productgriditemwidget.dart';

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
