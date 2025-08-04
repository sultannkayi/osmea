import 'package:flutter/material.dart';

/// A utility function to build a customizable TextField widget.
Widget buildTextField({
  required String labelText,
  String? hintText,
  ValueChanged<String>? onChanged,
}) {
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: const OutlineInputBorder(), 
    ),
    onChanged: onChanged,
  );
}
