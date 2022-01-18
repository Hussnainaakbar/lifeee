import 'package:flutter/material.dart';
import 'package:life_style_app/screens/bmi_calculator/bmi_home.dart';
import 'package:life_style_app/screens/bmi_calculator/result.dart';
import 'package:life_style_app/screens/drawers/f_l_drawer.dart';
import 'package:life_style_app/screens/drawers/m_g_drawer_side.dart';

import 'custom_text.dart';

class ShowValues extends StatefulWidget {
  final String age;
  final String height;
  final String weight;

  const ShowValues(
      {Key? key, required this.age, required this.height, required this.weight})
      : super(key: key);

  @override
  State<ShowValues> createState() => _ShowValuesState();
}

class _ShowValuesState extends State<ShowValues> {
  double finalResult = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      endDrawer: FemaleLossDrawer(),
      body: SafeArea(
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
              height: 180,
              width: 300,
              child: Image.asset('assets/bmi.jpg'),
            ),
            Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const Image(
                          //     fit: BoxFit.contain,
                          //     width: 400,
                          //     image: AssetImage('assets/bmi.jpg')),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width/1.2,
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
                          CustomText(
                            hintText: 'سنة',
                            icon: Icons.watch_later_outlined,
                            textUSer: widget.age,
                          ),
                          CustomText(
                            hintText: 'سم',
                            icon: Icons.thermostat,
                            textUSer: widget.height,
                          ),
                          CustomText(
                            icon: Icons.monitor_weight_outlined,
                            hintText: 'كيلوغرام',
                            textUSer: widget.weight,
                          ),
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
                                  finalResult = BmiCalculator(
                                      double.parse(widget.weight),
                                      double.parse(widget.height));
                                  setState(() {
                                    finalResult = finalResult;
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => Resulst(
                                            result: finalResult,
                                          )));
                                },
                              ),
                            ),
                          )
                        ]))),
          ],
        ),
      ),
    );
  }
}

double BmiCalculator(double weight, double height) {
  var result = (weight / (height * height)) * 10000;
  print(result);
  return result;
}