import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/pages/fee/installment_tab.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_fee_pay_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/our_fee_download_tile.dart';
import '../../../widgets/our_feed_tile.dart';

class Fee extends StatefulWidget {
  const Fee({Key? key}) : super(key: key);

  @override
  _FeeState createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff7294CF),
              Color(0xff2855AE),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.125,
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setSp(15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(20),
                    ),
                    Center(
                      child: Text(
                        "Fees",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22.5),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(12.5),
                  vertical: ScreenUtil().setSp(15),
                ),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top -
                    MediaQuery.of(context).size.height * 0.125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      ScreenUtil().setSp(50),
                    ),
                    topRight: Radius.circular(
                      ScreenUtil().setSp(50),
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OurFeePayTile(
                        receptiNo: "#1122",
                        month: "November",
                        paymentDate: "10 Nov 2022",
                        PaymentAmount: "400",
                      ),
                      OurFeeDownloadTile(
                        receptiNo: "#1324",
                        month: "October",
                        paymentDate: "10 Oct 2022",
                        PaymentAmount: "400",
                        paymode: "E-sewa",
                      ),
                      OurFeeDownloadTile(
                        receptiNo: "#5322",
                        month: "September",
                        paymentDate: "10 Sep 2022",
                        PaymentAmount: "200",
                        paymode: "Cash on Counter",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
