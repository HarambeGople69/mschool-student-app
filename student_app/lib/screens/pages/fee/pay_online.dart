import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/our_colors.dart';
import '../../../widgets/our_fee_download_tile.dart';
import '../../../widgets/our_fee_pay_tile.dart';
import '../../../widgets/our_flutter_toast.dart';
import '../../../widgets/our_sized_box.dart';

class PayOnline extends StatefulWidget {
  final String receptiNo;
  final String month;
  final String paymentDate;
  final String PaymentAmount;
  const PayOnline(
      {Key? key,
      required this.receptiNo,
      required this.month,
      required this.paymentDate,
      required this.PaymentAmount})
      : super(key: key);

  @override
  State<PayOnline> createState() => _PayOnlineState();
}

class _PayOnlineState extends State<PayOnline> {
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
                    Expanded(
                      child: Center(
                        child: Text(
                          "Pay Online",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(22.5),
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
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
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                      vertical: ScreenUtil().setSp(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        OurSizedBox(),
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
                        Divider(
                          color: darklogoColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Pending Amount",
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
                        OurSizedBox(),
                        OurSizedBox(),
                        OurSizedBox(),
                        OurElevatedButton(
                          title: "PAY NOW",
                          function: () {
                            // 9806800002
                            // Nepal@123
                            try {
                              EsewaFlutterSdk.initPayment(
                                esewaConfig: EsewaConfig(
                                  environment: Environment.test,
                                  clientId:
                                      "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R ",
                                  secretId:
                                      "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
                                ),
                                esewaPayment: EsewaPayment(
                                  productId: widget.receptiNo,
                                  productName: "Fee",
                                  productPrice: "100",
                                  callbackUrl: "www.test-url.com",
                                ),
                                onPaymentSuccess:
                                    (EsewaPaymentSuccessResult data) {
                                  debugPrint(":::SUCCESS::: => $data");
                                  OurToast()
                                      .showErrorToast("Payment Successful");
                                  // Get.find<CheckOutScreenController>().changeIndex(2);
                                },
                                onPaymentFailure: (data) {
                                  debugPrint(":::FAILURE::: => $data");
                                  OurToast().showErrorToast("Payment Failed");
                                },
                                onPaymentCancellation: (data) {
                                  debugPrint(":::CANCELLATION::: => $data");
                                  OurToast()
                                      .showErrorToast("Payment Cancelled");
                                },
                              );
                            } on Exception catch (e) {
                              debugPrint("EXCEPTION : ${e.toString()}");
                              OurToast().showErrorToast(e.toString());
                            }
                          },
                        )
                      ],
                    ),
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
