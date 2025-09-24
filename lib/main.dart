import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_manager/utils/app_color.dart';
import 'package:logistics_manager/utils/app_routers.dart';

import 'Managers/trip_cubit.dart';
import 'Repos/trip_repo.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final TripRepository tripRepository = TripRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TripCubit(tripRepository)..loadTrips(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Logistics Manager',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.dmSansTextTheme(ThemeData
              .light()
              .textTheme),
          focusColor: AppColors.secondary,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.secondary,
            selectionColor: AppColors.secondary,
            selectionHandleColor: AppColors.secondary,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
      ),
    );
  }
}
