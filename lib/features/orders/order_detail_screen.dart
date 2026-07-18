import 'package:flutter/material.dart';

import '../../models/trip.dart';

class OrderDetailScreen extends StatelessWidget {
  final Trip trip;

  const OrderDetailScreen({
    super.key,
    required this.trip,
  });

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case "completed":
        return Colors.green;

      case "in transit":
        return Colors.blue;

      case "loading":
        return Colors.orange;

      case "cancelled":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  double progressValue() {
    switch (trip.status.toLowerCase()) {
      case "loading":
        return 0.25;

      case "in transit":
        return 0.70;

      case "completed":
        return 1.0;

      default:
        return 0.0;
    }
  }

  Widget infoTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.indigo,
        ),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.id),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 45,
              backgroundColor: statusColor(trip.status),
              child: const Icon(
                Icons.local_shipping,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 18),

          Center(
            child: Chip(
              backgroundColor: statusColor(trip.status),
              label: Text(
                trip.status,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            "Trip Progress",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: progressValue(),
            minHeight: 12,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "${(progressValue() * 100).toInt()} %",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(height: 30),

          infoTile(
            Icons.local_shipping,
            "Truck",
            trip.truckId,
          ),

          infoTile(
            Icons.person,
            "Driver",
            trip.driver,
          ),

          infoTile(
            Icons.inventory_2,
            "Cargo",
            trip.cargo,
          ),

          infoTile(
            Icons.route,
            "Route",
            "${trip.from} → ${trip.to}",
          ),

          infoTile(
            Icons.calendar_today,
            "Departure",
            "${trip.departureDate.day}.${trip.departureDate.month}.${trip.departureDate.year}",
          ),

          infoTile(
            Icons.flag,
            "Arrival",
            trip.arrivalDate == null
                ? "Not arrived yet"
                : "${trip.arrivalDate!.day}.${trip.arrivalDate!.month}.${trip.arrivalDate!.year}",
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text(
                "Open Route",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: const Text(
                "Contact Driver",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}