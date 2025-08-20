

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/providers/auth_provider.dart';
import 'package:google_signin/screen/HomeSceen.dart';
import 'package:google_signin/screen/LoginSrceen.dart';
import 'package:provider/provider.dart';

class _WrapperScreen extends StatelessWidget {
  const _WrapperScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context);
   
      if(authProvider.user !=null){
        return HomeScreen();
      }
      else{
        return LoginSrceen();
    }
   }
  }
  
  extension on AuthProvider {
  get user => null;
  }
