
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:application_project/routes.dart';

class LoginCloneController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    if (txtUsername.text.trim().isEmpty ||
        txtPassword.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Username dan password harus terisi",
      );
      return;
    }

    if (isLoading.value) return;

    try {
      isLoading.value = true;

      final url = Uri.parse(
        "https://mediadwi.com/api/latihan/login",
      );

      final response = await http.post(
        url,
        body: {
          "username": txtUsername.text.trim(),
          "password": txtPassword.text,
        },
      ).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          Get.snackbar(
            "Berhasil",
            data['message'] ?? "Login berhasil",
          );

          // Tutup semua halaman sebelumnya
          // dan pindah ke Navigation Drawer
          Get.offAllNamed(Routes.menuDrawerPage);
        } else {
          Get.snackbar(
            "Gagal",
            data['message'] ?? "Username atau password salah",
          );
        }
      } else {
        Get.snackbar(
          "Gagal",
          "Terjadi kesalahan pada server",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Gagal",
        "Tidak dapat terhubung ke server: $e",
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
