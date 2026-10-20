import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DynamicListExample());
  }
}

class DynamicListExample extends StatefulWidget {
  const DynamicListExample({super.key});

  @override
  State<DynamicListExample> createState() => _DynamicListExampleState();
}

class _DynamicListExampleState extends State<DynamicListExample> {
  final List<String> _items = ['Apple', 'Banana', 'Orange'];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _items.add(_controller.text.trim());
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_items[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _addItem(),
              decoration: InputDecoration(
                hintText: 'Add New Item',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
