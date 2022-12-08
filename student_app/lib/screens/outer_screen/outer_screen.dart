import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/screens/onboarding_screen/onboarding_screen.dart';

import '../auth/our_login_screen.dart';
import '../pages/our_dashboard.dart';

class OuterLayerScreen extends StatefulWidget {
  const OuterLayerScreen({Key? key}) : super(key: key);

  @override
  State<OuterLayerScreen> createState() => _OuterLayerScreenState();
}

class _OuterLayerScreenState extends State<OuterLayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<int>("auth").listenable(),
        builder: (context, Box<int> boxs, child) {
          int value = boxs.get("state", defaultValue: 0)!;
          print("===========");
          print(value);
          print("===========");
          return value == 0
              ? OnboardingScreen()
              : value == 1
              ? LoginPage()
              : DashBoard();
        },
      ),
    );
  }
}
