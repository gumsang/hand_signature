import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';

class TwGestureDetect extends StatefulWidget {
  const TwGestureDetect({super.key});

  @override
  State<TwGestureDetect> createState() => _TwGestureDetectState();
}

class _TwGestureDetectState extends State<TwGestureDetect> {
  List<DrawingPoints?> points = [];
  List<Point> freeHandsPoints = [];
  bool isFreeHand = false;
  Color strokeColor = Colors.black;
  double strockWidth = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        // onForcePressStart: _onForcePressStart,
        // onForcePressUpdate: _onForcePressUpdate,
        child: CustomPaint(
          size: Size.infinite,
          painter: isFreeHand
              ? StrokePainter(
                  points: freeHandsPoints,
                )
              : MyPainter(points: points),
          child: Container(),
        ),
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
    print("start");
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
    print(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      points.add(null);
    });
    print("End");
  }

  void _addPoint(Offset position) {
    points.add(
      DrawingPoints(
        point: position,
        paint: Paint()
          ..color = strokeColor
          ..strokeWidth = strockWidth
          ..strokeCap = StrokeCap.butt,
      ),
    );
    freeHandsPoints.add(Point(position.dx, position.dy));
  }

  // void _onForcePressStart(ForcePressDetails details) {
  //   print('onForcePressStart triggered with $details');
  // }

  // void _onForcePressUpdate(ForcePressDetails details) {
  //   print('onForcePressUpdate triggered with $details');
  // }
}

class MyPainter extends CustomPainter {
  List<DrawingPoints?> points;

  MyPainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < points.length - 1; i++) {
      var currentPoint = points[i];
      var nextPoint = points[i + 1];
      if (currentPoint != null && nextPoint != null) {
        canvas.drawLine(
            currentPoint.point, nextPoint.point, currentPoint.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingPoints {
  Offset point;
  Paint paint;

  DrawingPoints({
    required this.point,
    required this.paint,
  });
}

class StrokePainter extends CustomPainter {
  final List<Point> points;

  StrokePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;

    // 1. Get the outline points from the input points
    final outlinePoints = getStroke(
      points,
      size: 16,
      thinning: 0.7,
      smoothing: 0.5,
      streamline: 0.5,
      taperStart: 0.0,
      taperEnd: 0.0,
      capStart: true,
      capEnd: true,
      simulatePressure: true,
      isComplete: true,
    );

    // 2. Render the points as a path
    final path = Path();

    if (outlinePoints.isEmpty) {
      // If the list is empty, don't do anything.
      return;
    } else if (outlinePoints.length < 2) {
      // If the list only has one point, draw a dot.
      path.addOval(Rect.fromCircle(
          center: Offset(outlinePoints[0].x, outlinePoints[0].y), radius: 1));
    } else {
      // Otherwise, draw a line that connects each point with a bezier curve segment.
      path.moveTo(outlinePoints[0].x, outlinePoints[0].y);

      for (int i = 1; i < outlinePoints.length - 1; ++i) {
        final p0 = outlinePoints[i];
        final p1 = outlinePoints[i + 1];
        path.quadraticBezierTo(
            p0.x, p0.y, (p0.x + p1.x) / 2, (p0.y + p1.y) / 2);
      }
    }

    // 3. Draw the path to the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(StrokePainter oldDelegate) {
    return true;
  }
}
