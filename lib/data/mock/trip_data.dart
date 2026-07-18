import '../../models/trip.dart';

final List<Trip> tripData = [
  Trip(
    id: "TRIP-001",
    truckId: "TRUCK-001",
    driver: "John Smith",
    from: "Tashkent",
    to: "Samarkand",
    cargo: "Electronics",
    status: "In Transit",
    departureDate: DateTime(2026, 7, 19, 8, 0),
    arrivalDate: null,
  ),
  Trip(
    id: "TRIP-002",
    truckId: "TRUCK-002",
    driver: "David Brown",
    from: "Samarkand",
    to: "Bukhara",
    cargo: "Food",
    status: "Completed",
    departureDate: DateTime(2026, 7, 18, 9, 30),
    arrivalDate: DateTime(2026, 7, 18, 16, 45),
  ),
  Trip(
    id: "TRIP-003",
    truckId: "TRUCK-003",
    driver: "Michael Lee",
    from: "Andijan",
    to: "Tashkent",
    cargo: "Textiles",
    status: "Loading",
    departureDate: DateTime(2026, 7, 20, 7, 0),
    arrivalDate: null,
  ),
];