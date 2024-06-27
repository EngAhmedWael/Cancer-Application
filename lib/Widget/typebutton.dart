
import 'package:cancer/constant.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({super.key, required this.onpressed, required this.text, required this.width});
  final String text;
  final void Function()? onpressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: Kpimary,
          border: Border.all(
            color: Kpimary,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

