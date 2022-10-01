import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class klimatic extends StatefulWidget {
  const klimatic({Key? key}) : super(key: key);

  @override
  State<klimatic> createState() => _klimaticState();
}

class _klimaticState extends State<klimatic> {

  void ShowStuff() async {
    Map data = await getWeather(util.appId, util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("klimatic"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ShowStuff,
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/weather1.jpg',
              height: 1200.0,
              width: 500.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 3.0, 20.0, 0.0),
            child:  Text("Ogbomoso", style: cityStyle()),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(90.0, 210.0, 20.0, 0.0),
            child: Image.asset('images/cloud.JPG'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 330.0, 20.0, 0.0),
            child: Text("66.7F",
            style: tempStyle(),
            ),
          )
        ],
      ),
    );
  }
  Future<Map> getWeather (String appId, String city) async {
    String apiUrl = "";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

}




TextStyle cityStyle() {
  return const TextStyle(
      fontSize: 20.0,
      color: Colors.black38,
      fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return const TextStyle(
      fontSize: 43.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontStyle: FontStyle.italic
  );
}