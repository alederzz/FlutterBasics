import 'package:flutter/material.dart';

class InputStyle {

  static InputDecoration defaultStyle({
    required String hintText,
    String? helperText,
    IconData? icon,
  }) {
    return InputDecoration(
      fillColor: Colors.black.withOpacity(0.2),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      suffixIcon: const Icon(Icons.check_circle, color: Colors.green,),
      prefixIcon: (icon != null) ? Icon( icon, color: Colors.cyan, ) : null,
      hintText: hintText,
      helperText: helperText,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.amber
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular(20.0) ),
        borderSide: BorderSide(
          color: Colors.pinkAccent,
          width: 2
        )
      )
    );
  }
}