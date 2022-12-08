import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_online_exam_listtile.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class OnlineExam extends StatefulWidget {
  const OnlineExam({Key? key}) : super(key: key);

  @override
  _OnlineExamState createState() => _OnlineExamState();
}

class _OnlineExamState extends State<OnlineExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Online Exam",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Dashboard",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: Colors.black,
                        // fontWeight: FontWeight.w600,
                      )
                      // style: paratext,
                      ),
                  TextSpan(
                    text: ' Student',
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ],
              ),
            ),
            OurSizedHeight(),
            Row(
              children: [
                OnlineExamtile(
                  number: "0",
                  title: "Exam",
                  backgroundColor: Colors.blue,
                  bottomColor: Colors.blue[600]!,
                ),
                SizedBox(
                  width: ScreenUtil().setSp(3),
                ),
                OnlineExamtile(
                  number: "0",
                  title: "Result",
                  backgroundColor: Colors.green,
                  bottomColor: Colors.green[600]!,
                ),
              ],
            ),
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Copyright 2020 ",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                        )
                        // style: paratext,
                        ),
                    TextSpan(
                      text: 'Hala Campus ',
                      style: TextStyle(
                        color: Colors.blue,
                        // fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ),
                    TextSpan(
                        text: "All right reserved",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                        )
                        // style: paratext,
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
