
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/AuthProivder.dart';
import 'package:google_signin/screen/HomeSceen.dart';
import 'package:google_signin/screen/LoginSrceen.dart';
import 'package:google_signin/screen/PostPage.dart';
import 'package:google_signin/screen/Signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
     ChangeNotifierProvider(create: (_)=> AuthProvider()),
    ],
    child:MaterialApp(
      title: 'TaskOne App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: '/login',
      routes: {
        // '/': (_) => const _WrapperScreen(),
        '/home': (_) =>  HomeScreen(),
        '/login': (_) => const LoginSrceen(),
        '/signup': (_) => const SignUpScreen(),
        '/posts':(_)=>  PostsPage(),
      },
    ),
    );
  }
}
