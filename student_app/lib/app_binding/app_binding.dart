import 'package:get/get.dart';
import '../controller/network_connection.dart';
import '../controller/progress_indicator_controller.dart';
import '../controller/student_corner_controller.dart';
import '../controller/timetable_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => ProgressIndicatorController(),
    );
    Get.lazyPut(
      () => TimeTableController(),
    );
    Get.lazyPut(
      () => StudentCornerController(),
    );
    Get.lazyPut(
      () => CheckConnectivity(),
    );
  }
  // StudentCornerController
}
