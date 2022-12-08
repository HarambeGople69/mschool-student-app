import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileTile extends StatelessWidget {
  final String title;
  final String? value;
  const StudentProfileTile({Key? key, required this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                value!,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
