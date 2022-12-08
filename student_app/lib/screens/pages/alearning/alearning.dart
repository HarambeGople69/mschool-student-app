import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class alearning extends StatefulWidget {
  const alearning({Key? key}) : super(key: key);

  @override
  _alearningState createState() => _alearningState();
}

class _alearningState extends State<alearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "You are not allowed",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(
              40,
            ),
          ),
        ),
      ),
    );
  }
}
