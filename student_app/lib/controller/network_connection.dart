import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CheckConnectivity extends GetxController {
  var isOnline = false.obs;
  void initialize() {
    var connectivityResult = (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("No Internet 1");
    } else if (connectivityResult == ConnectivityResult.mobile) {
      print("I am connected to a mobile network.");
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("I am connected to a wifi network.");
      // I am connected to a wifi network.
    }
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        print("Connection Checking mode enabled");
        // Got a new connectivity status!
        if (result == ConnectivityResult.none) {
          print("There is no network");
          isOnline = false.obs;
          print(isOnline);
          print("Utsav Shrestha");
          update();
        } else
        // if (result == ConnectivityResult.mobile ||
        //     result == ConnectivityResult.wifi)
        {
          isOnline = true.obs;
          print("There is network");
          print(isOnline);
          print("Utsav Shrestha");
          update();
        }
      },
    );
  }
  // checkfirst() async {
  //   print("Inside checkfirst");
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     print("NO NET");
  //     isOnline.value = false;
  //   } else {
  //     isOnline.value = true;
  //     print("NET");

  //     // I am connected to a wifi network.
  //   }
  // }
}
