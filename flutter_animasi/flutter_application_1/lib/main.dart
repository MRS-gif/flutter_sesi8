import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnimationExample());
  }
}

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  bool _isBlue = true;

  void _toggleColor() {
    setState(() {
      _isBlue = !_isBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleColor,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 200,
            height: 200,
            color: _isBlue ? Colors.blue : Colors.pink,
            alignment: Alignment.center,
            child: const Text(
              'Tap me!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        child: const Icon(Icons.palette),
      ),
    );
  }
}
