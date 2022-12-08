import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/custom_download_row.dart';
import 'package:myapp/widgets/custom_expansion_tile.dart';
import 'package:myapp/widgets/custom_pdf_display.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(15),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Column(
            children: [
              CustomExpansiontile(
                title: "English",
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDownloadRow(
                      seePDF: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PdfView(path: "assets/pdf/english.pdf");
                        }));
                      },
                      title: "Class: LKG English",
                      function: () {
                        print("Download");
                      },
                    ),
                  ],
                ),
              ),
              CustomExpansiontile(
                title: "Math",
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDownloadRow(
                      seePDF: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PdfView(path: "assets/pdf/math.pdf");
                        }));
                      },
                      title: "Class: LKG Math",
                      function: () {
                        print("Download");
                      },
                    ),
                  ],
                ),
              ),
              CustomExpansiontile(
                title: "Science",
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDownloadRow(
                      seePDF: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PdfView(path: "assets/pdf/science.pdf");
                        }));
                      },
                      title: "Class: LKG Science",
                      function: () {
                        print("Download");
                      },
                    ),
                  ],
                ),
              ),
              CustomExpansiontile(
                title: "Nepali",
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDownloadRow(
                      seePDF: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PdfView(path: "assets/pdf/nepali.pdf");
                        }));
                      },
                      title: "Class: LKG Drawing",
                      function: () {
                        print("Download");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
