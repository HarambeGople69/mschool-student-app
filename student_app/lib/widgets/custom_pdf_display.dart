import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  final String path;
  final bool? notassest;
  const PdfView({
    Key? key,
    required this.path,
    this.notassest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7294CF),
        centerTitle: true,
        title: Text(
          "Attachment",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(
              22.5,
            ),
          ),
        ),
      ),
      body: notassest == true
          ? SfPdfViewer.file(
              File(path),
            )
          : SfPdfViewer.asset(
              path,
            ),
    );
  }
}
