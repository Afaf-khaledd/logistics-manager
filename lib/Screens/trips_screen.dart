import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager/utils/app_styles.dart';
import '../Managers/trip_cubit.dart';
import '../Managers/trip_state.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/status_card_item.dart';
import '../helper/bottom_nav_handler.dart';
import '../helper/get_statues_color.dart';
import '../utils/app_color.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Trips',),
      bottomNavigationBar: BottomNavHandler(currentIndex: 2),
      body: BlocBuilder<TripCubit, TripState>(
        builder: (context, state) {
          if (state is TripLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TripLoaded) {
            final trips = state.trips;
            if (trips.isEmpty) {
              return const Center(child: Text("No trips yet, Add a trip!",style: AppStyles.styleSemiBold20,));
            }
            return ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return StatusCardItem(
                    icon: Icons.person,
                    title: "Trip ID: ${trip.id}",
                    subtitle: "${trip.driver.name} → ${trip.vehicle.name}\n${trip.pickup} → ${trip.dropoff}",
                    trailingText: trip.statusText,
                    trailingColor: getStatusColor(trip.status),
                    onTap: () => context.push('/trip_details', extra: trip),
                  );
              },
            );
          } else if (state is TripError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: 'Tool a new trip',
        onPressed: () => context.push('/assign_trip'),
        child: const Icon(Icons.add),
      ),
    );
  }
}