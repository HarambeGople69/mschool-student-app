import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class CustomExpansiontile extends StatefulWidget {
  final String title;
  final Widget widget;
  const CustomExpansiontile({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  _CustomExpansiontileState createState() => _CustomExpansiontileState();
}

class _CustomExpansiontileState extends State<CustomExpansiontile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.bottomLeft,
      title: Text(
        widget.title,
        style: BlueinfoStyle.copyWith(
          fontSize: ScreenUtil().setSp(
            20,
          ),
        ),
      ),
      children: [widget.widget],
    );
  }
}
