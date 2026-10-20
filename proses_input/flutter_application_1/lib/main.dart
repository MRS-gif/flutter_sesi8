import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: UserInputExample(),
    );
  }
}

class UserInputExample extends StatefulWidget {
  const UserInputExample({super.key});

  @override
  State<UserInputExample> createState() => _UserInputExampleState();
}

class _UserInputExampleState extends State<UserInputExample> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter some text',
                ),
                onChanged: (value) {
                  setState(() {
                    _text = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              Text('You entered: $_text', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
