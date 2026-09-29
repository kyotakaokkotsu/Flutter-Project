import 'package:application_project/components/my_textfield.dart';
import 'package:application_project/controller/kalkulator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class KalkulatorPage extends StatelessWidget {
  KalkulatorPage({super.key});

  final controller = Get.put(KalkulatorController());

  @override
  Widget build(BuildContext context) {
    TextEditingController txtangka1 = TextEditingController();
    TextEditingController txtangka2 = TextEditingController();

    // Fungsi untuk mengecek input
    bool cekInput() {
      if (txtangka1.text.isEmpty || txtangka2.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Kedua angka harus diisi terlebih dahulu!"),
          ),
        );

        return false;
      }

      return true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator")),

      body: Column(
        children: [
          MyTextfieldCal(
            myHint: "input angka 1",
            txtController: txtangka1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),

          MyTextfieldCal(
            myHint: "input angka 2",
            txtController: txtangka2,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TAMBAH
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!cekInput()) return;
                  
                      controller.tambah(
                        double.parse(txtangka1.text),
                        double.parse(txtangka2.text),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 170, 255, 100),
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),

                // KURANG
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!cekInput()) return;
                  
                      controller.kurang(
                        double.parse(txtangka1.text),
                        double.parse(txtangka2.text),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 77, 77),
                    ),
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),

                // KALI
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!cekInput()) return;
                  
                      controller.kali(
                        double.parse(txtangka1.text),
                        double.parse(txtangka2.text),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 77, 83, 255),
                    ),
                    child: const Text(
                      "X",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),

                // BAGI
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!cekInput()) return;
                  
                      controller.bagi(
                        double.parse(txtangka1.text),
                        double.parse(txtangka2.text),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 136, 51),
                    ),
                    child: const Text(
                      ":",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // HASIL
          Obx(
            () => Text(
              controller.hasilHitung.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
