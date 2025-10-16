import 'package:flutter/material.dart';

class AISuggestionsScreen extends StatelessWidget {
  const AISuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      {
        "title": "Increase Tomato Stock",
        "detail":
            "Tomatoes are trending in your area. Stock up to meet demand.",
      },
      {
        "title": "Offer Evening Discounts",
        "detail":
            "Most of your customers order between 6–9 PM. Offer small discounts at that time.",
      },
      {
        "title": "Spinach Low Demand",
        "detail":
            "Spinach hasn’t sold well in the past week. Consider reducing stock or offering bundle deals.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Suggestions"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: Colors.orange),
              title: Text(suggestion["title"]!),
              subtitle: Text(suggestion["detail"]!),
            ),
          );
        },
      ),
    );
  }
}
