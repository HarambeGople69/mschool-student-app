import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class RoboticsRegistrationForm extends StatefulWidget {
  const RoboticsRegistrationForm({Key? key}) : super(key: key);

  @override
  RoboticsRegistrationFormState createState() =>
      RoboticsRegistrationFormState();
}

class RoboticsRegistrationFormState extends State<RoboticsRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Robotics Registration Form",
          style: AppStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: ScreenUtil().setSp(120),
                  width: ScreenUtil().setSp(120),
                ),
              ),
              OurSizedHeight(),
              Text(
                "Welcome to the Registration for\nRobotics and Artificial intelligence (AI) Classes.",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    20,
                  ),
                  fontWeight: FontWeight.w500,
                ),
              ),
              OurSizedHeight(),
              Divider(
                thickness: 2,
              ),
              OurSizedHeight(),
              Text(
                "Level 1 registrations can be done from the below link.\n Once you open the below link, enter the captcha and choose \"Register for Robotics\"\nClick the following link to register for level 1 robotics:",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    18,
                  ),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
