import 'package:flutter/material.dart';

class FleetScreen extends StatelessWidget {
  const FleetScreen({super.key});

  Widget truckCard({
    required String truck,
    required String driver,
    required String status,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(
            Icons.local_shipping,
            color: Colors.white,
          ),
        ),
        title: Text(
          truck,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Driver: $driver\nStatus: $status",
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fleet"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          truckCard(
            truck: "Truck #001",
            driver: "Ali",
            status: "Online",
            color: Colors.green,
          ),

          truckCard(
            truck: "Truck #002",
            driver: "Bekzod",
            status: "Delivering",
            color: Colors.blue,
          ),

          truckCard(
            truck: "Truck #003",
            driver: "Aziz",
            status: "Maintenance",
            color: Colors.red,
          ),

          truckCard(
            truck: "Truck #004",
            driver: "Jasur",
            status: "Offline",
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}