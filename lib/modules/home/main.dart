import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/config/constants.dart';
import 'package:attendance_app/modules/home/controllers/main_home_controller.dart';

class MainHome extends StatelessWidget {

  final _controller = Get.put(MainHomeController());
  static final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
       bool isAdmin =_controller.email  =='a@gmail.com' || _controller.email  =='b@gmail.com' ;
      var viewList = [];
      var viewListTitles = [];
      if (isAdmin) {
        viewList = _controller.adminHomeViews;
        viewListTitles = _controller.adminHomeViewsTitles;
      } else {
        viewListTitles = _controller.homeViewsTitles;
        viewList = _controller.homeViews;
      }

      return Scaffold(
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: kwhite),
        //   backwardsCompatibility: false,
        //   backgroundColor: kwhite,
        //   elevation: 0,
        //   title: PrimaryText(
        //     text: _controller.homeViewsTitles[_controller.currantIndex.value],
        //     color: kblack,
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kbold,
          selectedItemColor: kprimary,
          unselectedItemColor: Colors.grey[300],
          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.currantIndex.value,
          onTap: (index) {
            _controller.currantIndex.value = index;
            pageController.jumpToPage(_controller.currantIndex.value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: viewListTitles[0]),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined),
                label: viewListTitles[1]),
          ],
        ),
        body: PageView.builder(
            onPageChanged: (index) => _controller.currantIndex.value = index,
            controller: pageController,
            itemCount: viewList.length,
            itemBuilder: (_, i) => viewList[i]),
      );
    });
  }
}
