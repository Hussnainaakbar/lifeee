import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:life_style_app/screens/home_screen.dart';


class PhoneService{
  FirebaseAuth auth =FirebaseAuth.instance;
  User? user =FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(context, uid)async{

    final QuerySnapshot  result = await users.where('uid',isEqualTo: uid).get();

    List<DocumentSnapshot> document = result.docs;

    if(document.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

    }else{


      return users.doc(user!.uid)
          .set({
        'uid':user!.uid,
        'email' : user!.email,
        'name' : user!.displayName,
        'url': user!.photoURL
      }).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

      })
          .catchError((error)=>print('failed to add user : $error'));
    }
    }
     Future<void> getUserName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc((FirebaseAuth.instance.currentUser!).uid)
        .get()
        .then((value) {
        var email = user!.email;
        var name = user!.displayName;
        var url = user!.photoURL;
        var uid = user!.uid;
    });
  }

  Future<void> productData() async {
    await FirebaseFirestore.instance
        .collection('Product')
        .doc((FirebaseAuth.instance.currentUser!).uid)
        .get()
        .then((value) {
      var email = user!.email;
      var name = user!.displayName;
      var url = user!.photoURL;
      var uid = user!.uid;
    });
  }

  /// fb ///////////////////////////////////////////////////////

  Future<UserCredential?> signInWithFacebook(context) async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }


  // fb()async {
  //   final result = await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
  //
  //   if (result.status == LoginStatus.success) {
  //     final userData = await FacebookAuth.i.getUserData(
  //       fields: "email,name",
  //     );
  //     user = userData as User?;
  //   }
  // }

}
