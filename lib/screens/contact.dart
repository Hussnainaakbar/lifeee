
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:life_style_app/shop/review_star.dart';
import 'package:life_style_app/shop/shop_home.dart';
import 'package:sizer/sizer.dart';

import 'drawers/m_g_drawer_side.dart';
import 'female/diet_plane.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(text: 'nutrianainsta@gmail.com',);

  final _subjectController = TextEditingController();

  final _bodyController = TextEditingController();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 85,
        color: Color(0xffFDB640),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopHome()));
                    },
                    child: Image.asset('assets/icons/shop.jpg',)),
              ),
              Image.asset('assets/icons/gift.jpg',),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ReviewStar()));
                  },
                  child: Image.asset('assets/icons/star.jpg',)),
            ],
          ),
        ),
      ),
      endDrawer: DrawerSide(),
      body: SafeArea(
        child: Column(
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
                height: 6.h,
                width: 60.w,
                color: Color(0xffFDB640),
                child: Center(
                    child: Text(
                      'الاتصال بنا',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          letterSpacing: 3),
                    ))),
            Container(
                height: 8.h,
                width: 60.w,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'سنسعد بالتواصل معكم و التوصل باقتراحاتكم و انتقاذاتكم',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ))),

            Container(
              height: 40.h,
              width: 85.w,

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        hintText: 'الاسم',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      controller: _recipientController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: _bodyController,

                      maxLines: 4,

                      decoration: InputDecoration(
                        hintText: 'رسالتكم',
                        hintStyle: TextStyle(fontSize: 20),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
                        ),
                      ),
                    ),
                    // TextField(
                    //   controller: _bodyController,
                    //   maxLines: null,
                    //   expands: true,
                    //   textAlignVertical: TextAlignVertical.top,
                    //   decoration: InputDecoration(
                    //       labelText: 'Body', border: OutlineInputBorder()),
                    // ),
                    CheckboxListTile(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                      title: Text('HTML'),
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            isHTML = value;
                          });
                        }
                      },
                      value: isHTML,
                    ),
                  ],
                ),

              ),
            ),

            InkWell(
              onTap: send,
              child: Container(
                  height: 6.h,
                  width: 45.w,
                  color: Color(0xffFDB640),
                  child: Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          '>    إرسال   ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                              letterSpacing: 3),
                        ),
                      ))),
            ),
            SizedBox(height: 1.h,),

            Text(
              'أو تواصل معنا على',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/instagram.png',height: 30,),
                SizedBox(width: 5,),
                Image.asset('assets/icons/fb.png',height: 30,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
