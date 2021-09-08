import 'package:flutter/cupertino.dart';
import 'package:attendance_app/config/constants.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText(
      {this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.color = kwhite,
      this.text = '',
      this.align = TextAlign.start,
      this.letterSpacing = 1.0});
  final text;
  final fontSize;
  final fontWeight;
  final color;
  final align;
  final letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textScaleFactor: letterSpacing.toDouble(),
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: fontSize.toDouble(),
          fontWeight: fontWeight,
          letterSpacing: letterSpacing.toDouble()),
    );
  }
}
