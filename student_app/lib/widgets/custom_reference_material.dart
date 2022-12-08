import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/pages/reference_material/reference_model_tab.dart';

class Referencetitle extends StatelessWidget {
  final String title;
  const Referencetitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ReferenceModelTab(
            title: title,
          );
        }));
      },
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setSp(35),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.blue[600]!,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(25),
            color: Colors.blue[600],
          ),
        ),
      ),
    );
  }
}
