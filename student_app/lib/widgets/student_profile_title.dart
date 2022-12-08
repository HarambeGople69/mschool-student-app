import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileTitle extends StatelessWidget {
  final String title;
  const StudentProfileTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(
          ScreenUtil().setSp(10),
        ),
      ),
      width: double.infinity,
      height: ScreenUtil().setSp(
        40,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
