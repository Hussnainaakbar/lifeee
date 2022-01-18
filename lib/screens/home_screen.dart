import 'package:flutter/material.dart';
import 'package:life_style_app/screens/female/female_screen.dart';
import 'package:life_style_app/screens/male/male_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              SizedBox(height: 8,),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width/1.4,
                color: Color(0xfffbbe28),
                child: Center(child: Text('مرحبا بك على تطبيقنا',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                )),

              ),
              SizedBox(height: 20,),
              Text('ستساعدنا هاته البيانات على اختيار \nالنظام الغذائي و الرياضي المناسب لك',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50,),
              Text('هل أنت',
                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold,letterSpacing: 0.8),
              ),
              SizedBox(height: 20,),
              Container(
                height: 300,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 8,),
                        Text('شاب',
                          textAlign: TextAlign.center,

                          style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 0.8),
                        ),
                        SizedBox(height: 20,),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>MaleHomeScreen()));
                          },
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                              color:Color(0xfffbbe28),
                              boxShadow:[
                                BoxShadow(
                                  offset: Offset(0,6),
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,

                                ),
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/icons/man.png',),
                            ),

                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 8,),
                        Text('فتاة',
                          textAlign: TextAlign.center,

                          style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 0.8),
                        ),
                        SizedBox(height: 20,),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>FemaleScreen()));
                          },
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                color:Color(0xfffbbe28),
                                boxShadow:[
                                  BoxShadow(
                                    offset: Offset(0,6),
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,

                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/icons/girl.png',),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
