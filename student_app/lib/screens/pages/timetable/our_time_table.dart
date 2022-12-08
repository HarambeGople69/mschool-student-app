import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/timetable_controller.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_timetable_tile.dart';

import '../../../widgets/our_event_tile.dart';

class OurTimeTable extends StatefulWidget {
  const OurTimeTable({Key? key}) : super(key: key);

  @override
  State<OurTimeTable> createState() => _OurTimeTableState();
}

class _OurTimeTableState extends State<OurTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff7294CF),
              Color(0xff2855AE),
            ],
          ),
        ),
        child: Obx(
          (() => GestureDetector(
                onHorizontalDragEnd: (dragDetail) {
                  if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
                    if (Get.find<TimeTableController>().index.value < 5) {
                      print(Get.find<TimeTableController>().index.value);
                      print("Right swipe");
                      Get.find<TimeTableController>().changeIndex(
                          Get.find<TimeTableController>().index.value + 1);
                    }
                  } else {
                    if (Get.find<TimeTableController>().index.value > 0) {
                      print(Get.find<TimeTableController>().index.value);
                      print("Left swipe");
                      Get.find<TimeTableController>().changeIndex(
                          Get.find<TimeTableController>().index.value - 1);
                    }
                  }
                },
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.125,
                        child: Row(
                          children: [
                            SizedBox(
                              width: ScreenUtil().setSp(15),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: ScreenUtil().setSp(30),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setSp(20),
                            ),
                            Text(
                              "TimeTable",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(22.5),
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setSp(12.5),
                          vertical: ScreenUtil().setSp(15),
                        ),
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).viewPadding.top -
                            MediaQuery.of(context).size.height * 0.125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              ScreenUtil().setSp(50),
                            ),
                            topRight: Radius.circular(
                              ScreenUtil().setSp(50),
                            ),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(0);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                0
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Sun",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  0
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                1
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Mon",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  1
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(2);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                2
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Tue",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  2
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(3);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                3
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Wed",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  3
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(4);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                4
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Thu",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  4
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<TimeTableController>()
                                          .changeIndex(5);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Get.find<TimeTableController>()
                                                    .index
                                                    .value ==
                                                5
                                            ? darklogoColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                          ScreenUtil().setSp(15),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setSp(10),
                                        vertical: ScreenUtil().setSp(10),
                                      ),
                                      child: Text(
                                        "Fri",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color: Get.find<TimeTableController>()
                                                      .index
                                                      .value ==
                                                  5
                                              ? Colors.white
                                              : darklogoColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: darklogoColor,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    OurTimetableTile(
                                      subject: "Computer",
                                      time: "04:00am - 05:00am",
                                      teacherName: "Utsav Shrestha",
                                      period: "Period 1",
                                    ),
                                    OurTimetableTile(
                                      subject: "Science",
                                      time: "04:00am - 05:00am",
                                      teacherName: "Utsav Shrestha",
                                      period: "Period 2",
                                    ),
                                    OurTimetableTile(
                                      subject: "Math",
                                      time: "04:00am - 05:00am",
                                      teacherName: "Utsav Shrestha",
                                      period: "Period 3",
                                    ),
                                    OurTimetableTile(
                                      subject: "English",
                                      time: "04:00am - 05:00am",
                                      teacherName: "Utsav Shrestha",
                                      period: "Period 4",
                                    ),
                                    OurTimetableTile(
                                      subject: "Social",
                                      time: "04:00am - 05:00am",
                                      teacherName: "Utsav Shrestha",
                                      period: "Period 5",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
