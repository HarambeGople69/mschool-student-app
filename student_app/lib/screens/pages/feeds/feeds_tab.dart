// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:myapp/models/circular_tab_model.dart';
// import 'package:myapp/utils/styles.dart';
// import 'package:myapp/widgets/custom_circular_attachment.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:myapp/widgets/custom_pdf_file.dart';
// // import 'package:myapp/widgets/custom_text_field.dart';
// import 'package:myapp/widgets/linear_button.dart';
// import 'package:myapp/widgets/our_sized_height.dart';
// import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
// import 'package:nepali_date_picker/nepali_date_picker.dart';
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:rive/rive.dart';

// class CircularTab extends StatefulWidget {
//   const CircularTab({Key? key}) : super(key: key);

//   @override
//   _CircularTabState createState() => _CircularTabState();
// }

// class _CircularTabState extends State<CircularTab> {
//   final _formKey = GlobalKey<FormState>();
//   final title = TextEditingController();
//   final circulatFor = TextEditingController();
//   final circularAdded = TextEditingController();
//   String titleText = "";
//   String circularAtText = "";
//   String circularAddedText = "";
//   String? basename;

//   File? file;
//   List<CircularTabModel> circularList = [];
//   final _offsetToArmed = 220.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomRefreshIndicator(
//         offsetToArmed: _offsetToArmed,
//         onRefresh: () => Future.delayed(const Duration(seconds: 3)),
//         builder: (context, child, controller) => AnimatedBuilder(
//           animation: controller,
//           child: child,
//           builder: (context, child) {
//             return Stack(
//               children: <Widget>[
//                 SizedBox(
//                   width: double.infinity,
//                   height: _offsetToArmed * controller.value,
//                   child: const RiveAnimation.asset(
//                     "assets/anim/search.riv",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Transform.translate(
//                     offset: Offset(0.0, _offsetToArmed * controller.value),
//                     child: controller.isLoading ? SizedBox() : child),
//               ],
//             );
//           },
//         ),
//         child: Container(
//           margin: EdgeInsets.symmetric(
//             horizontal: ScreenUtil().setSp(15),
//             vertical: ScreenUtil().setSp(10),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 "Please pull down from top of the screen and release to get the latest updates.",
//                 style: BlueinfoStyle,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.search,
//                     size: ScreenUtil().setSp(
//                       20,
//                     ),
//                   ),
//                   labelText: "Search",
//                   labelStyle: TextStyle(
//                     fontSize: ScreenUtil().setSp(20),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: circularList.length,
//                     itemBuilder: (context, index) {
//                       return CustomAttachment(
//                         title: circularList[index].title,
//                         circularFor: circularList[index].circularFor,
//                         circularAdded: circularList[index].circularAdded,
//                         file: circularList[index].file,
//                         basename: circularList[index].basename,
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showDrawDialog(context);
//         },
//         child: Icon(
//           Icons.upload,
//           size: ScreenUtil().setSp(
//             25,
//           ),
//         ),
//       ),
//     );
//   }

//   _showDrawDialog(BuildContext contexts) {
//     pickDocument() async {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );

//       if (result != null) {
//         setState(() {
//           file = File(result.files.single.path!);
//           basename = file!.path.split('/').last;
//         });
//         // basename = file!.path.split('/').last;

//         print("PDF selected=========================================");
//       } else {
//         // User canceled the picker
//         print("No files selected");
//       }
//     }

//     showDialog(
//         barrierDismissible: false,
//         context: contexts,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return Form(
//                   key: _formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // CustomTextField(
//                         //   onchange: (value) {
//                         //     titleText = value;
//                         //     print(titleText);
//                         //   },
//                         //   controller: title,
//                         //   validator: (value) {
//                         //     if (value.trim().isNotEmpty) {
//                         //       return null;
//                         //     } else {
//                         //       return "Can't be empty";
//                         //     }
//                         //   },
//                         //   title: "Subject Name",
//                         //   type: TextInputType.name,
//                         // ),
//                         OurSizedHeight(),
//                         OurSizedHeight(),
//                         TextFormField(
//                           validator: (value) {
//                             if (value!.isNotEmpty) {
//                               return null;
//                             } else {
//                               return "Please pick date";
//                             }
//                           },
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             labelText: "Circular for:",
//                             // labelStyle: paratext,
//                             errorStyle: TextStyle(
//                               fontSize: ScreenUtil().setSp(
//                                 15,
//                               ),
//                             ),
//                           ),
//                           controller: circulatFor,
//                           readOnly: true,
//                           onTap: () async {
//                             DateTime selectTime = picker.NepaliDateTime.now();
//                             DateTime? pickedDate =
//                                 await picker.showMaterialDatePicker(
//                               context: context,
//                               initialDate: NepaliDateTime.now(),
//                               firstDate: NepaliDateTime(2078),
//                               lastDate: NepaliDateTime(2090),
//                               initialDatePickerMode: DatePickerMode.day,
//                             );
//                             if (pickedDate != null) {
//                               selectTime = pickedDate;
//                               print(pickedDate);
//                               String formattedDate =
//                                   DateFormat('yyyy-MM-dd').format(pickedDate);
//                               circulatFor.text = formattedDate;
//                               circularAtText = formattedDate;
//                             } else {}
//                           },
//                         ),
//                         OurSizedHeight(),
//                         (file == null)
//                             ? GradientButton(
//                                 text: 'Upload File',
//                                 onPressed: () async {
//                                   await pickDocument();
//                                   setState(() {});
//                                 },
//                               )
//                             : InkWell(
//                                 onTap: () {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return PdfViewFile(
//                                       file: file!,
//                                       title: basename!,
//                                     );
//                                   }));
//                                 },
//                                 child: Container(
//                                   child: Text("$basename"),
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate() && file != null) {
//                     circularList.add(CircularTabModel(
//                         title: titleText,
//                         circularFor: "Circular for: $circularAtText",
//                         circularAdded:
//                             "Circular added on ${DateFormat('yyyy-MM-dd').format(
//                           NepaliDateTime.now(),
//                         )}",
//                         file: file!,
//                         basename: basename!));
//                     setState(() {
//                       file = null;
//                       circulatFor.text = "";
//                     });
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text(
//                   "Done",
//                   style: TextStyle(
//                     fontSize: ScreenUtil().setSp(20),
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   setState(() {
//                     file = null;
//                     circulatFor.text = "";
//                   });
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(
//                     fontSize: ScreenUtil().setSp(20),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }
