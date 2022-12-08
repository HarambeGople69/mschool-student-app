import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/event_model.dart';
import 'package:myapp/models/feeds_model.dart';
import 'package:myapp/models/organization_model.dart';
import 'package:myapp/models/subject_model.dart';
import 'app_binding/app_binding.dart';
import 'models/student_profile.dart';
import 'screens/splash_screen/our_splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>("token");
  await Hive.openBox<int>("auth");
  await Hive.openBox<int>("intro");
  Hive.registerAdapter(StudentProfileModelAdapter());
  await Hive.openBox<StudentProfileModel>("student_profile");
  Hive.registerAdapter(OrganizationModelAdapter());
  await Hive.openBox<OrganizationModel>("organization_profile");
  Hive.registerAdapter(SubjectModelAdapter());
  await Hive.openBox<SubjectModel>("subject_model");
  Hive.registerAdapter(EventModelAdapter());
  await Hive.openBox<EventModel>("event_model");
  Hive.registerAdapter(FeedModelAdapter());
  await Hive.openBox<FeedModel>("feeds_model");
  runApp(
    Intro(
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
      maskColor: const Color.fromRGBO(0, 0, 0, .6),
      noAnimation: false,
      maskClosable: false,
      buttonTextBuilder: (order) => order == 3 ? 'Finish' : 'Next',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child, widget) {
        return GetMaterialApp(
          initialBinding: MyBinding(),
          debugShowCheckedModeBanner: false,
          // useInheritedMediaQuery: true,
          title: 'mSchool',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText2: TextStyle(
                fontSize: 30.sp,
              ),
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
