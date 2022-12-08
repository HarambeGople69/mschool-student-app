import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_reference_material.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class ReferenceMaterial extends StatefulWidget {
  const ReferenceMaterial({Key? key}) : super(key: key);

  @override
  _ReferenceMaterialState createState() => _ReferenceMaterialState();
}

class _ReferenceMaterialState extends State<ReferenceMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reference Material",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Utsav Shrestha",
              style: BlueinfoStyle.copyWith(
                fontSize: ScreenUtil().setSp(
                  25,
                ),
              ),
            ),
            OurSizedHeight(),
            Text(
              "Please pull down from top of the screen and release to get the latest update",
              style: BlueinfoStyle,
            ),
            OurSizedHeight(),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[400],
              height: ScreenUtil().setSp(40),
              width: double.infinity,
              child: Text(
                "Subjects",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    20,
                  ),
                ),
              ),
            ),
            OurSizedHeight(),
            Referencetitle(
              title: "Eng",
            ),
            OurSizedHeight(),
            Referencetitle(
              title: "Math",
            ),
          ],
        ),
      ),
    );
  }
}
