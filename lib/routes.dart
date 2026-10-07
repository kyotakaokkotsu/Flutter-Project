import 'package:application_project/pages/confirm_registration_page.dart';
import 'package:application_project/pages/list_produk_page.dart';
import 'package:application_project/pages/registration_page.dart';
import 'package:application_project/pages/detail_produk_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/comfirmRegistration";
  static const String listProduk = "/listProduk";
  static const String detailProduk = "/detailProduk";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPage()),
    GetPage(name: listProduk, page: () => ListProdukPage()),
    GetPage(name: detailProduk, page: () => DetailProdukPage()),
  ];
}
