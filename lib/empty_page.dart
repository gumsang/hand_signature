import 'package:flutter/material.dart';
import 'package:flutter_signature/pad_page.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사인'),
      ),
      body: const PadPage(),
    );
  }
}
