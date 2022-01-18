import 'package:flutter/material.dart';

class WeigthBox extends StatelessWidget {
  final Color color;
  final String boxText;
  const WeigthBox({Key? key, required this.color, required this.boxText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 67,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(boxText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 21,
              color: Colors.black,
            )),
      ),
    );
  }
}