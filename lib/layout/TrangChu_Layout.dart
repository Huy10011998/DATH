import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'dart:async';

class TrangchuLayout extends StatefulWidget {
  @override
  _TrangchuLayoutState createState() => _TrangchuLayoutState();
}

class _TrangchuLayoutState extends State<TrangchuLayout> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new FutureBuilder(
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            return new LoadMore(
              child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: new Card(
                        child: Container(
                          child: new Column(children: <Widget>[
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        " " + myData[index]['thoi_gian_xay_ra'],
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(top: 5, left: 36),
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
                              padding: EdgeInsets.only(top:5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 230,
                                    height: 230,
                                    child: Image.network(
                                      myData[index]['hinh_anh'],
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                  Container(
                                    //padding: EdgeInsets.only(top:10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: 150,
                                          height: 105,
                                          child: Image.network(
                                            myData[index]['hinh_anh'],
                                            width: 150,
                                            height: 105,
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          height: 105,
                                          child: Image.network(
                                            myData[index]['hinh_anh'],
                                            width: 150,
                                            height: 105,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // new Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   width: 400,
                            //   height: 200,
                            //   child: Image.asset("images/hinh3.png",
                            //       fit: BoxFit.fill),
                            // ),
                          ]),
                        ),
                      ),
                    );
                  }),
              onLoadMore: _loadMore,
            );
          },
          future: DefaultAssetBundle.of(context).loadString("assets/aaa.json"),
        ),
      ),
    );
  }
}

Future<bool> _loadMore() async {
  print("onLoadMore");
  await Future.delayed(Duration(seconds: 0, milliseconds: 10));
  //load();
  return true;
}

// comment