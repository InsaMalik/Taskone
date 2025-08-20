import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  User? get user=> _user;

  Future<void> signInWithGoogle()async{
    try{
    final GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
    if(googleUser==null){
      throw Exception("Google Sign_in Failed . Please Try again");
    }
    final GoogleSignInAuthentication googleAuth= await googleUser.authentication;
    final OAuthCredential credential=GoogleAuthProvider.credential(
      accessToken:googleAuth.accessToken,
      idToken: googleAuth.idToken,
     );
     UserCredential userCredential=await _firebaseAuth.signInWithCredential(credential);
     _user=userCredential.user;
     notifyListeners();
  }
  catch (e){
    throw Exception("Google Sign_in Failed: $e");
  }
  
}

  // Email and password login
  Future<void> signInWithEmailandPassword(
    String email,String password)
  async{
    try{
      UserCredential userCredential =await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );
        _user=userCredential.user;
        notifyListeners();
    }catch(e){
      throw Exception("Email/password Login Failed: $e" );
    }
    }


//Sign out
Future<void> signOut()async{
  await _firebaseAuth.signOut();
  await GoogleSignIn().signOut();
  _user=null;
  notifyListeners();
}
}
