import 'package:application_project/controller/list_produk_controller.dart';
import 'package:application_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});

  final controller = Get.put(ListProdukController());

  final Color cardColor = const Color.fromRGBO(23, 32, 48, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),backgroundColor: const Color.fromRGBO(23, 32, 48, 1),titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: controller.listProduk.length,
          itemBuilder: (context, index) {
            final produk = controller.listProduk[index];

            return Card(
              color: cardColor,
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Get.toNamed(
                    Routes.detailProduk,
                    arguments: produk,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              produk.namaProduk,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              produk.harga,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}