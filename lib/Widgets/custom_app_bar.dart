import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyles.styleSemiBold20,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 60,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}