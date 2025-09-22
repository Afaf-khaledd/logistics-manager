import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Widgets/custom_bottom_nav_bar.dart';

class BottomNavHandler extends StatelessWidget {
  final int currentIndex;

  const BottomNavHandler({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {

    String nextScreen;
    switch (index) {
      case 0:
        nextScreen = '/vehicles';
        break;
      case 1:
        nextScreen = '/drivers';
        break;
      case 2:
        nextScreen = '/trips';
        break;
      default:
        return;
    }
    context.go(nextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}