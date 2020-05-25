import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/layout/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:test1/model/ApiTest.dart';

class TrangchuLayout extends StatefulWidget {
  final String title;
  TrangchuLayout([Key key, this.title]) : super(key: key);
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  final url =
      'http://apidemo.lamgigio.net/cong-phan-anh/100/api/phan-anh/danh-sach';
  // List<String> items = List<String>.generate(3, (i) => "myData");
  int count = 3;
  int present = 3;
  bool isLoading = false;
  double scroll;
  int total = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      scroll = 75.0;
    });
    _getData().then((value) {
      setState(() {
        total = int.parse(value);
        // items = List<String>.generate(int.parse(value), (i) => "myData");
      });
    });
  }

  Future<List<Result>> fetchAlbum() async {
    final response = await http.post(url, headers: <String, String>{
      'Content-type': 'application/json',
      'app-key': 'PHANANH'
    });

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body)['result'];
      return responseJson.map((m) => new Result.fromJson(m)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future _getData() async {
    final response = await http.post(url, headers: <String, String>{
      'Content-type': 'application/json',
      'app-key': 'PHANANH'
    });
    var maxCount = json.decode(response.body);
    return maxCount['count'];
  }

  Future _getMoreData() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      if (present < total) {
        count++;
      }
      present++;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: <Widget>[
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/hinh9.png"))),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Nhanh chóng - Tiện lợi - Bảo mật",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        child: AnimatedPadding(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(top: scroll),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfor) {
              if (scrollInfor.metrics.pixels > 50) {
                setState(() {
                  scroll = 0;
                });
              }
              if (scrollInfor.metrics.pixels > 50) {
                setState(() {
                  scroll = 0;
                });
              }

              if (scrollInfor.metrics.pixels ==
                  scrollInfor.metrics.minScrollExtent) {
                setState(() {
                  scroll = 75.0;
                });
              }

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
            child: FutureBuilder<List<Result>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                List<Result> myData = snapshot.data ?? [];
                return ListView.builder(
                    itemCount: (present < total) ? count + 1 : total,
                    itemBuilder: (BuildContext context, int index) {
                      Result album = myData[index];
                      if (index == present) {
                        return Container(
                            height: isLoading ? 40.0 : 0,
                            color: Colors.transparent,
                            child: Center(
                              child: new CircularProgressIndicator(),
                            ));
                      }
                      return InkWell(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Card(
                            child: Container(
                              child: Column(children: <Widget>[
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(
                                              album.tenViTri + "",
                                              // myData[index]['vi_tri'] + " ",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                " " + album.timeXayRaPa,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 10),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              album.tinhTrangPa == '1'
                                                  ? Container(
                                                      child: Text(
                                                        'Đã xử lí',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  : album.tinhTrangPa == '2'
                                                      ? Container(
                                                          child: Text(
                                                            'Đang xử lí',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      : album.tinhTrangPa == '3'
                                                          ? Container(
                                                              child: Text(
                                                                'Xử lí lại',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          : album.tinhTrangPa ==
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
                                                                            FontWeight.bold),
                                                                  ),
                                                                )
                                                              : Container(),
                                            ])),
                                  ],
                                )),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 15.0, top: 10.0),
                                        child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              album.noiDung,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ))),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20.0, right: 10.0, left: 10),
                                  width: SizeConfig.screenHeight,
                                  height: SizeConfig.screenWidth,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 62,
                                        height:
                                            SizeConfig.blockSizeVertical * 60,
                                        child: Column(
                                          children: <Widget>[
                                            Image.network(
                                                "https://image.tinnhanhchungkhoan.vn/715x540/uploaded/ngoctuanz/2019_08_24/8/1_wuhh.jpg")
                                            // Image.network(
                                            //   album.hinh ?? '',
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        width:
                                            SizeConfig.safeBlockHorizontal * 55,
                                        height:
                                            SizeConfig.safeBlockVertical * 65,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 3.0),
                                                child: Image.network(
                                                    "https://image.tinnhanhchungkhoan.vn/715x540/uploaded/ngoctuanz/2019_08_24/8/1_wuhh.jpg")
                                                // child: Image.network(
                                                //   album.hinh ?? '',
                                                //   fit: BoxFit.fill,
                                                // ),
                                                ),
                                            Container(
                                              child: Image.network(
                                                  "https://image.tinnhanhchungkhoan.vn/715x540/uploaded/ngoctuanz/2019_08_24/8/1_wuhh.jpg"),
                                              // child: Image.network(
                                              //   album.hinh ?? '',
                                              //   fit: BoxFit.fill,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // new Container(
                                //   margin: EdgeInsets.only(
                                //       bottom: 5, left: 5, right: 5),
                                //   width: SizeConfig.screenHeight,
                                //   height: SizeConfig.screenWidth,
                                //   child: Image.network(
                                //       myData[index]['hinh_anh'],
                                //       fit: BoxFit.fill),
                                // ),
                              ]),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                              arguments: index);
                        },
                      );
                    });
              },
            ),
          ),
        ),
      ),
    ]);
  }
}