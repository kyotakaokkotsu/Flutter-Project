import 'package:application_project/menu/history.dart';
import 'package:application_project/menu/home.dart';
import 'package:application_project/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{
  final RxInt SelectedIndex = 0.obs;

  void changePage(int index){
    SelectedIndex.value = index;

  }
  
  List<Widget> listPages = [HomePage(), HistoryPage(), ProfilePage()];
}