import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/assignment_models.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_assignment_info.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/custom_pdf_display.dart';
import '../../../widgets/our_assignment_tile.dart';
import '../../../widgets/our_elevated_button.dart';
import '../../../widgets/our_fee_download_tile.dart';
import '../../../widgets/our_fee_pay_tile.dart';
import '../../../widgets/our_sized_box.dart';

class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List<AssignmentModel> assignmentList = [
    AssignmentModel(
      title: "English",
      assignedDate: "21-Feb-2021",
      status: "Pending",
      deadline: "28-feb-2021",
      deadlineTime: "11:59 PM",
      path: "assets/pdf/english.pdf",
    ),
    AssignmentModel(
      title: "Science",
      assignedDate: "21-Jan-2021",
      status: "Approved",
      deadline: "28-Jan-2021",
      deadlineTime: "11:59 PM",
      path: "assets/pdf/science.pdf",
    ),
    AssignmentModel(
      title: "Math",
      assignedDate: "21-May-2021",
      status: "Pending",
      deadline: "28-May-2021",
      deadlineTime: "11:59 PM",
      path: "assets/pdf/math.pdf",
    ),
    AssignmentModel(
      title: "Nepali",
      assignedDate: "21-Apr-2021",
      status: "Denied",
      deadline: "28-Apr-2021",
      deadlineTime: "11:59 PM",
      path: "assets/pdf/nepali.pdf",
    ),
  ];
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
                        "Assignments",
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
                    MediaQuery.of(context).size.height * 0.125,
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
                      OurAssignmentTile(
                        subject: "Mathematics",
                        title: "Surface Areas and Volumes",
                        assignDate: "10 Nov 2022",
                        lastSubmissionDate: "10 Dec 2022",
                        submitted: false,
                      ),
                      OurAssignmentTile(
                        subject: "Science",
                        title: "Structures of Atom",
                        assignDate: "10 Oct 2022",
                        lastSubmissionDate: "15 Oct 2022",
                        submitted: false,
                      ),
                      OurAssignmentTile(
                        subject: "English",
                        title: "Chap 1 Q&A",
                        assignDate: "10 Oct 2022",
                        lastSubmissionDate: "30 Oct 2022",
                        submitted: true,
                      ),
                      OurAssignmentTile(
                        subject: "Mathematics",
                        title: "Surface Areas and Volumes",
                        assignDate: "10 Nov 2022",
                        lastSubmissionDate: "10 Dec 2022",
                        submitted: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
