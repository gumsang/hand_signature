import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PadPage extends StatefulWidget {
  const PadPage({super.key});

  @override
  State<PadPage> createState() => _PadPageState();
}

class _PadPageState extends State<PadPage> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  double minimumStrokeValue = 2.0;
  double maximumStrokeValue = 6.0;

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: minimumStrokeValue,
              maximumStrokeWidth: maximumStrokeValue,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: _handleSaveButtonPressed,
              child: const Text('To Image'),
            ),
            TextButton(
              onPressed: _handleClearButtonPressed,
              child: const Text('Clear'),
            ),
          ],
        ),
      ],
    );
  }
}
