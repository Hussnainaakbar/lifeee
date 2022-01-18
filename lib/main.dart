import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/provider/cart_provider.dart';
import 'package:life_style_app/provider/product_provider.dart';
import 'package:life_style_app/screens/bmi_calculator/bmi_home.dart';
import 'package:life_style_app/screens/female/diet_plane.dart';
import 'package:life_style_app/screens/female/f_diet.dart';
import 'package:life_style_app/screens/female/f_general_advices.dart';
import 'package:life_style_app/screens/female/f_sport.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_day1/f_food1.dart';
import 'package:life_style_app/screens/female/female_diet_day_vise/f_days2/f_food_main2.dart';
import 'package:life_style_app/screens/female/female_screen.dart';
import 'package:life_style_app/screens/female/g_main_menu.dart';
import 'package:life_style_app/screens/home_screen.dart';
import 'package:life_style_app/screens/login_screen.dart';
import 'package:life_style_app/screens/navigation_page.dart';
import 'package:life_style_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'auth/email_screen.dart';
import 'auth/email_verificatio_screen.dart';
import 'auth/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context)=>ProductProvider(),
        ),
      ],

      child: Sizer(
          builder: (context, orientation, deviceType){
            return MaterialApp(
            theme:  ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
            title: 'Life Style App',
            debugShowCheckedModeBanner: false,
            home: NavigationPage(),
            );
          }

      ),
    );
  }
}


