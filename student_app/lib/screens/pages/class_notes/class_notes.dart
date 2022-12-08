import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/class_note_models.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_class_notes_tile.dart';
import 'package:myapp/widgets/our_class_note_tile.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/custom_pdf_display.dart';

class ClassNotes extends StatefulWidget {
  const ClassNotes({Key? key}) : super(key: key);

  @override
  _ClassNotesState createState() => _ClassNotesState();
}

// path: "assets/pdf/english.pdf",

class _ClassNotesState extends State<ClassNotes> {
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
        // padding: EdgeInsets.symmetric(
        //   horizontal: ScreenUtil().setSp(10),
        //   vertical: ScreenUtil().setSp(10),
        // ),
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
                        "Class Notes",
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
                      OurClassNoteTile(
                        subject: "Mathematics",
                        title: "Area & Curve",
                        addedOn: "11 Nov 2022",
                      ),
                      OurClassNoteTile(
                        subject: "Science",
                        title: "Heat & Temperature",
                        addedOn: "10 Nov 2022",
                      ),
                      OurClassNoteTile(
                        subject: "English",
                        title: "Chapter 1",
                        addedOn: "10 Nov 2022",
                      ),
                      OurClassNoteTile(
                        subject: "Social",
                        title: "Chapter 2",
                        addedOn: "11 Nov 2022",
                      ),
                      OurClassNoteTile(
                        subject: "Drawing",
                        title: "Apple",
                        addedOn: "11 Nov 2022",
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
