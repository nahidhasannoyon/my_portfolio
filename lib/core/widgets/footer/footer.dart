import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> with TickerProviderStateMixin {
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _heartAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.easeInOut),
    );

    _shimmerController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _heartController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.jet, AppColors.eerieBlack1],
        ),
        border: Border(top: BorderSide(color: AppColors.orangeYellowCrayola)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Copyright with shimmer effect
            _buildCopyright(currentYear),
            const SizedBox(height: 16),
            // Animated "Developed from scratch" section
            _buildAnimatedDevelopmentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedDevelopmentSection() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      runSpacing: 8,
      children: [
        const Text(
          'Developed from',
          style: TextStyle(
            color: AppColors.lightGray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        // "Developed from scratch" with typewriter effect
        SizedBox(
          width: 53,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: AppColors.lightGray,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'scratch',
                  speed: const Duration(milliseconds: 80),
                  textStyle: const TextStyle(
                    color: AppColors.lightGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 2000),
              displayFullTextOnTap: true,
            ),
          ),
        ),

        // Using Dart & Flutter with colorful animation
        _buildDartFlutterBadge(),

        // Animated heart with "with love"
        _buildLoveSection(),

        // "by" text
        const Text(
          ' by',
          style: TextStyle(
            color: AppColors.lightGray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        // Name with gradient animation
        _buildAnimatedName(),
      ],
    );
  }

  Widget _buildDartFlutterBadge() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'using',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          width: 45,
          height: 45,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  'Dart',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RotateAnimatedText(
                  'Flutter',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              repeatForever: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoveSection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'with ',
          style: TextStyle(
            color: AppColors.lightGray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        ScaleTransition(
          scale: _heartAnimation,
          child: const Text('❤️', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildAnimatedName() {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: const [
                AppColors.orangeYellowCrayola,
                AppColors.vegasGold,
                Colors.white,
                AppColors.vegasGold,
                AppColors.orangeYellowCrayola,
              ],
              stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
              begin: Alignment(-2 + _shimmerController.value * 4, 0),
              end: Alignment(-1 + _shimmerController.value * 4, 0),
            ).createShader(bounds);
          },
          child: const Text(
            'Nahid Hasan Noyon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCopyright(int year) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        final opacity =
            0.5 +
            0.5 * (1 + ((_shimmerController.value * 2 - 1).abs() * -1 + 1));
        return Opacity(
          opacity: opacity.clamp(0.6, 1.0),
          child: Text(
            '© $year Nahid Hasan Noyon. All rights reserved.',
            style: const TextStyle(
              color: AppColors.lightGray70,
              fontSize: 11,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ),
        );
      },
    );
  }
}
