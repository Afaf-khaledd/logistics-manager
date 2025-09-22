import 'package:go_router/go_router.dart';
import 'package:logistics_manager/Screens/splash_screen.dart';

import '../Models/vehicles_model.dart';
import '../Screens/vehicle_details_screen.dart';
import '../Screens/vehicles_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/vehicles',
        builder: (context, state) => VehiclesScreen(),
      ),
      GoRoute(
        path: '/vehicle_details',
        builder: (context, state) => VehicleDetailsScreen(vehicle: state.extra as VehicleModel,),
      ),
      GoRoute(
        path: '/drivers',
        builder: (context, state) => VehiclesScreen(),
      ),
      GoRoute(
        path: '/trips',
        builder: (context, state) =>  VehiclesScreen(),
      ),
    ],
  );
}