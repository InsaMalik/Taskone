

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/HomeSceen.dart';
import 'package:google_signin/LoginSrceen.dart';

class _WrapperScreen extends StatefulWidget {
  const _WrapperScreen ({super.key});

  @override
  State<_WrapperScreen > createState() => __WrapperScreenState();
}

class __WrapperScreenState extends State<_WrapperScreen > {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context,snapshot){
      if(snapshot.hasData){
        return HomeScreen();
      }
      else{
        return LoginSrceen();
      }
     });
  }
}