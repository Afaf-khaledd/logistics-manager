import 'package:flutter/material.dart';
import 'package:logistics_manager/utils/app_styles.dart';

import '../utils/app_color.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleMedium16.copyWith(color: Colors.grey),
        ),
        Text(
          value,
          style: AppStyles.styleSemiBold18.copyWith(color: valueColor ?? AppColors.primary),
        ),
      ],
    );
  }
}