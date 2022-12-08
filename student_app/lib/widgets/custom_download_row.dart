import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDownloadRow extends StatefulWidget {
  final String title;
  final Function() function;
  final Function() seePDF;
  const CustomDownloadRow({
    Key? key,
    required this.title,
    required this.function,
    required this.seePDF,
  }) : super(key: key);

  @override
  _CustomDownloadRowState createState() => _CustomDownloadRowState();
}

class _CustomDownloadRowState extends State<CustomDownloadRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              widget.seePDF();
            },
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(
                  15,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.function();
          },
          icon: Icon(Icons.download),
        ),
      ],
    );
  }
}
