import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/layout/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrangchuLayout extends StatefulWidget {
  final String title;
  TrangchuLayout([Key key, this.title]) : super(key: key);
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  // final List<String> myList = List<String>.generate(4, (i) => "myData");
  List<String> items = List<String>.generate(3, (i) => "myData");
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
        items.add("MyData");
      }
      present++;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);
    SizeConfig().init(context);
    return new Scaffold(
      appBar: AppBar(
        title: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('images/bg.png'), fit: BoxFit.fill)),
          child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  child: Row(
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Nhanh chóng - Tiện lợi - Bảo mật",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _getMoreData();
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
                itemCount: (present <= 8) ? items.length + 1 : items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length) {
                    return Container(
                        height: isLoading ? 40.0 : 0,
                        color: Colors.transparent,
                        child: Center(
                          child: new CircularProgressIndicator(),
                        ));
                  }
                  return new InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: new Card(
                        child: Container(
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5, left: 7),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.place,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        child: Text(
                                          myData[index]['vi_tri'] + "  -  ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                          child: Text(
                                        " " + myData[index]['thoi_gian_xay_ra'],
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Container(
                                          child: Text(
                                            myData[index]['tinh_trang_pa'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                                    child: Text(
                                      myData[index]['noi_dung'],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10),
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
                                              myData[index]['hinh_anh'],
                                            ),
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
                                              margin:
                                                  EdgeInsets.only(bottom: 3.0),
                                              child: Image.network(
                                                myData[index]['hinh_anh'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              child: Image.network(
                                                myData[index]['hinh_anh'],
                                                fit: BoxFit.fill,
                                              ),
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
                      Navigator.pushNamed(context, '/detail', arguments: index);
                    },
                  );
                });
          },
          future: DefaultAssetBundle.of(context).loadString("assets/aaa.json"),
        ),
      ),
    );
  }
}
