import 'package:application_project/pages/confirm_registration_page.dart';
import 'package:application_project/pages/list_produk_page.dart';
import 'package:application_project/pages/registration_page.dart';
import 'package:application_project/pages/detail_produk_page.dart';
import 'package:application_project/pages/main_menu_page.dart';
import 'package:application_project/pages/menu_drawer_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/comfirmRegistration";
  static const String listProduk = "/listProduk";
  static const String detailProduk = "/detailProduk";
  static const String mainMenuPage = "/mainMenuPage";
  static const String menuDrawerPage = "/menuDrawerPage";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: listProduk, page: () => ListProdukPage()),
    GetPage(name: detailProduk, page: () => DetailProdukPage()),
    GetPage(name: mainMenuPage, page: () => MainMenuPage()),
    GetPage(name: menuDrawerPage, page: () => MenuDrawerPage()),
  ];
}
