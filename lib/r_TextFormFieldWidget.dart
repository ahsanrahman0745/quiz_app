import 'package:flutter/material.dart';

import 'colors.dart';
class TextFormFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String hintText;
  final Widget prefixIcon;
  final String defaultText;
  final FocusNode focusNode;
  final bool obscureText;
  final TextEditingController controller;
  final String parametersValidate;
  final Function onSubmitField;
  final Function onFieldTap;
   TextFormFieldWidget({Key? key,
     required this.textInputType,
     required this.hintText,
     required this.prefixIcon,
     required this.defaultText,
     required this.focusNode,
     required this.obscureText,
     required this.controller,
     required this.parametersValidate,
     required this.onSubmitField,
     required this.onFieldTap
   }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;
  @override
  Widget build(BuildContext context) {
    return     TextFormField(
      cursorHeight: 17,
      cursorWidth: 4.8,
      cursorColor: Colors.white30,
      cursorRadius: Radius.elliptical(60, 30),
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          wordSpacing: 0.5),
      controller: widget.controller,
      obscureText: false,
      keyboardType: TextInputType.name,
      decoration:  InputDecoration(
        prefixIcon: widget.prefixIcon,
          // color:Palette.yellow),
        labelText: " email",
        labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color.fromRGBO(244, 175, 27, 100), width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
