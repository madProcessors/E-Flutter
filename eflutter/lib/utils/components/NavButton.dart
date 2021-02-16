import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final bool selected;
  final Function onPressed;

  NavButton({this.title, this.onPressed, this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      shape: Border(
        bottom: selected ? BorderSide(color: Colors.white, width: 3) : BorderSide.none,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
