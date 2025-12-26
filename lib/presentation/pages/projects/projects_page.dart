import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';
import 'package:nahid_hasan_noyon/core/widgets/project_detail_modal.dart';

import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String _selectedCategory = 'All';
  bool _isDropdownOpen = false;

  List<ProjectItem> get _filteredProjects {
    if (_selectedCategory == 'All') {
      return PortfolioContent.projects;
    }
    return PortfolioContent.projects
        .where(
          (p) => p.category.toLowerCase() == _selectedCategory.toLowerCase(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Projects'),
          const SizedBox(height: 30),
          _buildFilter(context),
          const SizedBox(height: 25),
          _buildProjectGrid(context),
        ],
      ),
    );
  }

  Widget _buildFilter(BuildContext context) {
    final isDesktop =
        Responsive.isDesktopOrLarger(context) ||
        MediaQuery.of(context).size.width >= 768;

    if (isDesktop) {
      return _buildDesktopFilter();
    }
    return _buildMobileFilter();
  }

  Widget _buildDesktopFilter() {
    return Row(
      children: PortfolioContent.projectCategories.map((category) {
        final isSelected = _selectedCategory == category;
        return Padding(
          padding: const EdgeInsets.only(right: 25),
          child: _FilterButton(
            title: category,
            isSelected: isSelected,
            onTap: () => setState(() => _selectedCategory = category),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.eerieBlack2,
              border: Border.all(color: AppColors.jet),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedCategory == 'All'
                      ? 'Select category'
                      : _selectedCategory,
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                ),
                AnimatedRotation(
                  turns: _isDropdownOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 150),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.lightGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.eerieBlack2,
              border: Border.all(color: AppColors.jet),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: PortfolioContent.projectCategories.map((category) {
                return _DropdownItem(
                  title: category,
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                      _isDropdownOpen = false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          crossFadeState: _isDropdownOpen
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 150),
        ),
      ],
    );
  }

  Widget _buildProjectGrid(BuildContext context) {
    final crossAxisCount = Responsive.getValue(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
    ).toInt();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: crossAxisCount == 1 ? 1.3 : 0.85,
      ),
      itemCount: _filteredProjects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(
          project: _filteredProjects[index],
          selectedCategory: _selectedCategory,
          key: ValueKey(_filteredProjects[index].title),
        );
      },
    );
  }
}

class _FilterButton extends StatefulWidget {
  const _FilterButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<_FilterButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: 15,
            color: widget.isSelected
                ? AppColors.orangeYellowCrayola
                : _isHovered
                ? AppColors.lightGray70
                : AppColors.lightGray,
          ),
        ),
      ),
    );
  }
}

class _DropdownItem extends StatefulWidget {
  const _DropdownItem({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  State<_DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<_DropdownItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.jet : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: AppTextStyles.bodyText.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    super.key,
    required this.project,
    required this.selectedCategory,
  });
  final ProjectItem project;
  final String selectedCategory;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late List<String> _images;
  int _currentImageIndex = 0;
  late AnimationController _autoScrollController;

  @override
  void initState() {
    super.initState();
    _images =
        widget.project.imageUrls ??
        ['https://via.placeholder.com/400x300?text=No+Image'];

    // Auto-rotate images every 3 seconds
    _autoScrollController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _startAutoCycle();
  }

  void _startAutoCycle() {
    _autoScrollController.forward().then((_) {
      if (mounted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _images.length;
        });
        _autoScrollController.reset();
        _startAutoCycle();
      }
    });
  }

  @override
  void dispose() {
    _autoScrollController.dispose();
    super.dispose();
  }

  void _showProjectModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailModal(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showProjectModal(context),
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1,
          duration: const Duration(milliseconds: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedScale(
                        scale: _isHovered ? 1.1 : 1,
                        duration: const Duration(milliseconds: 250),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) =>
                              SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                          child: Image.network(
                            _images[_currentImageIndex],
                            key: ValueKey(_images[_currentImageIndex]),
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: AppColors.jet,
                              child: const Icon(
                                Icons.image,
                                color: AppColors.lightGray,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        color: _isHovered
                            ? Colors.black.withValues(alpha: 0.5)
                            : Colors.transparent,
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: _isHovered ? 1 : 0,
                        child: Center(
                          child: AnimatedScale(
                            scale: _isHovered ? 1 : 0.8,
                            duration: const Duration(milliseconds: 250),
                            child: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: AppColors.jet,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.visibility_outlined,
                                color: AppColors.orangeYellowCrayola,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.project.title,
                  style: AppTextStyles.h4.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (widget.selectedCategory == 'All') ...[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.project.category,
                    style: AppTextStyles.bodyText.copyWith(
                      color: AppColors.lightGray70,
                    ),
                  ),
                ),
              ],
              if (widget.project.description != null) ...[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.project.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyText.copyWith(
                      fontSize: 13,
                      color: AppColors.lightGray70,
                    ),
                  ),
                ),
              ],
              if (widget.project.keywords != null &&
                  widget.project.keywords!.isNotEmpty) ...[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: widget.project.keywords!
                        .take(3)
                        .map(
                          (keyword) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.jet,
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              keyword,
                              style: AppTextStyles.bodyText.copyWith(
                                fontSize: 11,
                                color: AppColors.orangeYellowCrayola,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
              if (widget.project.links != null &&
                  widget.project.links!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: widget.project.links!
                        .map(
                          (link) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () async {
                                if (link.url != '#') {
                                  if (await canLaunchUrl(Uri.parse(link.url))) {
                                    await launchUrl(Uri.parse(link.url));
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.orangeYellowCrayola,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (link.icon != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 6,
                                        ),
                                        child: SizedBox(
                                          width: 14,
                                          height: 14,
                                          child: link.icon!.contains('svg')
                                              ? SvgPicture.asset(
                                                  link.icon!,
                                                  width: 14,
                                                  height: 14,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                        AppColors
                                                            .orangeYellowCrayola,
                                                        BlendMode.srcIn,
                                                      ),
                                                  placeholderBuilder: (context) {
                                                    return const Icon(
                                                      Icons.link,
                                                      size: 14,
                                                      color: AppColors
                                                          .orangeYellowCrayola,
                                                    );
                                                  },
                                                )
                                              : Image.asset(
                                                  link.icon!,
                                                  color: AppColors
                                                      .orangeYellowCrayola,
                                                  errorBuilder: (_, _, _) =>
                                                      const Icon(
                                                        Icons.link,
                                                        size: 14,
                                                        color: AppColors
                                                            .orangeYellowCrayola,
                                                      ),
                                                ),
                                        ),
                                      ),
                                    Text(
                                      link.name,
                                      style: AppTextStyles.bodyText.copyWith(
                                        fontSize: 13,
                                        color: AppColors.orangeYellowCrayola,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
