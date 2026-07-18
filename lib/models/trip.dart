class Trip {
  final String id;
  final String truckId;
  final String driver;
  final String from;
  final String to;
  final String cargo;
  final String status;
  final DateTime departureDate;
  final DateTime? arrivalDate;

  const Trip({
    required this.id,
    required this.truckId,
    required this.driver,
    required this.from,
    required this.to,
    required this.cargo,
    required this.status,
    required this.departureDate,
    this.arrivalDate,
  });

  Trip copyWith({
    String? id,
    String? truckId,
    String? driver,
    String? from,
    String? to,
    String? cargo,
    String? status,
    DateTime? departureDate,
    DateTime? arrivalDate,
  }) {
    return Trip(
      id: id ?? this.id,
      truckId: truckId ?? this.truckId,
      driver: driver ?? this.driver,
      from: from ?? this.from,
      to: to ?? this.to,
      cargo: cargo ?? this.cargo,
      status: status ?? this.status,
      departureDate: departureDate ?? this.departureDate,
      arrivalDate: arrivalDate ?? this.arrivalDate,
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      truckId: json['truckId'],
      driver: json['driver'],
      from: json['from'],
      to: json['to'],
      cargo: json['cargo'],
      status: json['status'],
      departureDate: DateTime.parse(json['departureDate']),
      arrivalDate: json['arrivalDate'] != null
          ? DateTime.parse(json['arrivalDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "truckId": truckId,
      "driver": driver,
      "from": from,
      "to": to,
      "cargo": cargo,
      "status": status,
      "departureDate": departureDate.toIso8601String(),
      "arrivalDate": arrivalDate?.toIso8601String(),
    };
  }
}