import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controllers.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                // Menambahkan logo
                Image.asset("assets/bg.png"),
                SizedBox(
                  height: 50,
                )
                // Jarak antara logo dan form
              ],
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xE9E9E9),
                  hintText: "Masukan Email anda",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 118, 118, 118)),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xE9E9E9),
                  hintText: "Masukan Password anda",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 118, 118, 118)),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.login(
                  controller.cEmail.text,
                  controller.cPass.text,
                );
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 0, 91, 26),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.RESET_PASSWORD);
                },
                child: Text("Reset Password"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ?"),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text("Daftar Disini"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
