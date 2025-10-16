import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        "id": "ORD123",
        "items": ["Carrots", "Spinach"],
        "total": 105,
        "status": "Delivered",
      },
      {
        "id": "ORD124",
        "items": ["Tomatoes", "Cauliflower"],
        "total": 90,
        "status": "Pending",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final List<String> items =
              (order["items"] as List<dynamic>).cast<String>();
          final String status = order["status"] as String;

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.green),
              title: Text("Order ID: ${order["id"]}"),
              subtitle: Text(
                "Items: ${items.join(", ")}\nTotal: ₹${order["total"]}",
              ),
              trailing: Text(
                status,
                style: TextStyle(
                  color: status == "Delivered" ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
