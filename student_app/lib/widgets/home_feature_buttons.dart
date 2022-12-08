import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureButton extends StatelessWidget {
  final Function() function;
  final String title;
  final LinearGradient linearGradient;
  final Color color;
  final images;
  const FeatureButton(
      {Key? key,
      required this.title,
      required this.linearGradient,
      required this.function,
      required this.color,
      required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          function();
        },
        child: Container(
          height: ScreenUtil().setSp(60),
          margin: EdgeInsets.all(
            ScreenUtil().setSp(4),
          ),
          padding: EdgeInsets.all(
            ScreenUtil().setSp(4),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setSp(5),
              ),
              gradient: linearGradient),
          child: Row(
            children: [
              CircleAvatar(
                radius: ScreenUtil().setSp(20),
                backgroundColor: color,
                // backgroundImage: AssetImage(
                //   'assets/' + image,
                // ),
                child: ImageIcon(
                  AssetImage('assets/' + images),
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(
                        15,
                      ),
                      fontWeight: FontWeight.w500,
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
