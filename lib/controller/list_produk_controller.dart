import 'package:application_project/models/produk_model.dart';
import 'package:get/get.dart';

class ListProdukController extends GetxController {
  List<ProdukModel> listProduk = [
    ProdukModel(
      namaProduk: "Samsung Galaxy Fold",
      harga: "10 juta",
      deskripsi:
          "Smartphone layar lipat dengan performa tinggi dan desain premium.",
      review: "HP sangat bagus dan layarnya jernih.",
      rating: 4.8,
      namaToko: "Samsung Official Store",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1P20LdyvfWGzvzjMT9l01wynOg1z0Vh0wmfjCaGUPrA&s=10",
    ),

    ProdukModel(
      namaProduk: "iPhone 20",
      harga: "25 juta",
      deskripsi:
          "iPhone dengan performa cepat, kamera berkualitas, dan desain modern.",
      review: "Kameranya bagus dan performanya sangat cepat.",
      rating: 4.9,
      namaToko: "Apple Official Store",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjaR3usY6HTP69Pj-0uAkiJwaxMM6cYFANxDGDAxo2XQ&s=10",
    ),

    ProdukModel(
      namaProduk: "Laptop ROG",
      harga: "30 juta",
      deskripsi:
          "Laptop gaming dengan performa tinggi untuk gaming dan pekerjaan berat.",
      review: "Cocok untuk gaming, performanya sangat kencang.",
      rating: 4.7,
      namaToko: "ROG Official Store",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVgjqPL65tHJcJGCFySGcxUcMxddFnkFioUv9ldcTH5g&s=10",
    ),

    ProdukModel(
      namaProduk: "PS 5",
      harga: "8 juta",
      deskripsi:
          "Konsol game generasi terbaru dengan performa grafis yang tinggi.",
      review: "Main game sangat lancar dan grafiknya bagus.",
      rating: 4.9,
      namaToko: "PlayStation Official Store",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsewg2LSVteJUOGbCQm173wGlrUR27F2Igf_uqFJ2ClA&s=10",
    ),

    ProdukModel(
      namaProduk: "Smart TV Android",
      harga: "10 juta",
      deskripsi:
          "Smart TV berbasis Android dengan layar besar dan berbagai aplikasi hiburan.",
      review: "Gambar bagus dan aplikasi streaming lengkap.",
      rating: 4.6,
      namaToko: "Electronic Store",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs4MmgrerpZp5veeQ9k1ZlgIFMWyIS9BFWNfVY7K0EPQ&s=10",
    ),
  ];
}