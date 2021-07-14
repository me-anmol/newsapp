import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  SignInButton({this.onPressed, this.address});
  final Function onPressed;
  final String address;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      child: CircleAvatar(radius: 50.0, backgroundImage: AssetImage(address)),
    );
  }
}