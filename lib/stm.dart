import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _count = 0;

  // Method to update the state
  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  // Method to reset the state
  void _resetCounter() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pass count value from ParentWidget to ChildWidget1
          ChildWidget1(count: _count),

          SizedBox(height: 20),

          // Pass methods from ParentWidget to ChildWidget2 to modify the count
          ChildWidget2(
            onIncrement: _incrementCounter,
            onReset: _resetCounter,
          ),
        ],
      ),
    );
  }
}

// This widget displays the current count passed from the parent widget
class ChildWidget1 extends StatelessWidget {
  final int count;

  ChildWidget1({required this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Count: $count',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// This widget contains buttons to modify the count in the parent widget
class ChildWidget2 extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onReset;

  ChildWidget2({required this.onIncrement, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onIncrement,
          child: Text('Increment'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onReset,
          child: Text('Reset'),
        ),
      ],
    );
  }
}
