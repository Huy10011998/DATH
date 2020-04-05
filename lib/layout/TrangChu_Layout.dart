import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Chitiet_Layout_daxuly.dart';
import 'package:test1/layout/size_config.dart';

class TrangchuLayout extends StatefulWidget {
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  final List<String> myList = List<String>.generate(6, (index) => "myData");
  List<String> items = List<String>();
  int perPage = 1;
  int present = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(myList.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  _getMoreData() {
    setState(() {
      if ((present + perPage) > myList.length) {
        items.addAll(myList.getRange(present, myList.length));
      } else {
        items.addAll(myList.getRange(present, present + perPage));
      }
      present = present + perPage;
    });

    log("present: $present");
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _getMoreData();
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
                    return CupertinoActivityIndicator();
                  // return Container(
                  //   color: Colors.greenAccent,
                  //   child: Text("Load More"),
                  // );
                  // else if (present == 6 + perPage)
                  //   return Container(
                  //     color: Colors.greenAccent,
                  //     child: Text("Da het data"),
                  //   );     
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
                                              SizeConfig.blockSizeHorizontal *
                                                  60,
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
                                              SizeConfig.safeBlockHorizontal *
                                                  59,
                                          height:
                                              SizeConfig.safeBlockVertical * 67,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 3.0),
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
                                    margin: EdgeInsets.only(bottom:5,left:5,right:5),
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
                        Route route = MaterialPageRoute(
                            builder: (BuildContext context) => Chitiet());
                        Navigator.push(context, route);
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
