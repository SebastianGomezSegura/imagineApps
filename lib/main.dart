import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagineapps/Detalle.dart';
import 'package:imagineapps/Comic.dart';
import 'package:flutter/src/widgets/image.dart';
import 'dart:convert';
import 'package:imagineapps/pagina.dart';

void main() => runApp(MyApp());

class MyApp extends  StatelessWidget {
  const MyApp ({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRUEBA',
      theme: ThemeData (
      primarySwatch: Colors.grey,
      ),
      home: const Splash(),
    );
  }
}
fetchData() async {
  var res = await http.get(
      'https://comicvine.gamespot.com/api/issues/?api_key=de6bf2339cb68011e22bba686dd2522af59e8752&format=json');
  var decodedJson = jsonDecode(res.body);
  Comic = Comic.fromJson(decodedJson);
  setState(() {});
}
class Splash extends  StatefulWidget {
  const Splash({Key? key}) : super (key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends  State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement( context , MaterialPageRoute(builder:  (context)=> const Home()));
    });
  }
  @override
  Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.white60,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/comic.png'),
              const SizedBox(height: 30,),
              const CircularProgressIndicator(
                color: Colors.black54,
              )
            ],
          ),
        ),
      );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: const Text('COMIC VINE'),
      ),
      body : Comic == null
      ? Center(
      child: CircularProgressIndicator(),
      )
      :GridView.count(
    crossAxisCount: 4,
    children: Comic.results
        .map((comic) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  pagina(
                      results: comic,
                    )));
          },
          child: Card(
            color: Colors.grey,
            margin:
            const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: <Widget>[
                Container(
                    height: 275.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            comic.image.originalUrl),
                      ),
                    )),
                if (comic.name == null)
                  Text(
                    'Untitled ' + comic.issueNumber,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                if (comic.name != null)
                  Text(
                    comic.name + ' ' + comic.issueNumber,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                Text(
                  comic.dateAdded,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        )))
    .toList(),
    );
  }
}