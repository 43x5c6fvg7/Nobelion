import 'package:flutter/material.dart';

import '../../data/mock/trip_data.dart';
import '../../models/trip.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Trip> trips;
  late List<Trip> filteredTrips;

  @override
  void initState() {
    super.initState();
    trips = List.from(tripData);
    filteredTrips = List.from(trips);
  }

  void searchTrip(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTrips = List.from(trips);
      } else {
        filteredTrips = trips.where((trip) {
          return trip.id.toLowerCase().contains(query.toLowerCase()) ||
              trip.driver.toLowerCase().contains(query.toLowerCase()) ||
              trip.from.toLowerCase().contains(query.toLowerCase()) ||
              trip.to.toLowerCase().contains(query.toLowerCase()) ||
              trip.status.toLowerCase().contains(query.toLowerCase()) ||
              trip.truckId.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search Orders...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: searchTrip,
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: filteredTrips.length,
              itemBuilder: (context, index) {
                final trip = filteredTrips[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OrderDetailScreen(
                            trip: trip,
                          ),
                        ),
                      );
                    },

                    contentPadding: const EdgeInsets.all(16),

                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: statusColor(trip.status),
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.white,
                      ),
                    ),

                    title: Text(
                      trip.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("🚚 Truck: ${trip.truckId}"),
                          const SizedBox(height: 4),

                          Text("👤 Driver: ${trip.driver}"),
                          const SizedBox(height: 4),

                          Text("📦 Cargo: ${trip.cargo}"),
                          const SizedBox(height: 4),

                          Text("📍 ${trip.from} → ${trip.to}"),
                          const SizedBox(height: 4),

                          Text(
                            "🕒 ${trip.departureDate.day}.${trip.departureDate.month}.${trip.departureDate.year}",
                          ),
                        ],
                      ),
                    ),

                    trailing: Chip(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}