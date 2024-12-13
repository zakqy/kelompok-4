import 'package:flutter/material.dart';

import 'package:get/get.dart';
class BerandaView extends StatelessWidget {
  const BerandaView({super.key});

   @override
  Widget build(BuildContext context) {
    // Data untuk slider
    final List<Map<String, String>> sliderData = [
      {
        'image': 'assets/lembah_hijau.jpg',
        'title': 'Eksplorasi Alam',
        'description': 'Nikmati keindahan alam dan berbagai fasilitas menarik di Lembah Hijau.',
      },
      {
        'image': 'assets/satwa.jpg',
        'title': 'Mengenal Satwa',
        'description': 'Pelajari lebih dekat berbagai jenis satwa yang dilestarikan di sini.',
      },
      {
        'image': 'assets/waterboom.jpg',
        'title': 'Wisata Air',
        'description': 'Rasakan keseruan bermain air di waterboom kami.',
      },
      {
        'image': 'assets/keluarga.jpg',
        'title': 'Liburan Keluarga',
        'description': 'Ciptakan kenangan tak terlupakan bersama keluarga Anda.',
      },
    ];

    final List<Map<String, String>> bottomSliderData = [
      {
        'image': 'assets/park.jpg',
        'title': 'Taman Hijau',
        'description': 'Relaksasi di taman hijau yang sejuk dan asri.',
      },
      {
        'image': 'assets/playground.jpg',
        'title': 'Area Bermain',
        'description': 'Nikmati waktu bermain bersama anak-anak di area bermain.',
      },
      {
        'image': 'assets/camping.jpg',
        'title': 'Camping Seru',
        'description': 'Pengalaman berkemah di alam terbuka yang menyenangkan.',
      },
      {
        'image': 'assets/event.jpg',
        'title': 'Acara Spesial',
        'description': 'Ikuti berbagai acara spesial yang diadakan di Lembah Hijau.',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image
            Image.asset(
              'assets/lembah_hijau.jpg', // Ganti dengan path gambar Anda
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Pusat Informasi Lembah Hijau',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Slider Section
            SizedBox(
              height: 250, // Tinggi slider
              child: PageView.builder(
                itemCount: sliderData.length, // Jumlah slide
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  final data = sliderData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              data['image']!, // Ganti dengan path gambar Anda
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data['description']!,
                                  style: const TextStyle(fontSize: 12),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Slider Section
            SizedBox(
              height: 250, // Tinggi slider
              child: PageView.builder(
                itemCount: bottomSliderData.length, // Jumlah slide
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  final data = bottomSliderData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              data['image']!, // Ganti dengan path gambar Anda
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data['description']!,
                                  style: const TextStyle(fontSize: 12),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BerandaView(),
  ));
}

