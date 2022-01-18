import 'package:flutter/material.dart';

import '../../wp_api.dart';

class MyCart extends StatefulWidget {
  int? id;
  MyCart({this.id});

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [


          ],
        ),
      ),
    );
  }
}

class Post extends StatefulWidget {
  String? title,desc,href,content;
  Post({this.title,this.desc,this.content,this.href});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: fetchWpPostImageUrl(widget.href),
                builder: (BuildContext context, AsyncSnapshot ssnapshot){
                  if(ssnapshot.hasData){
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(ssnapshot.data["guid"]["rendered"]));

                  }
                  return CircularProgressIndicator();
                }
            ),
            SizedBox(height: 10,),

            // Text(widget.title!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
            SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Text(widget.desc!.replaceAll("&#8211;", "" ).replaceAll("nbsp", '').replaceAll("&;", "").replaceAll("<p>", "").replaceAll("<", "").replaceAll(">", "").replaceAll("p", "").replaceAll("/", "").replaceAll(":", ""),
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(widget.content!.replaceAll("8211", "").replaceAll("<br>", "").replaceAll("&#;", "").replaceAll("nbsp", '').replaceAll("&;", "").replaceAll("<p>", "").replaceAll("<", "").replaceAll(">", "").replaceAll("p", "").replaceAll("/", "")
            //       .replaceAll("class", "").replaceAll("_", "").replaceAll("has-text-align-right", "").replaceAll("strong", "").replaceAll("=", "").replaceAll('"', "").replaceAll(":", "")
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

}
