import 'package:flutter/material.dart';
import 'package:logistics_manager/Models/drivers_model.dart';
import 'package:logistics_manager/utils/app_color.dart';

import '../Widgets/custom_app_bar.dart';
import '../Widgets/details_item.dart';
import '../helper/get_statues_color.dart';

class DriverDetailsScreen extends StatelessWidget {
  final DriversModel driver;
  const DriverDetailsScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: AppColors.primary, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      driver.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30),
                DetailRow(title: "License Number", value: driver.licenseNumber),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Status",
                  value: driver.status == DriverStatus.available ? "Available" : "On Trip",
                  valueColor: getStatusColor(driver.status),
                ),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Assigned Vehicle",
                  value: driver.assignedVehicleId ?? "None",
                ),
                const SizedBox(height: 12),
                DetailRow(
                  title: "Ongoing/Last Trip",
                  value: driver.lastTrip ?? "None",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}