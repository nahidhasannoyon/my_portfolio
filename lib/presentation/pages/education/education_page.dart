import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Education'),
          const SizedBox(height: 30),
          _buildTimeline(
            context,
            title: 'University',
            icon: Icons.school_outlined,
            items: PortfolioContent.universityEducation,
          ),
          const SizedBox(height: 30),
          _buildTimeline(
            context,
            title: 'College',
            icon: Icons.book_outlined,
            items: PortfolioContent.collegeEducation,
          ),
          const SizedBox(height: 30),
          _buildTimeline(
            context,
            title: 'School',
            icon: Icons.menu_book_outlined,
            items: PortfolioContent.schoolEducation,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<EducationTimelineItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconBox(
              icon: icon,
              size: Responsive.getValue(context, mobile: 30, tablet: 48),
            ),
            const SizedBox(width: 15),
            Text(title, style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.only(
            left: Responsive.getValue(context, mobile: 45, tablet: 65),
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              return _EducationItemWidget(
                item: items[index],
                isLast: index == items.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _EducationItemWidget extends StatelessWidget {
  const _EducationItemWidget({required this.item, required this.isLast});
  final EducationTimelineItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                gradient: AppColors.textGradientYellow,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: AppColors.jet, spreadRadius: 4)],
              ),
            ),
            if (!isLast) Container(width: 1, height: 80, color: AppColors.jet),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.course,
                      style: AppTextStyles.h4.copyWith(
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                    Text(
                      item.dateRange,
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 14,
                        color: AppColors.vegasGold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.institution,
                      style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                    ),
                    Text(
                      item.location,
                      style: AppTextStyles.bodyText.copyWith(
                        fontSize: 12,
                        color: AppColors.vegasGold.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
