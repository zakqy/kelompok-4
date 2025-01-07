import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/pemesanan/controllers/pemesanan_controller.dart';


class PemesananView extends GetView<PemesananController> {
  const PemesananView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PemesananController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Image.asset("assets/bg.png"),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Nikmati liburan anda sekeluarga di Lembah Hijau",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005B1A),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Ayo pesan tiketmu sekarang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF005B1A),
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(132, 239, 238, 238),
                filled: true,
                labelText: "Masukkan Nama Pengunjung",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: controller.cJumlah,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(132, 239, 238, 238),
                filled: true,
                labelText: "Jumlah Pengunjung",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => controller.updateJumlahTiket(value),
            ),
            SizedBox(height: 10),

            TextField(
              controller: controller.cPembayaran,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(132, 239, 238, 238),
                filled: true,
                labelText: "Metode Pembayaran (Transfer Bank)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rincian Pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // Harga per tiket
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Harga Tiket"),
                        Text("Rp${controller.basePrice}/tiket"),
                      ],
                    )),
                    
                    SizedBox(height: 5),
                    
                    // Jumlah tiket
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jumlah Tiket"),
                        Text("${controller.jumlahTiket.value} tiket"),
                      ],
                    )),
                    
                    Divider(height: 20),
                    
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal untuk Produk"),
                        Text("Rp${controller.subtotalProduk}"),
                      ],
                    )),
                    
                    SizedBox(height: 5),
                    
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Layanan"),
                        Text("Rp${controller.biayaLayanan}"),
                      ],
                    )),
                    
                    SizedBox(height: 5),
                    
                    Divider(height: 20),
                    
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Pembayaran",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp${controller.totalPembayaran}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Pembayaran",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Obx(() => Text(
                      "Rp${controller.totalPembayaran}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700],
                      ),
                    )),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.add(
                    controller.cNama.text,
                    controller.cJumlah.text,
                    controller.totalPembayaran.value.toString(),
                    controller.cPembayaran.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF005B1A),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}