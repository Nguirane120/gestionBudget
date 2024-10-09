import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({required this.placeholder, required this.fieldController});
  final String placeholder;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      decoration: InputDecoration(
        hintText: "${placeholder}...",
        hintStyle: TextStyle(fontSize: 10),
        border: OutlineInputBorder(),
      ),
    );
  }
}
