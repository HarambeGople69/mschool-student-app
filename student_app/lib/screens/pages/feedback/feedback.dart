import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_button.dart';
// import 'package:myapp/widgets/custom_text_field.dart';
import 'package:myapp/widgets/our_sized_height.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
          style: AppStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OurSizedHeight(),
                // CustomTextField(
                //     controller: _titleController,
                //     validator: (value) {
                //       if (value.isNotEmpty) {
                //         return null;
                //       } else {
                //         return "Can't be none";
                //       }
                //     },
                //     title: "Module name",
                //     type: TextInputType.name),
                OurSizedHeight(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          ScreenUtil().setSp(30),
                        ),
                      ),
                    ),
                  ),
                  maxLines: 4,
                ),
                OurSizedHeight(),
                OurButton(
                  title: "Submit",
                  function: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
