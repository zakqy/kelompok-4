import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/pemesanan/controllers/pemesanan_controller.dart';

class PemesananView extends GetView<PemesananController> {
  const PemesananView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 250,
                height: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
              height: 10,
            ),
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
            SizedBox(height: 15,),
            TextField(
              controller: controller.cEmail,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: Color(0xFFD6D6D6),
                filled: true,
                labelText: "Masukkan Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cPassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Color(0xFFD6D6D6),
                filled: true,
                labelText: "Masukkan Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cTelp,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                fillColor: Color(0xFFD6D6D6),
                filled: true,
                labelText: "Masukkan Nomor Telepon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJumlah,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                fillColor: Color(0xFFD6D6D6),
                filled: true,
                labelText: "Jumlah Pemesanan Tiket",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity, // Mengisi lebar secara penuh
              child: ElevatedButton(
                onPressed: () {
                  controller.add(
                    controller.cPassword.text,
                    controller.cEmail.text,
                    controller.cTelp.text,
                    controller.cJumlah.text,
                  );
                },
                child: Text("Simpan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF005B1A),
                  foregroundColor: Colors.white, // Warna teks di tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
