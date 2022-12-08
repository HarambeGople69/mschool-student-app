import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home_feature_buttons.dart';
import 'feeds/feeds.dart';
import 'class_notes/class_notes.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil().setSp(350),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setSp(
            ScreenUtil().setSp(
              10,
            ),
          ),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(
        ScreenUtil().setSp(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Features',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              FeatureButton(
                images: 'icons/speaker.png',
                color: Color(0xffc2444f),
                function: () {
                  // print("object");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FeedsPage();
                  }));
                },
                linearGradient: LinearGradient(
                  colors: [
                    Color(
                      0xfff0545f,
                    ),
                    Color(
                      0xfff96679,
                    ),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                title: "Achievements",
              ),
              FeatureButton(
                images: 'icons/clinic.png',
                color: Color(0xff55a862),
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ClassNotes();
                  }));
                },
                linearGradient: LinearGradient(
                  colors: [
                    Color(0xff62ce78),
                    Color(0xff97d96f),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                title: "Clinic",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
