import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_manager/utils/app_styles.dart';

import '../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacement('/vehicles');
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.carsharing, width: width*0.4),
            SizedBox(height: 50),
            Text("Welcome to", style: AppStyles.styleSemiBold20.copyWith(color:Colors.black54)),
            Text("Driverly", style: AppStyles.styleBold25.copyWith(color:Color(0xFF434841)),),
          ],
        ),
      ),
    );
  }
}
