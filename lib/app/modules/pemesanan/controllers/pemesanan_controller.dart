import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PemesananController extends GetxController {
  // Text controllers
  final cNama = TextEditingController();
  final cJumlah = TextEditingController();
  final cPembayaran = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Observable variables with proper initialization
  final jumlahTiket = 0.obs;
  final subtotalProduk = 0.obs;
  final biayaLayanan = 2000.obs;
  final totalDiskon = 0.obs;
  final totalPembayaran = 0.obs;

  // Base price as observable
  final basePrice = 45000.obs;

  // Update jumlah tiket
  void updateJumlahTiket(String value) {
    try {
      jumlahTiket.value = int.parse(value);
      updateTotalHarga();
    } catch (e) {
      jumlahTiket.value = 0;
      updateTotalHarga();
    }
  }

  void updateTotalHarga() {
    // Calculate subtotal
    subtotalProduk.value = basePrice.value * jumlahTiket.value;

    // Calculate discount (5000 per ticket)
    totalDiskon.value = 5000 * jumlahTiket.value;

    // Calculate total payment
    totalPembayaran.value =
        subtotalProduk.value + biayaLayanan.value - totalDiskon.value;
  }

  void add(String nama, String jumlah, String harga, String pembayaran) async {
    CollectionReference pesantiket = firestore.collection("pesantiket");

    try {
      await pesantiket.add({
        "nama": nama,
        "jumlah": jumlah,
        "harga": harga,
        "pembayaran": pembayaran,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "pemesanan telah berhasil",
          onConfirm: () {
            cNama.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal memesan tiket",
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    updateTotalHarga();
  }

  @override
  void onClose() {
    cNama.dispose();
    cJumlah.dispose();
    cPembayaran.dispose();
    super.onClose();
  }
}
