import 'package:flutter/material.dart';
import 'package:life_style_app/screens/drawers/m_l_drawer.dart';
import 'package:life_style_app/screens/male/male_home.dart';
import 'package:life_style_app/screens/male/male_weight_gain/male_gain_menu.dart';
import 'package:life_style_app/screens/male/male_weight_loss/mail_loss_menu.dart';

import '../drawers/m_g_drawer_side.dart';

class MaleMainMenu extends StatefulWidget {
  const MaleMainMenu({Key? key}) : super(key: key);

  @override
  _MaleMainMenuState createState() => _MaleMainMenuState();
}

class _MaleMainMenuState extends State<MaleMainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MaleLossDrawer(),
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xffF29B2C),
              height: 80,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        icon: Icon(
                          Icons.arrow_back_ios_new, color: Colors.white,)),
                    Builder(
                      builder: (context){
                        return IconButton(onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                            icon: Image.asset('assets/icons/menu.png',fit: BoxFit.cover,color: Colors.white,)
                        );
                      },
                    )
                  ],
                ),
              ),
            ),

            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/mainmenu.jpg',fit: BoxFit.cover,),

            ),
            SizedBox(height: 55,),
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MaleWeightGainMenu()));
              },
              child: Container(
                  height: 100,
                  width: 350,
                  child: Image.asset('assets/weightgain.jpg')),
            ),
            SizedBox(height: 55,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>MaleWeightLossMenu()));
              },
              child: Container(
                  height: 100,
                  width: 350,
                  child: Image.asset('assets/lossweight.jpg')),
            ),
          ],
        ),
      ),
    );
  }
}
