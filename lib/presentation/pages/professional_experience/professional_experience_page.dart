import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

class ProfessionalExperiencePage extends StatelessWidget {
  const ProfessionalExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Professional Experience'),
          const SizedBox(height: 30),
          _buildTimeline(
            context,
            title: 'Full-Time / Contract Roles',
            icon: Icons.book_outlined,
            items: PortfolioContent.experience,
          ),
          _buildTimeline(
            context,
            title: 'Internships',
            icon: Icons.book_outlined,
            items: PortfolioContent.interns,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<ProfessionalTimelineItem> items,
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
              return _TimelineItemWidget(
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

class _TimelineItemWidget extends StatelessWidget {
  const _TimelineItemWidget({required this.item, required this.isLast});
  final ProfessionalTimelineItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
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
              if (!isLast)
                Expanded(child: Container(width: 1, color: AppColors.jet)),
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
                        item.company,
                        style: AppTextStyles.h4.copyWith(
                          fontSize: 15,
                          height: 1.3,
                        ),
                      ),
                      Text(
                        item.dateRange,
                        style: const TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13,
                          color: AppColors.vegasGold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        item.role,
                        style: const TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13,
                          color: AppColors.white1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.lightGray,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.location,
                        style: const TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13,
                          color: AppColors.lightGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...item.description.map(
                    (desc) => Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '• ',
                            style: TextStyle(
                              color: AppColors.lightGray,
                              fontSize: 14,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              desc,
                              style: AppTextStyles.bodyText.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
