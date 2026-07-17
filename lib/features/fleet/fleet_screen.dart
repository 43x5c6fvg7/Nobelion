import 'package:flutter/material.dart';
import '../../models/truck.dart';
import 'truck_detail_screen.dart';
import '../../data/mock/truck_data.dart';

class FleetScreen extends StatelessWidget {
  FleetScreen({super.key});

 final List<Truck> trucks = truckData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fleet"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trucks.length,
        itemBuilder: (context, index) {
          final truck = trucks[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            elevation: 3,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TruckDetailScreen(
                      truck: truck,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor:
                    truck.isOnline ? Colors.green : Colors.red,
                child: const Icon(
                  Icons.local_shipping,
                  color: Colors.white,
                ),
              ),
              title: Text(
                truck.id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Driver: ${truck.driver}\nStatus: ${truck.status}",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          );
        },
      ),
    );
  }
}