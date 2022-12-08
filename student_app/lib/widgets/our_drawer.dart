import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/screens/pages/change_password/our_change_password.dart';
import 'package:myapp/screens/pages/event_calender/event_calender.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/custom_drawer_listTile.dart';
import 'package:page_transition/page_transition.dart';
import '../models/organization_model.dart';
import '../models/student_profile.dart';
import '../screens/pages/events_program/our_events_program_screen.dart';
import '../screens/pages/leave_application/our_leave_application.dart';
import '../screens/pages/my_subject/my_subject_screen.dart';
import '../screens/pages/timetable/our_time_table.dart';
import 'our_sized_box.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(10),
                  vertical: ScreenUtil().setSp(10),
                ),
                child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<StudentProfileModel>("student_profile")
                          .listenable(),
                  builder: (context, Box<StudentProfileModel> boxs, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/profile_holder.png"),
                          radius: ScreenUtil().setSp(25),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome ${boxs.get(0)!.first_name}",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: darklogoColor,
                                letterSpacing: 1.1,
                              ),
                            ),
                            OurSizedBox(),
                            Text(
                              "Class ${boxs.get(0)!.aca_level} ${boxs.get(0)!.aca_section_name} | Roll no: ${boxs.get(0)!.roll_no}",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(17.5),
                                color: darklogoColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(
                color: darklogoColor,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      CustomDrawerTile(
                        color: Color(0xffc3830d),
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageTransition(
                              child: EventProgramScreen(),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                        title: "Events and Programs",
                        drawericon: 'icons/speaker.png',
                      ),
                      CustomDrawerTile(
                        color: Color.fromARGB(255, 195, 13, 174),
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            PageTransition(
                              child: MySubjectScreen(),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                        title: "My Subjects",
                        drawericon: 'icons/book.png',
                      ),
                      CustomDrawerTile(
                        color: Color.fromARGB(255, 163, 168, 85),
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OurTimeTable();
                          }));
                        },
                        title: "Timetable",
                        drawericon: "icons/clock.png",
                      ),
                      CustomDrawerTile(
                        color: Color(0xff5868d3),
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OurLeaveApplication();
                              },
                            ),
                          );
                        },
                        title: "Leave Application",
                        drawericon: "icons/ceo.png",
                      ),
                      CustomDrawerTile(
                        color: Color(0xff55a862),
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EventCalender();
                          }));
                        },
                        title: "Academic Calendar",
                        drawericon: "icons/calendar.png",
                      ),
                      CustomDrawerTile(
                        color: Color.fromARGB(255, 85, 168, 168),
                        function: () {
                          // Navigator.pop(context);

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Notifications();
                          // }));
                        },
                        title: "Notification",
                        drawericon: "icons/bell.png",
                      ),
                      CustomDrawerTile(
                        color: Color(0xffaa5abb),
                        function: () {
                          Navigator.pop(context);

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChangePassword();
                          }));
                        },
                        title: "Change Password",
                        drawericon: "icons/password.png",
                      ),
                      CustomDrawerTile(
                        color: Color(0xffc2444f),
                        function: () async {
                          await Hive.box<int>("auth").put("state", 1);
                          await Hive.box<StudentProfileModel>("student_profile")
                              .clear();
                          await Hive.box<OrganizationModel>(
                                  "organization_profile")
                              .clear();
                          // AppSharedPreference().logout();
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()));
                        },
                        title: "Logout",
                        drawericon: "icons/logout.png",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
