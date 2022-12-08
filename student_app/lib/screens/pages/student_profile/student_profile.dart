import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/our_sized_height.dart';
import 'package:myapp/widgets/student_profile_tile.dart';
import 'package:myapp/widgets/student_profile_title.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Profile",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(
              20,
            ),
            vertical: ScreenUtil().setSp(
              10,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: ScreenUtil().setSp(50),
                  backgroundImage: AssetImage("assets/images/face.jpg"),
                ),
              ),
              OurSizedHeight(),
              StudentProfileTitle(
                title: "House: Leaders",
              ),
              SizedBox(
                height: ScreenUtil().setSp(10),
              ),
              StudentProfileTitle(
                title: "Personal Information",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Name:",
                value: "Utsav Shrestha",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Admission No:",
                value: "218062",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Roll No:",
                value: "10",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Class",
                value: "2",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Section",
                value: "G",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Date of Birth",
                value: "02-Mar-2014",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Gender",
                value: "Male",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Civil ID:",
                value: "314040421330",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Date of joining",
                value: "Hindu",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "14-Dec-2017",
                value: "Icsk Junior",
              ),
              OurSizedHeight(),
              StudentProfileTitle(
                title: "Parent Information",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Father's Name",
                value: "Narendra Shrestha",
              ),
              OurSizedHeight(),
              StudentProfileTile(title: "Father's Occupation", value: ""),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Father's Contact",
                value: "91919191",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's contact",
                value: "1919191",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's Name",
                value: "Usha Shrestha",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's occupation",
                value: "",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's Profession",
                value: "Teacher",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Father's email id",
                value: "email@email.com",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's email id",
                value: "",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mother's Name",
                value: "Usha Shrestha",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Home Address",
                value: "Boudha",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Telephone No",
                value: "",
              ),
              OurSizedHeight(),
              StudentProfileTile(
                title: "Mode of transport",
                value: "Private",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
