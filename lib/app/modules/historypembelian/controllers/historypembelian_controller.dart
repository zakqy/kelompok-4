import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HistorypembelianController extends GetxController {
  //TODO: Implement HistorypembelianController

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  late TextEditingController cNama;
  late TextEditingController cJumlah;
  late TextEditingController cHarga;
  late TextEditingController cPembayaran;

Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("pesantiket").doc(id);
    return docRef.get();
  }

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pesantiket = firestore.collection('pesantiket');
    return pesantiket.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference pesantiket = firestore.collection('pesantiket');
    return pesantiket.snapshots();
  }

}
