import 'package:flutter/material.dart';
import 'package:couintproject/models/products.dart';
import 'package:couintproject/screens/home.dart';

class ProductGridItemWidget extends StatefulWidget {
  final Data data;
  final String heroTag;

  const ProductGridItemWidget({
    Key key,
    this.data,
    this.heroTag,
  }) : super(key: key);

  @override
  _ProductGridItemWidgetState createState() => _ProductGridItemWidgetState();
}

class _ProductGridItemWidgetState extends State<ProductGridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Theme.of(context).accentColor.withOpacity(0.08),
        onTap: () {
          // Navigator.of(context).pushNamed('/Product',
          //     arguments: new RouteArgument(argumentsList: [this.product, this.heroTag], id: this.product.id));
        },
        child: Card(
          child: Container(
            width: 200,
            height: 260,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.10),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                    tag: widget.heroTag + widget.data.id.toString(),
                    child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {},
                        child: Container(
                            width: 200,
                            height: 190,
                            child: Image.network(
                                'https://couint.com/storage/' +
                                    widget.data.image,
                                fit: BoxFit.cover)))),

                // Image.network(
                //                     'https://couint.com/storage/' + widget.data.image)
                // SizedBox(height: 12),
                Column(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(2)),
                    Container(
                      width: 190,
                      height: 15,
                      child: Text(
                        widget.data.name,
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(2)),
                    Container(
                      width: 187,
                      height: 10,
                      child: Text(
                        widget.data.introduction,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(2)),
                    Container(
                      height: 15,
                      child: Text(
                        widget.data.getPrice() + '  ',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Container(
                      height: 15,
                      child: Row(children: <Widget>[
                        Padding(padding: const EdgeInsets.all(2)),
                        SizedBox(
                            width: 15,
                            height: 15,
                            child: Image.network('https://couint.com/storage/' +
                                widget.data.market.image)),
                        Padding(padding: const EdgeInsets.all(2)),
                        Text(
                          widget.data.name,
                          style: Theme.of(context).textTheme.body2,
                        )
                      ]),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
