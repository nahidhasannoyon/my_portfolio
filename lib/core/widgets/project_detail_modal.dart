import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/cursor_service.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailModal extends StatefulWidget {
  const ProjectDetailModal({super.key, required this.project});

  final ProjectItem project;

  @override
  State<ProjectDetailModal> createState() => _ProjectDetailModalState();
}

class _ProjectDetailModalState extends State<ProjectDetailModal>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentImageIndex = 0;
  late List<String> _images;
  late AnimationController _autoScrollController;

  @override
  void initState() {
    super.initState();
    _images =
        widget.project.imageUrls ??
        ['https://via.placeholder.com/600x400?text=No+Image'];
    _pageController = PageController();

    // Auto-rotate images every 4 seconds
    _autoScrollController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollController.forward().then((_) {
      if (mounted) {
        _showNextImage();
        _autoScrollController.reset();
        _startAutoScroll();
      }
    });
  }

  void _showNextImage() {
    if (_currentImageIndex < _images.length - 1) {
      _pageController.animateToPage(
        _currentImageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showPreviousImage() {
    if (_currentImageIndex > 0) {
      _pageController.animateToPage(
        _currentImageIndex - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.animateToPage(
        _images.length - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final modalWidth = isMobile ? double.infinity : 600.0;
    final maxHeight = MediaQuery.of(context).size.height * 0.85;

    return Dialog(
      backgroundColor: AppColors.eerieBlack2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: MouseRegion(
        onEnter: (_) => disableCursor(),
        onExit: (_) => enableCursor(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: modalWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with title and close button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.project.title,
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.jet,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.lightGray,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppColors.jet, height: 1),
              // Content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Carousel
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              child: PageView.builder(
                                controller: _pageController,
                                reverse: true,
                                onPageChanged: (index) {
                                  setState(() => _currentImageIndex = index);
                                  // Reset auto-scroll timer
                                  _autoScrollController.reset();
                                  _startAutoScroll();
                                },
                                itemCount: _images.length,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    _images[index],
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              color: AppColors.jet,
                                              child: const Icon(
                                                Icons.image,
                                                color: AppColors.lightGray,
                                                size: 80,
                                              ),
                                            ),
                                  );
                                },
                              ),
                            ),
                            // Previous Button
                            if (_images.length > 1)
                              Positioned(
                                left: 12,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: _showPreviousImage,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(
                                            alpha: 0.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.chevron_left,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            // Next Button
                            if (_images.length > 1)
                              Positioned(
                                right: 12,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: _showNextImage,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(
                                            alpha: 0.5,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            // Image Counter
                            if (_images.length > 1)
                              Positioned(
                                bottom: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.7),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${_currentImageIndex + 1}/${_images.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Category
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.jet,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.lightGray70),
                        ),
                        child: Text(
                          widget.project.category,
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 13,
                            color: AppColors.lightGray70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Description
                      if (widget.project.description != null) ...[
                        Text(
                          'Description',
                          style: AppTextStyles.h4.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.project.description!,
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 13,
                            color: AppColors.lightGray70,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                      // Keywords/Technologies
                      if (widget.project.keywords != null &&
                          widget.project.keywords!.isNotEmpty) ...[
                        Text(
                          'Technologies',
                          style: AppTextStyles.h4.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.project.keywords!
                              .map(
                                (keyword) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.jet,
                                    border: Border.all(
                                      color: AppColors.orangeYellowCrayola,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    keyword,
                                    style: AppTextStyles.bodyText.copyWith(
                                      fontSize: 12,
                                      color: AppColors.orangeYellowCrayola,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 24),
                      ],
                      // Links
                      if (widget.project.links != null &&
                          widget.project.links!.isNotEmpty) ...[
                        Text(
                          'Links',
                          style: AppTextStyles.h4.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: widget.project.links!
                              .map((link) => _ProjectLinkButton(link: link))
                              .toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectLinkButton extends StatefulWidget {
  const _ProjectLinkButton({required this.link});
  final ProjectLink link;

  @override
  State<_ProjectLinkButton> createState() => _ProjectLinkButtonState();
}

class _ProjectLinkButtonState extends State<_ProjectLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (widget.link.url != '#') {
            if (await canLaunchUrl(Uri.parse(widget.link.url))) {
              await launchUrl(Uri.parse(widget.link.url));
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered
                  ? AppColors.orangeYellowCrayola
                  : AppColors.lightGray70,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
            color: _isHovered
                ? AppColors.orangeYellowCrayola.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.link.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: widget.link.icon!.contains('svg')
                        ? SvgPicture.asset(
                            widget.link.icon!,
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                              _isHovered
                                  ? AppColors.orangeYellowCrayola
                                  : AppColors.lightGray70,
                              BlendMode.srcIn,
                            ),
                            placeholderBuilder: (context) {
                              return const Icon(Icons.link, size: 16);
                            },
                          )
                        : Image.asset(
                            widget.link.icon!,
                            color: _isHovered
                                ? AppColors.orangeYellowCrayola
                                : AppColors.lightGray70,
                            errorBuilder: (_, _, _) =>
                                const Icon(Icons.link, size: 16),
                          ),
                  ),
                ),
              Text(
                widget.link.name,
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: 12,
                  color: _isHovered
                      ? AppColors.orangeYellowCrayola
                      : AppColors.lightGray70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
