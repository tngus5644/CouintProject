import 'package:flutter/material.dart';
import 'package:couintproject/screens/shoppingscreen.dart';

class myBottomNavigationBar extends StatefulWidget {

  myBottomNavigationBar( {Key key}) : super(key: key);
  @override
  _myBottomNavigationBarState createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.blueAccent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.orange,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '쇼핑',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale), label: '쿠폰&포인트'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '결제내역'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '프로필')
      ],
      currentIndex: Shopping.selectedBottom,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    Shopping.selectedBottom = index;
    setState(() {
      switch (index) {
        case 0: Navigator.pushNamed(context, '/');
        break;
        case 1 :Navigator.pushNamed(context, '/coupon');
        break;
        case 2:Navigator.pushNamed(context, '/payment');
        break;
        case 3:Navigator.pushNamed(context, '/profile');
        break;
      }
    });
  }
}
