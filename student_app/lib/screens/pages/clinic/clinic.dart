import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_button.dart';

class Clinic extends StatefulWidget {
  const Clinic({Key? key}) : super(key: key);

  @override
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic", style: AppStyle),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: OurButton(
                title: "Special Case",
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
