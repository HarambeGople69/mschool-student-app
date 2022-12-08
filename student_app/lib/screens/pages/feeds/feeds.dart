import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/feeds_model.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_feed_tile.dart';
import '../../../api/api_service.dart';
import '../../../controller/network_connection.dart';
import '../../../widgets/our_textfield.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _comment_text_controller = TextEditingController();

  final oldPasswordNode = FocusNode();
  final newPasswordNode = FocusNode();
  final confirmPasswordNode = FocusNode();

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
        // padding: EdgeInsets.symmetric(
        //   horizontal: ScreenUtil().setSp(10),
        //   vertical: ScreenUtil().setSp(10),
        // ),
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
                        "Feed",
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
                      ? FutureBuilder<List<FeedModel>?>(
                          future: APIService().feedsDetails(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<FeedModel>?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      FeedModel feedModel =
                                          snapshot.data![index];
                                      return OurfeedTile(
                                        feedModel: feedModel,
                                        commentfunction: () {
                                          commentBottomSheet(context);
                                        },
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
                              Hive.box<FeedModel>("feeds_model").listenable(),
                          builder: (context, Box<FeedModel> boxs, child) {
                            var a = boxs.keys.toList();
                            return a.isNotEmpty
                                ? ListView.builder(
                                    itemCount: a.length,
                                    itemBuilder: (context, index) {
                                      return Text("data");
                                      // EventModel eventModel =
                                      //     boxs.get(a[index])!;
                                      // return OurEventTile(
                                      //     eventModel: eventModel);
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

  // OurfeedTile(
  //                       userName: "Utsav Shrestha",
  //                       caption: "School Trip",
  //                       commentfunction: () {
  //                         commentBottomSheet(context);
  //                       },
  //                       timeago: "a moment ago",
  //                     ),
  //                     OurfeedTile(
  //                       userName: "Utsav Shrestha",
  //                       caption: "Foodball competition",
  //                       commentfunction: () {
  //                         commentBottomSheet(context);
  //                       },
  //                       timeago: "1 min ago",
  //                     ),
  //                     OurfeedTile(
  //                       userName: "Utsav Shrestha",
  //                       caption: "School Trip",
  //                       commentfunction: () {
  //                         commentBottomSheet(context);
  //                       },
  //                       timeago: "2 min ago",
  //                     ),

  void commentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(10),
              vertical: ScreenUtil().setSp(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: darklogoColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(
                  color: darklogoColor,
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _comment_text_controller,
                        validator: (value) {},
                        title: "Add comment",
                        type: TextInputType.name,
                        number: 1,
                        length: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.send,
                        color: darklogoColor,
                        size: ScreenUtil().setSp(
                          27.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
