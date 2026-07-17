import 'package:flutter/material.dart';

import '../data/mock/truck_data.dart';
import '../models/truck.dart';

class TruckRepository extends ChangeNotifier {
  final List<Truck> _trucks = List.from(truckData);

  List<Truck> get trucks => List.unmodifiable(_trucks);

  void addTruck(Truck truck) {
    _trucks.add(truck);
    notifyListeners();
  }

  void removeTruck(Truck truck) {
    _trucks.remove(truck);
    notifyListeners();
  }

  void updateTruck(int index, Truck truck) {
    _trucks[index] = truck;
    notifyListeners();
  }
}