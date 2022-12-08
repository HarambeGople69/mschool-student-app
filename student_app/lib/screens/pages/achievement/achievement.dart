import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Achievements",
          style: AppStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: ScreenUtil().setSp(150),
                width: ScreenUtil().setSp(150),
              ),
              OurSizedHeight(),
              Text(
                "No Achievements added Yet",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
