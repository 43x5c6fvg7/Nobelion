import '../data/mock/truck_data.dart';
import '../models/truck.dart';

class TruckRepository {
  final List<Truck> _trucks = List.from(truckData);

  List<Truck> getAllTrucks() {
    return List.from(_trucks);
  }

  void addTruck(Truck truck) {
    _trucks.add(truck);
  }

  void removeTruck(Truck truck) {
    _trucks.remove(truck);
  }

  void updateTruck(int index, Truck truck) {
    _trucks[index] = truck;
  }
}