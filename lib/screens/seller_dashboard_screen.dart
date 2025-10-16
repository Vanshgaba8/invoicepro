import 'package:flutter/material.dart';
import 'invoice_screen.dart';
import 'stock_screen.dart';
import 'analytics_screen.dart';
import 'profile_screen.dart';
import 'ai_suggestions_screen.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login', // ✅ back to login page
      (route) => false, // clear history
    );
  }

  @override
  Widget build(BuildContext context) {
    const sellerName = "Ramesh Kumar";
    const shopName = "Fresh Veggies Corner";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seller Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            tooltip: "Logout",
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(child: Text("R")),
              title: const Text(
                sellerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(shopName),
              trailing: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => const ProfileScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildCard(
                    context,
                    Icons.receipt_long,
                    "Generate Invoice",
                    const InvoiceScreen(),
                  ),
                  _buildCard(
                    context,
                    Icons.store,
                    "Manage Stock",
                    const StockScreen(),
                  ),
                  _buildCard(
                    context,
                    Icons.bar_chart,
                    "Analytics",
                    const AnalyticsScreen(),
                  ),
                  _buildCard(
                    context,
                    Icons.lightbulb, // ✅ AI icon
                    "AI Suggestions",
                    const AISuggestionsScreen(),
                  ),
                  _buildCard(
                    context,
                    Icons.settings,
                    "Profile",
                    const ProfileScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    IconData icon,
    String label,
    Widget page,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              const SizedBox(height: 10),
              Text(label, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
