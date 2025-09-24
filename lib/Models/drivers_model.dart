enum DriverStatus { available, onTrip }

class DriversModel {
  final String id;
  final String name;
  final String licenseNumber;
  final DriverStatus status;
  final String? assignedVehicleId;
  final String? lastTrip;

  DriversModel({
    required this.id,
    required this.name,
    required this.licenseNumber,
    required this.status,
    this.assignedVehicleId,
    this.lastTrip,
  });

  String get statusText => status.name[0].toUpperCase() + status.name.substring(1);
}

