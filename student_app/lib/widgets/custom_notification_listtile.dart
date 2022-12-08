import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class NotificationListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  const NotificationListtile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: BlueinfoStyle.copyWith(
          fontSize: ScreenUtil().setSp(
            ScreenUtil().setSp(16),
          ),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(13),
          color: Colors.grey,
        ),
      ),
    );
  }
}
