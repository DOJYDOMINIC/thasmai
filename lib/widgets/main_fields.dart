import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thasmai/constants/consts.dart';

const Color appcolor = Colors.black;

class TextFieldOne extends StatefulWidget {
  const TextFieldOne(
      {super.key, this.hinttext,
      required this.controller,
      required this.onchange,
      required this.obsecuretxt,
      this.preicon,
      this.keytype,
      this.fillcolor,
      this.sufix,
      this.validator, this.hintText, this.txtcolor,});

  final String? hinttext;
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged onchange;
  final bool obsecuretxt;
  final IconData? preicon;
  final IconButton? sufix;
  final TextInputType? keytype;
  final Color? fillcolor;
  final Color? txtcolor;
  final String? Function(String?)? validator;

  @override
  State<TextFieldOne> createState() => _TextFieldOneState();
}

class _TextFieldOneState extends State<TextFieldOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        keyboardType: widget.keytype,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:  GoogleFonts.poppins(color: Colors.grey.shade400),
          suffixIcon: widget.sufix,
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(
                width: 2,
                color: Colors.grey), // Border color when not in focus
          ),
          labelText: widget.hinttext,
          labelStyle: GoogleFonts.poppins(color: Colors.white),
          fillColor: widget.fillcolor ?? appcolor.withOpacity(.7),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                width: 2, color: Colors.grey), // Border color when focused
          ),
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        style:  TextStyle(
          color: widget.txtcolor ?? Colors.white,decoration: TextDecoration.none
        ),
        validator: widget.validator,
        //     (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'This field is required.';
        //   }
        //   return null;
        // },
        cursorColor: Colors.white,
        obscureText: widget.obsecuretxt,
        obscuringCharacter: '*',
        controller: widget.controller,
        onChanged: widget.onchange,
      ),
    );
  }
}
