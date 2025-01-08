import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/historypembelian_controller.dart';

class HistorypembelianView extends GetView<HistorypembelianController> {
  const HistorypembelianView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Desember 2024',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: Get.put(HistorypembelianController()).StreamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    // Ambil data dari Firestore
                    var listAllDocs = snapshot.data?.docs ?? [];
                    return listAllDocs.isNotEmpty
                        ? ListView.builder(
                            itemCount: listAllDocs.length,
                            itemBuilder: (context, index) {
                              // Data dari Firestore
                              var data = listAllDocs[index].data() as Map<String, dynamic>;
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Color(0xFF005B1A),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                data["nama"] ?? "Nama tidak tersedia",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.people,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "${data["jumlah"]} Pengunjung",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.account_balance_wallet,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 8),
                                              Image.asset(
                                                'assets/pembayaran.jpg',
                                                width: 24,
                                                height: 24,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/bg1.png',
                                          width: 60,
                                          height: 60,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Total Harga: Rp. ${data["harga"] ?? "0"}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Text("Data Kosong"),
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
