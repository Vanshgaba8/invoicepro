// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:invoicepro/screens/my_cart.dart';
import 'package:invoicepro/screens/order_history.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/buyer_dashboard_screen.dart';
import 'screens/seller_dashboard_screen.dart';
import 'screens/ai_health_recommendations.dart';

void main() {
  runApp(const InvoiceProApp());
}

class InvoiceProApp extends StatelessWidget {
  const InvoiceProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeggieCare',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // Default starting screen
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),

        // Buyer routes
        '/buyerDashboard': (context) => const BuyerDashboardScreen(),
        '/cart': (context) => const MyCartPage(),
        '/orders': (context) => const OrderHistoryPage(),
        '/recommendations': (context) => const AIHealthRecommendations(),

        // Seller routes
        '/sellerDashboard': (context) => const SellerDashboardScreen(),
      },
    );
  }
}
