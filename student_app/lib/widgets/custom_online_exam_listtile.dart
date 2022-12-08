import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class OnlineExamtile extends StatelessWidget {
  final String number;
  final String title;
  final Color backgroundColor;
  final Color bottomColor;
  const OnlineExamtile({
    Key? key,
    required this.number,
    required this.title,
    required this.backgroundColor,
    required this.bottomColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(160),
      // width: double.infinity,

      color: backgroundColor,
      child: Column(
        children: [
          OurSizedHeight(),
          Text(
            number,
            style: feeStyle.copyWith(
              color: Colors.white,
            ),
          ),
          OurSizedHeight(),
          Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.white,
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setSp(40),
            // width: double.infinity,
            width: ScreenUtil().setSp(170),
            color: bottomColor,
            child: Text(
              "More info",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
