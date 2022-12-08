import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_sized_box.dart';

import '../utils/our_colors.dart';

class OurFeeDownloadTile extends StatefulWidget {
  final String receptiNo;
  final String month;
  final String paymentDate;
  final String PaymentAmount;
  final String paymode;
  const OurFeeDownloadTile(
      {Key? key,
      required this.receptiNo,
      required this.month,
      required this.paymentDate,
      required this.PaymentAmount,
      required this.paymode})
      : super(key: key);

  @override
  State<OurFeeDownloadTile> createState() => _OurFeeDownloadTileState();
}

class _OurFeeDownloadTileState extends State<OurFeeDownloadTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setSp(5),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: darklogoColor,
              ),
              borderRadius: BorderRadius.circular(
                ScreenUtil().setSp(12.5),
              )),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setSp(10),
                  right: ScreenUtil().setSp(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Receipt No.",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.receptiNo,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darklogoColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Month",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.month,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    OurSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Date",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.paymentDate,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    OurSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pay Mode",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          widget.paymode,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darklogoColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: darklogoColor,
                          ),
                        ),
                        Text(
                          "Rs. ${widget.PaymentAmount}",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17.5),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              OurSizedBox(),
              OurSizedBox(),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().setSp(35),
                  decoration: BoxDecoration(
                    color: darklogoColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        ScreenUtil().setSp(12.5),
                      ),
                      bottomRight: Radius.circular(
                        ScreenUtil().setSp(12.5),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "DOWNLOAD",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(17.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        OurSizedBox(),
      ],
    );
  }
}
