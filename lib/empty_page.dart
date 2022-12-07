import 'package:flutter/material.dart';
import 'package:flutter_signature/tw_gesture_detect.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

List<Point> myPoints = [
  const Point(100, 100, 0.4),
  const Point(120, 100, 0.5),
  const Point(100, 120, 0.6),
  const Point(140, 140, 0.2),
  const Point(260, 50, 0.1),
];

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TwGestureDetect();
  }
}
