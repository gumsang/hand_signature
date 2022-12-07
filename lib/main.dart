import 'package:flutter/material.dart';
import 'package:flutter_signature/tw_gesture_detect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TwGestureDetect(),
    );
  }
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         child: GestureDetector(
//           onForcePressPeak: (details) => print(details.pressure),
//           onForcePressStart: (details) => print(details.pressure),
//           onForcePressUpdate: (details) => print(details.pressure),
//           child: Listener(
//             behavior: HitTestBehavior.opaque,
//             onPointerDown: (s) {
//               if (s.kind == PointerDeviceKind.stylus) {
//                 print("Pen Touched");
//                 // p.penMode ? p.penDrawStart(s.localPosition) : null;
//               } else if (s.kind == PointerDeviceKind.touch) {
//                 print("Finger Touched");
//                 s.
//               }
//             },
//             onPointerMove: (s) {
//               if (s.kind == PointerDeviceKind.stylus) {
//                 // p.penMode ? p.penDrawing(s.localPosition) : null;
//                 print("Pen Moved");
//                 print(s.pressure);
//               }
//             },
//             onPointerCancel: (s) {
//               print("Pen or finger whatever is hovering");
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
