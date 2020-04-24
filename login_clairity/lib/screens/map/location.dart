import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {

  String _locationMessage ='';

  void _getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location')
      ),
      body: Align(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_locationMessage),
          FlatButton(
            onPressed: (){
              _getCurrentLocation(); 
            },
            color: Colors.brown[100], 
            child: Text('Press to get current location'),
          ),

          SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[200],
                  child: Text(
                    'Go Back',
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.pop(context);
                }
                )
                
        ]
        ,),
      ),
      
    );
  }
}