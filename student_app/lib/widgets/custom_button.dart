import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurButton extends StatelessWidget {
  final String title;
  final Function function;
  const OurButton({
    Key? key,
    required this.title,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ScreenUtil().setSp(
          20,
        ),
      ),
      child: SizedBox(
        width: ScreenUtil().setSp(
          150,
        ),
        height: ScreenUtil().setSp(
          50,
        ),
        child: ElevatedButton(
          onPressed: () async {
            function();
          },
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
