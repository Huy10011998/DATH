import 'package:flutter/material.dart';

class _CheckID extends StatefulWidget {
  final int id;
  _CheckID({Key key, @required this.id}) : super(key: key);
  @override
  CheckIDState createState() => CheckIDState();
}

class CheckIDState  extends State<_CheckID>{
  void _getCheckID() {
    switch (widget.id) {
      case 1:
        Container(
          child: Text(
            'Đợi xử lí',
            style: TextStyle(
                fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 2:
        Container(
          child: Text(
            'Đang xử lí',
            style: TextStyle(
                fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 3:
        Container(
          child: Text(
            'Xử lí lại',
            style: TextStyle(
                fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
        break;
      case 4:
        Container(
          child: Text(
            'Đợi xử lí',
            style: TextStyle(
                fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        );
        break;
      default:
        // code block
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
