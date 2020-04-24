import 'package:flutter/material.dart';
import 'package:login_clairity/screens/map/location.dart';
import 'package:login_clairity/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth =AuthService();

  Map data;
  String pm1,pm2_5,pm10,name1;

  Future getData() async {
    http.Response response = await http.get("https://api.thingspeak.com/channels/987334/feeds/last.json?api_key=88BMJAAFH25HIF9X&results=100");
    data = json.decode(response.body);
    setState(() {
      pm1 = data["field1"];
   
      pm2_5 = data["field2"];
   
      pm10 = data["field3"];
    
      name1 = data["field4"];
    
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Air Pollution values'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column( 
            children: <Widget> [
              SizedBox(height: 20.0),
              Text('PM 1 value : '+ pm1),

              SizedBox(height: 20.0),
              Text('PM 2.5 value : '+ pm2_5),

              SizedBox(height: 20.0),
              Text('PM 10 value : '+ pm10),
              
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[200],
                  child: Text(
                    'Location',
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CurrentLocation()));
                }
                ),
          ]
          ),
      ),
    );
  }
}