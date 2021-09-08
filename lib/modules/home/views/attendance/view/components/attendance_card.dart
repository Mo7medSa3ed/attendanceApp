
import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  AttendanceCard(
      {this.start = '8:30', this.date = '2021-10-03', this.end = '8:30'});
  final date;
  final start;
  final end;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: kdefultpadding / 2),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(kdefultpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PrimaryText(
                text: date,
                align: TextAlign.right,
                color: kblack,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: PrimaryText(
                align: TextAlign.center,
                text: 'الحضور' + '\t\t' + start,
                color: kblack,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: PrimaryText(
                align: TextAlign.left,
                text: 'الانصراف' + '\t\t' + end,
                fontSize: 14,
                color: kblack,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
