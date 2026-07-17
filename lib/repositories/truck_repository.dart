import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/mock/truck_data.dart';
import '../models/truck.dart';


class TruckRepository extends ChangeNotifier {

  List<Truck> _trucks = [];


  List<Truck> get trucks =>
      List.unmodifiable(_trucks);



  Future<void> loadTrucks() async {

    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("trucks");


    if (data == null) {

      _trucks = List.from(truckData);

      await saveTrucks();

    } else {

      final List decoded = jsonDecode(data);

      _trucks = decoded
          .map(
            (item) => Truck.fromJson(item),
          )
          .toList();

    }


    notifyListeners();

  }



  Future<void> saveTrucks() async {

    final prefs = await SharedPreferences.getInstance();


    final data = jsonEncode(
      _trucks
          .map(
            (truck) => truck.toJson(),
          )
          .toList(),
    );


    await prefs.setString(
      "trucks",
      data,
    );

  }



  Future<void> addTruck(Truck truck) async {

    _trucks.add(truck);

    await saveTrucks();

    notifyListeners();

  }



  Future<void> updateTruck(
    Truck oldTruck,
    Truck newTruck,
  ) async {


    final index = _trucks.indexOf(oldTruck);


    if (index != -1) {

      _trucks[index] = newTruck;

      await saveTrucks();

      notifyListeners();

    }

  }




  Future<void> deleteTruck(
    Truck truck,
  ) async {

    _trucks.remove(truck);

    await saveTrucks();

    notifyListeners();

  }

}