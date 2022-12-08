import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/quick_contacts_model.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class QuickContact extends StatefulWidget {
  const QuickContact({Key? key}) : super(key: key);

  @override
  _QuickContactState createState() => _QuickContactState();
}

class _QuickContactState extends State<QuickContact> {
  List<QuickContactModel> contactList = [
    QuickContactModel(
      title: "Mrs Lata Rani",
      subtitle: "Class Teacher- Subject-Hindi",
      number: "9818724531",
    ),
    QuickContactModel(
      title: "Mrs Rajam M",
      subtitle: "Subject Teacher- English",
      number: "9818724531",
    ),
    QuickContactModel(
      title: "Mrs Shaita Hajira",
      subtitle: "Subject Teacher- Environmental Studies",
      number: "9818724531",
    ),
    QuickContactModel(
      title: "Mrs Syeda Afreen",
      subtitle: "Subject Teacher- Arabic",
      number: "9818724531",
    ),
  ];

  Future<void> _makePhoneCall(String url) async {
    String phone = "tel:+$url";
    if (await canLaunch("tel:+1 555 555 555")) {
      launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  Future<void> _makeSMS(String url) async {
    String sms = "sms:$url";
    if (await canLaunchUrlString(sms)) {
      launchUrlString(sms);
    } else {
      throw 'Could not launch $sms';
    }
  }

  _showDrawDialog(String title, String number) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(),
                TextButton(
                  onPressed: () async {
                    await _makePhoneCall(number);
                  },
                  child: Text(
                    "Call",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () async {
                    await _makeSMS(number);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Message",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    // _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.red[400],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quick Contacts",
          style: AppStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: Column(
          children: [
            Text(
              "-Teachers should be contacted only for a genuine reason. Academic related matters of your ward only to be discussed throught the phone.",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                color: Colors.blue[600],
              ),
            ),
            OurSizedHeight(),
            Text(
              "-Calls should be made at the stipulated time from 5.00 PM to 6.30 PM",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                color: Colors.blue[600],
              ),
            ),
            OurSizedHeight(),
            Text(
              "-No calls will be entertained before or after this timing. Calls should be made only on working days.",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                color: Colors.blue[600],
              ),
            ),
            OurSizedHeight(),
            Text(
              "-No Whatsapp group to be formed or messages to be sent to the given contact number",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                color: Colors.blue[600],
              ),
            ),
            Divider(),
            OurSizedHeight(),
            Expanded(
              child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _showDrawDialog(
                          contactList[index].title,
                          contactList[index].number,
                        );
                      },
                      child: ListTile(
                        leading: Text(
                          contactList[index].title[0],
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: Colors.blue[400],
                          ),
                        ),
                        title: Text(
                          contactList[index].title,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.blue[600],
                          ),
                        ),
                        subtitle: Text(
                          contactList[index].subtitle,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
