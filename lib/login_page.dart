// import 'package:flutter/material.dart';
// import 'package:application_project/components/my_textfield.dart';
// import 'package:application_project/components/my_button.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // Controller untuk username
//   final TextEditingController usernameController = TextEditingController();

//   // Controller untuk password
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Yokoso Watshi no Login Page")),

//       body: Column(
//         children: [
//           // Username
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: MyTextfield(
//               myHint: "Input user name",
//               txtController: usernameController,
//               radius: 10,
//             ),
//           ),

//           // Password
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: MyTextfield(
//               myHint: "Input Password",
//               txtController: passwordController,
//               radius: 10,
//             ),
//           ),

//           // Button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MyButton(myText: "Login"),

//               MyButton(myText: "Register"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
