import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'email_screen.dart';


class ResetPassword extends StatelessWidget {

  var emailController = TextEditingController();
  final formKey  = GlobalKey<FormState>();


  bool validate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Theme.of(context).primaryColor ,
              ),
              onPressed: (){
                if(formKey.currentState!.validate()){
                  FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>EmailScreen()));
                  });

                }

              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('Next',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                ),
              ),
            ),

        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock,color: Theme.of(context).primaryColor,size: 75,),
                SizedBox(height: 10,),
                Text('Forget\nPassword?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 10,),
                Text('Send your email,\nWe will send a link to reset password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 10,),

                ///////////////////////////////////////////////////

                TextFormField(
                  validator: (value){
                    final bool isValid = EmailValidator.validate(emailController.text);
                    if(value == null || value.isEmpty){
                      return 'Enter email';
                    }
                    if(value.isNotEmpty && isValid == false){
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 12),
                    labelText: 'Enter your Email',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
