import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

class OrderView extends StatefulWidget {
  final List? orders;
  const OrderView({Key? key, this.orders}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List fields = ['Name', 'Address', 'Town', 'Telephone', 'Email', 'Order notes(optional)'];
  var fieldControllers = [];

  @override
  void initState() {
    fieldControllers = List.generate(fields.length, (index) => TextEditingController());
    super.initState();
  }

  placeOrder() async {
    var encoded = json.encode(widget.orders);
    var body =
        '''{\r\n      "payment_method": "cod",\r\n      "payment_method_title": "",\r\n      "set_paid": true,\r\n      "billing": {\r\n        "first_name": "${fieldControllers[0].text}",\r\n        "last_name": "",\r\n        "address_1": "${fieldControllers[1].text}",\r\n        "address_2": "",\r\n        "city": "${fieldControllers[2].text}",\r\n        "state": "",\r\n        "postcode": "",\r\n        "country": "",\r\n        "email": "${fieldControllers[4].text}",\r\n        "phone": "${fieldControllers[3].text}"\r\n      },\r\n      "shipping": {\r\n        "first_name": "",\r\n        "last_name": "",\r\n        "address_1": "",\r\n        "address_2": "",\r\n        "city": "",\r\n        "state": "",\r\n        "postcode": "",\r\n        "country": ""\r\n      },\r\n      "line_items": $encoded,\r\n      "shipping_lines": [\r\n        {"method_id": "flat_rate", "method_title": "Flat Rate", "total": "50.000"}\r\n      ]\r\n    }''';

    var basrUrl = "https://nutriana.surnaturel.ma/";
    var client = http.Client();
    Map<String, String> header = {'Accept': '*/*', 'Content-Type': 'application/json; charset=UTF-8'};
    var response = await client.post(
        Uri.parse(basrUrl +
            "wp-json/wc/v2/orders/?consumer_key=ck_29ce6d9108bbfa3f38c7e58c17c040cdbbff1730&consumer_secret=cs_f7321e6cd6374655ef6a4040713b82c6c5b42bcc"),
        headers: header,
        body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('ORDER IS PLACED');
    } else {
      print('ORDER NOT PLACED');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Place your order"),
          actions: [
            TextButton(
                onPressed: () {
                  print("BUTTON PRESSED");
                  placeOrder();
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Column(
          children: fields
              .mapIndexed<Widget>((index, e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: e,
                        label: Text(e),
                      ),
                      controller: fieldControllers[index],
                    ),
                  ))
              .toList(),
        ));
  }
}
