import 'package:flutter/material.dart';
import 'package:myapp/utils/styles.dart';

class PTMFeedback extends StatefulWidget {
  const PTMFeedback({Key? key}) : super(key: key);

  @override
  _PTMFeedbackState createState() => _PTMFeedbackState();
}

class _PTMFeedbackState extends State<PTMFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PTM Feedback",
          style: AppStyle,
        ),
      ),
    );
  }
}
