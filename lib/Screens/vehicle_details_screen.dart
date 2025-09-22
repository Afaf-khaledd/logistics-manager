import 'package:flutter/material.dart';
import 'package:logistics_manager/utils/app_color.dart';
import '../Models/vehicles_model.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/details_item.dart';
import '../helper/get_statues_color.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final VehicleModel vehicle;
  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: vehicle.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.directions_car, color: AppColors.primary, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      "Vehicle ID: ${vehicle.id}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30),
                DetailRow(title: "Type", value: vehicle.typeText),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Status",
                  value: vehicle.statusText,
                  valueColor: getStatusColor(vehicle.status),
                ),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Assigned Driver",
                  value: vehicle.assignedDriver ?? "None",
                ),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Current Trip",
                  value: vehicle.currentTrip ?? "None",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}