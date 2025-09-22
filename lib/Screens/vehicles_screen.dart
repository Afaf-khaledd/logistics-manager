import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager/Models/vehicles_model.dart';
import 'package:logistics_manager/utils/app_color.dart';

import '../Widgets/custom_app_bar.dart';
import '../helper/bottom_nav_handler.dart';
import '../helper/get_statues_color.dart';

class VehiclesScreen extends StatelessWidget {
  VehiclesScreen({super.key});

  final List<VehicleModel> mockVehicles = [
    VehicleModel(
      id: "V1",
      name: "Truck 1",
      type: VehicleType.truck,
      status: VehicleStatus.available,
    ),
    VehicleModel(
      id: "V2",
      name: "Van 2",
      type: VehicleType.van,
      status: VehicleStatus.assigned,
      assignedDriver: "D1",
      currentTrip: "T1",
    ),
    VehicleModel(
      id: "V3",
      name: "Bike 1",
      type: VehicleType.bike,
      status: VehicleStatus.available,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(title: 'Vehicles',),
      body: ListView.builder(
        itemCount: mockVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = mockVehicles[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.local_shipping, color: Colors.white),
              ),
              title: Text(
                "Vehicle ID: ${vehicle.id}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                vehicle.typeText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              trailing: Text(
                vehicle.statusText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: getStatusColor(vehicle.status),
                ),
              ),
              onTap: () {context.push('/vehicle_details', extra: vehicle);},
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavHandler(currentIndex: 0),
    );
  }
}