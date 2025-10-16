import 'package:flutter/material.dart';

class BuyerDashboardScreen extends StatelessWidget {
  const BuyerDashboardScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login', // ✅ redirect to login route
      (route) => false, // clear navigation stack
    );
  }

  @override
  Widget build(BuildContext context) {
    const buyerName = "Anita Sharma";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyer Dashboard"),
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
              leading: const CircleAvatar(child: Text("A")),
              title: const Text(
                buyerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Welcome back!"),
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
                    Icons.local_florist,
                    "Today’s Recommendations",
                    "/recommendations", // ✅ AI Health Recommendations
                  ),
                  _buildCard(
                    context,
                    Icons.shopping_cart,
                    "My Cart",
                    "/cart", // ✅ Cart Page
                  ),
                  _buildCard(
                    context,
                    Icons.history,
                    "Order History",
                    "/orders", // ✅ Order History Page
                  ),
                  _buildCard(
                    context,
                    Icons.health_and_safety,
                    "Health Suggestions",
                    "/recommendations", // ✅ Again AI Recommendations
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
    String routeName,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(context, routeName);
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
