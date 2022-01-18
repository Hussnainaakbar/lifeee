

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/screens/login_screen.dart';
import 'package:life_style_app/screens/splash_screen.dart';

import 'home_screen.dart';

class NavigationPage extends StatefulWidget {

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return HomeScreen();
        }
        return SplashScreen();
      },
    );
    // return Scaffold(
    //   body: isSigned == true ? SplashScreen() : HomeScreen(),
    // );
  }
}
