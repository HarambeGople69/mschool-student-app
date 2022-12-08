import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class ReferenceModelTab extends StatefulWidget {
  final String title;
  const ReferenceModelTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _ReferenceModelTabState createState() => _ReferenceModelTabState();
}

class _ReferenceModelTabState extends State<ReferenceModelTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reference Material",
          style: AppStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: ScreenUtil().setSp(
                      20,
                    ),
                  ),
                  labelText: "Search",
                  labelStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ),
              OurSizedHeight(),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(25),
                ),
              ),
              OurSizedHeight(),
              ListTile(
                title: Text(
                  "TERM-1 REVISION WORKSHEET ENGLISH",
                  style: BlueinfoStyle,
                ),
                subtitle: Text(
                  "MRS. RAJAN M",
                  style: BlueinfoStyle,
                ),
                trailing: Text(
                  "22-May-2021",
                  style: BlueinfoStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
