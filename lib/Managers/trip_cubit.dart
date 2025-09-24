import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/drivers_model.dart';
import '../Models/trips_model.dart';
import '../Models/vehicles_model.dart';
import '../Repos/trip_repo.dart';
import 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  final TripRepository repository;

  TripCubit(this.repository) : super(TripInitial());

  void loadTrips() {
    emit(TripLoading());
    try {
      final trips = repository.getTrips();
      emit(TripLoaded(trips));
    } catch (e) {
      emit(TripError("Failed to load trips: $e"));
    }
  }

  void addTrip(TripModel trip) {
    if (state is TripLoaded) {
      repository.addTrip(trip);
      final trips = repository.getTrips();
      emit(TripLoaded(List.from(trips)));
    }
  }

  void updateTripStatus(String tripId, TripStatus newStatus) {
    if (state is TripLoaded) {
      final currentState = state as TripLoaded;
      final trips = List<TripModel>.from(currentState.trips);

      final index = trips.indexWhere((t) => t.id == tripId);
      if (index != -1) {
        final updatedTrip = trips[index];
        updatedTrip.status = newStatus;

        if (newStatus == TripStatus.completed) {
          updatedTrip.driver.status = DriverStatus.available;
          updatedTrip.driver.assignedVehicleId = null;

          updatedTrip.vehicle.status = VehicleStatus.available;
          updatedTrip.vehicle.assignedDriver = null;
          updatedTrip.vehicle.currentTrip = null;
        }

        trips[index] = updatedTrip;
        emit(TripLoaded(trips));
      }
    }
  }
}