import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:life_style_app/auth/email_screen.dart';
import 'package:life_style_app/auth/google_screen.dart';
import 'package:life_style_app/screens/home_screen.dart';
import 'package:life_style_app/service/phone_service.dart';
import 'dart:convert';
import 'package:sizer/sizer.dart';



String prettyPrint(Map json) {
  JsonEncoder encoder =  JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Map<String, dynamic>? _userData;
  // AccessToken? _accessToken;
  // bool _checking = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _checkIfIsLogged();
  // }
  //
  // Future<void> _checkIfIsLogged() async {
  //   final accessToken = await FacebookAuth.instance.accessToken;
  //   setState(() {
  //     _checking = false;
  //   });
  //   if (accessToken != null) {
  //     print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
  //     // now you can call to  FacebookAuth.instance.getUserData();
  //     final userData = await FacebookAuth.instance.getUserData();
  //     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     _accessToken = accessToken;
  //     setState(() {
  //       _userData = userData;
  //     });
  //   }
  // }
  //
  // void _printCredentials() {
  //   print(
  //     prettyPrint(_accessToken!.toJson()),
  //   );
  // }
  //
  // Future<void> _login() async {
  //   final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
  //
  //   // loginBehavior is only supported for Android devices, for ios it will be ignored
  //   // final result = await FacebookAuth.instance.login(
  //   //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
  //   //   loginBehavior: LoginBehavior
  //   //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
  //   // );
  //
  //   if (result.status == LoginStatus.success) {
  //     _accessToken = result.accessToken;
  //     _printCredentials();
  //     // get the user data
  //     // by default we get the userId, email,name and picture
  //     final userData = await FacebookAuth.instance.getUserData();
  //     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     _userData = userData;
  //   } else {
  //     print(result.status);
  //     print(result.message);
  //   }
  //
  //   setState(() {
  //     _checking = false;
  //   });
  // }
  //
  //
  // Future<void> _logOut() async {
  //   await FacebookAuth.instance.logOut();
  //   _accessToken = null;
  //   _userData = null;
  //   setState(() {});
  // }
  //
  //
  //
  // facebookLogin() async {
  //   print("FaceBook");
  //   try {
  //     final result =
  //     await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print(userData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background.png'),
            )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 445,),
            Container(
              height: 44.h,
              width: double.infinity,
              //color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 25,),
              // _checking
              //     ? Center(
              //   child: CircularProgressIndicator(),
              // )
              //     : SingleChildScrollView(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         Text(
              //           _userData != null ? prettyPrint(_userData!) : "NO LOGGED",
              //         ),
              //         SizedBox(height: 20),
              //         _accessToken != null
              //             ? Text(
              //           prettyPrint(_accessToken!.toJson()),
              //         )
              //             : Container(),
              //         SizedBox(height: 20),
              //         CupertinoButton(
              //           color: Colors.blue,
              //           child: Text(
              //             _userData != null ? "LOGOUT" : "LOGIN",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           onPressed: _userData != null ? _logOut : _login,
              //         ),
              //         SizedBox(height: 50),
              //       ],
              //     ),
              //   ),
              // ),




                  InkWell(
                    onTap: (){
                      PhoneService().signInWithFacebook(context);

                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.25,
                      color: Color(0xff3b5998),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                           Container(
                             height: 50,
                             width: 50,
                             color: Colors.white10,
                             child: Image.asset('assets/icons/facebook.png',color: Colors.grey.shade300,),
                           ),
                            Center(child: Text('الدخول باستخدام الفايسبوك',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 15,),
                  InkWell(
                    onTap: ()async {
                      User? user =await GoogleAuth.signInWithGoogle(context: context);
                      if(user!=null){
                        PhoneService _auth = PhoneService();
                        _auth.addUser(context, user.uid);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.25,
                      color: Colors.red.shade700,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Container(
                              height: 50,
                              width: 50,
                              color: Colors.white10,
                              child: Image.asset('assets/icons/email.png',color: Colors.grey.shade300,),
                            ),
                            SizedBox(width: 6,),
                            Center(child: Text('الدخول باستخدام الإيميل',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>EmailScreen()));

                    },
                    child: Text('ليس عندي حساب',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text('نسيت كلمة السر    ؟',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
