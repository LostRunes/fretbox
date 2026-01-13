import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Red circular icon
        Image.asset('assets/emergency.png', height: 70),

            const SizedBox(height: 12),

            // Title
            const Text(
              'Emergency Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 80),

            // Message
            const Text(
              'Emergency Support is  Not Available',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
