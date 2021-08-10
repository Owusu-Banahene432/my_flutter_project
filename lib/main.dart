import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:shoeapp/Homepage.dart';
import 'package:shoeapp/signuppage.dart';

Future<void> main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: LandingPage(),
      routes: {
        '/home': (context) => Homepage(),
        '/Signup':(context)=> SignupPage(),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() { 
    super.initState();
    Timer(Duration(seconds: 5), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage(),),);
    });
    
  }

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
}
        
      
  


