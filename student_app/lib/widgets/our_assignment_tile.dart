import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/pages/assignment/view_assignment.dart';
import '../utils/our_colors.dart';
import 'custom_pdf_display.dart';
import 'our_elevated_button.dart';

class OurAssignmentTile extends StatefulWidget {
  final String subject;
  final String title;
  final String assignDate;
  final String lastSubmissionDate;
  final bool submitted;
  const OurAssignmentTile(
      {Key? key,
      required this.subject,
      required this.title,
      required this.assignDate,
      required this.lastSubmissionDate,
      required this.submitted})
      : super(key: key);

  @override
  State<OurAssignmentTile> createState() => _OurAssignmentTileState();
}

class _OurAssignmentTileState extends State<OurAssignmentTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(10),
            vertical: ScreenUtil().setSp(10),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: darklogoColor,
            ),
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(12.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: logoColor,
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setSp(5),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(2.5),
                  vertical: ScreenUtil().setSp(2.5),
                ),
                child: Text(
                  widget.subject,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5), color: darklogoColor),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(5),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(17.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setSp(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Assign Date:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(16.5),
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
                      fontWeight: FontWeight.bold,
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
                      fontSize: ScreenUtil().setSp(16.5),
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
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Divider(
                color: darklogoColor,
              ),
              widget.submitted == false
                  ? Center(
                      child: OurElevatedButton(
                        title: "TO BE SUBMITTED",
                        function: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: OurViewAssignment(
                                subject: widget.subject,
                                title: widget.title,
                                assignDate: widget.assignDate,
                                lastSubmissionDate: widget.lastSubmissionDate,
                              ),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: OurElevatedButton(
                        title: "SUBMITTED",
                        function: () {},
                      ),
                    ),
            ],
          ),
        ),
        OurSizedBox(),
      ],
    );
  }
}
