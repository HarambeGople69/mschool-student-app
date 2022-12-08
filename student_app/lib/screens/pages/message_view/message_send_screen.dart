import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_message_send_tile.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/our_textfield.dart';

class MessageSendScreen extends StatefulWidget {
  final String name;
  const MessageSendScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<MessageSendScreen> createState() => _MessageSendScreenState();
}

class _MessageSendScreenState extends State<MessageSendScreen> {
  TextEditingController _comment_text_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7294CF),
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(22.5),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(10),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OurMessageSendTile(
              msg: "HI",
              isMe: true,
            ),
            OurMessageSendTile(
              msg: "Hello",
              isMe: false,
            ),
            OurMessageSendTile(
              msg: "Dummy text 1",
              isMe: false,
            ),
            OurMessageSendTile(
              msg: "Dummy text 2",
              isMe: true,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _comment_text_controller,
                    validator: (value) {},
                    title: "Add comment",
                    type: TextInputType.name,
                    number: 1,
                    length: 1,
                  ),
                ),
                IconButton(
                  onPressed: () async {},
                  icon: Icon(
                    Icons.send,
                    color: darklogoColor,
                    size: ScreenUtil().setSp(
                      27.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
