import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

import 'custom_pdf_display.dart';

class AssignmentInfo extends StatefulWidget {
  final String title;
  final String assignedDate;
  final String status;
  final String deadline;
  final String deadlineTime;
  final String path;
  const AssignmentInfo({
    Key? key,
    required this.title,
    required this.assignedDate,
    required this.status,
    required this.deadline,
    required this.deadlineTime,
    required this.path,
  }) : super(key: key);

  @override
  _AssignmentInfoState createState() => _AssignmentInfoState();
}

class _AssignmentInfoState extends State<AssignmentInfo> {
  _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                TextButton(
                  onPressed: () {
                    // _clearBoard();
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PdfView(path: widget.path);
                    }));
                  },
                  child: Text(
                    "Attachment",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "View History",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDrawDialog();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(15),
          vertical: ScreenUtil().setSp(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: BlueinfoStyle.copyWith(
                      fontSize: ScreenUtil().setSp(
                        20,
                      ),
                    ),
                  ),
                ),
                OurSizedHeight(),
                Icon(
                  Icons.check,
                  size: ScreenUtil().setSp(
                    30,
                  ),
                  color: Colors.green[600],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assigned Date",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil().setSp(
                            15,
                          ),
                        ),
                      ),
                      OurSizedHeight(),
                      Text(
                        widget.assignedDate,
                        style: assignmentStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: assignmentStyle,
                      ),
                      OurSizedHeight(),
                      Text(
                        widget.status,
                        style: assignmentStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deadline",
                        style: assignmentStyle,
                      ),
                      OurSizedHeight(),
                      Text(
                        widget.deadline,
                        style: assignmentStyle,
                      ),
                      Text(
                        widget.deadlineTime,
                        style: assignmentStyle,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PdfView(path: widget.path);
                    }));
                  },
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.blue[600],
                    size: ScreenUtil().setSp(
                      25,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: ScreenUtil().setSp(3),
            )
          ],
        ),
      ),
    );
  }
}
