import 'package:flutter/material.dart';

class KuroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KuroAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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

          const SizedBox(width: 10),

          const Text(
            "Kuro Games",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}