import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C8BF5),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // 🔴 Permission warning box
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Text(
                'Local Notification Permission is not granted, please reinstall the app',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          const Spacer(),

          // 🔔 Empty state
          Column(
            children: [
              Image.asset(
                'assets/notif.png',
                height: 145,
              ),
              const SizedBox(height: 16),
              const Text(
                'No notification yet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "You'll see notifications here when they are available",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
