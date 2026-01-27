import 'package:flutter/material.dart';
import '../core/storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    final token = await LocalStorage.getToken();
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      token == null ? '/login' : '/notifications',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset('images/splash_img.jpg'),
          ),
          const SizedBox(height: 30),
          Center(child: CircularProgressIndicator(color: Color(0xff2d4a4c))),
        ],
      ),
    );
  }
}
