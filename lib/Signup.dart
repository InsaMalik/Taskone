

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical:30),
          child:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Text("Sign in",
            style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),
            const SizedBox(height: 50,),
            const TextField(
             decoration: InputDecoration(
              prefixIcon:Icon(Icons.person_outline),
              labelText:"Full Name",
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),                
              ),
             ),
            ),
            const SizedBox(height: 20,),
            const TextField(
             decoration: InputDecoration(
              prefixIcon:Icon(Icons.email_outlined),
              labelText:"Email",
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),                
              ),
             ),
            ),
            const SizedBox(height: 20,),
            const TextField(
             decoration: InputDecoration(
              prefixIcon:Icon(Icons.lock_outlined),
              labelText:"Password",
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),                
              ),
             ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
            onPressed: (){},
            style:  ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ), 
            child: const Text("Sign Up"),),
            const SizedBox(height: 19,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "  Log In",
                    style: TextStyle(color:Colors.blue),
                  ),
                ),
              ],),
           ],
          ),
          ),
      ),
    );
  }
}