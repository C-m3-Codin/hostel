import 'package:flutter/material.dart';
import 'package:hostel/services/auth.dart';

class home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
            FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
               icon: Icon(Icons.person), 
               label: Text('Logout'))
        ],

    ),
    body: home(
      
    ),
    );
    
  }
}