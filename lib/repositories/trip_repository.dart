import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/mock/trip_data.dart';
import '../models/trip.dart';

class TripRepository extends ChangeNotifier {
  List<Trip> _trips = [];

  List<Trip> get trips => List.unmodifiable(_trips);

  Future<void> loadTrips() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("trips");

    if (data == null) {
      _trips = List.from(tripData);
      await saveTrips();
    } else {
      final List decoded = jsonDecode(data);

      _trips = decoded
          .map((item) => Trip.fromJson(item))
          .toList();
    }

    notifyListeners();
  }

  Future<void> saveTrips() async {
    final prefs = await SharedPreferences.getInstance();

    final data = jsonEncode(
      _trips.map((trip) => trip.toJson()).toList(),
    );

    await prefs.setString("trips", data);
  }

  Future<void> addTrip(Trip trip) async {
    _trips.add(trip);

    await saveTrips();

    notifyListeners();
  }

  Future<void> updateTrip(
    Trip oldTrip,
    Trip newTrip,
  ) async {
    final index = _trips.indexOf(oldTrip);

    if (index != -1) {
      _trips[index] = newTrip;

      await saveTrips();

      notifyListeners();
    }
  }

  Future<void> deleteTrip(Trip trip) async {
    _trips.remove(trip);

    await saveTrips();

    notifyListeners();
  }
}