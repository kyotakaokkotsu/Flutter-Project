import 'package:application_project/controller/detail_produk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProdukPage extends StatelessWidget {
  DetailProdukPage({super.key});

  final controller = Get.put(DetailProdukController());

  final Color cardColor = const Color.fromRGBO(23, 32, 48, 1);

  @override
  Widget build(BuildContext context) {
    final produk = controller.produk;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),

        child: Card(
          color: cardColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAMA 
                Text(
                  produk.namaProduk,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // GAMBAR 
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),

                  child: Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.white,
                    child: Image.network(
                      produk.imageUrl,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.contain,

                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const SizedBox(
                          height: 220,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },

                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 220,
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // HARGA
                const Text(
                  "Harga",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),

                const SizedBox(height: 5),

                Text(
                  produk.harga,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // DESKRIPSI
                const Text(
                  "Deskripsi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  produk.deskripsi,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                // REVIEW
                const Text(
                  "Review",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  produk.review,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 15),

                // RATING
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 25),

                    const SizedBox(width: 8),

                    Text(
                      produk.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // NAMA TOKO
                const Text(
                  "Nama Toko",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  produk.namaToko,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
