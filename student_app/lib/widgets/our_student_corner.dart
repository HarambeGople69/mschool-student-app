import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/our_colors.dart';
import 'package:myapp/widgets/our_elevated_button.dart';

import 'custom_pdf_display.dart';
import 'our_sized_box.dart';

class OurStudentCorner extends StatefulWidget {
  final String subject;
  final String AddedOn;
  const OurStudentCorner(
      {Key? key, required this.subject, required this.AddedOn})
      : super(key: key);

  @override
  State<OurStudentCorner> createState() => _OurStudentCornerState();
}

class _OurStudentCornerState extends State<OurStudentCorner> {
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
                  horizontal: ScreenUtil().setSp(5),
                  vertical: ScreenUtil().setSp( 5),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Added on:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(16.5),
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    widget.AddedOn,
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
              // OurSizedBox(),
              Center(
                child: OurElevatedButton(
                  title: "VIEW ATTACHMENT",
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PdfView(path: "assets/pdf/english.pdf");
                    }));
                  },
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
