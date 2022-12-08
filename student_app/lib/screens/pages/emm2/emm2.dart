import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class EMM2 extends StatefulWidget {
  const EMM2({Key? key}) : super(key: key);

  @override
  _EMM2State createState() => _EMM2State();
}

class _EMM2State extends State<EMM2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMM",
          style: AppStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  size: ScreenUtil().setSp(
                    20,
                  ),
                ),
                labelText: "Search",
                labelStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
            OurSizedHeight(),
            Text(
              "Please pull down from top of the screen and release to get the latest update",
              style: BlueinfoStyle,
            ),
          ],
        ),
      ),
    );
  }
}
