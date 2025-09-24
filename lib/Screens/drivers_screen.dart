import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager/Models/drivers_model.dart';
import 'package:logistics_manager/helper/get_statues_color.dart';

import '../Widgets/custom_app_bar.dart';
import '../Widgets/status_card_item.dart';
import '../helper/bottom_nav_handler.dart';

class DriversScreen extends StatelessWidget {
  DriversScreen({super.key});

  final List<DriversModel> drivers = [
    DriversModel(
      id: 'D1',
      name: 'Ahmed Ali',
      licenseNumber: 'ABC12345',
      status: DriverStatus.available,
    ),
    DriversModel(
      id: 'D2',
      name: 'Salah Mohamed',
      licenseNumber: 'XYZ98765',
      status: DriverStatus.onTrip,
      assignedVehicleId: 'V2',
      lastTrip: 'T2',
    ),
    DriversModel(
      id: 'D3',
      name: 'Kareem Mohamed',
      licenseNumber: 'ASD12985',
      status: DriverStatus.available,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Drivers',),
      bottomNavigationBar: BottomNavHandler(currentIndex: 1),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return StatusCardItem(
            icon: Icons.person,
            title: driver.name,
            subtitle: "License: ${driver.licenseNumber}",
            trailingText: driver.statusText,
            trailingColor: getStatusColor(driver.status),
            onTap: () => context.push('/driver_details', extra: driver),
          );
        },
      ),
    );
  }
}
