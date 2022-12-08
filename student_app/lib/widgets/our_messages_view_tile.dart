import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/pages/message_view/message_send_screen.dart';
import '../utils/our_colors.dart';

class OurMessagesViewTile extends StatefulWidget {
  final String title;
  final String lastmsg;
  const OurMessagesViewTile(
      {Key? key, required this.title, required this.lastmsg})
      : super(key: key);

  @override
  State<OurMessagesViewTile> createState() => _OurMessagesViewTileState();
}

class _OurMessagesViewTileState extends State<OurMessagesViewTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: MessageSendScreen(
                  name: widget.title,
                ),
                type: PageTransitionType.leftToRight));
      },
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/profile_holder.png"),
                radius: ScreenUtil().setSp(20),
              ),
              SizedBox(
                width: ScreenUtil().setSp(15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      color: darklogoColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setSp(5),
                  ),
                  Text(
                    widget.lastmsg,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: darklogoColor,
          ),
          OurSizedBox(),
        ],
      ),
    );
  }
}
