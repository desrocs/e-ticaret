import 'package:flutter/material.dart';

Widget label(String text) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: Colors.white10),
    child: Text(
      text,
      style: TextStyle(color: Colors.lightBlue, fontSize: 12),
    ),
  );
}