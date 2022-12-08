import 'package:flutter/material.dart';
import 'package:myapp/models/notifications.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widgets/custom_notification_listtile.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationModel> notificationList = [
    NotificationModel(
      title: "Updated Circular: ISEK Enthusia Flyer",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title: "New Circular: ISEK Enthusia Flyer",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title:
          "New Circular for class 2: ISEK- ENTHUSIA Category 2-Classes 2 to 4",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title: "New Circular: Circular regarding ICSK Cloud data",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title: "New Circular: Soark Magazine june 2021",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title:
          "MRS .Lata rani has created an assignment for class 2-g subject hindi- Title- Holiday Assignment",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title:
          "Mrs. Rajam M has created an assignment for class 2-g subject(English)-Title-Holiday-Assignment 2021",
      subtitle: "12-jul-2021 05:14 PM",
    ),
    NotificationModel(
      title:
          "MRS Syanda Afreen has approved your assignmnet for chapter 2-Activity commerL Excellet!!!",
      subtitle: "12-jul-2021 05:14 PM",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: AppStyle,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          // separatorBuilder: (context, index) => Divider(),
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return NotificationListtile(
              title: notificationList[index].title,
              subtitle: notificationList[index].subtitle,
            );
          }),
    );
  }
}
