import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerTile extends StatelessWidget {
  final String title;
  final drawericon;
  final Color color;
  final Function function;
  const CustomDrawerTile({
    Key? key,
    required this.title,
    required this.drawericon,
    required this.function, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {
            function();
          },
          leading: CircleAvatar(
            backgroundColor: color,
            radius: ScreenUtil().setSp(22),

            // backgroundImage: AssetImage(
            //   'assets/' + image,
            // ),
            child: ImageIcon(
              AssetImage('assets/' + drawericon),
              color: Colors.white,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                15,
              ),
            ),
          ),
        ),
        // Divider(),
      ],
    );
  }
}
