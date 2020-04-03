import 'package:flutter/material.dart';
import 'package:hostel/models/user.dart';
import 'package:hostel/screens/authentication/authenticate.dart';
import 'package:hostel/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //home if signed in
    //authenticate if not

    final user = Provider.of<User>(context);
    if(user == null)
    { 
      return Authenticate();
    }
    
   else{return home();}
  }
}