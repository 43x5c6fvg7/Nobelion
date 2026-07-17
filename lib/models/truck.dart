class Truck {
  final String id;
  final String driver;
  final String status;
  final bool isOnline;

  final String location;
  final String capacity;
  final String cargo;
  final int fuel;
  final String lastUpdate;

  Truck({
    required this.id,
    required this.driver,
    required this.status,
    required this.isOnline,
    required this.location,
    required this.capacity,
    required this.cargo,
    required this.fuel,
    required this.lastUpdate,
  });
}