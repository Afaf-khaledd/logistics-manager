import 'package:flutter/material.dart';
import '../Models/drivers_model.dart';
import '../Models/trips_model.dart';
import '../Models/vehicles_model.dart';

Color getStatusColor(dynamic status) {
  if (status is VehicleStatus) {
    switch (status) {
      case VehicleStatus.available:
        return Colors.green;
      case VehicleStatus.assigned:
        return Colors.orange;
    }
  } else if (status is DriverStatus) {
    switch (status) {
      case DriverStatus.available:
        return Colors.green;
      case DriverStatus.onTrip:
        return Colors.orange;
    }
  }
  else if (status is TripStatus) {
    switch (status) {
      case TripStatus.completed:
        return Colors.green;
      case TripStatus.inProgress:
        return Colors.orange;
      case TripStatus.pending:
        return Colors.red;
    }
  }
  return Colors.grey;
}
