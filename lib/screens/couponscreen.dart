import 'package:flutter/material.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:couintproject/screens/shoppingscreen.dart';
import 'package:couintproject/widgets/HomeSliderWidget.dart';

class CouponPoint extends StatefulWidget {
  @override
  _CouponPointState createState() => _CouponPointState();
}

class _CouponPointState extends State<CouponPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),

            ///HomeSlide 놓기
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                Text(
                  'Kontain',
                  style: TextStyle(fontSize: 25),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                Text(
                  '보유중인 기프티콘이 없습니다',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://couint.com/storage/UBUiYXnq3Yn5ylqbLd7GxFhi2YlRPzcLcO1w89Ao.jpeg')),
                    Column(
                      children: [Text('Kontain'), Text('신선한 스페셜티')],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:10.0), child: Container(height:1.0, width:130, color:Colors.grey),
                ),


                Row(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://couint.com/storage/UBUiYXnq3Yn5ylqbLd7GxFhi2YlRPzcLcO1w89Ao.jpeg')),
                    Column(
                      children: [Text('Kontain'), Text('신선한 스페셜티')],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://couint.com/storage/UBUiYXnq3Yn5ylqbLd7GxFhi2YlRPzcLcO1w89Ao.jpeg')),
                    Column(
                      children: [Text('Kontain'), Text('신선한 스페셜티')],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 200)),
          Container(
              child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                Text(
                  '팍스체이너스',
                  style: TextStyle(fontSize: 25),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                Text(
                  'PaxChainers',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 50)),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }
}
