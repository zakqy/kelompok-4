import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PemesananController extends GetxController {
  //TODO: Implement PemesananController

  late TextEditingController cPassword;
  late TextEditingController cEmail;
  late TextEditingController cTelp;
  late TextEditingController cJumlah;

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("pemesanan").doc(id);

    return docRef.get();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pemesanan = firestore.collection('pemesanan');

    return pemesanan.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference pemesanan = firestore.collection('pemesanan');

    return pemesanan.snapshots();
  }

  void add(String password, String email, String telp, String jumlah) async {
    CollectionReference pemesanan = firestore.collection("pemesanan");

    try {
      await pemesanan.add({
        "password": password,
        "email": email,
        "telp": telp,
        "jumlah": jumlah,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pemesanan",
          onConfirm: () {
            cPassword.clear();
            cEmail.clear();
            cTelp.clear();
            cJumlah.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pemesanan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("pemesanan").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cPassword = TextEditingController();
    cEmail = TextEditingController();
    cTelp = TextEditingController();
    cJumlah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cPassword = TextEditingController();
    cEmail = TextEditingController();
    cTelp = TextEditingController();
    cJumlah = TextEditingController();
    super.onClose();
  }
}
