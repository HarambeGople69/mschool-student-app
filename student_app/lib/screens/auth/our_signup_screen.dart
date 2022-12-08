// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:myapp/utils/our_colors.dart';
// import 'package:myapp/widgets/our_elevated_button.dart';
// import 'package:myapp/widgets/our_password_field.dart';
// // import 'package:myapp/widgets/custom_text_field.dart';
// import 'package:myapp/widgets/our_sized_box.dart';
// import 'package:page_transition/page_transition.dart';

// import '../../widgets/our_textfield.dart';
// import '../pages/our_dashboard.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _collegeID = TextEditingController();
//   final _studentID = TextEditingController();
//   final _password = TextEditingController();
//   final _full_name = TextEditingController();
//   final _email = TextEditingController();
//   final _phone = TextEditingController();

//   final _collegeNode = FocusNode();
//   final _studentNode = FocusNode();
//   final _passwordNode = FocusNode();
//   final _full_nameNode = FocusNode();
//   final _emailNode = FocusNode();
//   final _phoneNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xff7294CF),
//             Color(0xff2855AE),
//           ],
//         )),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.35,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: ScreenUtil().setSp(10),
//                   vertical: ScreenUtil().setSp(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     OurSizedBox(),
//                     Image.asset(
//                       "assets/images/splash_screen_image.png",
//                       height: ScreenUtil().setSp(150),
//                       width: double.infinity,
//                       fit: BoxFit.fitHeight,
//                     ),
//                     Text(
//                       "Hi Student",
//                       style: TextStyle(
//                         fontSize: ScreenUtil().setSp(25),
//                         color: Colors.white,
//                       ),
//                     ),
//                     OurSizedBox(),
//                     Text(
//                       "Sign Up to continue",
//                       style: TextStyle(
//                         fontSize: ScreenUtil().setSp(15),
//                         color: Colors.grey[300],
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               OurSizedBox(),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.65 -
//                     ScreenUtil().setSp(35),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: ScreenUtil().setSp(10),
//                   vertical: ScreenUtil().setSp(10),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(
//                       ScreenUtil().setSp(50),
//                     ),
//                     topRight: Radius.circular(
//                       ScreenUtil().setSp(50),
//                     ),
//                   ),
//                 ),
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     OurSizedBox(),
//                     CustomTextField(
//                       start: _collegeNode,
//                       end: _studentNode,
//                       length: 1,
//                       number: 0,
//                       controller: _collegeID,
//                       validator: (value) {},
//                       title: "College ID",
//                       type: TextInputType.name,
//                     ),
//                     OurSizedBox(),
//                     CustomTextField(
//                       start: _studentNode,
//                       end: _full_nameNode,
//                       length: 1,
//                       number: 0,
//                       controller: _studentID,
//                       validator: (value) {},
//                       title: "Student ID",
//                       type: TextInputType.name,
//                     ),
//                     OurSizedBox(),
//                     CustomTextField(
//                       start: _full_nameNode,
//                       end: _emailNode,
//                       length: 1,
//                       number: 0,
//                       controller: _full_name,
//                       validator: (value) {},
//                       title: "Full name",
//                       type: TextInputType.name,
//                       icon: Icons.person,
//                     ),
//                     OurSizedBox(),
//                     CustomTextField(
//                       start: _emailNode,
//                       end: _phoneNode,
//                       length: 1,
//                       number: 0,
//                       controller: _email,
//                       validator: (value) {},
//                       title: "Email",
//                       type: TextInputType.emailAddress,
//                       icon: Icons.email,
//                     ),
//                     OurSizedBox(),
//                     CustomTextField(
//                       start: _phoneNode,
//                       end: _passwordNode,
//                       length: 1,
//                       number: 0,
//                       controller: _phone,
//                       validator: (value) {},
//                       title: "Phone no",
//                       type: TextInputType.number,
//                       icon: Icons.phone,
//                     ),
//                     OurSizedBox(),
//                     PasswordForm(
//                       start: _passwordNode,
//                       controller: _password,
//                       title: "Password",
//                       validator: (value) {},
//                       number: 1,
//                     ),
//                     OurSizedBox(),
//                     Center(
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.65,
//                         child: OurElevatedButton(
//                           title: "SIGN UP",
//                           function: () {
//                             Navigator.push(
//                               context,
//                               PageTransition(
//                                 child: DashBoard(),
//                                 type: PageTransitionType.leftToRight,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     // Text("data"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         height: ScreenUtil().setSp(35),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Already have an account? ",
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: ScreenUtil().setSp(17.5),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "Sign In ",
//                 style: TextStyle(
//                   color: darklogoColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: ScreenUtil().setSp(17.5),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
