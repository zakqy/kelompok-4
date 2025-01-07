import 'package:myapp/app/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();
  final cCpass = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    cPass.dispose();
    cCpass.dispose();
    super.onClose();
  }
}
