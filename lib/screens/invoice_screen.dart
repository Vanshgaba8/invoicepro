import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final List<Map<String, dynamic>> items = [
    {"name": "Tomato", "qty": 2, "price": 40},
    {"name": "Potato", "qty": 5, "price": 25},
  ];

  @override
  Widget build(BuildContext context) {
    double total = items.fold(
      0,
      (sum, item) => sum + (item["qty"] * item["price"]).toDouble(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Generate Invoice")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              title: Text("Ramesh Kumar"),
              subtitle: Text("Fresh Veggies Corner"),
              leading: CircleAvatar(child: Text("R")),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) {
                  final item = items[i];
                  return ListTile(
                    title: Text("${item["name"]} - ${item["qty"]}kg"),
                    trailing: Text(
                      "₹${(item["qty"] * item["price"]).toString()}",
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              "Total: ₹$total",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Invoice PDF generated successfully!"),
                  ),
                );
              },
              child: const Text("Generate PDF Invoice"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.mic, color: Colors.white, size: 28),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("🎤 Listening for items..."),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
