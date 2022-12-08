import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/widgets/our_event_tile.dart';
import '../../../api/api_service.dart';
import '../../../controller/network_connection.dart';
import '../../../models/event_model.dart';
import '../../../utils/our_colors.dart';

class EventProgramScreen extends StatefulWidget {
  const EventProgramScreen({Key? key}) : super(key: key);

  @override
  State<EventProgramScreen> createState() => _EventProgramScreenState();
}

class _EventProgramScreenState extends State<EventProgramScreen> {
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
                      "Events & Programs",
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
                      ? FutureBuilder<List<EventModel>?>(
                          future: APIService().eventsDetails(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<EventModel>?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      EventModel eventModel =
                                          snapshot.data![index];
                                      return OurEventTile(
                                        eventModel: eventModel,
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
                              Hive.box<EventModel>("event_model").listenable(),
                          builder: (context, Box<EventModel> boxs, child) {
                            var a = boxs.keys.toList();
                            return a.isNotEmpty
                                ? ListView.builder(
                                    itemCount: a.length,
                                    itemBuilder: (context, index) {
                                      EventModel eventModel =
                                          boxs.get(a[index])!;
                                      return OurEventTile(
                                          eventModel: eventModel);
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
