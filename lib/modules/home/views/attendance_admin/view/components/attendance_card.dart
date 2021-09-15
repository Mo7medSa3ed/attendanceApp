import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class AttendanceAdminCard extends StatelessWidget {
  AttendanceAdminCard(
      {this.start = '8:30',
      this.name = 'محمد سعيد عليوة',
      this.email = 'mohamed@gmail.com',
      this.end = '8:30'});
  final email;
  final name;
  final start;
  final end;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: kdefultpadding / 2),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(kdefultpadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryText(
                    text: name ?? '',
                    align: TextAlign.right,
                    color: kblack,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: PrimaryText(
                    align: TextAlign.start,
                    text: 'الحضور' +
                        '\t\t' +
                        (start.toString().isNotEmpty
                            ? TimeOfDay(
                                    hour: int.parse(
                                        start.toString().substring(0, 2)),
                                    minute: int.parse(
                                        start.toString().substring(3, 5)))
                                .format(context)
                            : ''),
                    color: kblack,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: PrimaryText(
                    text: email ?? "",
                    align: TextAlign.right,
                    color: kblack,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: PrimaryText(
                    align: TextAlign.start,
                    text: 'الانصراف' +
                        '\t\t' +
                        (end.toString().isNotEmpty
                            ? TimeOfDay(
                                    hour: int.parse(
                                        end.toString().substring(0, 2)),
                                    minute: int.parse(
                                        end.toString().substring(3, 5)))
                                .format(context)
                            : ''),
                    color: kblack,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
