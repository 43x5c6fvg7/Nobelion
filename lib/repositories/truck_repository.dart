import '../data/mock/truck_data.dart';
import '../models/truck.dart';
import 'package:flutter/material.dart';

class TruckRepository extends ChangeNotifier {

  final List<Truck> _trucks = List.from(truckData);


  List<Truck> get trucks {
    return List.unmodifiable(_trucks);
  }


  void addTruck(Truck truck) {
    _trucks.add(truck);
  }


  void updateTruck(
    Truck oldTruck,
    Truck newTruck,
  ) {

    final index = _trucks.indexOf(oldTruck);

    if (index != -1) {
      _trucks[index] = newTruck;
    }

  }


  void deleteTruck(Truck truck) {
    _trucks.remove(truck);
  }

}