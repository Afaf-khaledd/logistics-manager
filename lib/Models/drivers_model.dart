enum DriverStatus { available, onTrip }

class DriverModel {
  final String id;
  final String name;
  final String licenseNumber;
  DriverStatus status;
  String? assignedVehicleId;
  String? lastTrip;

  DriverModel({
    required this.id,
    required this.name,
    required this.licenseNumber,
    this.status = DriverStatus.available,
    this.assignedVehicleId,
    this.lastTrip,
  });

  String get statusText =>
      status == DriverStatus.available ? "Available" : "On Trip";
}