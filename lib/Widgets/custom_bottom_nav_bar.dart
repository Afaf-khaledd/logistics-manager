import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:logistics_manager/utils/app_color.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<TabItem> items = [
    TabItem(icon: Icons.car_crash_rounded,title: 'Vehicles'),
    TabItem(icon: Icons.person_rounded, title: 'Drivers'),
    TabItem(icon: Icons.maps_home_work_rounded,title: 'Trips'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomBarDefault(
      items: items,
      backgroundColor: Colors.white60,
      color: Colors.black,
      iconSize: 22,
      colorSelected: AppColors.primary,
      indexSelected: widget.currentIndex,
      onTap: widget.onTap,
      enableShadow: true,
      paddingVertical: 20,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 2,
          offset: const Offset(0, 1.7),
        ),
      ],
      borderRadius: BorderRadius.circular(2),
    );
  }
}