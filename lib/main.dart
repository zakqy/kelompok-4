import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controllers.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobile II IF 22 C',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Langsung arahkan ke SplashScreen
      getPages: AppPages.routes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Menjalankan logika setelah durasi splash selesai
    Future.delayed(Duration(seconds: 5), () async {
      final CAuth = Get.find<AuthController>();
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        Get.offAllNamed(
            Routes.HOME); 
      } else {
        Get.offAllNamed(Routes.LOGIN); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF005B1A), 
                    Color(0xFF00C137), 
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                ),
              ),
            ),
              Center(
                child: Container(
                width: 250,
                height: 250, 
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
  
                  ),
                ),
                            ),
              ),

          ],
        ),
    );
  }
}
