import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class OurMessageSendTile extends StatelessWidget {
  final String msg;
  final bool isMe;
  const OurMessageSendTile({Key? key, required this.msg, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.55,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(10),
                vertical: ScreenUtil().setSp(10),
              ),
              decoration: BoxDecoration(
                color: logoColor,
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setSp(10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      msg,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: darklogoColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OurSizedBox(),
          ],
        ),
      ],
    );
  }
}
