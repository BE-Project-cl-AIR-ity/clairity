import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var notes1 = [];

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data;
  String name1,pm1,name2,pm2_5,name3,pm10;

  Future getData() async {
    http.Response response = await http.get("https://api.thingspeak.com/channels/987334/feeds/last.json?api_key=88BMJAAFH25HIF9X&results=100");
    data = json.decode(response.body);
    setState(() {
      pm1 = data["field1"];
    });
    setState(() {
      pm2_5 = data["field2"];
    });setState(() {
      pm10 = data["field3"];
    });setState(() {
      name1 = data["field4"];
    });setState(() {
      name2 = data["field5"];
    });setState(() {
      name3 = data["field6"];
    });
    notes1 = [pm1,pm2_5,pm10,name1,name2,name3];

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

 /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air Pollution Monitoring"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Text("$pm1",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,)
           ),
      ),
      
    );  
  } 
  }*/
  
/*@override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: notes1.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(notes1[pos], style: TextStyle(
                fontSize: 18.0,
                height: 1.6,
              ),),
            ),
          )
        );
      },
    );
  }
}
*/


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air Pollution Monitoring"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
      itemCount: notes1.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(color: Colors.white,child: Padding(padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(notes1[pos], style: TextStyle(fontSize: 18.0,height: 1.6,),),
            ),
          ),
        );
      },
    ),
    );
  }
}