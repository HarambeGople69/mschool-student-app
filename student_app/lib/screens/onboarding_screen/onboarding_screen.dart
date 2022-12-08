/*
* File : Shopping Onboarding
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutx/flutx.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:provider/provider.dart';

import '../../widgets/our_sized_box.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FxOnBoarding(
          pages: <PageViewModel>[
            PageViewModel(
              Color(0xffe1ebfa),

              // logoColor.withOpacity(0.2),
              Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setSp(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/illu-1.png'),
                      width: ScreenUtil().setSp(275),
                      height: ScreenUtil().setSp(300),
                    )),
                    OurSizedBox(),
                    Center(
                      child: Text(
                        'Onboarding desc 1',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Color(0xff1b50a3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    OurSizedBox(),
                    // FxText(
                    //     'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    //     fontWeight: 500),
                  ],
                ),
              ),
            ),
            PageViewModel(
              // Color(0xffbfd4f4),
              Color(0xffd0e0f7),

              // logoColor.withOpacity(0.3),
              Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setSp(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/illu-2.png'),
                      width: ScreenUtil().setSp(275),
                      height: ScreenUtil().setSp(300),
                    )),
                    OurSizedBox(),
                    Center(
                      child: Text(
                        'Onboarding desc 2',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Color(0xff1b50a3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    OurSizedBox(),
                  ],
                ),
              ),
            ),
            PageViewModel(
              Color(0xffbfd4f4),

              // logoColor.withOpacity(0.4),
              Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setSp(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/illu-3.png'),
                      width: ScreenUtil().setSp(275),
                      height: ScreenUtil().setSp(300),
                    )),
                    // SizedBox(height: 30),
                    OurSizedBox(),
                    Center(
                      child: Text(
                        'Onboarding desc 3',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Color(0xff1b50a3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // SizedBox(height: 16),
                    OurSizedBox(),
                  ],
                ),
              ),
            ),
          ],
          unSelectedIndicatorColor: Color(0xff1b50a3).withOpacity(0.2),
          selectedIndicatorColor: darklogoColor,
          doneWidget: InkWell(
            onTap: () async {
              await Hive.box<int>("auth").put("state", 1);
            },
            child: Container(
              padding: EdgeInsets.all(
                ScreenUtil().setSp(10),
              ),
              child: Text(
                "DONE",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(17.5),
                  color: Color(0xff1b50a3),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          skipWidget: InkWell(
            onTap: () async {
              await Hive.box<int>("auth").put("state", 1);
            },
            child: Container(
              padding: EdgeInsets.all(
                ScreenUtil().setSp(10),
              ),
              child: Text(
                "SKIP",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(17.5),
                  color: Color(0xff1b50a3),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
