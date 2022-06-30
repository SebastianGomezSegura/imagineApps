import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagineapps/Detalle.dart';
import 'package:imagineapps/Comic.dart';

class ComicPage extends StatefulWidget{
  Results results;
  @override
  ComicDetail createState() => ComicDetail(results);

  ComicPage ({Key key, @required this.results}) : super(key: key);

}

class ComicDetail extends State<ComicPage> {

  Detail detail;
  Results result;

  ComicDetail(Results results) {
    this.result = results;
    fetchDetail();
  }

  fetchDetail () async
  {
    var apiDetailUrl = result.apiDetailUrl;
    var res = await http.get(apiDetailUrl! +'?api_key=de6bf2339cb68011e22bba686dd2522af59e8752&format=json');
    var decode = jsonDecode(res.body);
    this.detail = Detail.fromJson(decode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Detalle'),
      ),
      body: this.detail == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Characters",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(
                            start: 1.2, end: 1.2),
                        height: 4.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(20.0),
                      childAspectRatio: 7 / 2,
                      children: this
                          .detail
                          .results
                          .characterCredits
                          .map((characterCredit) => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(this
                                      .detail
                                      .results
                                      .image
                                      .originalUrl),
                                ),
                              )),
                          Text(characterCredit.name),
                        ],
                      ))
                          .toList(),
                    ),
                  ),
                  Text(
                    "Teams",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(
                            start: 1.2, end: 1.2),
                        height: 4.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(20.0),
                      childAspectRatio: 7 / 2,
                      children: this
                          .detail
                          .results
                          .teamCredits
                          .map((teamCredit) => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(this
                                      .detail
                                      .results
                                      .image
                                      .originalUrl),
                                ),
                              )),
                          Text(teamCredit.name),
                        ],
                      ))
                          .toList(),
                    ),
                  ),
                  Text(
                    "Locatios",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                    child: new Center(
                      child: new Container(
                        margin: new EdgeInsetsDirectional.only(
                            start: 1.2, end: 1.2),
                        height: 4.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(20.0),
                      childAspectRatio: 7 / 2,
                      children: this
                          .detail
                          .results
                          .locationCredits
                          .map((locationCredit) => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(this
                                      .detail
                                      .results
                                      .image
                                      .originalUrl),
                                ),
                              )),
                          Text(locationCredit.name),
                        ],
                      ))
                          .toList(),
                    ),
                  ),
                ],
              )),
          Flexible(
              child: Container(
                  height: 900.0,
                  width: 900.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          this.detail.results.image.originalUrl),
                    ),
                  ))),
        ],
      ),
    );
  }
}