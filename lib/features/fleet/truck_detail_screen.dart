import 'package:flutter/material.dart';
import '../../models/truck.dart';

class TruckDetailScreen extends StatelessWidget {
  final Truck truck;

  const TruckDetailScreen({
    super.key,
    required this.truck,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(truck.id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor:
                    truck.isOnline ? Colors.green : Colors.red,
                child: const Icon(
                  Icons.local_shipping,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Truck ID",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            Text(
              truck.id,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Driver",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            Text(
              truck.driver,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Status",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            Text(
              truck.status,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: truck.isOnline
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                truck.isOnline
                    ? "Truck is Online"
                    : "Truck is Offline",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}