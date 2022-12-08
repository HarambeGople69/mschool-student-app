import 'package:get/get.dart';

class StudentCornerController extends GetxController {
  var index = 0.obs;
  changeIndex(int value) {
    index.value = value;
  }
}
