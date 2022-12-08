import 'package:get/get.dart';

class TimeTableController extends GetxController {
  var index = 0.obs;
  changeIndex(int value) {
    index.value = value;
  }
}
