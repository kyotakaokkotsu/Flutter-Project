import 'package:flutter/material.dart';

class ForgotRegister extends StatelessWidget {
  const ForgotRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 232, 161, 31),
              ),
            ),
          ),
        ),

        const Spacer(),

        Container(
          margin: const EdgeInsets.all(10),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Register now",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 232, 161, 31),
              ),
            ),
          ),
        ),
      ],
    );
  }
}