import 'package:flutter/material.dart';

const kTitleBlack =
    TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold);

InputDecoration kInputDecorationSearchParticipant = InputDecoration(
  contentPadding: EdgeInsets.all(0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      width: 1,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  ),
  labelStyle: TextStyle(color: Colors.blue),
  errorStyle: TextStyle(
    fontSize: 16.0,
    color: Colors.blue,
  ),
);
