import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/student_corner_controller.dart';
import 'package:myapp/screens/pages/student_corner/syllabus_tab.dart';
import 'package:myapp/utils/styles.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/custom_pdf_display.dart';
import '../../../widgets/our_elevated_button.dart';
import '../../../widgets/our_fee_download_tile.dart';
import '../../../widgets/our_fee_pay_tile.dart';
import '../../../widgets/our_sized_box.dart';
import '../../../widgets/our_student_corner.dart';

class StudentCorner extends StatefulWidget {
  const StudentCorner({Key? key}) : super(key: key);

  @override
  _StudentCornerState createState() => _StudentCornerState();
}

class _StudentCornerState extends State<StudentCorner> {
  List<Widget> display = [
    Syllabus(),
    Syllabus(),
    Syllabus(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => GestureDetector(
            onHorizontalDragEnd: (dragDetail) {
              if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
                if (Get.find<StudentCornerController>().index.value < 2) {
                  print(Get.find<StudentCornerController>().index.value);
                  print("Right swipe");
                  Get.find<StudentCornerController>().changeIndex(
                      Get.find<StudentCornerController>().index.value + 1);
                }
              } else {
                if (Get.find<StudentCornerController>().index.value > 0) {
                  print(Get.find<StudentCornerController>().index.value);
                  print("Left swipe");
                  Get.find<StudentCornerController>().changeIndex(
                      Get.find<StudentCornerController>().index.value - 1);
                }
              }
            },
            child: Scaffold(
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
                            Center(
                              child: Text(
                                "Student Corner",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(22.5),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setSp(7.5),
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
                                      Get.find<StudentCornerController>()
                                          .changeIndex(0);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Get.find<StudentCornerController>()
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
                                        "Syllabus",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color:
                                              Get.find<StudentCornerController>()
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
                                      Get.find<StudentCornerController>()
                                          .changeIndex(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Get.find<StudentCornerController>()
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
                                        "Past Question Paper",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color:
                                              Get.find<StudentCornerController>()
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
                                      Get.find<StudentCornerController>()
                                          .changeIndex(2);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Get.find<StudentCornerController>()
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
                                        "Questions",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(17.5),
                                          color:
                                              Get.find<StudentCornerController>()
                                                          .index
                                                          .value ==
                                                      2
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
                              OurStudentCorner(
                                subject: "English",
                                AddedOn: "02 Nov 2022",
                              ),
                              OurStudentCorner(
                                subject: "Science",
                                AddedOn: "03 Nov 2022",
                              ),
                              OurStudentCorner(
                                subject: "Mathematics",
                                AddedOn: "04 Nov 2022",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
