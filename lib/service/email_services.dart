

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/auth/email_verificatio_screen.dart';
import 'package:life_style_app/screens/home_screen.dart';


class EmailAuthentication{


  CollectionReference users = FirebaseFirestore.instance.collection('users');


  Future<DocumentSnapshot> getAdminCredental(
      {email, isLog, password, context})async{
    DocumentSnapshot result = await users.doc(email).get();
    if(isLog){
      emailLogin(email,password,context);
    }else{
      if(result.exists){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text('An Account already exit with this email'),
          ),
        );
      }else{
        emailRegister(email,password,context);
      }
    }

    return result;
  }
  emailLogin(email,password, context)async{
    try{
      UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential.user!.uid!=null){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));

      }

    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text('No user found for this email'),
          ),
        );
      }else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text('Wrong password provided for this user'),
          ),
        );
      }
    }

  }
  emailRegister(email,password, context)async{

    try{
      UserCredential userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);

            if(userCredential.user!.uid!=null){
              return users.doc(userCredential.user!.uid).set({
                'uid':userCredential.user!.uid,
                'url':userCredential.user!.photoURL,
                'email': userCredential.user!.email,
                'name': userCredential.user!.displayName,
              }).then((value) async{

                //verification email code

                  await userCredential.user!.sendEmailVerification().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>EmailVerificationScreen()));

                  });

              }).catchError((onError){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:
                  Text('Failed to add user'),
                  ),
                );

              });
            }
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text('The password provided is to weak'),
          ),
        );
      }else if(e.code == 'email-already-in-use '){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text('The account already exists for that email '),
          ),
        );
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:
        Text('${e.toString()} '),
        ),
      );
    }
  }
}

