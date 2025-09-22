import 'package:flutter/material.dart';
import '../Models/vehicles_model.dart';

Color getStatusColor(VehicleStatus status) {
  switch (status) {
    case VehicleStatus.available:
      return Colors.green;
    case VehicleStatus.assigned:
      return Colors.orange;
  }
}
