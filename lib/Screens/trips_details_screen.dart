import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistics_manager/utils/app_color.dart';
import '../Managers/trip_cubit.dart';
import '../Models/trips_model.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/details_item.dart';
import '../helper/get_statues_color.dart';

class TripDetailsScreen extends StatelessWidget {
  final TripModel trip;
  const TripDetailsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Trip ${trip.id}"),
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
                    Icon(Icons.local_shipping, color: AppColors.primary, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      "Trip ${trip.id}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30),
                DetailRow(title: "Driver", value: trip.driver.name),
                const SizedBox(height: 12),
                DetailRow(title: "Vehicle", value: trip.vehicle.name),
                const SizedBox(height: 12),
                DetailRow(title: "Pickup Location", value: trip.pickup),
                const SizedBox(height: 12),
                DetailRow(title: "Dropoff Location", value: trip.dropoff),
                const SizedBox(height: 12),
                // Status Row with Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButton<TripStatus>(
                      value: trip.status,
                      underline: const SizedBox(),
                      onChanged: (newStatus) {
                        if (newStatus != null) {
                          context.read<TripCubit>().updateTripStatus(trip.id, newStatus);
                          Navigator.pop(context);
                        }
                      },
                      items: TripStatus.values.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 12, color: getStatusColor(status)),
                              const SizedBox(width: 6),
                              Text(status.toString().split('.').last),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}