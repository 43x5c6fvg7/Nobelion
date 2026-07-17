import 'package:flutter/material.dart';

import '../../core/widgets/bottom_nav_bar.dart';
import '../fleet/fleet_screen.dart';
import '../orders/orders_screen.dart';
import '../ai/ai_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [
    DashboardPage(),
    FleetScreen(),
    OrdersScreen(),
    AiScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nobelion"),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: NobelionBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget buildCard(String title, String value, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 35, color: Colors.blue),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 5),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Welcome Back 👋",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),

        buildCard("Today's Orders", "125", Icons.inventory),
        buildCard("Active Trucks", "48", Icons.local_shipping),
        buildCard("Drivers Online", "36", Icons.person),
        buildCard("Today's Revenue", "\$12,450", Icons.attach_money),
      ],
    );
  }
}