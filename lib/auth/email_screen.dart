import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/auth/reset_password.dart';
import 'package:life_style_app/service/email_services.dart';


class EmailScreen extends StatefulWidget {


  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool validate =false;
  bool login = false;
  bool loading = false;

  EmailAuthentication service = EmailAuthentication();

  validateEmail(){
    if(formKey.currentState!.validate()){
      setState(() {
        validate = false;
        loading = true;
      });

      service.getAdminCredental(
        context: context,
        isLog: login,
        password: passwordController.text,
        email: emailController.text
      )
          .then((value) {
        setState(() {

          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Logon',
        style: TextStyle(color: Colors.black),
        ),

      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AbsorbPointer(
            absorbing:  validate ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                validate  ? MaterialStateProperty.all(Theme.of(context).primaryColor) : MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: (){
                validateEmail();
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: loading ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
                    : Text(login ? 'Login' : 'Register',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.red.shade200,
                child: Icon(CupertinoIcons.person_alt_circle,color: Colors.red,size: 60,),
              ),
              SizedBox(height: 10,),
              Text('Enter to ${login ? 'login' : 'Register'}',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10,),
              Text('Enter email and password to ${login ? 'login' : 'Register'}',
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),
              ),
              SizedBox(height: 25,),
              TextFormField(
                controller: emailController,
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
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12),
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(

                obscureText: true,
                controller: passwordController,
                onChanged: (value){
                  if(emailController.text.isNotEmpty){
                    if(value.length>3){
                      setState(() {
                        validate = true;
                      });
                    }else{
                      setState(() {
                        validate= false;
                      });
                    }
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: validate ? IconButton(
                      onPressed: (){
                        passwordController.clear();
                        setState(() {
                          validate= false;
                        });
                      },
                      icon: Icon(Icons.clear),
                  ): null,

                  contentPadding: EdgeInsets.only(left: 12),
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(height: 10,),

              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ResetPassword()));
                    },
                    child: Text('Forget Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                  )
                  ),
              ),

              Row(
                children: [
                  Text(login ? 'Do not have account?' : 'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                     setState(() {
                       login = !login;
                     });
                    },
                    child: Text(login ? 'Register' : 'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
