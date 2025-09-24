import 'package:equatable/equatable.dart';
import '../Models/trips_model.dart';

abstract class TripState extends Equatable {
  const TripState();

  @override
  List<Object?> get props => [];
}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripLoaded extends TripState {
  final List<TripModel> trips;
  const TripLoaded(this.trips);

  @override
  List<Object?> get props => [trips];
}

class TripError extends TripState {
  final String message;
  const TripError(this.message);

  @override
  List<Object?> get props => [message];
}