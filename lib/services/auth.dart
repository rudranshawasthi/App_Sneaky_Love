import 'package:firebase_auth/firebase_auth.dart';
import 'package:avibebo/models/appUser.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;



  //auth change user stream

  Stream<appUser> get user{
    return _auth.authStateChanges().map(_appUserfromFirebaseUser);
  }



  appUser _appUserfromFirebaseUser(User user){
    return user != null ? appUser(uid: user.uid) : null;
  }


  //Sign in with email password

  Future signIn(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _appUserfromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  //Sign Up with email password

  Future signUp(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _appUserfromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //Sign Out

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