import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.child,
    this.borderRadius = 14,
    this.padding,
    this.boxShadow,
  });
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.borderGradientOnyx,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ?? [AppShadows.shadow2],
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: padding,
        decoration: BoxDecoration(
          gradient: AppColors.bgGradientJet,
          borderRadius: BorderRadius.circular(borderRadius - 1),
        ),
        child: child,
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.icon, this.size = 30});
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: AppColors.borderGradientOnyx,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [AppShadows.shadow1],
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: AppColors.eerieBlack1,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Icon(
          icon,
          size: size * 0.55,
          color: AppColors.orangeYellowCrayola,
        ),
      ),
    );
  }
}

class ArticleTitle extends StatelessWidget {
  const ArticleTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h2),
        const SizedBox(height: 7),
        Container(
          width: 30,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppColors.textGradientYellow,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: EdgeInsets.symmetric(
        vertical: Responsive.getValue(context, mobile: 16, tablet: 24),
      ),
      color: AppColors.jet,
    );
  }
}