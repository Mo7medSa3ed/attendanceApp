import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/helper/general_helper.dart';
import 'package:attendance_app/modules/home/views/qr_code/controller/qrController.dart';
import 'package:attendance_app/shared/functions/functions.dart';
import 'package:attendance_app/shared/widgets/primary_button.dart';
import 'package:attendance_app/shared/widgets/primary_text%20_header.dart';
import 'package:attendance_app/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class QRCodeView extends StatefulWidget {
  QRCodeView(this.title);
  final title;

  @override
  _QRCodeViewState createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _controller = Get.put(QrController());
  late QRViewController controller;

  @override
  void reassemble() {
    controller.resumeCamera();
    super.reassemble();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      _controller.saveStudantData(scanData.code!.trim(), widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: kprimary,
        splashColor: kwhite,
        child: Icon(
          Icons.arrow_upward,
          size: 30,
          color: kblack,
        ),
        onPressed: () {
          showAsBottomSheet(context, widget.title);
        },
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kdefultpadding * 2, horizontal: kdefultpadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryHeaderText(
                    text: widget.title ?? '',
                  ),
                  SizedBox(
                    height: kdefultpadding,
                  ),
                  PrimaryText(
                    text: 'عدل وضعية الهاتف بحيث يكون Qr فى منتصف الصورة',
                    color: kbold,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            Expanded(
                child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            )),
          ],
        ),
      ),
    );
  }
}

void showAsBottomSheet(context, title) async {
  await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      backdropColor: kwhite,
      liftOnScrollHeaderElevation: 50,
      avoidStatusBar: false,
      scrollSpec: ScrollSpec.overscroll(),
      headerBuilder: (ctx, s) => Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kblack.withOpacity(0.5),
        ),
        width: 50,
        height: 10,
      ),
      elevation: 8,
      extendBody: true,
      cornerRadius: kdefultpadding * 2,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.95],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        final titleForDialog = title == 'الحضور' ? 'تحضير' : 'انصراف';
        return Container(
          height: getScreanHeight(context) * 0.95,
          padding: EdgeInsets.only(right: kdefultpadding, left: kdefultpadding),
          child: GetBuilder<QrController>(
            init: QrController(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.resultList.length + 1,
                      itemBuilder: (ctx, i) => i == 0
                          ? Container(
                              padding: EdgeInsets.all(kdefultpadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                    text: 'قائمة الطلاب',
                                    color: kblack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  if (controller.resultList.length == 0)
                                    SizedBox(
                                      height: getScreanHeight(context) / 1.2,
                                      child: Center(
                                        child: PrimaryText(
                                            fontWeight: FontWeight.w700,
                                            text: "لم يتم تسجيل اى طالب",
                                            color: kblack),
                                      ),
                                    )
                                ],
                              ),
                            )
                          : Card(
                              elevation: 2,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: kdefultpadding,
                                ),
                                title: PrimaryText(
                                  text: controller.resultList[i - 1]['email']
                                      .toString()
                                      .split('/')[1],
                                  color: kblack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                subtitle: PrimaryText(
                                  text: controller.resultList[i - 1]['email']
                                      .toString()
                                      .split('/')[0],
                                  color: kblack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: kgrey.withOpacity(0.3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kdefultpadding / 2,
                      vertical: kdefultpadding / 1.5),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        PrimaryButton(
                            text: titleForDialog,
                            radias: 100,
                            onTap: controller.resultList.length == 0
                                ? null
                                : () async {
                                    GeneralHelper.showConfirmDialog(context,
                                        title: "تأكيد $title",
                                        desc:
                                            "هل انت متأكد من تاكيد $titleForDialog الطلاب؟",
                                        onTap: () async {
                                      Get.back();
                                      await controller.savaAttendanceOrCheckout(
                                          isAttendance: title == 'الحضور');
                                    });
                                  }),
                        PrimaryButton(
                          text: 'بدء من جديد',
                          radias: 100,
                          onTap: controller.resultList.length == 0
                              ? null
                              : () async {
                                  // controller.saveStudantData(
                                  //     "student@gmail.com/محمد ايمن محمد",
                                  //     title);
                                  GeneralHelper.showConfirmDialog(context,
                                      title: "البدء من جديد",
                                      desc: "هل انت متأكد من البدء من جديد؟",
                                      onTap: () {
                                    Get.back();
                                    controller.resetResult();
                                  });
                                },
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  });
}
