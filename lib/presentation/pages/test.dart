import 'package:flutter/material.dart';
import 'package:serag_app/service/notification_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  void _showSimpleNotification() {
    NotificationService().showNotification(
      id: 1,
      title: 'إشعار محلي',
      body: 'هذا محتوى الإشعار 🎉',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإشعارات')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showSimpleNotification,
          child: const Text('أظهر إشعار'),
        ),
      ),
    );
  }
}
