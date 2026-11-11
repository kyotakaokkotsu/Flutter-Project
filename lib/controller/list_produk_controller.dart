
import 'package:application_project/models/produk_model.dart';
import 'package:application_project/models/data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListProdukController extends GetxController {
  RxList<ProdukModel> listProduk = <ProdukModel>[].obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Mengambil data API secara otomatis
    fetchProduk();
  }

  Future<void> fetchProduk() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/searchteams.php?t=Arsenal",
      );

      final response = await http.get(url).timeout(
        const Duration(seconds: 20),
      );

      if (response.statusCode == 200) {
        // Parsing JSON menggunakan data_model
        final data = dataModelFromJson(response.body);

        // Mengubah data API menjadi ProdukModel
        final hasilProduk = data.teams.map((team) {
          return ProdukModel(
            namaProduk: team['strTeam'] ?? 'Nama tim tidak tersedia',

            harga: team['strLeague'] ?? 'Liga tidak tersedia',

            deskripsi: team['strDescriptionEN'] ??
                'Deskripsi tidak tersedia',

            review: team['strStadium'] ?? 'Stadion tidak tersedia',

            rating: 0.0,

            namaToko: team['strCountry'] ?? 'Negara tidak tersedia',

            imageUrl: team['strBadge'] ?? '',
          );
        }).toList();

        if (hasilProduk.isEmpty) {
          listProduk.clear();
          errorMessage.value = 'Data tim tidak ditemukan';
        } else {
          // Memasukkan seluruh hasil API ke dalam RxList
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
        "Gagal Mengambil Data",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
