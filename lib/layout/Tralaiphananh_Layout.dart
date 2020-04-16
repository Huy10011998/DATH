import 'package:flutter/material.dart';

class Tralaiphananh extends StatefulWidget {
  final String title;
  Tralaiphananh({Key key, this.title}) : super(key: key);

  @override
  _TralaiphananhState createState() => _TralaiphananhState();
}

class _TralaiphananhState extends State<Tralaiphananh> {
  int radioItem = 1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Test TLPA'),
      ),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: new Text(
              'Trả lại phản ánh này',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
            onTap: () => _onRadioButton(),
          ),
        ],
      )),
    );
  }

  void _onRadioButton() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            color: Color(0xFF737373),
            height: 400,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: new BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: new BorderRadius.circular(25),
              ),
            ),
          );
        });
  }

  _buildBottomNavigationMenu() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Trả lại phản ánh',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: 5, left: 15),
            child: Text(
              'Vui lòng cho biết vì sao bạn muốn trả lại phản ánh này',
              textAlign: TextAlign.left,
            ),
          ),
          new Container(
            child: Column(children: <Widget>[
              new Container(
                  child: Row(children: <Widget>[
                Radio(
                  groupValue: radioItem,
                  value: 1,
                  onChanged: (int val) {
                    print('val');
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
                Text('Không thuộc trách nhiệm của phòng'),
              ])),
              new Container(
                  child: Row(children: <Widget>[
                Radio(
                  groupValue: radioItem,
                  value: 2,
                  onChanged: (int val) {
                    print('val');
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
                Text('Không đủ thẩm quyền để xử lý'),
              ])),
              new Container(
                  child: Row(children: <Widget>[
                Radio(
                  groupValue: radioItem,
                  value: 3,
                  onChanged: (int val) {
                    print('val');
                    setState(() {
                      radioItem = val;
                    });
                  },
                ),
                Text('Lý do khác'),
              ])),
            ]),
          ),
          //Text('$radioItem'),
        ]);
        
  }
}
