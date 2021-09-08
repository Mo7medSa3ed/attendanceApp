import 'package:flutter/material.dart';
import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({this.onTap, this.text, this.radias = 4});
  final text;
  final radias;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kprimary),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radias.toDouble()))),
            padding:
                MaterialStateProperty.all(EdgeInsets.all(kdefultpadding / 2))),
        onPressed: onTap,
        child: PrimaryText(
          text: text.trim(),
          color: kblack,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ));
  }
}
