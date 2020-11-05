import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'WebViewWidget.dart';

class NewAccountWidget extends StatefulWidget {
  @override
  _NewAccountWidgetState createState() => _NewAccountWidgetState();
}

class _NewAccountWidgetState extends State<NewAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            color: Colors.black54,
            child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://couint.com/template/images/pictures/25.jpg'),
                    fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcOver)),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.add_rounded),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/accountwebview');
                      },
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      '새 계좌 등록',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '체크 카드만 이용 가능합니다.',
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                  ],
                ))));
  }
}
