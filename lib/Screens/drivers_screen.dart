import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager/helper/get_statues_color.dart';

import '../Models/mock_data.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/status_card_item.dart';
import '../helper/bottom_nav_handler.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Drivers',),
      bottomNavigationBar: BottomNavHandler(currentIndex: 1),
      body: ListView.builder(
        itemCount: mockDrivers.length,
        itemBuilder: (context, index) {
          final driver = mockDrivers[index];
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
