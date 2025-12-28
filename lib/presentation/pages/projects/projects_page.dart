import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/smart_image_widget.dart';
import 'package:nahid_hasan_noyon/core/widgets/project_detail_modal.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
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
        Responsive.isDesktop(context) ||
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
        crossAxisSpacing: 15.w.clamp(13, 17),
        mainAxisSpacing: 15.w.clamp(13, 17),
        childAspectRatio: crossAxisCount == 1 ? 1.4 : .8,
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

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.all(15.w.clamp(12, 18)),
          decoration: BoxDecoration(
            color: AppColors.eerieBlack2,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: _isHovered ? AppColors.orangeYellowCrayola : AppColors.jet,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.orangeYellowCrayola.withValues(
                        alpha: 0.2,
                      ),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.project.title,
                      style: AppTextStyles.h4.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isHovered ? 0.125 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.arrow_outward,
                      color: _isHovered
                          ? AppColors.orangeYellowCrayola
                          : AppColors.lightGray70,
                      size: 20,
                    ),
                  ),
                ],
              ),
              if (widget.selectedCategory == 'All') ...[
                const SizedBox(height: 6),
                Text(
                  widget.project.category,
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.lightGray70,
                    fontSize: 13,
                  ),
                ),
              ],
              if (widget.project.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  widget.project.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 13,
                    color: AppColors.lightGray70,
                    height: 1.3,
                  ),
                ),
              ],
              if (widget.project.keywords != null &&
                  widget.project.keywords!.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.project.keywords!
                      .take(3)
                      .map(
                        (keyword) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w.clamp(8, 12),
                            vertical: 5.w.clamp(4, 6),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.jet,
                            border: Border.all(
                              color: AppColors.orangeYellowCrayola.withValues(
                                alpha: 0.3,
                              ),
                              width: 0.5,
                            ),
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
              ],
              if (widget.project.links != null &&
                  widget.project.links!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 5.w.clamp(4, 6),
                  runSpacing: 5.w.clamp(4, 6),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w.clamp(8, 12),
                                vertical: 6.w.clamp(5, 7),
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
                                  if (link.icon != null) ...[
                                    SmartImageWidget(
                                      source: link.icon!,
                                      width: 14.w.clamp(12, 16),
                                      height: 14.w.clamp(12, 16),
                                      errorWidget: Icon(
                                        Icons.link,
                                        size: 14.w.clamp(12, 16),
                                        color: AppColors.orangeYellowCrayola,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                  ],
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
              ],
            ],
          ),
        ),
      ),
    );
  }
}
