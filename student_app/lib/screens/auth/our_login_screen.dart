import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/api/api_service.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:myapp/widgets/our_password_field.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import '../../controller/progress_indicator_controller.dart';
import '../../widgets/our_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _collegeID = TextEditingController();
  final _studentID = TextEditingController();
  final _password = TextEditingController();

  final _collegeNode = FocusNode();
  final _studentNode = FocusNode();
  final _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
          inAsyncCall: Get.find<ProgressIndicatorController>().index.value,
          progressIndicator: Container(
            margin: EdgeInsets.all(16.w),
            height: 350.h,
            width: ScreenUtil.defaultSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.6),
                  ),
                ]),
            child: Lottie.asset(
              'assets/anim/loading.json',
              fit: BoxFit.cover,
              height: 300.h,
              width: 350.h,
            ),
          ),
          // SpinKitDoubleBounce(
          //   size: ScreenUtil().setSp(35),
          //   duration: Duration(milliseconds: 1500),
          //   color: darklogoColor,
          //   // itemBuilder: (BuildContext context, int index) {
          //   //   return DecoratedBox(
          //   //     decoration: BoxDecoration(
          //   //       color: index.isEven ? lightLogoColor : darkLogoColor,
          //   //     ),
          //   //   );
          //   // },
          // ),
          child: Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                        vertical: ScreenUtil().setSp(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OurSizedBox(),
                          OurSizedBox(),
                          OurSizedBox(),
                          Image.asset(
                            "assets/images/splash_screen_image.png",
                            height: ScreenUtil().setSp(200),
                            width: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                          Text(
                            "Hi Student",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              color: Colors.white,
                            ),
                          ),
                          OurSizedBox(),
                          Text(
                            "Sign in to continue",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey[300],
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OurSizedBox(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                        vertical: ScreenUtil().setSp(10),
                      ),
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
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OurSizedBox(),
                          CustomTextField(
                            start: _collegeNode,
                            end: _studentNode,
                            length: 1,
                            number: 0,
                            controller: _collegeID,
                            validator: (value) {},
                            title: "College ID",
                            type: TextInputType.name,
                          ),
                          OurSizedBox(),
                          CustomTextField(
                            start: _studentNode,
                            end: _passwordNode,
                            length: 1,
                            number: 0,
                            controller: _studentID,
                            validator: (value) {},
                            title: "Student ID",
                            type: TextInputType.name,
                          ),
                          OurSizedBox(),
                          PasswordForm(
                            start: _passwordNode,
                            controller: _password,
                            title: "Password",
                            validator: (value) {},
                            number: 1,
                          ),
                          OurSizedBox(),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: OurElevatedButton(
                                title: "SIGN IN",
                                function: () async {
                                  if (_collegeID.text.trim().isEmpty ||
                                      _studentID.text.trim().isEmpty ||
                                      _password.text.trim().isEmpty) {
                                    OurToast().showErrorToast(
                                        "Fields can't be empty");
                                  } else {
                                    Get.find<ProgressIndicatorController>()
                                        .changeValue(true);
                                    await APIService().login(
                                      _collegeID.text.trim(),
                                      _studentID.text.trim(),
                                      _password.text.trim(),
                                      context,
                                    );
                                    Get.find<ProgressIndicatorController>()
                                        .changeValue(false);
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     child: DashBoard(),
                                  //     type: PageTransitionType.leftToRight,
                                  //   ),
                                  // );
                                },
                              ),
                            ),
                          ),
                          //1002 2470 2470
                          // Text("data"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: Container(
            //   color: Colors.white,
            //   height: ScreenUtil().setSp(35),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Don't have an account? ",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: ScreenUtil().setSp(17.5),
            //         ),
            //       ),
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             PageTransition(
            //               child: SignUpPage(),
            //               type: PageTransitionType.leftToRight,
            //             ),
            //           );
            //         },
            //         child: Text(
            //           "Sign Up ",
            //           style: TextStyle(
            //             color: darklogoColor,
            //             fontWeight: FontWeight.bold,
            //             fontSize: ScreenUtil().setSp(17.5),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ));
  }
}
