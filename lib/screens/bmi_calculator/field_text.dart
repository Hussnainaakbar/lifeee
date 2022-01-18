import 'package:flutter/material.dart';

class kmyText extends StatelessWidget {
  String hintText;
  IconData icon;
  final TextEditingController mycontroller;
  final void Function(String) onchanged;
  kmyText(
      {Key? key,
        required this.onchanged,
        required this.hintText,
        required this.icon,
        required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          keyboardType: TextInputType.number,
          controller: mycontroller,
          // autofocus: true,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
              size: 35,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF6A419), width: 3.0),
            ),
            // border: OutlineInputBorder(
            //     borderSide: BorderSide(color: Color(0xfffbbe28), width: 5.0)
            //     )
          ),
          onChanged: onchanged,
        ),
      ),
    );
  }
}