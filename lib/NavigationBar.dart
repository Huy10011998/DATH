import 'package:flutter/material.dart';
import 'package:test1/layout/TrangChu_Layout.dart';
//import 'package:test1/layout/Chitiet_Layout_daxuly.dart';
//import 'package:demo_trangchu/layout/Chitiet_Layout.dart';

//import 'package:demo_trangchu/layout/Theodoi_Layout.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int navigation = 0;

  Widget selectedroute(int nav) {
    switch (nav) {
      case 0:
        return TrangchuLayout();
        break;
      // case 2:
      //   return Chitiet();
      default:
        return TrangchuLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: <Widget>[
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("images/hinh6.png"))),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cổng phản ánh",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Nhanh chóng - Tiện lợi - Bảo mật",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: selectedroute(navigation),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.deepPurple,
        currentIndex: navigation,
        onTap: (value) {
          setState(() {
            navigation = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 34,
            ),
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Trang chủ",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 34,
            ),
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Thêm mới",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cast,
              size: 34,
            ),
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Đang theo dõi",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///aaaa
