
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
 
class LoginSrceen extends StatelessWidget {
  const LoginSrceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LogIn",
                style:TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,

              ),
              const SizedBox(height: 30,),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText:"Email",
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  labelText:"Password",
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
           Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){},
              child:const Text("Forget Password"),
              ),
           ),
           const SizedBox(height: 10,),
           ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/home");
            }, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Login"),
           ),
           const SizedBox(height: 20,),
           Row(children:
            const[
             Expanded(child: Divider()),
             Padding(padding: EdgeInsets.symmetric(horizontal: 10),
             child: Text("or"),
             ),
             Expanded(child:Divider()),
           ],
           ),
           const SizedBox(height: 20,),
           SignInButton(
            Buttons.Google,
            onPressed:() async {
              try{
                UserCredential userCredential = await  signInWithGoogle();
                if(userCredential !=null){
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text("welcome,${userCredential.user?.displayName??"user"}"),
                      backgroundColor: Colors.green,

                    ),
                  );
                  Navigator.pushReplacementNamed(context, "/home");
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("lohin Failed. Please try again"),
                      backgroundColor: Colors.red,
                    )
                    );
                }
               
              } catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content:Text("Google Sign-In Failed:$e"),
                      backgroundColor: Colors.red,
                    ),
                    );
                }
            },
           ),
           SizedBox(height: 30,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              GestureDetector(
                onTap:(){
                  Navigator.pushNamed(context,"/signup");
                },
                child: const Text("Sign up",
                style: TextStyle(color:Colors.blue),),
              )
            ],
           )
            ],
          ),
        ),
        ),
      );
    
  }
  
  signInWithGoogle() {}
}