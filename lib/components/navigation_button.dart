import 'package:flutter/material.dart';
class NavigationButton extends StatelessWidget {
  NavigationButton(
      {this.icon,
        this.onPressed,
        this.iconColor,
        this.textColor,
        this.buttonColor,
        this.buttonText});
  final IconData icon;
  final Function onPressed;
  final Color iconColor;
  final Color textColor;
  final Color buttonColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 25.0, left: 25.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40.0,
              color: iconColor,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              buttonText,
              style: TextStyle(fontSize: 30.0, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}