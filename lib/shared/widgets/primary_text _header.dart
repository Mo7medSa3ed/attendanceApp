import 'package:attendance_app/config/constants.dart';
import 'package:flutter/cupertino.dart';

class PrimaryHeaderText extends StatelessWidget {
  PrimaryHeaderText({
    this.fontSize = 36.0,
    this.color = kwhite,
    this.text = '',
    this.align = TextAlign.start,
  });
  final text;
  final fontSize;
  final color;
  final align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(1, 1),
            child: Container(
              width: text == 'بياناتك'
                  ? 120
                  : text == 'الدفتر'
                      ? 110
                      : 145,
              height: 25,
              color: kprimary.withOpacity(0.8),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
