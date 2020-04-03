import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel/models/user.dart';

class   AuthService{

    final FirebaseAuth _auth=FirebaseAuth.instance;
  //create user object
  User _userFromFirebaseUser(FirebaseUser user){
    return user!= null?User(uid:user.uid):null;
  }



  //check user stream and change if needed
  Stream <User> get user{
    //return _auth.onAuthStateChanged.map((FirebaseUser user)=>_userFromFirebaseUser(user));
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }


  //SIGN IN
 Future signInEmailPass(String email,String pass)
 async {

    try{
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);  
      }
    catch(e){

      print(e.toString());


    }
  
 }



  

  //REGISTER

  Future registerEmailPass(String email,String pass) async {

    try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);  
      }
    catch(e){

      print(e.toString());


    }
  }


  //SIGH OUT

  Future signOut() async{
    try{
      return await _auth.signOut();

    }
    catch(e){
      print(e.toString());
      return null;

    }
  }




}