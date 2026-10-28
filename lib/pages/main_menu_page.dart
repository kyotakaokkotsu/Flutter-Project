import 'package:application_project/controller/main_menu_controller.dart';
import 'package:application_project/menu/history.dart';
import 'package:application_project/menu/home.dart';
import 'package:application_project/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final menuController = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: menuController.SelectedIndex.value,
          children: menuController.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: menuController.SelectedIndex.value,
          onTap: menuController.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
