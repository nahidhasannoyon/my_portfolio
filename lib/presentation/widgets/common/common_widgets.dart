import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';

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

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: AppColors.jet,
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

class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    this.onPressed,
    required this.child,
    this.borderRadius = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
  });
  final VoidCallback? onPressed;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? AppColors.bgGradientYellow1
                : AppColors.borderGradientOnyx,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: const [AppShadows.shadow3],
          ),
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: widget.padding,
            decoration: BoxDecoration(
              gradient: _isHovered
                  ? AppColors.bgGradientYellow2
                  : AppColors.bgGradientJet,
              borderRadius: BorderRadius.circular(widget.borderRadius - 1),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.style,
    this.gradient = AppColors.textGradientYellow,
  });
  final String text;
  final TextStyle style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
