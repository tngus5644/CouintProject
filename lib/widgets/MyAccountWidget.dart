import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:couintproject/models/fetchAccount.dart';

class MyAccountwidget extends StatelessWidget {
  Data myItem;

  MyAccountwidget({this.myItem});

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
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcOver)),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      myItem.accountAlias,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Text(
                      myItem.accountNumMasked,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),


                  ],
                ))));
  }
}
