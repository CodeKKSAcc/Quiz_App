

import 'package:flutter/material.dart';

InputDecoration myDecor({required String hintText, required String labelText}){
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21),
      borderSide: BorderSide(width: 2.7, color: Colors.blue)
    )
  );
}