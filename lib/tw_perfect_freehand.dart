import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

List<Point> myPoints = [
  const Point(0, 0, 0.2),
  const Point(1, 2, 0.3),
  const Point(2, 4, 0.4),
];

final stroke = getStroke(myPoints, simulatePressure: false);

class TwPerfectFreehand extends StatefulWidget {
  const TwPerfectFreehand({super.key});

  @override
  State<TwPerfectFreehand> createState() => _TwPerfectFreehandState();
}

class _TwPerfectFreehandState extends State<TwPerfectFreehand> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
