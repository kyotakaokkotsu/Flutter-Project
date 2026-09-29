import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        controller: txtController,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: myHint,
        ),
      ),
    );
  }
}