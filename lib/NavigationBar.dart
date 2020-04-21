import 'package:flutter/material.dart';
import 'package:test1/layout/TrangChu_Layout.dart';
//import 'package:test1/layout/Chitiet_Layout_daxuly.dart';
import 'package:test1/layout/Tatcaphananh_Layout.dart';
import 'layout/Phananhdanhan_Layout.dart';

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
      case 1:
        return Phananhdanhan();
        break;
      case 2:
        return Tatcaphananh();
        break;
      default:
        return TrangchuLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.portrait,
              size: 34,
            ),
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Đã nhận",
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
              "Tất cả phản ánh",
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
