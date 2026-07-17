import 'package:flutter/material.dart';

import '../../data/mock/truck_data.dart';
import '../../models/truck.dart';
import 'widgets/fleet_search.dart';
import 'widgets/truck_card.dart';

class FleetScreen extends StatefulWidget {
  const FleetScreen({super.key});

  @override
  State<FleetScreen> createState() => _FleetScreenState();
}

class _FleetScreenState extends State<FleetScreen> {
  late List<Truck> trucks;
  late List<Truck> filteredTrucks;

  @override
  void initState() {
    super.initState();

    trucks = List.from(truckData);
    filteredTrucks = List.from(trucks);
  }

  void searchTruck(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTrucks = List.from(trucks);
      } else {
        filteredTrucks = trucks.where((truck) {
          return truck.id.toLowerCase().contains(query.toLowerCase()) ||
              truck.driver.toLowerCase().contains(query.toLowerCase()) ||
              truck.status.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fleet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FleetSearch(
              onChanged: searchTruck,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredTrucks.length,
                itemBuilder: (context, index) {
                  return TruckCard(
                    truck: filteredTrucks[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}