import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_messages_view_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_textfield.dart';

import '../../../widgets/our_class_note_tile.dart';

class OurMessageScreen extends StatefulWidget {
  const OurMessageScreen({Key? key}) : super(key: key);

  @override
  State<OurMessageScreen> createState() => _OurMessageScreenState();
}

class _OurMessageScreenState extends State<OurMessageScreen> {
  TextEditingController _search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff7294CF),
              Color(0xff2855AE),
            ],
          ),
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: ScreenUtil().setSp(10),
        //   vertical: ScreenUtil().setSp(10),
        // ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  child: Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setSp(15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: ScreenUtil().setSp(30),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setSp(20),
                      ),
                      Center(
                        child: Text(
                          "Messages",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22.5),
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setSp(12.5),
                    vertical: ScreenUtil().setSp(15),
                  ),
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewPadding.top -
                      MediaQuery.of(context).size.height * 0.125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        ScreenUtil().setSp(50),
                      ),
                      topRight: Radius.circular(
                        ScreenUtil().setSp(50),
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: _search_controller,
                          validator: (value) {},
                          title: "Search",
                          type: TextInputType.name,
                          number: 1,
                          icon: Icons.person,
                        ),
                        OurSizedBox(),
                        OurSizedBox(),
                        OurMessagesViewTile(
                          title: "Utsav Shrestha",
                          lastmsg: "Last message",
                        ),
                        OurMessagesViewTile(
                          title: "Ram Shrestha",
                          lastmsg: "dummy 1",
                        ),
                        OurMessagesViewTile(
                          title: "Shyam Shrestha",
                          lastmsg: "dummy 2",
                        ),
                        OurMessagesViewTile(
                          title: "Sita Shrestha",
                          lastmsg: "demo",
                        ),
                        OurMessagesViewTile(
                          title: "Gita  Shrestha",
                          lastmsg: "HI",
                        ),
                        OurMessagesViewTile(
                          title: "Hari Shrestha",
                          lastmsg: "hello",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
