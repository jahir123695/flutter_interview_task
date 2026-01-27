import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://interview.krishivikas.com/api";

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/user-login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      debugPrint("LOGIN RESPONSE: ${response.body}");

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return decoded;
      } else {
        throw Exception(decoded['message'] ?? "Login failed");
      }
    } catch (e) {
      throw Exception("Login Error: $e");
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/user-register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      debugPrint("REGISTER RESPONSE: ${response.body}");

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return decoded;
      } else {
        throw Exception(decoded['message'] ?? "Registration failed");
      }
    } catch (e) {
      throw Exception("Register Error: $e");
    }
  }

  Future<List<dynamic>> fetchNotifications({
    required String token,
    int skip = 0,
    int take = 10,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/dealer-notification-list"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "type": null,
          "category": null,
          "language": "en",
          "skip": skip,
          "take": take,
        }),
      );

      debugPrint("NOTIFICATION RESPONSE: ${response.body}");

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200 && decoded['success'] == true) {
        return decoded['data']['notification_data'] ?? [];
      } else {
        throw Exception(decoded['message'] ?? "Failed to load notifications");
      }
    } catch (e) {
      throw Exception("Notification Error: $e");
    }
  }
}
