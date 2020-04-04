import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:loadmore/loadmore.dart';
// import 'dart:async';

import 'Chitiet_Layout_daxuly.dart';

class TrangchuLayout extends StatefulWidget {
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  List<String> myList;
  List<String> items = List<String>();

  ScrollController _scrollController = ScrollController();
  int perPage = 10;
  int present = 0;
  @override
  void initState() {
    super.initState();

    myList = List.generate(2, (index) => "myData");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });

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
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new FutureBuilder(
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            return new ListView.builder(
                controller: _scrollController,
                itemExtent: 525,
                itemCount: (present <= myList.length)
                    ? items.length + 1
                    : items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length) {
                    return CupertinoActivityIndicator();
                  }
                  return InkWell(
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
                                  padding: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            padding: EdgeInsets.only(left: 10),
                                            width: 262,
                                            height: 225,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        myData[index]
                                                            ['hinh_anh']),
                                                    fit: BoxFit.contain)),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              width: 150,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          myData[index]
                                                              ['hinh_anh']),
                                                      fit: BoxFit.contain)),
                                            ),
                                            Container(
                                              child: Image.network(
                                                myData[index]['hinh_anh'],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                new Container(
                                  width: 400,
                                  height: 200,
                                  child: Image.asset("images/hinh3.png",
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
