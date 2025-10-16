import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sales Analytics")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.star, color: Colors.green),
              title: Text("Top Selling"),
              subtitle: Text("Tomato – 20kg/week"),
            ),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text("Low Selling"),
              subtitle: Text("Spinach – 2 bundles/week"),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.blue),
              title: Text("Order Peak Hours"),
              subtitle: Text("7 PM – 9 PM"),
            ),
          ],
        ),
      ),
    );
  }
}
