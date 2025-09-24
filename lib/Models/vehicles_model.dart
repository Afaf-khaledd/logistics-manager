enum VehicleStatus { available, assigned }
enum VehicleType { truck, van, bike, car, bus }

class VehicleModel {
  final String id;
  final String name;
  final VehicleType type;
  final VehicleStatus status;
  final String? assignedDriver;
  final String? currentTrip;

  VehicleModel({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    this.assignedDriver,
    this.currentTrip,
  });

  String get typeText => type.name[0].toUpperCase() + type.name.substring(1);
  String get statusText => status.name[0].toUpperCase() + status.name.substring(1);
}
