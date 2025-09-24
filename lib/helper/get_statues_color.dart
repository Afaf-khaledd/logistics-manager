import 'package:flutter/material.dart';
import '../Models/drivers_model.dart';
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
  return Colors.grey;
}
