import 'package:flutter/material.dart';

const KTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20),
  hintText: "",
  hintStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  fillColor: Colors.white70,
  filled: true,
  border: OutlineInputBorder(
    // borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);
