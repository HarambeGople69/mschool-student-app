import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_password_field.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final oldPasswordNode = FocusNode();
  final newPasswordNode = FocusNode();
  final confirmPasswordNode = FocusNode();

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
                      "Change Password",
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
                      PasswordForm(
                        start: oldPasswordNode,
                        end: newPasswordNode,
                        controller: oldPasswordController,
                        title: "Old Password",
                        validator: (value) {},
                        number: 0,
                      ),
                      OurSizedBox(),
                      PasswordForm(
                        start: newPasswordNode,
                        end: confirmPasswordNode,
                        controller: newPasswordController,
                        title: "New Password",
                        validator: (value) {},
                        number: 0,
                      ),
                      OurSizedBox(),
                      PasswordForm(
                        start: confirmPasswordNode,
                        controller: confirmPasswordController,
                        title: "Re-type Password",
                        validator: (value) {},
                        number: 1,
                      ),
                      OurSizedBox(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: OurElevatedButton(
                          title: "CHANGE PASSWORD",
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
