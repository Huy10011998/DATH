import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/layout/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tatcaphananh extends StatefulWidget {
  final String title;
  Tatcaphananh([Key key, this.title]) : super(key: key);
  @override
  _TatcaphananhState createState() => _TatcaphananhState();
}

class _TatcaphananhState extends State<Tatcaphananh> {
  List<String> items = List<String>.generate(5, (i) => "myData");
  int present = 2;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future _getMoreData() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      if (present < 8) {
        items.add('myData');
      }
      present++;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);
    SizeConfig2().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: <Widget>[
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("images/hinh9.png"))),
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
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfor) {
          if (!isLoading &&
              scrollInfor.metrics.pixels ==
                  scrollInfor.metrics.maxScrollExtent) {
            _getMoreData();
            setState(() {
              isLoading = true;
            });
          }
          return true;
        },
        child: new FutureBuilder(
          builder: (context, snapshot) {
            final myData = json.decode(snapshot.data.toString());
            return new ListView.builder(
              itemCount: (present <= 8) ? items.length + 1 : items.length,
              itemBuilder: (BuildContext context, int index) {
                if (items.length == index) {
                  return Container(
                    height: isLoading ? 40 : 0,
                    color: Colors.transparent,
                    child: Center(child: new CircularProgressIndicator()),
                  );
                }
                return new Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: new Card(
                        child: new Row(children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            myData[index]['tinh_trang_xu_ly'] == '1'
                                ? Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 2, color: Colors.orange)),
                                    ),
                                  )
                                : myData[index]['tinh_trang_xu_ly'] == '2'
                                    ? Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  width: 2,
                                                  color: Colors.green)),
                                        ),
                                      )
                                    : myData[index]['tinh_trang_xu_ly'] == '3'
                                        ? Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            width: 50,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 2,
                                                      color: Colors.red)),
                                            ),
                                          )
                                        : myData[index]['tinh_trang_xu_ly'] ==
                                                '4'
                                            ? Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      top: BorderSide(
                                                          width: 2,
                                                          color: Colors.blue)),
                                                ),
                                              )
                                            : myData[index]
                                                        ['tinh_trang_xu_ly'] ==
                                                    '5'
                                                ? Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 5),
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              width: 2,
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  )
                                                : Container(),
                            myData[index]['tinh_trang_xu_ly'] == '1'
                                ? Container(
                                    child: Text(
                                      'Đang xử lí',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.orange,fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : myData[index]['tinh_trang_xu_ly'] == '2'
                                    ? Container(
                                        child: Text(
                                          'Đợi phản hồi',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green,fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : myData[index]['tinh_trang_xu_ly'] == '3'
                                        ? Container(
                                            child: Text(
                                              'Xử lí lại',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : myData[index]['tinh_trang_xu_ly'] ==
                                                '4'
                                            ? Container(
                                                child: Text(
                                                  'Đợi xử lí',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blue,fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            : myData[index]
                                                        ['tinh_trang_xu_ly'] ==
                                                    '5'
                                                ? Container(
                                                    child: Text(
                                                      'Phản ánh ảo',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey,fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                                : Container(),
                            Container(
                              height: 75,
                              width: 250,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                myData[index]['noi_dung'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: <Widget>[
                                  // Icon(
                                  //   Icons.place,
                                  //   color: Colors.indigo,
                                  // ),
                                  Text(
                                    myData[index]['chu_de'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey[400]),
                                  ),
                                  // Icon(
                                  //   Icons.access_time,
                                  //   color: Colors.grey,
                                  // ),
                                  Text(
                                    ' * ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    myData[index]['thoi_gian_tao_pa'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        padding:
                            EdgeInsets.only(right: 10, top: 10, bottom: 10),
                        width: 100,
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image.network(
                              myData[index]['hinh_anh'],
                              fit: BoxFit.fill,
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    ])));
              },
            );
          },
          future: DefaultAssetBundle.of(context).loadString("assets/bbb.json"),
        ),
      ),
    );
  }
}
