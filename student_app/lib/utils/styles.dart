import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final AppStyle = TextStyle(
  fontSize: ScreenUtil().setSp(25),
  fontWeight: FontWeight.w600,
);

final infoStyle = TextStyle(
  color: Colors.white,
  fontSize: ScreenUtil().setSp(15),
  fontWeight: FontWeight.w500,
);
final BoldinfoStyle = TextStyle(
  color: Colors.white,
  fontSize: ScreenUtil().setSp(20),
  fontWeight: FontWeight.w800,
);

final BlueinfoStyle = TextStyle(
  color: Colors.blue[600],
  fontSize: ScreenUtil().setSp(15),
  fontWeight: FontWeight.w400,
);

final feeStyle = TextStyle(
  color: Colors.blue[600],
  fontSize: ScreenUtil().setSp(35),
  fontWeight: FontWeight.w600,
);

final assignmentStyle = TextStyle(
  color: Colors.black54,
  fontSize: ScreenUtil().setSp(
    15,
  ),
);

final EvaluationStyle = TextStyle(
  fontSize: ScreenUtil().setSp(
    20,
  ),
  fontWeight: FontWeight.w300,
  color: Colors.blueGrey,
);
final PublishedStyle = TextStyle(
  color: Color(0xff4fe452),
  fontSize: ScreenUtil().setSp(
    15,
  ),
);
final DeniedStyle = TextStyle(
  color: Colors.red,
  fontSize: ScreenUtil().setSp(
    15,
  ),
);
