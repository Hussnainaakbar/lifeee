import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/screens/drawers/f_l_drawer.dart';
import 'package:life_style_app/screens/female/weight_loss/l_w_menu.dart';
import 'package:life_style_app/screens/female/weight_loss/loss_weight_diet/day1/menuday1.dart';
import 'package:life_style_app/screens/female/weight_loss/loss_weight_diet/day2/menuday2.dart';
import 'package:life_style_app/screens/female/weight_loss/loss_weight_diet/day3/menuday3.dart';
import 'package:life_style_app/screens/female/weight_loss/loss_weight_sport/loss_weigt_sport_calender.dart';

import '../../../drawers/m_g_drawer_side.dart';

class LossWeightCalender extends StatefulWidget {
  const LossWeightCalender({Key? key}) : super(key: key);

  @override
  _LossWeightCalenderState createState() => _LossWeightCalenderState();
}

class _LossWeightCalenderState extends State<LossWeightCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: FemaleLossDrawer(),
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
              height: 130,
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
            SizedBox(height: 5,),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22.0,right: 40),
                  child: Text('لدينا لك لتخسر وزنك.  خطة لمدة شهر كامل نوجهك خلالها إلى موعد وكيفية تناول وجباتك.  وكذلك حول المكوس لتقليل الدهون في الجسم.  مجرد إراحة تطبيقنا لتقليل وزن جسمك',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,letterSpacing: -1.5),
                  ),
                )),
            SizedBox(height: 8,),
            Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/1.05,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7,crossAxisSpacing: 3.0,mainAxisSpacing: 3),
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'ليوم الأول',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم الثاني',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الثالث',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('3',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الرابع',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم الخامس',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('5',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم السادس',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('6',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم السابع',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('7',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم الثامن',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('8',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم التاسع',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('9',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم العاشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('10',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'ليوم الحادي عشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('11',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الثاني عشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('12',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الثالث عشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('13',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم الرابع عشر',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('14',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الخامس عشر',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('15',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم السادس عشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('16',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم السابع عشر',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('17',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الثامن عشر',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('18',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم التاسع عشر',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('19',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم العشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('20',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الحادي والعشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('21',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الثاني والعشرون',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('22',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم الثالث والعشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('23',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الرابع والعشرون',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('24',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الخامس والعشرون',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('25',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم السادس والعشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('26',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم السابع والعشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('27',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الثامن والعشرون',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('28',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay2(youm: 'اليوم التاسع والعشرون',)));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('29',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay3(youm: 'اليوم الثلاثين',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('30',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LossMenuDay1(youm: 'اليوم الواحد والثلاثون',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF7B044),
                          )
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Text('31',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                            Text('يوم',style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LossWeightSportCalender()));
              },
              child: Container(
                height: 55,
                width: 210,
                color: Color(0xffF7B044),
                child: Center(
                  child: Text('تمارين الرياضه >',
                    style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),
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
