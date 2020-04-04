import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Chitiet_Layout_daxuly.dart';

class TrangchuLayout extends StatefulWidget {
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  final List<String> myList = List<String>.generate(6, (index) => "myData");
  List<String> items = List<String>();
  int perPage = 2;
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
            log("myData length: ${myData.length}");
            return new ListView.builder(
                itemCount: (present <= myList.length)
                    ? items.length + 1
                    : items.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == items.length)
                    return Container(
                      color: Colors.greenAccent,
                      child: Text("Load More"),
                    );
                  else if (present == 6 + perPage)
                    return Container(
                      color: Colors.greenAccent,
                      child: Text("Da het data"),
                    );
                  else
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
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              padding:
                                                  EdgeInsets.only(left: 10),
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
