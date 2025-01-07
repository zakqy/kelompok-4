import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/historypembelian_controller.dart';

class HistorypembelianView extends GetView<HistorypembelianController> {
  const HistorypembelianView({super.key});

  @override
    Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(HistorypembelianController()).StreamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // ambil data dari firebase
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.length > 0
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["jumlah"]}",
                        ),
                        Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}",
                        ),
                      ],
                    ),
                   
                  ),
                )
              : Center(
                  child: Text("Data Kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
