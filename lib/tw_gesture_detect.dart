import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TwGestureDetect extends StatefulWidget {
  const TwGestureDetect({super.key});

  @override
  State<TwGestureDetect> createState() => _TwGestureDetectState();
}

class _TwGestureDetectState extends State<TwGestureDetect> {
  List<DrawingPoints?> points = [];
  bool isFreeHand = false;
  Color strokeColor = Colors.black;
  double strockWidth = 3.0;
  double pressureIndex = 10.0;
  PointerHoverEvent? pressIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                points.clear();
              });
            },
            icon: const Icon(Icons.clear_rounded),
          ),
        ],
      ),
      body: GestureDetector(
        onPanStart: _onPanStart, //펜 시작 좌표
        onPanUpdate: _onPanUpdate, //펜 이동 좌표
        onPanEnd: _onPanEnd, //입력 종료
        child: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerMove: (s) {
            if (s.kind == PointerDeviceKind.stylus) {
              setState(() {
                strockWidth = s.pressure * pressureIndex; //0~1인 필압의 n 배
              });
            }
          },
          child: CustomPaint(
            size: Size.infinite,
            painter: MyPainter(points: points),
            child: Container(),
          ),
          // onPointerDown: (s) {
          //   if (s.kind == PointerDeviceKind.stylus) {
          //     print("Pen Touched");
          //     // _onPanStart;
          //   } else if (s.kind == PointerDeviceKind.touch) {
          //     print("Finger Touched");
          //   }
          // },
          // onPointerCancel: (s) {
          //   print("Pen or finger whatever is hovering");
          //   // _onPanEnd;
          // },
        ),
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _addPoint(details.globalPosition);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      points.add(null);
    });
  }

  void _addPoint(Offset position) {
    points.add(
      DrawingPoints(
        point: position,
        paint: Paint()
          ..color = strokeColor
          ..strokeWidth = strockWidth
          ..strokeCap = StrokeCap.round,
      ),
    );
  }
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
