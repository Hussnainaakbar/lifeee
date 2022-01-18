import 'package:flutter/material.dart';
import 'package:life_style_app/screens/bmi_calculator/field_text.dart';
import 'package:life_style_app/screens/male/male_bmi/m_bmi_show_value.dart';
import 'package:life_style_app/screens/male/male_home.dart';

import '../../drawers/m_g_drawer_side.dart';

class MaleBmiHome extends StatefulWidget {
  const MaleBmiHome({Key? key}) : super(key: key);

  @override
  _MaleBmiHomeState createState() => _MaleBmiHomeState();
}

class _MaleBmiHomeState extends State<MaleBmiHome> {
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    ageController.dispose();
    hieghtController.dispose();
    weightController.dispose();
    super.dispose();
  }

  String age = '';
  String hieght = '';
  String weight = '';
  TextEditingController ageController = TextEditingController();
  TextEditingController hieghtController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  static const LinearGradient createGradient = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0XFFF6A419), Color(0XFFF6A419)]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      endDrawer: DrawerSide(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
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
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 300,
                      child: Image.asset('assets/bmi.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      color: Color(0xffF6A419),
                      child: const Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'تحليل الوزن',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'سيساعدك حساب مؤشر حساب الكتلة على معرفة ما إذا كان وزن جسمك مناسبا لطولك .',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          letterSpacing: -3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,right: 18),
                      child: Column(
                        children: [
                          kmyText(
                            mycontroller: ageController,
                            hintText: 'العمر',
                            icon: Icons.watch_later_outlined,
                            onchanged: (valueAge) {
                              setState(() {
                                age = valueAge;
                              });
                              print(age);
                            },
                          ),
                          kmyText(
                            mycontroller: hieghtController,
                            hintText: 'الطول بالسنتمتر',
                            icon: Icons.thermostat,
                            onchanged: (valueHeight) {
                              setState(() {
                                hieght = valueHeight;
                              });
                              print(hieght);
                            },
                          ),
                          kmyText(
                            mycontroller: weightController,
                            hintText: 'الوزن بالكيلوغرام',
                            icon: Icons.monitor_weight_outlined,
                            onchanged: (valueWeight) {
                              setState(() {
                                weight = valueWeight;
                              });
                              print(weight);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffF6A419),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                          label: const Text(
                            'تحليل وزني',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          onPressed: () {
                            if (age == '' || hieght == '' || weight == '') {
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => MaleBmiShowValue(
                                        height: hieght,
                                        weight: weight,
                                        age: age,
                                      )));
                              ageController.clear();
                              hieghtController.clear();
                              weightController.clear();
                            }
                          },
                        ),
                      ),
                    )
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
