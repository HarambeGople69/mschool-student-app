import 'package:flutter/material.dart';
import 'package:myapp/utils/styles.dart';

class TeacherCommunication extends StatefulWidget {
  const TeacherCommunication({ Key? key }) : super(key: key);

  @override
  _TeacherCommunicationState createState() => _TeacherCommunicationState();
}

class _TeacherCommunicationState extends State<TeacherCommunication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communication",
        style: AppStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}