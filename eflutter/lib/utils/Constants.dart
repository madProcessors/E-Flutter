import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KTextFieldDecoration extends InputDecoration {
  KTextFieldDecoration(this.hintText);

  @override
  final String hintText;

  @override
  get contentPadding => EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  @override
  get border => OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)));

  @override
  get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      );

  @override
  get focusedBorder => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2), borderRadius: BorderRadius.all(Radius.circular(32)));
}

class KSearchBarDecorator  extends InputDecoration {
  KSearchBarDecorator(this.hintText);

  @override
  final String hintText;

  @override
  get contentPadding => EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  @override
  get border => OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)));

  @override
  get enabledBorder => OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  @override
  get focusedBorder => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2), borderRadius: BorderRadius.all(Radius.circular(32)));
}
