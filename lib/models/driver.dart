class Driver {
  final String id;
  final String name;
  final String phone;
  final bool isAvailable;

  const Driver({
    required this.id,
    required this.name,
    required this.phone,
    required this.isAvailable,
  });

  Driver copyWith({
    String? id,
    String? name,
    String? phone,
    bool? isAvailable,
  }) {
    return Driver(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      isAvailable: json["isAvailable"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "isAvailable": isAvailable,
    };
  }
}