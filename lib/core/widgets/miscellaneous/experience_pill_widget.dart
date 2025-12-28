import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';

class ExperiencePillWidget extends StatelessWidget {
  const ExperiencePillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.onyx, AppColors.eerieBlack1],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.orangeYellowCrayola.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeYellowCrayola.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.workspace_premium_rounded,
            color: AppColors.orangeYellowCrayola,
            size: 16,
          ),
          SizedBox(width: 8),
          Text(
            '3+ Years Exp.',
            style: TextStyle(
              // fontFamily: AppTextStyles.fontFamily,
              fontSize: 12,
              color: AppColors.white2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
