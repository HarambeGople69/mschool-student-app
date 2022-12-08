import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_textfield.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/our_elevated_button.dart';
import '../../../widgets/our_password_field.dart';
import '../../../widgets/our_sized_box.dart';

class OurLeaveApplication extends StatefulWidget {
  const OurLeaveApplication({Key? key}) : super(key: key);

  @override
  State<OurLeaveApplication> createState() => _OurLeaveApplicationState();
}

class _OurLeaveApplicationState extends State<OurLeaveApplication> {
  final classTeacherController = TextEditingController();
  final applicationTitleController = TextEditingController();
  final descriptionController = TextEditingController();

  final classTeacherNode = FocusNode();
  final applicationTitleNode = FocusNode();
  final descriptionNode = FocusNode();

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
                      Text(
                        "Leave Application",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22.5),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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
                      MediaQuery.of(context).size.height * 0.125 -
                      ScreenUtil().setSp(100),
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
                          icon: Icons.person,
                          start: classTeacherNode,
                          end: applicationTitleNode,
                          controller: classTeacherController,
                          title: "Class Teacher",
                          type: TextInputType.name,
                          validator: (value) {},
                          number: 0,
                        ),
                        OurSizedBox(),
                        CustomTextField(
                          start: applicationTitleNode,
                          end: descriptionNode,
                          controller: applicationTitleController,
                          type: TextInputType.name,
                          title: "Application Title",
                          validator: (value) {},
                          number: 0,
                        ),
                        OurSizedBox(),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setSp(15),
                          ),
                          // height: ScreenUtil().setSp(40),
                          child: TextFormField(
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10),
                            // ],
                            scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            cursorColor: darklogoColor,
                            controller: descriptionController,
                            focusNode: descriptionNode,
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                            onChanged: (String value) {
                              // widget.onchange!(value) ?? () {};
                            },
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: darklogoColor,
                            ),
                            keyboardType: TextInputType.name,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: logoColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: logoColor,
                                ),
                              ),
                              // focusedBorder: InputBorder.none,
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setSp(10),
                                horizontal: ScreenUtil().setSp(2),
                              ),

                              isDense: true,
                              hintText: "         Description",

                              hintStyle: TextStyle(
                                color: darklogoColor,
                                fontSize: ScreenUtil().setSp(
                                  17.5,
                                ),
                              ),
                            ),
                            // maxLength: 10,
                          ),
                        ),
                        OurSizedBox(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: OurElevatedButton(
                            title: "SEND REQUEST",
                            function: () {},
                          ),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Image.asset(
          "assets/images/bottom_image.png",
          width: double.infinity,
          height: ScreenUtil().setSp(100),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
