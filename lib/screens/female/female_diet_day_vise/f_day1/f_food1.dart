import 'package:flutter/material.dart';
import 'package:life_style_app/screens/drawers/f_g_drawer.dart';
import 'package:life_style_app/screens/drawers/m_g_drawer_side.dart';
import 'package:life_style_app/screens/female/f_diet.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_day1/bf1.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_day1/dinner1.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_day1/lunch_day1.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_day1/snack1.dart';

import '../../f_sport.dart';

class FemaleFoodMain extends StatefulWidget {
  String youm;
  FemaleFoodMain({required this.youm,Key? key}) : super(key: key);

  @override
  _FemaleFoodMainState createState() => _FemaleFoodMainState();
}

class _FemaleFoodMainState extends State<FemaleFoodMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer:FemaleGainDrawer(),
      body: SafeArea(
        child:Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                    Builder(
                      builder: (context){
                        return IconButton(onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                            icon: Image.asset('assets/icons/menu.png',fit: BoxFit.cover,color: Colors.black,)
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 200,
              child: Image.asset('assets/diet_sy.jpg'),
            ),
            SizedBox(height: 8,),
            Container(
              height: 55,
              width: 270,
              color: Color(0xffF7B044),
              child: Center(
                child: Text('نظام غذائي',
                  style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 35,),
            Container(
              height: 300,
              width: 300,
              child:  GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,crossAxisSpacing: 8.0,mainAxisSpacing: 8),
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Lunchday1(youm: widget.youm,)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/lunch.jpeg'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>BreakFastday1(youm: widget.youm,)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/bf.jpeg'),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Dinnerday1(youm: widget.youm,)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/diner.jpeg'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SnackDay1(youm: widget.youm,)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/snak.jpg'),
                      ),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                //Navigator.pushReplacementNamed(context, FemaleSport.id);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>FemaleSport()));
              },
              child: Container(
                height: 40,
                width: 150,
                color: Color(0xffF7B044),
                child: Center(
                  child: Text('تمارين الرياضه >',
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
