import 'package:flutter/material.dart';
import '../core/services/api_service.dart';
import '../core/storage/local_storage.dart';

class NotificationProvider extends ChangeNotifier {
  List notifications = [];
  bool isLoading = false;
  int skip = 0;
  final int take = 10;
  bool hasMore = true;

  Future<void> fetchNotifications({bool refresh = false}) async {
    if (isLoading) return;

    if (refresh) {
      skip = 0;
      notifications.clear();
      hasMore = true;
    }

    try {
      isLoading = true;
      notifyListeners();

      final token = await LocalStorage.getToken();
      if (token == null) throw Exception("Token not found");

      final data = await ApiService().fetchNotifications(
        token: token,
        skip: skip,
        take: take,
      );

      notifications.addAll(data);

      if (data.isEmpty) {
        hasMore = false;
      } else {
        notifications.addAll(data);
        skip += take;
      }
    } catch (e) {
      debugPrint("Notification API Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
