import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';
import 'dart:convert';
//import 'package:demo_trangchu/layout/sizeconfig.dart';
import 'package:test1/layout/size_config.dart';
//import 'package:intl/intl.dart';

class Chitiet extends StatefulWidget {
  @override
  _ChitietState createState() => _ChitietState();
}

class _ChitietState extends State<Chitiet> {
  bool visibilityOne = true;
  bool visibilityTwo = false;
  bool visibilityThree = false;
  bool visibilityFour = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "one") {
        visibilityOne = visibility;
      }
      if (field == "two") {
        visibilityTwo = visibility;
      }
      if (field == "three") {
        visibilityThree = visibility;
      }
      if (field == "four") {
        visibilityFour = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Chi tiết phản ánh',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (BuildContext context, snapshot) {
            var myData1 = json.decode(snapshot.data.toString());
            return new Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    final currentIndex =
                        ModalRoute.of(context).settings.arguments;
                    return Container(
                      child: new Card(
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              new Container(
                                  margin: new EdgeInsets.all(0.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      visibilityOne
                                          ? new Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                new Expanded(
                                                  flex: 1,
                                                  child: new Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        38,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        38,
                                                    child: BeforeAfter(
                                                      beforeImage:
                                                          Image.network(myData1[
                                                                  currentIndex]
                                                              ['hinh_anh']),
                                                      afterImage: Image.network(
                                                          myData1[currentIndex]
                                                              ['hinh_anh']),
                                                      imageHeight: SizeConfig
                                                              .safeBlockVertical *
                                                          40,
                                                      imageWidth: SizeConfig
                                                              .safeBlockHorizontal *
                                                          85,
                                                      imageCornerRadius: 0,
                                                      overlayColor: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : new Container(),
                                      visibilityTwo
                                          ? new Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Expanded(
                                                  flex: 1,
                                                  child: new Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        38,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        38,
                                                    child: BeforeAfter(
                                                      beforeImage:
                                                          Image.network(myData1[
                                                                  currentIndex]
                                                              ['hinh_anh']),
                                                      afterImage: Image.network(
                                                          myData1[currentIndex]
                                                              ['hinh_anh']),
                                                      imageHeight: SizeConfig
                                                              .safeBlockVertical *
                                                          40,
                                                      imageWidth: SizeConfig
                                                              .safeBlockHorizontal *
                                                          85,
                                                      imageCornerRadius: 0,
                                                      overlayColor: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : new Container(),
                                      visibilityThree
                                          ? new Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Expanded(
                                                  flex: 1,
                                                  child: new Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        38,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        38,
                                                    child: BeforeAfter(
                                                      beforeImage:
                                                          Image.network(myData1[
                                                                  currentIndex]
                                                              ['hinh_anh']),
                                                      afterImage: Image.network(
                                                          myData1[currentIndex]
                                                              ['hinh_anh']),
                                                      imageHeight: SizeConfig
                                                              .safeBlockVertical *
                                                          40,
                                                      imageWidth: SizeConfig
                                                              .safeBlockHorizontal *
                                                          85,
                                                      imageCornerRadius: 0,
                                                      overlayColor: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : new Container(),
                                      visibilityFour
                                          ? new Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Expanded(
                                                  flex: 1,
                                                  child: new Container(
                                                    width: SizeConfig
                                                            .blockSizeHorizontal *
                                                        38,
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        38,
                                                    child: BeforeAfter(
                                                      beforeImage:
                                                          Image.network(myData1[
                                                                  currentIndex]
                                                              ['hinh_anh']),
                                                      afterImage: Image.network(
                                                          myData1[currentIndex]
                                                              ['hinh_anh']),
                                                      imageHeight: SizeConfig
                                                              .safeBlockVertical *
                                                          40,
                                                      imageWidth: SizeConfig
                                                              .safeBlockHorizontal *
                                                          85,
                                                      imageCornerRadius: 0,
                                                      overlayColor: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : new Container(),
                                    ],
                                  )),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new InkWell(
                                      onTap: () {
                                        visibilityOne
                                            ? null
                                            : _changed(true, "one");
                                        _changed(false, "two");
                                        _changed(false, "three");
                                        _changed(false, "four");
                                      },
                                      child: new Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 16,
                                        height:
                                            SizeConfig.blockSizeVertical * 16,
                                        margin: new EdgeInsets.only(top: 8.0),
                                        child: new Column(
                                          children: <Widget>[
                                            new Icon(Icons.image,
                                                size: 45.0,
                                                color: visibilityOne
                                                    ? Colors.blue[600]
                                                    : Colors.grey[400]),
                                            new Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: new Text(
                                                "Img 1",
                                                style: new TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: visibilityOne
                                                      ? Colors.red[800]
                                                      : Colors.blue[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  new SizedBox(width: 5.0),
                                  new InkWell(
                                      onTap: () {
                                        visibilityTwo
                                            ? null
                                            : _changed(true, "two");
                                        _changed(false, "one");
                                        _changed(false, "three");
                                        _changed(false, "four");
                                      },
                                      child: new Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 16,
                                        height:
                                            SizeConfig.blockSizeVertical * 16,
                                        margin: new EdgeInsets.only(top: 8.0),
                                        child: new Column(
                                          children: <Widget>[
                                            new Icon(Icons.image,
                                                size: 45.0,
                                                color: visibilityTwo
                                                    ? Colors.blue[600]
                                                    : Colors.grey[400]),
                                            new Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: new Text(
                                                "Img 2",
                                                style: new TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: visibilityTwo
                                                      ? Colors.red[800]
                                                      : Colors.blue[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  new SizedBox(width: 5.0),
                                  new InkWell(
                                      onTap: () {
                                        visibilityThree
                                            ? null
                                            : _changed(true, "three");
                                        _changed(false, "one");
                                        _changed(false, "two");
                                        _changed(false, "four");
                                      },
                                      child: new Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 16,
                                        height:
                                            SizeConfig.blockSizeVertical * 16,
                                        margin: new EdgeInsets.only(top: 8.0),
                                        child: new Column(
                                          children: <Widget>[
                                            new Icon(Icons.image,
                                                size: 45.0,
                                                color: visibilityThree
                                                    ? Colors.blue[600]
                                                    : Colors.grey[400]),
                                            new Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: new Text(
                                                "Img 3",
                                                style: new TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: visibilityThree
                                                      ? Colors.red[800]
                                                      : Colors.blue[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  new SizedBox(width: 5.0),
                                  new InkWell(
                                      onTap: () {
                                        visibilityFour
                                            ? null
                                            : _changed(true, "four");
                                        _changed(false, "one");
                                        _changed(false, "three");
                                        _changed(false, "two");
                                      },
                                      child: new Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 16,
                                        height:
                                            SizeConfig.blockSizeVertical * 16,
                                        margin: new EdgeInsets.only(top: 8.0),
                                        child: new Column(
                                          children: <Widget>[
                                            new Icon(Icons.image,
                                                size: 45.0,
                                                color: visibilityFour
                                                    ? Colors.blue[600]
                                                    : Colors.grey[400]),
                                            new Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: new Text(
                                                "Img 4",
                                                style: new TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: visibilityFour
                                                      ? Colors.red[800]
                                                      : Colors.blue[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),

                              // Khung chi tiết
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 100,
                                height: SizeConfig.blockSizeVertical * 50,
                                // padding: EdgeInsets.only(
                                //   top: 20,
                                // ),
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.black)),
                                // Phần thông tin chi tiết người dùng đăng
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: <Widget>[
                                            // Mô tả chi tiết
                                            Text(
                                              myData1[currentIndex]['noi_dung'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            // Nơi xảy ra phản ánh
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.place,
                                                  color: Colors.white54,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  myData1[currentIndex]
                                                      ['vi_tri'],
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            // Thời gian xảy ra
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.white54,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  myData1[currentIndex]
                                                      ['thoi_gian_xay_ra'],
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.white,
                                              endIndent: 50,
                                              indent: 50,
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Chủ đề, mã, thời gian tạo phản ánh
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  50, 0, 0, 0),
                                              child: Column(
                                                children: <Widget>[
                                                  // Chủ đề
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Chủ đề:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 90,
                                                      ),
                                                      Text(
                                                        myData1[currentIndex]
                                                            ['chu_de'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                  // Mã phản ánh
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Mã phản ánh:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        myData1[currentIndex]
                                                            ['ma_phan_anh'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                  // Thời gian phản ánh
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Thời gian phản ánh:",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        myData1[currentIndex][
                                                            'thoi_gian_tao_pa'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Phần phản hồi từ người quản trị
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Column(
                                        children: <Widget>[
                                          // Tình trạng
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Tình trạng: ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                myData1[currentIndex]
                                                    ['tinh_trang_pa'],
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          // Lời nhắn
                                          Text(
                                            "Qua quá trình kiểm tra, chúng tôi đã xác nhận và xử lý vi phạm. \nTrân trọng!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
          future: DefaultAssetBundle.of(context).loadString("assets/aaa.json"),
        ),
      ),
    );
  }
}
