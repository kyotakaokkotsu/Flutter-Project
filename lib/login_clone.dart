import 'package:flutter/material.dart';

class LoginClonePage extends StatefulWidget {
  const LoginClonePage({super.key});

  @override
  State<LoginClonePage> createState() => _LoginClonePageState();
}

class _LoginClonePageState extends State<LoginClonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/Screenshot 2026-09-09 124453.png',
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Text(
              "Kuro Games",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // Email
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Please enter your email address",
              ),
            ),
          ),

          // Password
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
            ),

          // Forgot Password & Register
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 232, 161, 31),
                    ),
                  ),
                ),
              ),

              Spacer(),

              Container(
                margin: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 232, 161, 31),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Login Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(40),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "    Log in    ",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
