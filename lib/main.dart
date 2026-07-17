import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'repositories/truck_repository.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  final repository = TruckRepository();

  await repository.loadTrucks();


  runApp(

    ChangeNotifierProvider.value(
      value: repository,
      child: const NobelionApp(),
    ),

  );

}