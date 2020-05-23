import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../NavigationBar.dart';

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
            onTap: () => _buildBottomNavigationMenu(),
          ),
        ],
      )),
    );
  }

  _buildBottomNavigationMenu() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
              color: Color(0xFF737373),
              height: 400,
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'Trả lại phản ánh',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
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
                              onChanged: (val) {
                                print(radioItem);
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
                              onChanged: (val) {
                                print(radioItem);
                                setState(() {
                                  radioItem = val;
                                });
                              },
                            ),
                            Text('Không đủ thẩm quyền để xử lý'),
                          ])),
                          new Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                        groupValue: radioItem,
                                        value: 3,
                                        onChanged: (val) {
                                          print(radioItem);
                                          setState(() {
                                            radioItem = val;
                                          });
                                        },
                                      ),
                                      Text('Lý do khác'),
                                    ],
                                  ),
                                ),
                                radioItem == 3
                                    ? Container(
                                        width: 340,
                                        child: TextField(
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText:
                                                  'Mô tả rõ hơn về vấn đề...'),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Container(
                            width: 260,
                            padding: const EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () => _getAccept(),
                              textColor: Colors.white,
                              color: Colors.deepPurple,
                              child: const Text('Đồng ý',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                decoration: new BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(25.0),
                    topRight: const  Radius.circular(25.0))
                ),
              ),
            );
          });
        });
  }

  _getAccept() async {
    Navigator.of(context).pop();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setstate) {
            return new Container(
                color: Color(0xFF737373),
                height: 400,
                child: Container(
                  decoration: new BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: new BorderRadius.circular(25),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            'Hoàn thành!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 250,
                          child: Image.asset(
                            "images/hinh7.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          width: 260,
                          padding: const EdgeInsets.all(20.0),
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavigationBar()));
                              },
                              textColor: Colors.white,
                              color: Colors.deepPurple,
                              child: const Text('Xong',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ));
          });
        });
  }
}
