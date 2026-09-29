import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String myText;

  const MyButton({
    super.key,
    required this.myText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        myText,
        style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 70, 57, 249),
        ),
      ),
    );
  }
}

