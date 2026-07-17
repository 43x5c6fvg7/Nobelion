import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'repositories/truck_repository.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TruckRepository(),
      child: const NobelionApp(),
    ),
  );
}