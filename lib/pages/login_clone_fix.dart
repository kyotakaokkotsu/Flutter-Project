import 'package:flutter/material.dart';

import 'package:application_project/components/kuro_appbar.dart';
import 'package:application_project/components/my_textfield_1.dart';
import 'package:application_project/components/forgot_register.dart';
import 'package:application_project/components/login_button.dart';
import 'package:application_project/components/my_textbutton.dart';

class LoginCloneFix extends StatelessWidget {
  LoginCloneFix({super.key});

  // Controller untuk email
  final TextEditingController emailController = TextEditingController();

  // Controller untuk password
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),

      appBar: const KuroAppBar(),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextfield(
              myHint: "Please enter your email address",
              txtController: emailController,
            ),

            MyTextfield(
              myHint: "Enter password",
              txtController: passwordController,
              obscureText: true,
            ),

            Row(
              children: [
                MyTextButton(
                  text: "Forgot Password",
                  onPressed: () {
                    print("Forgot Password ditekan");
                  },
                ),
                const Spacer(),
                MyTextButton(
                  text: "Register now",
                  onPressed: () {
                    print("Register ditekan");
                  },
                ),
              ],
            ),

            LoginButton(
              onPressed: () {
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
