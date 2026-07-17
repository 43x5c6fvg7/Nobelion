import 'package:flutter/material.dart';

import '../../data/mock/truck_data.dart';
import '../../models/truck.dart';
import 'widgets/truck_card.dart';

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

          return TruckCard(
            truck: truck,
          );
        },
      ),
    );
  }
}