import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.nextScreen, super.key});
  final Widget nextScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showDE = true;
  final bool _showV = true;
  double _rotation = 0;
  double _offsetX = 0;
  String _loadingText = '';
  final String _fullLoadingText = 'loading...';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _startAnimation();
  }

  void _startAnimation() async {
    // Show DEV for 800ms
    await Future.delayed(const Duration(milliseconds: 800));

    // Fade out DE
    if (mounted) {
      setState(() {
        _showDE = false;
      });
    }
    await Future.delayed(const Duration(milliseconds: 400));

    // Rotate V to become >
    if (mounted) {
      for (int i = 0; i <= 90; i += 5) {
        setState(() {
          _rotation = -i * (3.14159 / 180);
        });
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }

    await Future.delayed(const Duration(milliseconds: 200));

    // Move > to the left
    if (mounted) {
      for (int i = 0; i <= 50; i += 2) {
        setState(() {
          _offsetX = -i.toDouble();
        });
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }

    await Future.delayed(const Duration(milliseconds: 200));

    // Show loading text character by character
    if (mounted) {
      for (int i = 0; i < _fullLoadingText.length; i++) {
        setState(() {
          _loadingText = _fullLoadingText.substring(0, i + 1);
        });
        await Future.delayed(const Duration(milliseconds: 150));
      }
    }

    await Future.delayed(const Duration(milliseconds: 500));

    // Navigate to home
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a0a),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // De text
            AnimatedOpacity(
              opacity: _showDE ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              child: const Text(
                'De',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
            // v that rotates to >
            AnimatedOpacity(
              opacity: _showV ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              child: Transform.translate(
                offset: Offset(_offsetX, 0),
                child: Transform.rotate(
                  angle: _rotation,
                  child: const Text(
                    'v',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            // Loading text
            if (_loadingText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  _loadingText,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: 1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
