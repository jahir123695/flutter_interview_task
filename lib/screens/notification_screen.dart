import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../providers/auth_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<NotificationProvider>().fetchNotifications(refresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotificationProvider>();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff2d4a4c),
        title: const Text("Dealer Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().logout(context);
            },
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () => provider.fetchNotifications(refresh: true),
        child: provider.notifications.isEmpty && provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount:
                    provider.notifications.length +
                    (provider.isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == provider.notifications.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final item = provider.notifications[index];

                  return ListTile(
                    leading: item['image'] != null
                        ? Image.network(
                            item['image'],
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.notifications),

                    title: Text(
                      item['title'] ?? 'No title',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text(
                      item['description'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
