import 'package:flutter/material.dart';

// Đây là một StatefulWidget
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// Đây là class State của StatefulWidget MyWidget
class _MyWidgetState extends State<MyWidget> { 
  @override
  Widget build(BuildContext context) { // Đây là hàm build trong stateful widget
    return const Placeholder();
  }
}