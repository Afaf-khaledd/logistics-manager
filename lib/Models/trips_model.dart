import 'drivers_model.dart';
import 'vehicles_model.dart';

enum TripStatus { pending, inProgress, completed }

class TripModel {
  final String id;
  final DriverModel driver;
  final VehicleModel vehicle;
  final String pickup;
  final String dropoff;
  TripStatus status;

  TripModel({
    required this.id,
    required this.driver,
    required this.vehicle,
    required this.pickup,
    required this.dropoff,
    this.status = TripStatus.pending,
  });

  String get statusText {
    switch (status) {
      case TripStatus.pending:
        return "Pending";
      case TripStatus.inProgress:
        return "In Progress";
      case TripStatus.completed:
        return "Completed";
    }
  }
}