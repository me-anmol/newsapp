import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  MyInputField({this.hintText,this.onChange,this.type,this.hideText =false});
  final String hintText;
  final Function onChange;
  final TextInputType type;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0),
      child: TextField(
        obscureText: hideText,
        keyboardType : type,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          fillColor: Color(0xFFB2A28F),
          filled: true,
        ),

      ),
    );
  }
}
