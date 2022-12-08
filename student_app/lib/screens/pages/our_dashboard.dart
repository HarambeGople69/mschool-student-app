import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/api/api_service.dart';
import 'package:myapp/screens/pages/academic_performance/academic_performance.dart';
import 'package:myapp/screens/pages/alearning/alearning.dart';
import 'package:myapp/screens/pages/assignment/assignment.dart';
import 'package:myapp/screens/pages/feeds/feeds.dart';
import 'package:myapp/screens/pages/class_notes/class_notes.dart';
import 'package:myapp/screens/pages/fee/fee.dart';
import 'package:myapp/screens/pages/message_view/messages_view.dart';
import 'package:myapp/screens/pages/student_corner/student_corner.dart';
import 'package:myapp/utils/custom_clipper.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_drawer.dart';
import 'package:myapp/widgets/home_feature_buttons.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:page_transition/page_transition.dart';

import '../../controller/network_connection.dart';
import '../../models/organization_model.dart';
import '../../models/student_profile.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showIntroData();
    Get.find<CheckConnectivity>().initialize();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  showIntroData() async {
    int aa = Hive.box<int>("intro").get("done", defaultValue: 0)!;
    print("Inside show intro data");
    if (aa == 0) {
      await Future.delayed(Duration(seconds: 3)).then((value) {
        Intro.of(context).start();

        print("Hello Utsav");
      });
      Hive.box<int>("intro").put("done", 1);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        leading: IntroStepBuilder(
            order: 3,
            text: "Other feature",
            builder: (context, key) {
              return InkWell(
                key: key,
                onTap: () {
                  print("Utsav Shrestha");
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: ScreenUtil().setSp(25),
                ),
              );
            }),
        backgroundColor: Color.fromARGB(255, 72, 122, 220),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "m-School",
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(35),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffe6e6e6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ScreenUtil().setSp(425),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: ScreenUtil().setSp(250),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 72, 122, 220),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(ScreenUtil().setSp(105)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(15),
                        vertical: ScreenUtil().setSp(10),
                      ),
                      child: ValueListenableBuilder(
                        valueListenable:
                            Hive.box<StudentProfileModel>("student_profile")
                                .listenable(),
                        builder:
                            (context, Box<StudentProfileModel> boxs, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome ${boxs.get(0)!.first_name}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      color: Colors.white,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                  OurSizedBox(),
                                  Text(
                                    "Class ${boxs.get(0)!.aca_level} ${boxs.get(0)!.aca_section_name} | Roll no: ${boxs.get(0)!.roll_no}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(17.5),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  print(Get.find<CheckConnectivity>()
                                      .isOnline
                                      .value);
                                  // APIService().eventsDetails();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      "assets/images/profile_holder.png"),
                                  radius: ScreenUtil().setSp(25),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           "Hi Utsav",
                      //           style: TextStyle(
                      //             fontSize: ScreenUtil().setSp(20),
                      //             color: Colors.white,
                      //             letterSpacing: 1.1,
                      //           ),
                      //         ),
                      //         OurSizedBox(),
                      //         Text(
                      //           "Class XI-A | Roll no: 04",
                      //           style: TextStyle(
                      //             fontSize: ScreenUtil().setSp(17.5),
                      //             color: Colors.grey[300],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     CircleAvatar(
                      //       backgroundColor: Colors.white,
                      //       backgroundImage:
                      //           AssetImage("assets/images/profile_holder.png"),
                      //       radius: ScreenUtil().setSp(25),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  IntroStepBuilder(
                      order: 1,
                      text: 'Explore list of features',
                      builder: (context, key) => Positioned(
                            key: key,
                            top: ScreenUtil().setSp(75),
                            left: ScreenUtil().setSp(10),
                            right: ScreenUtil().setSp(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  ScreenUtil().setSp(
                                    ScreenUtil().setSp(
                                      10,
                                    ),
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(
                                ScreenUtil().setSp(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      FeatureButton(
                                        // images: 'icons/speaker.png',
                                        images: 'icons/feed.png',
                                        // icons/feed.png
                                        color: Color(0xffc2444f),
                                        function: () {
                                          // print("object");
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: FeedsPage(),
                                              type: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          );
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(
                                              0xfff0545f,
                                            ),
                                            Color(
                                              0xfff96679,
                                            ),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Feed",
                                      ),
                                      FeatureButton(
                                        images: 'icons/notes.png',
                                        color: Color(0xff55a862),
                                        function: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: ClassNotes(),
                                              type: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          );
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(0xff62ce78),
                                            Color(0xff97d96f),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Class\nNotes",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FeatureButton(
                                        images: 'icons/gallery.png',
                                        color: Color(0xff3091c8),
                                        function: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: OurMessageScreen(),
                                              type: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          );

                                          // OurMessageScreen
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(0xff41b2fe),
                                            Color(0xff22c0fd),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Messages",
                                      ),
                                      FeatureButton(
                                        images: 'icons/money.png',
                                        color: Color(0xffaa5abb),
                                        function: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: Fee(),
                                              type: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          );
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) {
                                          //   return Fee();
                                          // }));
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(0xffce72ee),
                                            Color(0xffee71d5),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Fees",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FeatureButton(
                                        images: 'icons/academic.png',
                                        color: Color(0xffc3830d),
                                        function: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return AcademicPerformance();
                                          }));
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(0xfff79e0d),
                                            Color(0xfffab414),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Academic\nPerformance",
                                      ),
                                      FeatureButton(
                                        images: 'icons/student.png',
                                        color: Color(0xff5868d3),
                                        function: () {
                                          print("object");
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) {
                                          //   return StudentCorner();
                                          // }));
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: StudentCorner(),
                                              type: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          );
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color(0xff717ffc),
                                            Color(0xff6095fd),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Student\nCorner",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FeatureButton(
                                        images: 'icons/live.png',
                                        color:
                                            Color.fromARGB(255, 85, 168, 168),
                                        function: () {},
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 98, 206, 190),
                                            Color.fromARGB(255, 111, 201, 217),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Live class",
                                      ),
                                      FeatureButton(
                                        color:
                                            Color.fromARGB(255, 185, 48, 200),
                                        function: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return alearning();
                                          }));
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 254, 65, 166),
                                            Color.fromARGB(255, 209, 34, 253),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "aLearning",
                                        images: 'icons/alearning.png',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FeatureButton(
                                        images: 'icons/achievement.png',
                                        color:
                                            Color.fromARGB(255, 194, 163, 68),
                                        function: () {
                                          // print("object");
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return FeedsPage();
                                          }));
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 240, 198, 84),
                                            Color.fromARGB(255, 249, 190, 102),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Performance\nIndicator",
                                      ),
                                      FeatureButton(
                                        images: 'icons/clinic.png',
                                        color:
                                            Color.fromARGB(255, 163, 168, 85),
                                        function: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ClassNotes();
                                          }));
                                        },
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 198, 190, 45),
                                            Color.fromARGB(255, 195, 186, 17),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        title: "Clinic",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            ),
            IntroStepBuilder(
              order: 2,
              text: "View your assignments here",
              builder: (context, key) => InkWell(
                key: key,
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: Assignment(),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Assignment();
                  // }));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                      vertical: ScreenUtil().setSp(10)),
                  height: ScreenUtil().setSp(
                    85,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setSp(30)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipPath(
                          clipper: ArcClipper(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setSp(20),
                              vertical: ScreenUtil().setSp(20),
                            ),
                            // width: double.infinity / 2,
                            decoration: BoxDecoration(
                                color: Color(0xffb356c8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setSp(5)),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Assignment",
                                  style: BoldinfoStyle,
                                ),
                                Text(
                                  "View and submit your homework",
                                  style: infoStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/2.png",
                        fit: BoxFit.cover,
                        width: ScreenUtil().setSp(
                          50,
                        ),
                        height: ScreenUtil().setSp(40),
                      ),
                      // Text("data"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setSp(5),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: ScreenUtil().setSp(5),
        ),
        height: ScreenUtil().setSp(25),
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<OrganizationModel>("organization_profile").listenable(),
          builder: (context, Box<OrganizationModel> boxs, child) {
            return InkWell(
              onTap: () async {
                organizationDetail(boxs.get(0), context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boxs.get(0)!.college_name,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      color: darklogoColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void organizationDetail(OrganizationModel? organizationModel, context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            color: logoColor.withOpacity(0.35),
            // height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(20),
              vertical: ScreenUtil().setSp(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        organizationModel!.college_name ?? "",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Affiliated to:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        organizationModel.affiliated_to ?? "",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Estd:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(
                                organizationModel.estd,
                              ) *
                              1000,
                        ).toString().split(" ")[0],
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Location:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${organizationModel.city} ${organizationModel.district} ${organizationModel.province}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${organizationModel.email}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Phone:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${organizationModel.phone2}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(17.5),
                          color: darklogoColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
