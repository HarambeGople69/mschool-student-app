import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/event_model.dart';
import 'package:myapp/models/feeds_model.dart';
import 'package:myapp/models/organization_model.dart';
import 'package:myapp/models/student_profile.dart';
import 'package:myapp/models/subject_model.dart';
import 'dart:convert';
import 'package:myapp/widgets/our_flutter_toast.dart';

import '../controller/progress_indicator_controller.dart';

class APIService {
  String mainUrl = "https://manakamana.actnepal.com.np/mobile/student/";
  Future<void> login(String collegeId, String studentId, String password,
      BuildContext context) async {
    // final AppSharedPreference _appSharedPreferece = AppSharedPreference();
    String url = "${mainUrl}stdauth";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: ({
          "collegeid": collegeId, //String
          "studentid": studentId, //String
          "password": password //String
        }),
      );

      var responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('=========');
        print(responseJson);
        if (responseJson["status"] == "success") {
          print(responseJson["token"]);
          print('=========');
          print("Inside Success");
          print("statusCode 200");

          await Hive.box<String>("token").put("token", responseJson["token"]);
          await profileAPI();
          await orgDetails();

          await Hive.box<int>("auth").put("state", 2);
        }
        // print(toJson);
        else {
          print("Error");
          print('=========');
          OurToast().showErrorToast(responseJson["error"]);
          print(response.statusCode);
          print('=========');
        }
      }
      Get.find<ProgressIndicatorController>().changeValue(false);
    } catch (e) {
      print('=========');
      Get.find<ProgressIndicatorController>().changeValue(false);
      OurToast().showErrorToast(
        e.toString(),
      );
      print(e);
      print('=========');
    }
  }

  Future<void> profileAPI() async {
    print("INSIDE PROFILE API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/profile?token=$token";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      Map<String, dynamic> responseJson = json.decode(response.body);
      print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        print(responseJson);
        StudentProfileModel studentProfileModel =
            StudentProfileModel.fromMap(responseJson);
        await Hive.box<StudentProfileModel>("student_profile").add(
          studentProfileModel,
        );
        OurToast().showSuccessToast(
            "Welcome, ${studentProfileModel.first_name} ${studentProfileModel.middle_name} ${studentProfileModel.last_name}");

        print(studentProfileModel);
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }

  orgDetails() async {
    print("INSIDE ORGDETAILS API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/orgdetails?token=$token";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      Map<String, dynamic> responseJson = json.decode(response.body);
      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        // print(response.body);
        OrganizationModel organizationModel =
            OrganizationModel.fromMap(responseJson);
        print(organizationModel.toJson());
        await Hive.box<OrganizationModel>("organization_profile").add(
          organizationModel,
        );
        // print(responseJson);

      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }

  Future<List<SubjectModel>?> subjectDetails() async {
    print("INSIDE SUBJECT API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    List<SubjectModel> subjectModelList = [];
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/subjects?token=$token";
    print(url);
    Hive.box<SubjectModel>("subject_model").clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        List<dynamic> responseJson = json.decode(response.body);
        // print(response);
        responseJson.forEach((element) {
          // print(element);
          SubjectModel subjectModel = SubjectModel.fromMap(element);
          // print(subjectModel);
          subjectModelList.add(subjectModel);
          Hive.box<SubjectModel>("subject_model").add(subjectModel);
        });
        print(subjectModelList);
        // print(response.body);
        // print(response.body.runtimeType);
        // print(responseJson);
        return subjectModelList;
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }

  Future<List<EventModel>?> eventsDetails() async {
    print("INSIDE EVENT API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    List<EventModel> eventModelList = [];
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/events?token=$token";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        List<dynamic> responseJson = json.decode(response.body);
        // print(response);
        responseJson.forEach((element) {
          // print(element);
          EventModel eventModel = EventModel.fromMap(element);
          // print(subjectModel);
          eventModelList.add(eventModel);
          Hive.box<EventModel>("event_model").add(eventModel);
        });
        print(eventModelList);
        // print(response.body);
        // print(response.body.runtimeType);
        // print(responseJson);
        return eventModelList;
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }

  Future<List<FeedModel>?> feedsDetails() async {
    print("INSIDE FEEDS API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    List<FeedModel> feedsModelList = [];
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/feeds?token=$token";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        List<dynamic> responseJson = json.decode(response.body);
        // print(response);
        responseJson.forEach((element) {
          // print(element);
          FeedModel feedsModel = FeedModel.fromMap(element);
          // print(subjectModel);
          feedsModelList.add(feedsModel);
          Hive.box<FeedModel>("feeds_model").add(feedsModel);
        });
        print(feedsModelList);
        // print(response.body);
        // print(response.body.runtimeType);
        // print(responseJson);
        return feedsModelList;
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
    }
  }

  Future<String?> likeCount(String id) async {
    print("INSIDE LIKECOUNT API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/feedlikescount?token=$token&feedid=$id";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        var responseJson = json.decode(response.body);

        print(responseJson["count"].runtimeType);
        return responseJson["count"];
        // print(response.body.runtimeType);
        // print(responseJson);
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
        return "";
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
      return "";
    }
  }

  Future<String?> commentCount(String id) async {
    print("INSIDE LIKECOUNT API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/feedcommentscount?token=$token&feedid=$id";
    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      // print(responseJson);
      if (response.statusCode == 200) {
        print("Inside status code 200");
        print('=========');
        var responseJson = json.decode(response.body);

        print(responseJson["count"].runtimeType);
        return responseJson["count"];
        // print(response.body.runtimeType);
        // print(responseJson);
      } else {
        print("Error");
        print('=========');
        print(response.statusCode);
        print('=========');
        return "0";
      }
    } catch (e) {
      print(e);
      OurToast().showErrorToast(e.toString());
      return "";
    }
  }

  Future<void> addLike(String id) async {
    print("INSIDE ADDLIKE API");
    var token = Hive.box<String>("token").get(
      "token",
    );
    String url =
        "https://manakamana.actnepal.com.np/mobile/student/feedlike?token=$token";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: ({
          "feedid": id, 
        }),
      );

      var responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print(responseJson);
      }
    } catch (e) {
      print('=========');
      OurToast().showErrorToast(
        e.toString(),
      );
      print(e);
      print('=========');
    }
  }
}
