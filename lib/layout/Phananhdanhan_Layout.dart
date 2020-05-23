import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:test1/layout/size_config.dart';

class Phananhdanhan extends StatefulWidget {
  final String title;
  Phananhdanhan([Key key, this.title]) : super(key: key);
  @override
  _PhananhdanhanState createState() => _PhananhdanhanState();
}

class _PhananhdanhanState extends State<Phananhdanhan> {
  List<String> items = List<String>.generate(5, (i) => ("MyData"));
  int present = 5;
  bool isLoading = false;
  int total = 0;

  @override
  void initState() {
    super.initState();

    getData().then((value) {
      setState(() {
        total = int.parse(value);
        print('asd' +total.toString());
      });
    });
  }

  Future getData() async {
    String distancesText = await rootBundle.loadString('assets/bbb.json');
    final distances = json.decode(distancesText);
    return distances.length.toString();
  }

  Future _getMoraData() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      if (present < total) {
        items.add("MyData");
      }
      present++;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);
    SizeConfig2().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Phản ánh đã nhận',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfor) {
            if (!isLoading &&
                scrollInfor.metrics.pixels ==
                    scrollInfor.metrics.maxScrollExtent) {
              _getMoraData();
              setState(() {
                isLoading = true;
              });
            }
            return;
          },
          child: new FutureBuilder(
            builder: (context, snapshot) {
              final myData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                  itemCount:
                      (present <= total) ? items.length + 1 : items.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == items.length) {
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
                          Container(
                            width: 260,
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: myData[index]['tinh_trang_xu_ly'] ==
                                          '1'
                                      ? Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          width: 50,
                                          decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: 3,
                                                    color: Colors.orange)),
                                          ),
                                        )
                                      : myData[index]['tinh_trang_xu_ly'] == '2'
                                          ? Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              width: 50,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        width: 3,
                                                        color: Colors.green)),
                                              ),
                                            )
                                          : myData[index]['tinh_trang_xu_ly'] ==
                                                  '3'
                                              ? Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5),
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        top: BorderSide(
                                                            width: 3,
                                                            color: Colors.red)),
                                                  ),
                                                )
                                              : myData[index][
                                                          'tinh_trang_xu_ly'] ==
                                                      '4'
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5),
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                width: 3,
                                                                color: Colors
                                                                    .blue)),
                                                      ),
                                                    )
                                                  : myData[index][
                                                              'tinh_trang_xu_ly'] ==
                                                          '5'
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                                top: BorderSide(
                                                                    width: 3,
                                                                    color: Colors
                                                                        .grey)),
                                                          ),
                                                        )
                                                      : Container(),
                                ),
                                Container(
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: myData[index]
                                                      ['tinh_trang_xu_ly'] ==
                                                  '1'
                                              ? Container(
                                                  child: Text(
                                                    'Đang xử lí',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.orange,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              : myData[index][
                                                          'tinh_trang_xu_ly'] ==
                                                      '2'
                                                  ? Container(
                                                      child: Text(
                                                        'Đợi phản hồi',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  : myData[index][
                                                              'tinh_trang_xu_ly'] ==
                                                          '3'
                                                      ? Container(
                                                          child: Text(
                                                            'Xử lí lại',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : myData[index][
                                                                  'tinh_trang_xu_ly'] ==
                                                              '4'
                                                          ? Container(
                                                              child: Text(
                                                                'Đợi xử lí',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          : myData[index][
                                                                      'tinh_trang_xu_ly'] ==
                                                                  '5'
                                                              ? Container(
                                                                  child: Text(
                                                                    'Phản ánh ảo',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              : Container(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 12),
                                          child: new Text(
                                            'còn lại: ${myData[index]['thoi_gian_con_lai']}',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  height: 65,
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
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        myData[index]['chu_de'],
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey[400]),
                                      ),
                                      Text(
                                        ' * ',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        myData[index]['thoi_gian_tao_pa'],
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey[400]),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            padding:
                                EdgeInsets.only(right: 10, top: 10, bottom: 5),
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
                  });
            },
            future:
                DefaultAssetBundle.of(context).loadString("assets/bbb.json"),
          ),
        ));
  }
}
