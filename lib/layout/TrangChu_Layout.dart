import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/layout/size_config.dart';

class TrangchuLayout extends StatefulWidget {
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  final List<String> myList = List<String>.generate(8, (index) => "myData");
  List<String> items = List<String>.generate(2, (index) => "myData");
  int present = 2;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future _getMoreData() async {
    await new Future.delayed(new Duration(seconds: 1));
    setState(() {
      if (present < myList.length) {
        items.addAll(myList.getRange(present, present + 1));
      }
      present++;
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
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
                itemCount: (present <= myList.length)
                    ? items.length + 1
                    : items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length)
                    return Container(
                        height: isLoading ? 50.0 : 0,
                        color: Colors.transparent,
                        child: Center(
                          child: new CircularProgressIndicator(),
                        ));
                  return new InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: new Card(
                        child: Container(
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
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
                                          myData[index]['vi_tri'] + "  -  ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            " " +
                                                myData[index]
                                                    ['thoi_gian_xay_ra'],
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 32),
                                        child: Text(
                                          myData[index]['tinh_trang_pa'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      myData[index]['noi_dung'],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: SizeConfig.screenHeight,
                                  height: SizeConfig.screenWidth,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 60,
                                        height:
                                            SizeConfig.blockSizeVertical * 58,
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
                                            SizeConfig.safeBlockHorizontal * 59,
                                        height:
                                            SizeConfig.safeBlockVertical * 67,
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
                                new Container(
                                  margin: EdgeInsets.only(
                                      bottom: 5, left: 5, right: 5),
                                  width: SizeConfig.screenHeight,
                                  height: SizeConfig.screenWidth,
                                  child: Image.network(
                                      myData[index]['hinh_anh'],
                                      fit: BoxFit.fill),
                                ),
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
