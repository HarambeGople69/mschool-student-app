import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myapp/api/api_service.dart';
import 'package:myapp/models/feeds_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/our_colors.dart';
import 'our_sized_box.dart';

class OurfeedTile extends StatefulWidget {
  final FeedModel feedModel;
  final Function commentfunction;
  const OurfeedTile({
    Key? key,
    required this.feedModel,
    required this.commentfunction,
  }) : super(key: key);

  @override
  State<OurfeedTile> createState() => _OurfeedTileState();
}

class _OurfeedTileState extends State<OurfeedTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print("Utsav Test");
        // APIService().likeCount(
        //   widget.feedModel.id,
        // );
        // print(widget.feedModel.id);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(10),
              vertical: ScreenUtil().setSp(10),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: darklogoColor,
                ),
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setSp(12.5),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.feedModel.feed_topic ?? "",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: darklogoColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Image.asset(
                  "assets/images/placeholder.png",
                  height: ScreenUtil().setSp(200),
                  width: double.infinity,
                ),
                OurSizedBox(),
                Text(
                  widget.feedModel.description.toString().trim(),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(17.5),
                    color: darklogoColor,
                  ),
                ),
                OurSizedBox(),
                Row(
                  children: [
                    Row(
                      children: [
                        FutureBuilder<String?>(
                          future: APIService().likeCount(widget.feedModel.id),
                          builder: (BuildContext context,
                              AsyncSnapshot<String?> snapshot) {
                            return Text(
                              snapshot.data ?? "0",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(17.5),
                              ),
                            );
                          },
                        ),
                        // Text(
                        //   1.toString(),
                        // style: TextStyle(
                        //   fontSize: ScreenUtil().setSp(17.5),
                        // ),
                        // ),
                        SizedBox(
                          width: ScreenUtil().setSp(5),
                        ),
                        InkWell(
                          onTap: () async {
                            print("Hello World");
                            await APIService().addLike(widget.feedModel.id);
                          },
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(15),
                    ),
                    InkWell(
                      onTap: () {
                        widget.commentfunction();
                      },
                      child: Row(
                        children: [
                          FutureBuilder<String?>(
                            future:
                                APIService().commentCount(widget.feedModel.id),
                            builder: (BuildContext context,
                                AsyncSnapshot<String?> snapshot) {
                              return Text(
                                snapshot.data ?? "0",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(17.5),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: ScreenUtil().setSp(5),
                          ),
                          Icon(
                            // Icons.list_alt_outlined,
                            MdiIcons.chatOutline,
                            color: darklogoColor,
                            size: ScreenUtil().setSp(22.5),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      timeago.format(
                        DateTime.parse(widget.feedModel.feed_date),
                      ),
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: darklogoColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          OurSizedBox(),
        ],
      ),
    );
  }
}
