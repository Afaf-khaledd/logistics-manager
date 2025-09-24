import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistics_manager/utils/app_styles.dart';
import '../Managers/trip_cubit.dart';
import '../Models/mock_data.dart';
import '../Models/trips_model.dart';
import '../Models/drivers_model.dart';
import '../Models/vehicles_model.dart';
import '../Widgets/custom_app_bar.dart';
import '../utils/app_color.dart';

class AssignTripScreen extends StatefulWidget {
  const AssignTripScreen({super.key});

  @override
  State<AssignTripScreen> createState() => _AssignTripScreenState();
}

class _AssignTripScreenState extends State<AssignTripScreen> {
  DriverModel? selectedDriver;
  VehicleModel? selectedVehicle;
  final pickupController = TextEditingController();
  final dropoffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Assign New Trip"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Driver", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<DriverModel>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  hint: const Text("Select Driver"),
                  value: selectedDriver,
                  onChanged: (value) => setState(() => selectedDriver = value),
                  items: mockDrivers
                      .where((d) => d.status == DriverStatus.available)
                      .map((driver) => DropdownMenuItem(
                    value: driver,
                    child: Text(driver.name),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 16),

                const Text("Vehicle", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<VehicleModel>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  hint: const Text("Select Vehicle"),
                  value: selectedVehicle,
                  onChanged: (value) => setState(() => selectedVehicle = value),
                  items: mockVehicles
                      .where((v) => v.status == VehicleStatus.available)
                      .map((vehicle) => DropdownMenuItem(
                    value: vehicle,
                    child: Text(vehicle.name),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: pickupController,
                  decoration: const InputDecoration(
                    labelText: "Pickup Location",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: dropoffController,
                  decoration: const InputDecoration(
                    labelText: "Drop-off Location",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: _createTrip,
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: Text("Create Trip", style: AppStyles.styleMedium16.copyWith(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createTrip() {
    if (selectedDriver != null &&
        selectedVehicle != null &&
        pickupController.text.isNotEmpty &&
        dropoffController.text.isNotEmpty) {
      final trip = TripModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        driver: selectedDriver!,
        vehicle: selectedVehicle!,
        pickup: pickupController.text,
        dropoff: dropoffController.text,
      );

      // Add via Cubit
      context.read<TripCubit>().addTrip(trip);

      // Update driver & vehicle statuses
      selectedDriver!.status = DriverStatus.onTrip;
      selectedDriver!.assignedVehicleId = selectedVehicle!.id;
      selectedDriver!.lastTrip = trip.id;

      selectedVehicle!.status = VehicleStatus.assigned;
      selectedVehicle!.assignedDriver = selectedDriver!.id;
      selectedVehicle!.currentTrip = trip.id;

      Navigator.pop(context);
    }
  }
}