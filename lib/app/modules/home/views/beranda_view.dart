import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controllers.dart';

import 'package:myapp/app/modules/home/views/beranda_view.dart';


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
    {
      'title': 'Beranda',
      'view': BerandaView(),
    },
    {
      'title': 'pesan tiket',
      'view': BerandaView(),
    },
    {
      'title': 'pilih jadwal',
      'view': BerandaView(),
    },
    {
      'title': 'histori pembelian',
      'view': BerandaView(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 0, 91, 26),
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 91, 26),
              ),
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
                    "Dwi Cahyo Kuncoro",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'dwicahyokuncoro86@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(255, 0, 91, 26),
            textColor: Color.fromARGB(255, 0, 91, 26),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.shop),
            title: Text('pesan tiket'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(255, 0, 91, 26),
            textColor: Color.fromARGB(255, 0, 91, 26),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.calendar_today),
            title: Text('pilih jadwal'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(255, 0, 91, 26),
            textColor: Color.fromARGB(255, 0, 91, 26),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.history_sharp),
            title: Text('histori pembelian'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(255, 0, 91, 26),
            textColor: Color.fromARGB(255, 0, 91, 26),
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Keluar'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Color.fromARGB(255, 0, 91, 26),
            textColor: Color.fromARGB(255, 0, 91, 26),
          ),
        ],
      ),
    );
  }
}
