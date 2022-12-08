import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_pdf_display.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class CustomClass extends StatefulWidget {
  final String title;
  final String subject;
  final String date;
  final String path;
  const CustomClass({
    Key? key,
    required this.title,
    required this.subject,
    required this.date,
    required this.path,
  }) : super(key: key);

  @override
  _CustomClassState createState() => _CustomClassState();
}

class _CustomClassState extends State<CustomClass> {
  _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subject: ${widget.subject}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
                Text(
                  "Shared On: ${widget.date}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // _clearBoard();
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return PdfView(path: widget.path);
                  // }));
                },
                child: Text(
                  "Attachment",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // _clearBoard();
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDrawDialog();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: BlueinfoStyle.copyWith(
              fontSize: ScreenUtil().setSp(
                18,
              ),
            ),
          ),
          OurSizedHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subject,
                style: BlueinfoStyle,
              ),
              Text(
                widget.date,
                style: BlueinfoStyle,
              )
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          OurSizedHeight(),
        ],
      ),
    );
  }
}
