import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/app/controllers/auth_controllers.dart';
import 'package:myapp/app/modules/historypembelian/views/historypembelian_view.dart';
import 'package:myapp/app/modules/home/views/beranda_view.dart';
import 'package:myapp/app/modules/pemesanan/views/pemesanan_view.dart';


import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  
  List<Map> _fragment = [
    {'title': 'Beranda', 'view': BerandaView()},
    {'title': 'Pesan Tiket', 'view': PemesananView()},
    {'title': 'Cari Jadwal', 'view': BerandaView()},
    {'title': 'History Pembelian', 'view': HistorypembelianView()},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF005B1A),
        titleSpacing: 0,
        title: Text(
          _fragment[_index]['title'],
          style: GoogleFonts.roboto(
              textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF005B1A)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "ZAKQY",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Obx(() => Text(
                      cAuth.userEmail.value,
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                SizedBox(height: 2),
                Text(
                  "",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
          // Home button
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color(0xFF005B1A),
            textColor: Color(0xFF005B1A),
          ),
          // Pesan Tiket button
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.shop),
            title: Text('Pesan Tiket'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color(0xFF005B1A),
            textColor: Color(0xFF005B1A),
          ),
          // Cari Jadwal button
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.calendar_today),
            title: Text('Cari Jadwal'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color(0xFF005B1A),
            textColor: Color(0xFF005B1A),
          ),
          // History Pembelian button
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.history_sharp),
            title: Text('History Pembelian'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color(0xFF005B1A),
            textColor: Color(0xFF005B1A),
          ),
          // Logout button
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color(0xFF005B1A),
            textColor: Color(0xFF005B1A),
          ),
        ],
      ),
    );
  }
}
