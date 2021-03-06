import 'package:flutter/material.dart';
import 'package:test1/NavigationBar.dart';
import 'package:test1/layout/Album.dart';
import 'package:test1/layout/Chitiet_Layout_daxuly.dart';
import 'package:test1/layout/Phananhdanhan_Rong_Layout.dart';
import 'package:test1/layout/Tatcaphananh_Layout.dart';
import 'package:test1/layout/Tralaiphananh_Layout.dart';
import 'package:test1/layout/TrangChu_Layout.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: NavigationBar(),  //gọi màn hình đầu tiên ở chổ này
        initialRoute: '/',
        routes: {
          '/home': (context) => TrangchuLayout(),
          '/detail': (context) => Chitiet(),
          
        });
  }
}
