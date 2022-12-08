import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';

import '../../../models/assignment_file_model.dart';
import '../../../widgets/custom_pdf_display.dart';
import '../../../widgets/our_fee_download_tile.dart';
import '../../../widgets/our_fee_pay_tile.dart';

class OurViewAssignment extends StatefulWidget {
  final String subject;
  final String title;
  final String assignDate;
  final String lastSubmissionDate;
  const OurViewAssignment(
      {Key? key,
      required this.subject,
      required this.title,
      required this.assignDate,
      required this.lastSubmissionDate})
      : super(key: key);

  @override
  State<OurViewAssignment> createState() => _OurViewAssignmentState();
}

class _OurViewAssignmentState extends State<OurViewAssignment> {
  List<AssignmentFileModel> myfiles = [];

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
                    Center(
                      child: Text(
                        "View Assignment",
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
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                      vertical: ScreenUtil().setSp(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.subject,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(
                                  25,
                                ),
                                color: darklogoColor,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: darklogoColor,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                        OurSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Assign Date:",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18.5),
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.assignDate,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(
                                  15,
                                ),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setSp(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Last Submission Date:",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18.5),
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.lastSubmissionDate,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(
                                  15,
                                ),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        OurSizedBox(),
                        OurSizedBox(),
                        OurElevatedButton(
                          title: "VIEW ASSIGNMENT",
                          function: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PdfView(path: "assets/pdf/english.pdf");
                            }));
                          },
                        ),
                        OurSizedBox(),
                        myfiles.isEmpty
                            ? Center(
                                child: Text(
                                  "No files selected",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17.5),
                                    color: darklogoColor,
                                  ),
                                ),
                              )
                            : Column(
                                children: myfiles
                                    .map((e) => InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PdfView(
                                                notassest: true,
                                                path: e.path,
                                              );
                                            }));
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.picture_as_pdf,
                                                    color: darklogoColor,
                                                    size:
                                                        ScreenUtil().setSp(25),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        ScreenUtil().setSp(15),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      e.name,
                                                      style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(17.5),
                                                        color: darklogoColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              OurSizedBox(),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                        OurSizedBox(),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: ScreenUtil().setSp(50),
                                child: OurElevatedButton(
                                  title: "UPLOAD ASSIGNMENT",
                                  function: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                        'pdf',
                                      ],
                                    );
                                    if (result != null) {
                                      print("===================");
                                      PlatformFile file = result.files.first;
                                      setState(() {
                                        AssignmentFileModel
                                            assignmentFileModel =
                                            AssignmentFileModel(
                                          name: file.name,
                                          path: file.path!,
                                        );
                                        myfiles.add(
                                          assignmentFileModel,
                                        );
                                      });

                                      // File file = File(result.files.first);
                                      // print(file.)
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setSp(10),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: ScreenUtil().setSp(50),
                                child: OurElevatedButton(
                                  title: "SUBMIT",
                                  function: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        OurSizedBox(),
                      ],
                    ),
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
