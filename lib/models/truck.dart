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


  Truck copyWith({
    String? id,
    String? driver,
    String? status,
    bool? isOnline,
    String? location,
    String? capacity,
    String? cargo,
    int? fuel,
    String? lastUpdate,
  }) {
    return Truck(
      id: id ?? this.id,
      driver: driver ?? this.driver,
      status: status ?? this.status,
      isOnline: isOnline ?? this.isOnline,
      location: location ?? this.location,
      capacity: capacity ?? this.capacity,
      cargo: cargo ?? this.cargo,
      fuel: fuel ?? this.fuel,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }


  factory Truck.fromJson(Map<String, dynamic> json) {
    return Truck(
      id: json['id'] ?? '',
      driver: json['driver'] ?? '',
      status: json['status'] ?? '',
      isOnline: json['isOnline'] ?? false,
      location: json['location'] ?? '',
      capacity: json['capacity'] ?? '',
      cargo: json['cargo'] ?? '',
      fuel: json['fuel'] ?? 0,
      lastUpdate: json['lastUpdate'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "driver": driver,
      "status": status,
      "isOnline": isOnline,
      "location": location,
      "capacity": capacity,
      "cargo": cargo,
      "fuel": fuel,
      "lastUpdate": lastUpdate,
    };
  }
}