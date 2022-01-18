



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:life_style_app/screens/home_screen.dart';

class GoogleAuth{

  static SnackBar customSnackBar({required String content}){
    return SnackBar(
      content: Text(
        content,
        style: TextStyle(
          color: Colors.redAccent,letterSpacing: 1.5,
        ),
      ),
    );
  }


  static Future<User?> signInWithGoogle({required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null){
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

     final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

     try{
       final UserCredential userCredential =
           await auth.signInWithCredential(credential);

       user =userCredential.user!;

     }on FirebaseAuthException catch(e){
       if(e.code == 'account exit with different credential'){ 
         ScaffoldMessenger.of(context).showSnackBar(
           customSnackBar(content: 'account exit with different credential'),
         );
       }else if(e.code == 'invalid credential'){
         ScaffoldMessenger.of(context).showSnackBar(
           customSnackBar(content: 'invalid credential'),
         );
       }
     }catch(e){
       ScaffoldMessenger.of(context).showSnackBar(
         customSnackBar(content: 'Login failed'),
       );
     }
    }
    return user;
  }
  Future<UserCredential?> signInWithFacebook(context) async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Navigator.pushReplacementNamed(context, HomeScreen.id);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}


