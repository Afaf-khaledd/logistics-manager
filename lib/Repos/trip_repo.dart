import '../Models/trips_model.dart';

class TripRepository {
  final List<TripModel> _trips = [];

  List<TripModel> getTrips() => _trips;

  void addTrip(TripModel trip) => _trips.add(trip);

  void updateTripStatus(String id, TripStatus status) {
    final trip = _trips.firstWhere((t) => t.id == id);
    trip.status = status;
  }
}
