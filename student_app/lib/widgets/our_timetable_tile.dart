import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/our_colors.dart';
import 'our_sized_box.dart';

class OurTimetableTile extends StatefulWidget {
  final String subject;
  final String time;
  final String teacherName;
  final String period;
  const OurTimetableTile(
      {Key? key,
      required this.subject,
      required this.time,
      required this.teacherName,
      required this.period})
      : super(key: key);

  @override
  State<OurTimetableTile> createState() => _OurTimetableTileState();
}

class _OurTimetableTileState extends State<OurTimetableTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setSp(7.5),
      ),
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
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.subject,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(17.5),
              color: darklogoColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          OurSizedBox(),
          Text(
            widget.time,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              color: darklogoColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(
            color: darklogoColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.teacherName,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.period,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          OurSizedBox(),
        ],
      ),
    );
  }
}
