import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_theme.dart';
import 'package:my_portfolio/core/utils/responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });
  final int selectedIndex;
  final Function(int) onItemSelected;

  static const List<String> items = [
    'About',
    'Education',
    'Resume',
    'Portfolio',
    'Blog',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktopOrLarger = Responsive.isDesktopOrLarger(context);

    if (isDesktopOrLarger) {
      return _buildDesktopNav(context);
    }
    return _buildMobileNav(context);
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xBF2B2B2C),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            return _NavItem(
              title: items[index],
              isSelected: selectedIndex == index,
              onTap: () => onItemSelected(index),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xBF2B2B2C),
        border: Border.all(color: AppColors.jet),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: const [AppShadows.shadow2],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(items.length, (index) {
            return _NavItem(
              title: items[index],
              isSelected: selectedIndex == index,
              onTap: () => onItemSelected(index),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktopOrLarger(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.getValue(
              context,
              mobile: 7,
              tablet: 15,
              desktop: 15,
            ),
            vertical: isDesktop ? 15 : 20,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: Responsive.getValue(
                context,
                mobile: 11,
                tablet: 14,
                desktop: 15,
              ),
              fontWeight: isDesktop ? FontWeight.w500 : FontWeight.w400,
              color: widget.isSelected
                  ? AppColors.orangeYellowCrayola
                  : _isHovered
                  ? AppColors.lightGray70
                  : AppColors.lightGray,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
