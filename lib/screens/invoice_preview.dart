import 'package:flutter/material.dart';

class InvoicePreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String item = args["item"]!;
    int qty = int.tryParse(args["qty"] ?? "0") ?? 0;
    int price = int.tryParse(args["price"] ?? "0") ?? 0;
    int total = qty * price;

    return Scaffold(
      appBar: AppBar(title: Text("Invoice Preview")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invoice #1001",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text("Item: $item"),
                Text("Quantity: $qty kg"),
                Text("Price per kg: ₹$price"),
                Divider(),
                Text(
                  "Total: ₹$total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Invoice Saved!")));
                    Navigator.pop(context);
                  },
                  child: Text("Save Invoice"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
