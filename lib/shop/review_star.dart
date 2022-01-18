import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:life_style_app/screens/drawers/m_g_drawer_side.dart';
import 'package:life_style_app/shop/shop_home.dart';

class ReviewStar extends StatefulWidget {
  const ReviewStar({Key? key}) : super(key: key);

  @override
  _ReviewStarState createState() => _ReviewStarState();
}

class _ReviewStarState extends State<ReviewStar> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      endDrawer: DrawerSide(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(
          color: Colors.black,
          // size: 33
        ),
        backgroundColor: Color(0xffFBFAF8),
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            // CircleAvatar(
            //     child: Image.asset('assets/icons/shopping-cart.png',height: 20,)),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/rating.jpg',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 60,
              width: 280,
              color: Color(0xffFDB640),
              child: Center(
                  child: Text(
                'تقييمك لتطبيقنا',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 34,
                    letterSpacing: 3),
              ))),
          SizedBox(
            height: 5,
          ),
          Container(
              height: 115,
              width: 200,
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'هل أنت راض عن تطبيق نوتریان lifestyle ؟',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ))),
          RatingBar.builder(
            initialRating: 0.5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color:Color(0xffFDB640),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 30,),
          Container(
              height: 50,
              width: 220,
              color: Color(0xffFDB640),
              child: Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      ' > إرسال اقتراح',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          letterSpacing: 3),
                    ),
                  ))),
        ],
      ),
    );
  }
}
