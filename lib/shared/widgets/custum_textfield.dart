import 'package:attendance_app/config/constants.dart';
import 'package:flutter/material.dart';

class CustumTextField extends StatelessWidget {
  CustumTextField({this.controller, this.hint, this.validator});
  final controller;
  final hint;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: kprimary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 18.0, color: kbold),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kblack, width: 1)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kblack, width: 1.2)),
      ),
    );
  }
}
