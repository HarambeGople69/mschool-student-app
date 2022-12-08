import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewFile extends StatelessWidget {
  final File file;
  final String title;
  const PdfViewFile({
    Key? key,
    required this.file,required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         title,
        ),
        actions: [
          Icon(
            Icons.share,
          ),
        ],
      ),
      body: SfPdfViewer.file(
        file,
      ),
    );
  }
}
