import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attendance",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: ScreenUtil().setSp(20),
          right: ScreenUtil().setSp(20),
          top: ScreenUtil().setSp(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Utsav Shrestha",
              style: BlueinfoStyle.copyWith(
                fontSize: ScreenUtil().setSp(
                  25,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(10),
                  vertical: ScreenUtil().setSp(10)),
              color: Colors.blue,
              width: double.infinity,
              height: ScreenUtil().setSp(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0 Days",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                        ),
                      ),
                      Text(
                        "Present",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "0 Days",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                        ),
                      ),
                      Text(
                        "Present",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
