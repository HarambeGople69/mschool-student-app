import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class PrincipalMessage extends StatefulWidget {
  const PrincipalMessage({Key? key}) : super(key: key);

  @override
  _PrincipalMessageState createState() => _PrincipalMessageState();
}

class _PrincipalMessageState extends State<PrincipalMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Principal's Message",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Principal's Message",
                  style: BlueinfoStyle.copyWith(
                    fontSize: ScreenUtil().setSp(
                      ScreenUtil().setSp(20),
                    ),
                  ),
                ),
                subtitle: Text(
                  "8/16/2021",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
