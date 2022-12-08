import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/api/api_service.dart';
import 'package:myapp/utils/our_colors.dart';

import '../../../controller/network_connection.dart';
import '../../../models/subject_model.dart';

class MySubjectScreen extends StatefulWidget {
  const MySubjectScreen({Key? key}) : super(key: key);

  @override
  State<MySubjectScreen> createState() => _MySubjectScreenState();
}

class _MySubjectScreenState extends State<MySubjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<CheckConnectivity>().initialize();
  }

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
                      "My Subjects",
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
                child: GetBuilder<CheckConnectivity>(builder: (controller) {
                  return Get.find<CheckConnectivity>().isOnline.value == true
                      ? FutureBuilder<List<SubjectModel>?>(
                          future: APIService().subjectDetails(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<SubjectModel>?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      SubjectModel subjectModel =
                                          snapshot.data![index];
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setSp(5),
                                          vertical: ScreenUtil().setSp(5),
                                        ),
                                        height: ScreenUtil().setSp(50),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setSp(5),
                                          vertical: ScreenUtil().setSp(5),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: darklogoColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              ScreenUtil().setSp(12.5),
                                            )),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                subjectModel.subject_name,
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(18.5),
                                                  color: darklogoColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                subjectModel.subject_type,
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(15),
                                                  color: darklogoColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                Column(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        "assets/images/logo.jpg",
                                        height: ScreenUtil().setSp(250),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Text(
                                      "No data available",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: ScreenUtil().setSp(25),
                                          color: darklogoColor),
                                    )
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "assets/images/logo.jpg",
                                      height: ScreenUtil().setSp(250),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(
                                    "No data available",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(25),
                                        color: darklogoColor),
                                  )
                                ],
                              );
                            } else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: darklogoColor,
                                  ),
                                ],
                              );
                            }
                          },
                        )
                      : ValueListenableBuilder(
                          valueListenable:
                              Hive.box<SubjectModel>("subject_model")
                                  .listenable(),
                          builder: (context, Box<SubjectModel> boxs, child) {
                            var a = boxs.keys.toList();
                            return a.isNotEmpty
                                ? ListView.builder(
                                    itemCount: a.length,
                                    itemBuilder: (context, index) {
                                      SubjectModel subjectModel =
                                          boxs.get(a[index])!;
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setSp(5),
                                          vertical: ScreenUtil().setSp(5),
                                        ),
                                        height: ScreenUtil().setSp(50),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setSp(5),
                                          vertical: ScreenUtil().setSp(5),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: darklogoColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              ScreenUtil().setSp(12.5),
                                            )),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                subjectModel.subject_name,
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(18.5),
                                                  color: darklogoColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                subjectModel.subject_type,
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(15),
                                                  color: darklogoColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Column(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          "assets/images/logo.jpg",
                                          height: ScreenUtil().setSp(250),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      Text(
                                        "No data available",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: ScreenUtil().setSp(25),
                                            color: darklogoColor),
                                      )
                                    ],
                                  );
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
