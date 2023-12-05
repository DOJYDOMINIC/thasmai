import 'package:flutter/material.dart';
import '../constants/consts.dart';

class TextFiller extends StatelessWidget {
  const TextFiller(
      {super.key,
      required this.controller,
      required this.hinttxt,
      this.validator,
      required this.onchanged});
  final TextEditingController controller;
  final String hinttxt;
  final String? Function(String?)? validator;
  final void Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 20,
      controller: controller,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hinttxt,
        hintStyle: TextStyle(color: Colors.black),
        labelStyle: TextStyle(color: ambercolor, fontWeight: FontWeight.w200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black, // Change the color as needed
          ),
        ),
      ),
      style: TextStyle(
          decoration: TextDecoration.none), // Add this line to remove underline
      validator: validator,
      //     (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
    );
  }
}
