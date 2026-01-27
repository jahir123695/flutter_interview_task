import 'package:flutter/material.dart';
import '../core/services/api_service.dart';
import '../core/storage/local_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> loginWithEmailPass(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await ApiService().login({
        "email": email,
        "password": password,
      });

      final token = res['data']['access_token'];
      await LocalStorage.saveToken(token);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Future<void> registerUser(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      notifyListeners();

      await ApiService().register(data);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    await LocalStorage.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
