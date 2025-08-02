import 'package:flutter/material.dart';
import 'package:todo_app/theApp.dart';

void main() {
  runApp(const application());
}

class application extends StatelessWidget {
  const application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getApplication(),
    );
  }
}
