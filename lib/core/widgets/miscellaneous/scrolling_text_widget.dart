import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';

class ScrollingTextWidget extends StatefulWidget {
  const ScrollingTextWidget({super.key, required this.text});
  final String text;

  @override
  State<ScrollingTextWidget> createState() => ScrollingTextWidgetState();
}

class ScrollingTextWidgetState extends State<ScrollingTextWidget> {
  late final ScrollController _scrollController;
  bool _scrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrollIfNeeded());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _startScrollIfNeeded() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;

    try {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll <= 0) return;
    } catch (_) {}

    if (_scrolling) return;
    _scrolling = true;

    while (mounted) {
      try {
        final max = _scrollController.position.maxScrollExtent;
        if (max <= 0) break;
        await _scrollController.animateTo(
          max,
          duration: Duration(seconds: (max / 30).clamp(3, 12).toInt()),
          curve: Curves.linear,
        );
        await Future.delayed(const Duration(milliseconds: 600));
        if (!mounted) break;
        _scrollController.jumpTo(0);
        await Future.delayed(const Duration(milliseconds: 400));
      } catch (_) {
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.length <= 20) {
      return Text(
        widget.text,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.white2,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    final repeated = '${widget.text}    ';

    return SizedBox(
      height: 18,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Text(
              repeated,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.white2,
              ),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            Text(
              repeated,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.white2,
              ),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }
}
