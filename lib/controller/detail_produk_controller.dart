import 'package:application_project/models/produk_model.dart';
import 'package:get/get.dart';

class DetailProdukController extends GetxController {
  late ProdukModel produk;

  @override
  void onInit() {
    super.onInit();

    produk = Get.arguments;
  }
}