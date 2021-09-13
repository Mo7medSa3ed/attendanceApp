import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/helper/general_helper.dart';
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
  late Barcode result;
  late QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    controller.resumeCamera();
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
      setState(() {
        result = scanData;
      });
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
          showAsBottomSheet(context);
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

void showAsBottomSheet(context) async {
  await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      backdropColor: kwhite,
      liftOnScrollHeaderElevation: 50,
      avoidStatusBar: false,
      scrollSpec: ScrollSpec.overscroll(),
      headerBuilder: (ctx, s) => Container(
        margin: const EdgeInsets.all(8),
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
        snappings: [0.96],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
          height: getScreanHeight(context),
          padding: EdgeInsets.only(
              bottom: kdefultpadding * 2,
              right: kdefultpadding,
              left: kdefultpadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (ctx, i) => i == 0
                        ? Container(
                            padding: EdgeInsets.all(kdefultpadding),
                            child: PrimaryText(
                              text: 'قائمة الطلاب',
                              color: kblack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        : Card(
                            elevation: 2,
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: kdefultpadding,
                              ),
                              title: PrimaryText(
                                text: 'محمد سعيد عليوة',
                                color: kblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              subtitle: PrimaryText(
                                text: 'mohamed@gmail.com',
                                color: kblack,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          )),
              ),
              Container(
                  height: 1,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: kdefultpadding, vertical: kdefultpadding),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        spreadRadius: 2)
                  ])),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kdefultpadding / 2,
                    vertical: kdefultpadding / 1.5),
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: [
                      PrimaryButton(
                          text: 'تحضير',
                          radias: 100,
                          onTap: () async {
                            GeneralHelper.showConfirmDialog(context,
                                title: "تأكيد الحضور",
                                desc: "هل انت متأكد من تاكيد حضور الطلاب؟",
                                onTap: () => Get.back());
                          }),
                      PrimaryButton(
                          text: 'بدء من جديد',
                          radias: 100,
                          onTap: () async {
                            GeneralHelper.showConfirmDialog(context,
                                title: "تأكيد البدء من جديد",
                                desc: "هل انت متأكد من البدء من جديد؟",
                                onTap: () => Get.back());
                          }),
                    ]),
              )
            ],
          ),
        );
      },
    );
  });
}
