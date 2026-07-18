import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'repositories/truck_repository.dart';
import 'repositories/driver_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TruckRepository()..loadTrucks(),
        ),
        ChangeNotifierProvider(
          create: (_) => DriverRepository()..loadDrivers(),
        ),
      ],
      child: const NobelionApp(),
    ),
  );
}