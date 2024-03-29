import 'package:flutter/material.dart';
import 'package:hostel/screens/authentication/sign_in.dart';
import 'package:hostel/screens/authentication/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signIn=true;
  void toggleView()
  {
    setState(()=>signIn=!signIn);
  }
  @override
  Widget build(BuildContext context) {
   if(signIn)
   {
     return SignIn(toggleView:toggleView);
   }
   else
   return Register(toggleView:toggleView);
  }
}