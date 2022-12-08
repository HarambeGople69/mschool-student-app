import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class AcademicPerformance extends StatefulWidget {
  const AcademicPerformance({Key? key}) : super(key: key);

  @override
  _AcademicPerformanceState createState() => _AcademicPerformanceState();
}

class _AcademicPerformanceState extends State<AcademicPerformance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Academic performance",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(15),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setSp(15),
                    vertical: ScreenUtil().setSp(10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(20),
                    ),
                    color: Colors.blueGrey[300],
                  ),
                  child: Text(
                    "2019-20",
                    style: BoldinfoStyle,
                  ),
                ),
              ),
              OurSizedHeight(),
              Text(
                "Evaluation 1",
                style: EvaluationStyle,
              ),
              OurSizedHeight(),
              Text(
                "Published",
                style: PublishedStyle,
              ),
              OurSizedHeight(),
              Text(
                "Evaluation 2",
                style: EvaluationStyle,
              ),
              OurSizedHeight(),
              Text(
                "Published",
                style: PublishedStyle,
              ),
              OurSizedHeight(),
              Text(
                "Evaluation 3",
                style: EvaluationStyle,
              ),
              OurSizedHeight(),
              Text(
                "Pending",
                style: DeniedStyle,
              ),
              OurSizedHeight(),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setSp(15),
                    vertical: ScreenUtil().setSp(10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(20),
                    ),
                    color: Colors.blueGrey[300],
                  ),
                  child: Text(
                    "2020-21",
                    style: BoldinfoStyle,
                  ),
                ),
              ),
              OurSizedHeight(),
              Text(
                "Evaluation 1",
                style: EvaluationStyle,
              ),
              OurSizedHeight(),
              Text(
                "Published",
                style: PublishedStyle,
              ),
              OurSizedHeight(),
              Text(
                "Evaluation 2",
                style: EvaluationStyle,
              ),
              OurSizedHeight(),
              Text(
                "Published",
                style: PublishedStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
