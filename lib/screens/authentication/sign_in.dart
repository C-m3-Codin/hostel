import 'package:flutter/material.dart';
import 'package:hostel/screens/authentication/authenticate.dart';
import 'package:hostel/screens/authentication/register.dart';
import 'package:hostel/services/auth.dart';
import 'package:hostel/shared/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  String email='';
  String pass='';
  String error='';
  final _formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
      backgroundColor: Colors.blue,
      elevation: 10.0,
      title: Text('Sign in',
      textAlign: TextAlign.center,),
      actions: <Widget>[
        FlatButton.icon(
          onPressed:()
          {
            widget.toggleView();
          },
          icon: Icon(
            //Icons.perm_identity
            Icons.person_add
            ),
          label: Text("Register")
          )
      ],
    
      ),
      body: Container(

        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            
          children:<Widget>[
            TextFormField(
              decoration:textDecoration.copyWith(hintText:"Email"),
              validator: (val)=>val.isEmpty?"Email Adikke":null,
              onChanged:(val){
                setState(()=>email=val);


              }
            ),

            SizedBox(height: 10),
            TextFormField(
              decoration:textDecoration.copyWith(hintText:"Password"),
              validator: (val)=>val.length<5?"pinneyum maranno GREATER THAN 5":null,
              obscureText: true,
              onChanged: (val)
              {
                setState(()=>pass=val);

              },
            ),

            SizedBox(height: 20,),
            RaisedButton(
              
              color: Colors.blue,
              child: Text('Login',
              style: TextStyle(
                color: Colors.white
              ),)
              
              
            , onPressed: () async{
              if(_formkey.currentState.validate())
              {
                //sign in
                dynamic result=_auth.signInEmailPass(email, pass);
                if (result==null)
                setState(()=>error='Entered email and pass dont match');
              }

            },

            )

          ]
          ),
          ), 
        ),
        
    );
  }
}