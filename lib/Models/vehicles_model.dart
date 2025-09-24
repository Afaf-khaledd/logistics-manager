enum VehicleType { truck, van, bike }
enum VehicleStatus { available, assigned }

class VehicleModel {
  final String id;
  final String name;
  final VehicleType type;
  VehicleStatus status;
  String? assignedDriver;
  String? currentTrip;

  VehicleModel({
    required this.id,
    required this.name,
    required this.type,
    this.status = VehicleStatus.available,
    this.assignedDriver,
    this.currentTrip,
  });

  String get typeText {
    switch (type) {
      case VehicleType.truck:
        return "Truck";
      case VehicleType.van:
        return "Van";
      case VehicleType.bike:
        return "Bike";
    }
  }

  String get statusText =>
      status == VehicleStatus.available ? "Available" : "Assigned";
}