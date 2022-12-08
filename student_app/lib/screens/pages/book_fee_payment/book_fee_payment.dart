import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class BooKFeePayment extends StatefulWidget {
  const BooKFeePayment({Key? key}) : super(key: key);

  @override
  _BooKFeePaymentState createState() => _BooKFeePaymentState();
}

class _BooKFeePaymentState extends State<BooKFeePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Fee Payment",
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
              "Book Fee Payment",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                fontWeight: FontWeight.w600,
              ),
            ),
            OurSizedHeight(),
            Card(
              child: Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setSp(30),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Maintenance Mode",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            25,
                          ),
                          color: Colors.amber[400],
                        ),
                      ),
                      OurSizedHeight(),
                      Text(
                        "Online payment is unavailable. Regret the inconvenence.",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(
                    20,
                  ),
                  vertical: ScreenUtil().setSp(
                    10,
                  ),
                ),
                width: double.infinity,
                child: Text(
                  "Copyright 2021 Hala Campus. All right reserved.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(
                      14,
                    ),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
