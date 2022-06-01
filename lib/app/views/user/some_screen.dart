import 'package:flutter/material.dart';

class SomeScreen extends StatelessWidget {
  const SomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Some Screen'),
      ),
      body: const Center(
        child: Text('Some Screen'),
      ),
    );
  }
}
