// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// // ignore: must_be_immutable
// class CustomTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final IconData? suffixIcon;
//   late bool obscureText;
//   final String hintText;
//   final Function(String) validator;
//   final TextInputType? keyboardType;
//   final TextStyle? hintStyle;
//   final bool? needBorder;
//   final int? maxLines;

//   CustomTextField({
//     required this.controller,
//     this.suffixIcon,
//     required this.validator,
//     this.obscureText = true,
//     required this.hintText,
//     this.keyboardType,
//     this.hintStyle,
//     this.needBorder = true,
//     this.maxLines = 1,
//   });

//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       validator: (value) => widget.validator(value!),
//       style: TextStyle(),
//       maxLines: widget.maxLines,
//       obscureText: widget.obscureText,
//       keyboardType: widget.keyboardType,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         hintStyle: widget.hintStyle != null
//             ? widget.hintStyle
//             : TextStyle(
//                 fontSize: ScreenUtil().setSp(
//                   40,
//                 ),
//                 fontWeight: FontWeight.w600,
//               ),
//         suffixIcon: widget.suffixIcon != null
//             ? InkWell(
//                 onTap: () {
//                   setState(() {
//                     widget.obscureText = !widget.obscureText;
//                   });
//                 },
//                 child: Icon(
//                   widget.suffixIcon,
//                   size: 20.sp,
//                 ),
//               )
//             : null,
//         contentPadding: EdgeInsets.all(
//           ScreenUtil().setSp(20),
//         ),
//         border: widget.needBorder == true
//             ? OutlineInputBorder(
//                 // borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(32),
//               )
//             : null,
//         focusedBorder: widget.needBorder == true
//             ? OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(32),
//                 borderSide: BorderSide(),
//               )
//             : null,
//       ),
//     );
//   }
// }
