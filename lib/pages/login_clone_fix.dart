
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_project/controller/login_clone_controller.dart';
import 'package:application_project/components/kuro_appbar.dart';
import 'package:application_project/components/my_textfield_1.dart';
import 'package:application_project/components/login_button.dart';
import 'package:application_project/components/my_textbutton.dart';

class LoginCloneFix extends StatelessWidget {
  LoginCloneFix({super.key});

  final loginController = Get.put(LoginCloneController());

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
              myHint: "Please enter your username",
              txtController: loginController.txtUsername,
            ),

            MyTextfield(
              myHint: "Enter password",
              txtController: loginController.txtPassword,
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

            // Kondisi loading dan tombol login
            Obx(
              () => loginController.isLoading.value
                  ? const CircularProgressIndicator()
                  : LoginButton(
                      onPressed: () {
                        loginController.login();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
