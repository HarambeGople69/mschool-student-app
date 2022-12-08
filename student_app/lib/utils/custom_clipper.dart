import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    var firstControlPoint = Offset(size.width * .7, size.height / 2);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
