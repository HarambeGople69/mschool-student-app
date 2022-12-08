import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/event_model.dart';
import 'package:myapp/widgets/our_sized_box.dart';

import '../../../utils/our_colors.dart';

class OurEventDetailScreen extends StatefulWidget {
  final EventModel eventModel;
  final String title;
  final String time;
  final String desc;
  final String uid;
  const OurEventDetailScreen(
      {Key? key,
      required this.title,
      required this.time,
      required this.desc,
      required this.uid,
      required this.eventModel})
      : super(key: key);

  @override
  State<OurEventDetailScreen> createState() => _OurEventDetailScreenState();
}

class _OurEventDetailScreenState extends State<OurEventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(10),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "Hero-image-${widget.uid}",
                    child: Material(
                      child: Image.asset(
                        "assets/images/placeholder.png",
                        height: ScreenUtil().setSp(200),
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: darklogoColor,
                      size: ScreenUtil().setSp(25),
                    ),
                  ),
                ],
              ),
              OurSizedBox(),
              Hero(
                tag: "Hero-title-${widget.uid}",
                child: Material(
                  child: Text(
                    widget.eventModel.event_name,
                    style: TextStyle(
                      color: darklogoColor,
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              OurSizedBox(),
              Hero(
                tag: "Hero-timer-${widget.uid}",
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
                        widget.eventModel.event_date,
                        style: TextStyle(
                          color: darklogoColor,
                          fontSize: ScreenUtil().setSp(17),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              OurSizedBox(),
              Row(
                children: [
                  Text(
                    "Organized By: ${widget.eventModel.event_by}",
                    style: TextStyle(
                      color: darklogoColor,
                      fontSize: ScreenUtil().setSp(17),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              OurSizedBox(),
              Row(
                children: [
                  Text(
                    "Entry Fee: Rs.${double.parse(widget.eventModel.event_fee).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: darklogoColor,
                      fontSize: ScreenUtil().setSp(17),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              OurSizedBox(),
              Divider(
                color: darklogoColor,
              ),
              Hero(
                tag: "Hero-desc-${widget.uid}",
                child: Material(
                  child: Text(
                    widget.eventModel.description,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
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
