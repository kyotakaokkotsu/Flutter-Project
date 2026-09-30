import 'package:application_project/components/my_textfield_1.dart';
import 'package:application_project/controller/registration_controller.dart';
import 'package:application_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextfield(
              myHint: "Input Nama",
              txtController: controller.txtNama,
            ),

            MyTextfield(
              myHint: "Input Alamat",
              txtController: controller.txtAlamat,
            ),

            MyTextfield(
              myHint: "Input No. WhatsApp",
              txtController: controller.txtNoWa,
            ),

            MyTextfield(
              myHint: "Input Email",
              txtController: controller.txtEmail,
            ),

            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Obx(
                () => DropdownButton<String>(
                  value: controller.jenisKelamin.value.isEmpty
                      ? null
                      : controller.jenisKelamin.value,
                  isExpanded: true,
                  hint: const Text("Pilih Jenis Kelamin"),
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: "Laki-laki",
                      child: Text("Laki-laki"),
                    ),
                    DropdownMenuItem(
                      value: "Perempuan",
                      child: Text("Perempuan"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      controller.jenisKelamin.value = value;
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(
                  Routes.confirmRegistration,
                  arguments: {
                    'name': controller.txtNama.text,
                    'jenis_kelamin': controller.jenisKelamin.value,
                    'alamat': controller.txtAlamat.text,
                    'no_wa': controller.txtNoWa.text,
                    'email': controller.txtEmail.text,
                  },
                );
              },
              child: const Text("Send"),
            ),
          ],
        ),
      ),
    );
  }
}