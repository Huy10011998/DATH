import 'package:flutter/material.dart';
import 'package:test1/NavigationBar.dart';


void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home:NavigationBar(), //gọi màn hình đầu tiên ở chổ này
    );
  }
}
