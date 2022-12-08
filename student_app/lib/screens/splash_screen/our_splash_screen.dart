import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/auth/our_login_screen.dart';

import '../outer_screen/outer_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void completed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OuterLayerScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff7294CF),
            Color(0xff2855AE),
          ],
        )),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(10),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                "assets/images/logo.jpg",
                height: ScreenUtil().setSp(250),
                width: MediaQuery.of(context).size.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
            ),
            Spacer(),
            Image.asset(
              "assets/images/splash_screen_image.png",
              height: ScreenUtil().setSp(300),
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}
