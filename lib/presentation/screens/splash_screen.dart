import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/smart_image_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.nextScreen, super.key});
  final Widget nextScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _glowController;
  late AnimationController _particleController;
  late AnimationController _ringController;
  late AnimationController _shimmerController;
  late AnimationController _geometryController;

  // Animations
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _logoRotation;
  late Animation<double> _deOpacity;
  late Animation<double> _vOpacity;
  late Animation<double> _vRotation;
  late Animation<double> _vTranslation;
  late Animation<double> _glowAnimation;
  late Animation<double> _nameOpacity;
  late Animation<Offset> _nameSlide;
  late Animation<double> _titleOpacity;
  late Animation<Offset> _titleSlide;
  late Animation<double> _ringExpansion;
  late Animation<double> _shimmerAnimation;

  // State
  String _loadingText = '';
  final String _fullLoadingText = 'loading...';
  bool _showLoadingText = false;
  double _fadeOutOpacity = 1.0;

  // Particle system
  final List<_Particle> _particles = [];
  final int _particleCount = 80;

  // Floating geometric shapes
  final List<_GeometricShape> _shapes = [];

  @override
  void initState() {
    super.initState();
    _initializeParticles();
    _initializeGeometricShapes();
    _initializeAnimations();
    _startAnimation();
  }

  void _initializeParticles() {
    final random = math.Random();
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(
        _Particle(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: random.nextDouble() * 4 + 1,
          speed: random.nextDouble() * 0.3 + 0.1,
          opacity: random.nextDouble() * 0.6 + 0.2,
          color: _getRandomParticleColor(random),
          twinkleSpeed: random.nextDouble() * 2 + 1,
          horizontalDrift: (random.nextDouble() - 0.5) * 0.02,
        ),
      );
    }
  }

  Color _getRandomParticleColor(math.Random random) {
    final colors = [
      AppColors.orangeYellowCrayola,
      const Color(0xFFFFD700), // Gold
      const Color(0xFFFFA500), // Orange
      const Color(0xFFFFE4B5), // Moccasin
      Colors.white,
    ];
    return colors[random.nextInt(colors.length)];
  }

  void _initializeGeometricShapes() {
    final random = math.Random();
    final shapeTypes = [
      ShapeType.triangle,
      ShapeType.hexagon,
      ShapeType.diamond,
    ];

    for (int i = 0; i < 15; i++) {
      _shapes.add(
        _GeometricShape(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: random.nextDouble() * 30 + 10,
          rotation: random.nextDouble() * math.pi * 2,
          rotationSpeed: (random.nextDouble() - 0.5) * 0.02,
          floatSpeed: random.nextDouble() * 0.2 + 0.05,
          opacity: random.nextDouble() * 0.15 + 0.05,
          type: shapeTypes[random.nextInt(shapeTypes.length)],
        ),
      );
    }
  }

  void _initializeAnimations() {
    // Logo animation controller - dramatic entrance
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    // Glow pulse animation
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    // Particle animation
    _particleController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    // Ring expansion animation
    _ringController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat();

    // Shimmer animation for text
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat();

    // Geometric shapes animation
    _geometryController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _particleController.addListener(() {
      if (mounted) setState(() {});
    });

    _geometryController.addListener(() {
      if (mounted) setState(() {});
    });

    // Logo animations - 3D flip effect
    _logoScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 40,
      ),
    ]).animate(_logoController);

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _logoRotation = Tween<double>(begin: -math.pi, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // Ring animations
    _ringExpansion = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ringController, curve: Curves.easeOut));

    // Text animations - De fades in after title, then fades out
    _deOpacity =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 35,
          ),
          TweenSequenceItem(tween: ConstantTween(1.0), weight: 30),
          TweenSequenceItem(
            tween: Tween(
              begin: 1.0,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 35,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.55, 0.75),
          ),
        );

    _vOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.55, 0.65, curve: Curves.easeIn),
      ),
    );

    _vRotation = Tween<double>(begin: 0.0, end: -math.pi / 2).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.65, 0.78, curve: Curves.easeInOutCubic),
      ),
    );

    _vTranslation = Tween<double>(begin: 0.0, end: -60.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.78, 0.88, curve: Curves.easeOutCubic),
      ),
    );

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.linear),
    );

    // Name and title animations
    _nameOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.15, 0.40, curve: Curves.easeOut),
      ),
    );

    _nameSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.15, 0.40, curve: Curves.easeOutCubic),
          ),
        );

    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.35, 0.60, curve: Curves.easeOut),
      ),
    );

    _titleSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.35, 0.60, curve: Curves.easeOutCubic),
          ),
        );
  }

  void _startAnimation() async {
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 1800));
    _textController.forward();

    // Wait for core animations to establish visual hierarchy
    await Future.delayed(const Duration(milliseconds: 1400));

    // Show loading text character by character with faster typing
    if (mounted) {
      setState(() => _showLoadingText = true);
      for (int i = 0; i < _fullLoadingText.length; i++) {
        if (!mounted) return;
        setState(() {
          _loadingText = _fullLoadingText.substring(0, i + 1);
        });
        // Faster typing speed: 40ms per char, 15ms for dots
        final delay = _fullLoadingText[i] == '.' ? 15 : 40;
        await Future.delayed(Duration(milliseconds: delay));
      }
    }

    await Future.delayed(const Duration(milliseconds: 50));

    // Fade out entire screen with smooth curve
    if (mounted) {
      for (int i = 100; i >= 0; i -= 5) {
        if (!mounted) return;
        // Apply easeOut curve to the fade
        final curvedValue = Curves.easeOutCubic.transform(i / 100);
        setState(() => _fadeOutOpacity = curvedValue);
        await Future.delayed(const Duration(milliseconds: 8));
      }
    }

    // Navigate to home
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              widget.nextScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 1),
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    _ringController.dispose();
    _shimmerController.dispose();
    _geometryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Opacity(
        opacity: _fadeOutOpacity,
        child: Stack(
          children: [
            // Multi-layer gradient background
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.5,
                  colors: [
                    Color(0xFF1a1510),
                    Color(0xFF0d0a08),
                    Color(0xFF050505),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),

            // Ambient light effect at top
            Positioned(
              top: -100,
              left: size.width * 0.3,
              child: AnimatedBuilder(
                animation: _glowController,
                builder: (context, child) {
                  return Container(
                    width: size.width * 0.4,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          AppColors.orangeYellowCrayola.withValues(
                            alpha: 0.08 * _glowAnimation.value,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Floating geometric shapes
            ..._buildGeometricShapes(size),

            // Animated particles with glow
            ..._buildParticles(size),

            // Vignette effect
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.0,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated logo with rings and glow
                  _buildAnimatedLogo(isMobile),

                  SizedBox(height: isMobile ? 50 : 100),

                  // Animated text section
                  _buildAnimatedText(isMobile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGeometricShapes(Size size) {
    return List.generate(_shapes.length, (index) {
      final shape = _shapes[index];
      final progress = _geometryController.value;
      final y = (shape.y + progress * shape.floatSpeed) % 1.2 - 0.1;
      final currentRotation =
          shape.rotation + progress * shape.rotationSpeed * math.pi * 2;

      return Positioned(
        left: shape.x * size.width,
        top: y * size.height,
        child: Transform.rotate(
          angle: currentRotation,
          child: CustomPaint(
            size: Size(shape.size, shape.size),
            painter: _GeometryPainter(
              type: shape.type,
              color: AppColors.orangeYellowCrayola.withValues(
                alpha: shape.opacity,
              ),
            ),
          ),
        ),
      );
    });
  }

  List<Widget> _buildParticles(Size size) {
    return List.generate(_particles.length, (index) {
      final particle = _particles[index];
      final progress = _particleController.value;
      final y = (particle.y + progress * particle.speed) % 1.0;
      final x = (particle.x + progress * particle.horizontalDrift) % 1.0;

      // Twinkle effect
      final twinkle =
          (math.sin(progress * math.pi * 2 * particle.twinkleSpeed) + 1) / 2;
      final currentOpacity = particle.opacity * (0.3 + 0.7 * twinkle);

      return Positioned(
        left: x * size.width,
        top: y * size.height,
        child: Container(
          width: particle.size,
          height: particle.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: particle.color.withValues(alpha: currentOpacity * 0.8),
            boxShadow: [
              BoxShadow(
                color: particle.color.withValues(alpha: currentOpacity * 0.6),
                blurRadius: particle.size * 3,
                spreadRadius: particle.size * 0.5,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAnimatedLogo(bool isMobile) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _logoController,
        _glowController,
        _ringController,
      ]),
      builder: (context, child) {
        return SizedBox(
          width: 280,
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Pulsing rings
              ..._buildPulsingRings(),

              // Main logo with 3D rotation effect
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_logoRotation.value),
                child: Transform.scale(
                  scale: _logoScale.value,
                  child: Opacity(
                    opacity: _logoOpacity.value.clamp(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.orangeYellowCrayola.withValues(
                              alpha: 0.25 * _glowAnimation.value,
                            ),
                            blurRadius: 60 * _glowAnimation.value,
                            spreadRadius: 15 * _glowAnimation.value,
                          ),
                          BoxShadow(
                            color: const Color(
                              0xFFFFD700,
                            ).withValues(alpha: 0.15 * _glowAnimation.value),
                            blurRadius: 100 * _glowAnimation.value,
                            spreadRadius: 25 * _glowAnimation.value,
                          ),
                        ],
                      ),
                      child: SmartImageWidget(
                        source: 'assets/images/gifs/flutter-logo-loading.gif',
                        width: isMobile ? 150 : 220,
                        height: isMobile ? 150 : 220,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildPulsingRings() {
    return List.generate(3, (index) {
      final delay = index * 0.33;
      final adjustedProgress = (_ringExpansion.value + delay) % 1.0;
      final scale = 1.0 + adjustedProgress * 0.8;
      final opacity = (1.0 - adjustedProgress) * 0.4 * _logoOpacity.value;

      return Transform.scale(
        scale: scale,
        child: Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.orangeYellowCrayola.withValues(
                alpha: opacity.clamp(0.0, 1.0),
              ),
              width: 2 * (1 - adjustedProgress),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildAnimatedText(bool isMobile) {
    return AnimatedBuilder(
      animation: Listenable.merge([_textController, _shimmerController]),
      builder: (context, child) {
        return Column(
          children: [
            // Name with shimmer effect
            SlideTransition(
              position: _nameSlide,
              child: Opacity(
                opacity: _nameOpacity.value.clamp(0.0, 1.0),
                child: _buildShimmerText(
                  'Nahid Hasan Noyon',
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title with fade and blur effect
            SlideTransition(
              position: _titleSlide,
              child: Opacity(
                opacity: _titleOpacity.value.clamp(0.0, 1.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.orangeYellowCrayola.withValues(
                        alpha: 0.3,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: AppColors.white1.withValues(alpha: 0.8),
                      letterSpacing: 6,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 50 : 80),

            // Dev > loading text
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // De text with glow
                Opacity(
                  opacity: _deOpacity.value.clamp(0.0, 1.0),
                  child: _buildGlowText('De', isMobile ? 52 : 72),
                ),

                // v that rotates to > with glow
                Opacity(
                  opacity: _vOpacity.value.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(_vTranslation.value, 0),
                    child: Transform.rotate(
                      angle: _vRotation.value,
                      child: _buildGlowText('v', isMobile ? 52 : 72),
                    ),
                  ),
                ),

                // Loading text with typing effect
                if (_showLoadingText && _loadingText.isNotEmpty)
                  _buildLoadingText(isMobile),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildShimmerText(
    String text, {
    required double fontSize,
    required FontWeight fontWeight,
    required double letterSpacing,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: const [
            Color(0xFFFFD700),
            Color(0xFFFFF8DC),
            Color(0xFFFFD700),
            Color(0xFFFFDB70),
          ],
          stops: [
            _shimmerAnimation.value - 0.3,
            _shimmerAnimation.value - 0.1,
            _shimmerAnimation.value,
            _shimmerAnimation.value + 0.3,
          ].map((s) => s.clamp(0.0, 1.0)).toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: GoogleFonts.borel().fontFamily,
          fontWeight: fontWeight,
          color: Colors.white,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }

  Widget _buildGlowText(String text, double fontSize) {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, child) {
        return Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
            shadows: [
              Shadow(
                color: AppColors.orangeYellowCrayola.withValues(
                  alpha: 0.9 * _glowAnimation.value,
                ),
                blurRadius: 25 * _glowAnimation.value,
              ),
              Shadow(
                color: AppColors.orangeYellowCrayola.withValues(
                  alpha: 0.6 * _glowAnimation.value,
                ),
                blurRadius: 50 * _glowAnimation.value,
              ),
              Shadow(
                color: const Color(
                  0xFFFFD700,
                ).withValues(alpha: 0.4 * _glowAnimation.value),
                blurRadius: 80 * _glowAnimation.value,
              ),
              const Shadow(color: Colors.white30, blurRadius: 3),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingText(bool isMobile) {
    return AnimatedBuilder(
      animation: Listenable.merge([_glowController, _shimmerController]),
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: const [
                Color(0xFFFFD700),
                Color(0xFFFFF8DC),
                Color(0xFFFFD700),
              ],
              stops: [
                (_shimmerAnimation.value - 0.2).clamp(0.0, 1.0),
                _shimmerAnimation.value.clamp(0.0, 1.0),
                (_shimmerAnimation.value + 0.2).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          child: Text(
            _loadingText,
            style: TextStyle(
              fontSize: isMobile ? 40 : 52,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              letterSpacing: 4,
              shadows: [
                Shadow(
                  color: AppColors.orangeYellowCrayola.withValues(
                    alpha: 0.6 * _glowAnimation.value,
                  ),
                  blurRadius: 20 * _glowAnimation.value,
                ),
                Shadow(
                  color: const Color(
                    0xFFFFD700,
                  ).withValues(alpha: 0.3 * _glowAnimation.value),
                  blurRadius: 40 * _glowAnimation.value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Particle class for background animation
class _Particle {
  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
    required this.color,
    required this.twinkleSpeed,
    required this.horizontalDrift,
  });
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;
  final Color color;
  final double twinkleSpeed;
  final double horizontalDrift;
}

// Geometric shape types
enum ShapeType { triangle, hexagon, diamond }

// Geometric shape for floating background elements
class _GeometricShape {
  _GeometricShape({
    required this.x,
    required this.y,
    required this.size,
    required this.rotation,
    required this.rotationSpeed,
    required this.floatSpeed,
    required this.opacity,
    required this.type,
  });
  final double x;
  final double y;
  final double size;
  final double rotation;
  final double rotationSpeed;
  final double floatSpeed;
  final double opacity;
  final ShapeType type;
}

// Custom painter for geometric shapes
class _GeometryPainter extends CustomPainter {
  _GeometryPainter({required this.type, required this.color});
  final ShapeType type;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    switch (type) {
      case ShapeType.triangle:
        final path = Path();
        for (int i = 0; i < 3; i++) {
          final angle = (i * 2 * math.pi / 3) - math.pi / 2;
          final point = Offset(
            center.dx + radius * math.cos(angle),
            center.dy + radius * math.sin(angle),
          );
          if (i == 0) {
            path.moveTo(point.dx, point.dy);
          } else {
            path.lineTo(point.dx, point.dy);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
        break;

      case ShapeType.hexagon:
        final path = Path();
        for (int i = 0; i < 6; i++) {
          final angle = (i * 2 * math.pi / 6) - math.pi / 2;
          final point = Offset(
            center.dx + radius * math.cos(angle),
            center.dy + radius * math.sin(angle),
          );
          if (i == 0) {
            path.moveTo(point.dx, point.dy);
          } else {
            path.lineTo(point.dx, point.dy);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
        break;

      case ShapeType.diamond:
        final path = Path()
          ..moveTo(center.dx, center.dy - radius)
          ..lineTo(center.dx + radius, center.dy)
          ..lineTo(center.dx, center.dy + radius)
          ..lineTo(center.dx - radius, center.dy)
          ..close();
        canvas.drawPath(path, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
