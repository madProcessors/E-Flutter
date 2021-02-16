import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function onXPressed;
  final TextEditingController controller;

  SearchBar({this.hintText, this.onXPressed, this.controller});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      constraints: BoxConstraints(maxHeight: 40, maxWidth: MediaQuery.of(context).size.width * 0.6),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 14),
        cursorColor: Colors.white70,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white70,
              size: 14,
            ),
            onPressed: widget.onXPressed,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffffa255),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        controller: widget.controller,
      ),
    );
  }
}
