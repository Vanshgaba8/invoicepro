import 'package:flutter/material.dart';

class AIHealthRecommendations extends StatelessWidget {
  const AIHealthRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data (in real app → fetched from profile/location API)
    const userLocation = "Delhi";
    final currentMonth = DateTime.now().month;

    // Seasonal recommendations map
    final Map<String, Map<int, List<String>>> seasonalVeggies = {
      "Delhi": {
        1: ["Carrots", "Cauliflower", "Spinach"], // Jan
        2: ["Carrots", "Radish", "Peas"],
        3: ["Cabbage", "Tomatoes", "Beetroot"],
        4: ["Cucumber", "Bottle Gourd", "Okra"],
        5: ["Bitter Gourd", "Cucumber", "Pumpkin"],
        6: ["Corn", "Cucumber", "Bottle Gourd"],
        7: ["Ladyfinger", "Pumpkin", "Bitter Gourd"],
        8: ["Spinach", "Beans", "Bottle Gourd"],
        9: ["Cauliflower", "Spinach", "Carrots"],
        10: ["Cabbage", "Radish", "Fenugreek"],
        11: ["Carrots", "Cauliflower", "Turnip"],
        12: ["Carrots", "Spinach", "Radish"],
      },
      "Mumbai": {
        1: ["Green Peas", "Cabbage", "Carrots"],
        5: ["Cucumber", "Bottle Gourd", "Pumpkin"],
        7: ["Bitter Gourd", "Drumstick", "Cucumber"],
        12: ["Spinach", "Cauliflower", "Carrots"],
      },
    };

    // Fallback if location/month not found
    final seasonalList =
        seasonalVeggies[userLocation]?[currentMonth] ??
        ["Tomatoes", "Onions", "Potatoes"]; // always available

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Health Recommendations"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location: $userLocation",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Month: ${_monthName(currentMonth)}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Recommended Seasonal Vegetables:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: seasonalList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(
                        Icons.local_florist,
                        color: Colors.green,
                      ),
                      title: Text(seasonalList[index]),
                      subtitle: const Text("Fresh & best for this season"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month];
  }
}
