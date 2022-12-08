import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class Installment extends StatefulWidget {
  const Installment({Key? key}) : super(key: key);

  @override
  _InstallmentState createState() => _InstallmentState();
}

class _InstallmentState extends State<Installment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(15),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Text(
                  "2020-21",
                  style: feeStyle,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  size: ScreenUtil().setSp(
                    50,
                  ),
                ),
              ],
            ),
            OurSizedHeight(),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total fee",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(
                        25,
                      ),
                      fontWeight: FontWeight.w300,
                      color: Colors.blue[200],
                    ),
                  ),
                  Text(
                    "NRS 0.000",
                    style: feeStyle,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue[600],
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Pay now",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
