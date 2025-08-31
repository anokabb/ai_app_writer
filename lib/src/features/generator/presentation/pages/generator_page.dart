import 'package:flutter/material.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  static const routeName = '/generator';

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('GeneratorPage'),
      ),
    );
  }
}
