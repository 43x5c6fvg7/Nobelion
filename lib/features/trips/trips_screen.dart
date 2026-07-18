import 'package:flutter/material.dart';

import '../../data/mock/trip_data.dart';
import '../../models/trip.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Trip> trips = tripData;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trips"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  trip.truckId.substring(trip.truckId.length - 1),
                ),
              ),
              title: Text(
                "${trip.from} → ${trip.to}",
              ),
              subtitle: Text(
                "${trip.driver}\n${trip.cargo}",
              ),
              trailing: Chip(
                label: Text(trip.status),
              ),
            ),
          );
        },
      ),
    );
  }
}