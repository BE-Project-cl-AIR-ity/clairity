import 'package:flutter/material.dart';
import 'package:login_clairity/models/user.dart';
import 'package:login_clairity/screens/authenticate/authenticate.dart';
import 'package:login_clairity/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //return either home or authenticate widget

    if(user == null) {
      return Authenticate();
    }else{
      return Home();
    } 

}
}