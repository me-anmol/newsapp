import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.onPressed,this.text});
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.0),
      child: Material(
        color:Colors.blue ,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text, style: TextStyle(color: Colors.white,fontSize: 20.0,),
          ),
        ),
      ),
    );
  }
}
