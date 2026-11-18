
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:application_project/models/produk_model.dart';
import 'package:application_project/models/data_model.dart';

class ListProdukController extends GetxController {
  RxList<ProdukModel> listProduk = <ProdukModel>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduk();
  }

  Future<void> fetchProduk() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final url = Uri.parse(
        'https://www.freetogame.com/api/games',
      );

      final response = await http
          .get(url)
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {

        final List<DataModel> data =
            dataModelFromJson(response.body);


        final hasilProduk = data.map((game) {
          return ProdukModel(
            namaProduk: game.title,
            harga: 'Free to Play',
            deskripsi: game.shortDescription,
            review: game.developer,
            rating: 0.0,
            namaToko: game.publisher,
            imageUrl: game.thumbnail,
          );
        }).toList();

        if (hasilProduk.isEmpty) {
          listProduk.clear();
          errorMessage.value = 'Data game tidak ditemukan';
        } else {
          listProduk.assignAll(hasilProduk);
        }
      } else {
        throw Exception(
          'Server memberikan status ${response.statusCode}',
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();

      Get.snackbar(
        'Gagal Mengambil Data',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
