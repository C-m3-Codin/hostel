import 'package:flutter/material.dart';
import 'package:hostel/services/auth.dart';
import 'package:hostel/shared/constants.dart';

class Register extends StatefulWidget {

   final Function toggleView;
  Register({this.toggleView});
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {

  String email='';
  String pass='';
  String error = "";
  final AuthService _auth=AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(


      backgroundColor: Colors.blue,
      elevation: 10.0,
      title: Text('Register to the app'),

      actions: <Widget>[
        FlatButton.icon(onPressed:(){
          widget.toggleView();
        }, icon: Icon(Icons.perm_identity), label: Text('Sign in'))
      ],
    
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formkey,
          child: Column(

          children:<Widget>[
           // Text("Email Id"),
            TextFormField(
              decoration:textDecoration.copyWith(hintText:"Email"),
              validator: (val)=>val.isEmpty?"Enter email enne tanne alle ezuthiye?":null,
              onChanged:(val){
                setState(()=>email=val);


              }
            ),

            SizedBox(height: 40),
          //  Text("Password"),
            TextFormField(
              decoration:textDecoration.copyWith(hintText:"Password"),
              validator: (val)=>val.length < 5 ? 'Password must be greator than 5':null,
              obscureText: true,
              onChanged: (val)
              {
                setState(()=>pass=val);

              },
            ),

            SizedBox(height: 20,),
            RaisedButton(
              //shape: 
              elevation: 20.0,
              splashColor: Colors.red,
              hoverColor: Colors.red,
              color: Colors.blue,
              child: Text('Register',
              style: TextStyle(
                color: Colors.white
              ),)
              
              
            , onPressed: () async{

              if(_formkey.currentState.validate())
              {
                //Register
                dynamic result = await _auth.registerEmailPass(email, pass);
                if(result==null)
                setState(()=>error='please enter valid emaill' );
              }

            },

            ),
            SizedBox(height: 20,),
            Text(error,
            style: TextStyle(color:Colors.red),),
            Text(
             "Register Cheyye myree",
             // textAlign: TextAlign.center,
              style: TextStyle(color:Colors.red),
            )

          ]
          ),
          ), 
        ),
        
    );
  }
}