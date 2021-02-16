import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;
  final double width;

  const RoundedButton({this.color, this.title, @required this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          minWidth: width,
          onPressed: onPressed,
          height: 40,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
