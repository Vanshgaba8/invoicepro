import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stock = [
      {"name": "Tomato", "qty": "25 kg", "price": "₹40/kg"},
      {"name": "Potato", "qty": "40 kg", "price": "₹25/kg"},
      {"name": "Spinach", "qty": "10 bundles", "price": "₹15/bundle"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Manage Stock")),
      body: ListView.builder(
        itemCount: stock.length,
        itemBuilder: (c, i) {
          final item = stock[i];
          return Card(
            child: ListTile(
              title: Text(item["name"]!),
              subtitle: Text("${item["qty"]} • ${item["price"]}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add new stock coming soon!")),
          );
        },
      ),
    );
  }
}
