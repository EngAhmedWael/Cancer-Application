
import 'package:cancer/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textform extends StatelessWidget {
 const  Textform(
      {super.key,  this.icon, required this.text, this.onchanged,this.controller ,this.icondata,this.keyboard,this.inputFormat,this.counter,required this.obsure,this.obtap});
  final String text;
  final IconData? icon;
  final IconButton? icondata;
  final TextInputType? keyboard;
 final List<TextInputFormatter>? inputFormat;
 final void Function(String)? onchanged;
 final String? counter;
final void Function()?obtap;
 final bool obsure;
 final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText:obsure ,
        onTap: obtap,
        controller:controller ,
        cursorColor: Kpimary,
        validator: (value) {
          if(value!.isEmpty){
            return 'Please write the data';
          }
        },
        onChanged:onchanged ,
        inputFormatters: inputFormat,
        keyboardType:keyboard ,
        decoration: InputDecoration(
          counterText:counter ,
            counterStyle: TextStyle(color: Kpimary,fontSize: 15),
            suffixIcon: icondata,

            prefixIcon: Icon(
              icon,
              color: Kpimary,
            ),
            hintText: text,
            hintStyle: TextStyle(color: Kpimary),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Kpimary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Kpimary)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Kpimary))),
      ),
    );
  }
}
