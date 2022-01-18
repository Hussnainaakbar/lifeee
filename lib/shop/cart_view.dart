import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:life_style_app/shop/order_view.dart';

class CartView extends StatelessWidget {
  final bool checking;
  final String? cartKey;
  CartView({Key? key, this.cartKey, required this.checking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List orders = [];
    var keys;
    Future getCartItems() async {
      final url =
          'http://nutriana.surnaturel.ma/wp-json/cocart/v1/get-cart?cart_key=$cartKey';
      final response = await http
          .get(Uri.parse(url), headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        keys = decoded.keys.toList();
        return decoded;
      } else {
        print("ERROR GETTING CART");
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
          ],
        ),
        backgroundColor: Color(0xffFDB640),
        title: Text("YOUR CART",
            style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          TextButton(
              onPressed: () {
                if (checking == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderView(orders: orders)));
                } else {
                  Fluttertoast.showToast(
                      msg: "server not responding try again and add items ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 4);
                }
              },
              child: Text(
                "Proceed",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: FutureBuilder(
        future: getCartItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = {
                  'product_id': snapshot.data[keys[index].toString()]
                          ['product_id']
                      .toString(),
                  'quantity': snapshot.data[keys[index].toString()]['quantity']
                      .toString()
                };
                orders.add(data);
                var title = snapshot.data[keys[index].toString()]
                        ['product_title']
                    .toString();
                var subtitle = snapshot.data[keys[index].toString()]
                        ['product_price']
                    .toString();
                var quantit = snapshot.data[keys[index].toString()]['quantity']
                    .toString();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.production_quantity_limits),
                    title: Text(title),
                    subtitle: Text("Price: " + subtitle,
                        style: TextStyle(fontWeight: FontWeight.w900)),
                    trailing: Text(
                      "Quantity: " + quantit,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
