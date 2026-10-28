import 'package:application_project/controller/list_produk_controller.dart';
import 'package:application_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});

  final controller = Get.put(ListProdukController());

  final Color cardColor = const Color.fromRGBO(23, 32, 48, 1);

  // Membuka halaman detail produk
  void bukaDetail(dynamic produk) {
    Get.toNamed(
      Routes.detailProduk,
      arguments: produk,
    );
  }

  // Menghapus produk
  void hapusProduk(int index) {
    final produk = controller.listProduk[index];

    controller.listProduk.removeAt(index);

    Get.snackbar(
      "Produk Dihapus",
      "${produk.namaProduk} berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Refresh daftar produk
  Future<void> refreshProduk() async {
    await Future.delayed(const Duration(seconds: 1));

    // Data saat ini berasal dari list lokal di controller.
    // Tidak perlu mengisi ulang data jika hanya melakukan refresh.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
        backgroundColor: cardColor,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => RefreshIndicator(
            onRefresh: refreshProduk,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.listProduk.length,
              itemBuilder: (context, index) {
                final produk = controller.listProduk[index];

                return Dismissible(
                  key: ValueKey(produk.namaProduk),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    hapusProduk(index);
                  },
                  child: Card(
                    color: cardColor,
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onLongPressStart: (details) async {
                        final selected = await showMenu<String>(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx,
                            details.globalPosition.dy,
                            MediaQuery.of(context).size.width -
                                details.globalPosition.dx,
                            MediaQuery.of(context).size.height -
                                details.globalPosition.dy,
                          ),
                          items: const [
                            PopupMenuItem(
                              value: 'detail',
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(width: 10),
                                  Text("Lihat Detail"),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'hapus',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 10),
                                  Text("Hapus Produk"),
                                ],
                              ),
                            ),
                          ],
                        );

                        if (selected == 'detail') {
                          bukaDetail(produk);
                        } else if (selected == 'hapus') {
                          final konfirmasi = await Get.dialog<bool>(
                            AlertDialog(
                              title: const Text("Hapus Produk"),
                              content: Text(
                                "Yakin ingin menghapus ${produk.namaProduk}?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back(result: false);
                                  },
                                  child: const Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back(result: true);
                                  },
                                  child: const Text(
                                    "Hapus",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (konfirmasi == true) {
                            final currentIndex =
                                controller.listProduk.indexOf(produk);

                            if (currentIndex != -1) {
                              hapusProduk(currentIndex);
                            }
                          }
                        }
                      },
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          bukaDetail(produk);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}