import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Skills'),
          const SizedBox(height: 30),
          _buildTechnicalSkills(context),
          const SizedBox(height: 50),
          _buildSoftSkills(context),
        ],
      ),
    );
  }

  Widget _buildTechnicalSkills(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconBox(
              icon: Icons.code_outlined,
              size: Responsive.getValue(context, mobile: 30, tablet: 48),
            ),
            const SizedBox(width: 15),
            const Text('Technical Skills', style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: GradientBox(
            padding: EdgeInsets.all(
              Responsive.getValue(context, mobile: 20, tablet: 25),
            ),
            child: Column(
              children: List.generate(PortfolioContent.technicalSkills.length, (
                index,
              ) {
                final skill = PortfolioContent.technicalSkills[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < PortfolioContent.technicalSkills.length - 1
                        ? 20
                        : 0,
                  ),
                  child: _SkillCategory(
                    category: skill.category,
                    skills: skill.skills,
                    isMobile: isMobile,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSoftSkills(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconBox(
              icon: Icons.people_alt_outlined,
              size: Responsive.getValue(context, mobile: 30, tablet: 48),
            ),
            const SizedBox(width: 15),
            const Text('Soft Skills', style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 60),
          child: GradientBox(
            padding: EdgeInsets.all(
              Responsive.getValue(context, mobile: 20, tablet: 25),
            ),
            child: isMobile
                ? Column(
                    children: List.generate(
                      PortfolioContent.softSkills.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          bottom: index < PortfolioContent.softSkills.length - 1
                              ? 15
                              : 0,
                        ),
                        child: _SoftSkillTag(
                          skill: PortfolioContent.softSkills[index],
                        ),
                      ),
                    ),
                  )
                : Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: PortfolioContent.softSkills
                        .map((skill) => _SoftSkillTag(skill: skill))
                        .toList(),
                  ),
          ),
        ),
      ],
    );
  }
}

class _SkillCategory extends StatelessWidget {
  const _SkillCategory({
    required this.category,
    required this.skills,
    required this.isMobile,
  });

  final String category;
  final String skills;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final skillList = skills.split('/,').map((s) => s.trim()).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                gradient: AppColors.textGradientYellow,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(category, style: AppTextStyles.h4.copyWith())),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skillList
                .map((skill) => _TechnicalSkillTag(skill: skill))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SoftSkillTag extends StatefulWidget {
  const _SoftSkillTag({required this.skill});

  final String skill;

  @override
  State<_SoftSkillTag> createState() => _SoftSkillTagState();
}

class _SoftSkillTagState extends State<_SoftSkillTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? Colors.black : AppColors.orangeYellowCrayola;
    final backgroundColor = _isHovered
        ? AppColors.orangeYellowCrayola.withAlpha(200)
        : null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: color, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(
              widget.skill,
              style: AppTextStyles.bodyText.copyWith(
                color: color,
                fontSize: 10,
                fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechnicalSkillTag extends StatefulWidget {
  const _TechnicalSkillTag({required this.skill});

  final String skill;

  @override
  State<_TechnicalSkillTag> createState() => _TechnicalSkillTagState();
}

class _TechnicalSkillTagState extends State<_TechnicalSkillTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? Colors.black : AppColors.orangeYellowCrayola;
    final backgroundColor = _isHovered
        ? AppColors.orangeYellowCrayola.withAlpha(200)
        : null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: color, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          widget.skill,
          style: AppTextStyles.bodyText.copyWith(
            color: color,
            fontSize: 10,
            fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
