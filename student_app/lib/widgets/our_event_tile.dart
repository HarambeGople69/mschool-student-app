import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/event_model.dart';
import 'package:myapp/screens/pages/events_program/our_event_detail_screen.dart';
import 'package:uuid/uuid.dart';
import '../utils/our_colors.dart';
import 'our_sized_box.dart';

class OurEventTile extends StatelessWidget {
  final EventModel eventModel;
  OurEventTile({Key? key, required this.eventModel}) : super(key: key);
  var uid = Uuid().v4();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              reverseTransitionDuration: Duration(seconds: 1),
              pageBuilder: ((context, animation, secondaryAnimation) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.0,
                    0.5,
                  ),
                );
                return FadeTransition(
                  opacity: curvedAnimation,
                  child: OurEventDetailScreen(
                    eventModel: eventModel,
                    time: "time",
                    title: "title",
                    desc: "desc",
                    uid: uid,
                  ),
                );
              }),
            )
            // MaterialPageRoute(
            // builder: (context) => ShoppingProductScreen(
            //   heroTag: key,
            //   productModel: widget.productModel,
            //   // image: widget.productModel.url,
            // ),
            // ),
            );
      },
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setSp(150),
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
                Hero(
                  tag: "Hero-title-${uid}",
                  child: Material(
                    child: Text(
                      eventModel.event_name,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(17.5),
                        fontWeight: FontWeight.w500,
                        color: darklogoColor,
                      ),
                    ),
                  ),
                ),
                OurSizedBox(),
                Container(
                  height: ScreenUtil().setSp(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "Hero-image-${uid}",
                        child: Material(
                          child: eventModel.photo_img == null
                              ? Image.asset(
                                  "assets/images/placeholder.png",
                                  height: ScreenUtil().setSp(100),
                                  width: ScreenUtil().setSp(100),
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.network(
                                  eventModel.photo_img,
                                  height: ScreenUtil().setSp(100),
                                  width: ScreenUtil().setSp(100),
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setSp(7.5),
                      ),
                      Expanded(
                        child: Container(
                          height: ScreenUtil().setSp(100),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "Hero-timer-${uid}",
                                child: Material(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        color: darklogoColor,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setSp(10),
                                      ),
                                      Text(
                                        eventModel.event_date,
                                        style: TextStyle(
                                          color: darklogoColor,
                                          fontSize: ScreenUtil().setSp(15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              OurSizedBox(),
                              Hero(
                                tag: "Hero-desc-${uid}",
                                child: Material(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          eventModel.description,
                                          // softWrap: true,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12.5),
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
