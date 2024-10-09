import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({required this.placeholder});
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "${placeholder}...",
        hintStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
      ),
    );
  }
}
