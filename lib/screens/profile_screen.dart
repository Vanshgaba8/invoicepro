import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const sellerName = "Ramesh Kumar";
    const shopName = "Fresh Veggies Corner";
    const phone = "+91-9876543210";
    const email = "ramesh@invoicepro.com";

    return Scaffold(
      appBar: AppBar(title: const Text("Profile & Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Text("R", style: TextStyle(fontSize: 32)),
            ),
            const SizedBox(height: 20),
            Text(
              sellerName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(shopName, style: const TextStyle(color: Colors.grey)),
            const Divider(height: 40),
            ListTile(leading: const Icon(Icons.phone), title: Text(phone)),
            ListTile(leading: const Icon(Icons.email), title: Text(email)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
