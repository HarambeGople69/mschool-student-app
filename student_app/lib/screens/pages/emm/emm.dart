import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class EMM extends StatefulWidget {
  const EMM({Key? key}) : super(key: key);

  @override
  _EMMState createState() => _EMMState();
}

class _EMMState extends State<EMM> {
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
        // margin:EdgeInsi
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
