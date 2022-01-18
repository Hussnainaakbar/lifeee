import 'package:flutter/material.dart';
import 'package:life_style_app/screens/drawers/f_l_drawer.dart';
import 'package:life_style_app/screens/female/weight_loss/l_w_menu.dart';

import '../../../wp_api.dart';
import '../../drawers/m_g_drawer_side.dart';

class LossWeightGeneralAdvice extends StatefulWidget {
  const LossWeightGeneralAdvice({Key? key}) : super(key: key);

  @override
  _LossWeightGeneralAdviceState createState() => _LossWeightGeneralAdviceState();
}

class _LossWeightGeneralAdviceState extends State<LossWeightGeneralAdvice> {
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.2,
              child: FutureBuilder(
                  future: fetchWpPosts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map wppost = snapshot.data[index];
                          //var imageUrl = wppost["_embedded"]["wp:featuredmedia"][0]["source-url"];
                          return Column(
                            children: [

                              PostTile(
                                  href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                                  title:wppost["title"]["rendered"],
                                  desc: wppost["excerpt"]["rendered"],
                                  content:wppost["content"]["rendered"]

                              ),
                            ],
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PostTile extends StatefulWidget {
  String? title,desc,href,content;
  PostTile({this.title,this.desc,this.content,this.href});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {

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

            Text(widget.title!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget.desc!.replaceAll("&#8211;", "" ).replaceAll("nbsp", '').replaceAll("&;", "").replaceAll("<p>", "").replaceAll("<", "").replaceAll(">", "").replaceAll("p", "").replaceAll("/", "").replaceAll(":", ""),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.content!.replaceAll("8211", "").replaceAll("<br>", "").replaceAll("&#;", "").replaceAll("nbsp", '').replaceAll("&;", "").replaceAll("<p>", "").replaceAll("<", "").replaceAll(">", "").replaceAll("p", "").replaceAll("/", "")
                  .replaceAll("class", "").replaceAll("_", "").replaceAll("has-text-align-right", "").replaceAll("strong", "").replaceAll("=", "").replaceAll('"', "").replaceAll(":", "")
              ),
            ),
          ],
        ),
      ),
    );
  }

}
