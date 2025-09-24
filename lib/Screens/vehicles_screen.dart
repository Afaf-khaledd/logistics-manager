import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Models/mock_data.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/status_card_item.dart';
import '../helper/bottom_nav_handler.dart';
import '../helper/get_statues_color.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

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
          return StatusCardItem(
            icon: Icons.local_shipping,
            title: "Vehicle ID: ${vehicle.id}",
            subtitle: vehicle.typeText,
            trailingText: vehicle.statusText,
            trailingColor: getStatusColor(vehicle.status),
            onTap: () => context.push('/vehicle_details', extra: vehicle),
          );
        },
      ),
      bottomNavigationBar: BottomNavHandler(currentIndex: 0),
    );
  }
}