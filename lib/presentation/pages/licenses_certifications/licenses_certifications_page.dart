import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/cursor_service.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/smart_image_widget.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:url_launcher/url_launcher.dart';

class LicensesCertificationsPage extends StatefulWidget {
  const LicensesCertificationsPage({super.key});

  @override
  State<LicensesCertificationsPage> createState() =>
      _LicensesCertificationsPageState();
}

class _LicensesCertificationsPageState
    extends State<LicensesCertificationsPage> {
  String _selectedCategory = 'All';
  bool _isDropdownOpen = false;

  List<CertificationItem> get _filteredCertifications {
    if (_selectedCategory == 'All') {
      return PortfolioContent.certifications;
    }
    return PortfolioContent.certifications
        .where((cert) => cert.category == _selectedCategory)
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
          const ArticleTitle(title: 'Licenses & Certifications'),
          const SizedBox(height: 30),
          _buildFilter(context),
          const SizedBox(height: 25),
          _buildCertificationsGrid(context),
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
      children: PortfolioContent.certificationCategories.map((category) {
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
              children: PortfolioContent.certificationCategories.map((
                category,
              ) {
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

  Widget _buildCertificationsGrid(BuildContext context) {
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
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.w,
        childAspectRatio: crossAxisCount == 1 ? 0.85 : .5.w,
      ),
      itemCount: _filteredCertifications.length,
      itemBuilder: (context, index) {
        return _CertificationCard(
          certification: _filteredCertifications[index],
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

class _CertificationCard extends StatelessWidget {
  const _CertificationCard({required this.certification});
  final CertificationItem certification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.eerieBlack2,
        border: Border.all(color: AppColors.jet),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Certificate Image
          if (certification.imageUrl != null) ...[
            Stack(
              children: [
                SmartImageWidget(
                  source: certification.imageUrl!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  errorWidget: Container(
                    height: 180,
                    color: AppColors.jet,
                    child: const Icon(
                      Icons.workspace_premium,
                      color: AppColors.lightGray,
                      size: 50,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.fullscreen,
                      color: AppColors.smokyBlack,
                      size: 20,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: MouseRegion(
                            onEnter: (_) => disableCursor(),
                            onExit: (_) => enableCursor(),
                            child: Stack(
                              children: [
                                InteractiveViewer(
                                  child: SmartImageWidget(
                                    source: certification.imageUrl!,
                                    errorWidget: Container(
                                      height: 300,
                                      color: AppColors.jet,
                                      child: const Icon(
                                        Icons.workspace_premium,
                                        color: AppColors.lightGray,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppColors.smokyBlack,
                                      size: 30,
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Issuer Logo and Name
                  Row(
                    children: [
                      SmartImageWidget(
                        source: certification.issuerLogo,
                        width: 40.w,
                        borderRadius: BorderRadius.circular(8),
                        height: 40.w,
                        backgroundColor: AppColors.jet,
                        padding: const EdgeInsets.all(6),
                        errorWidget: Center(
                          child: Text(
                            certification.issuer.substring(0, 1),
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.orangeYellowCrayola,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          certification.issuer,
                          style: AppTextStyles.bodyText.copyWith(
                            color: AppColors.lightGray70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  // Title
                  Text(
                    certification.title,
                    style: AppTextStyles.h4.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.w),
                  // Issue Date
                  if (certification.issueDate != null) ...[
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: AppColors.lightGray,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Issued ${certification.issueDate}',
                          style: AppTextStyles.bodyText.copyWith(
                            fontSize: 13,
                            color: AppColors.lightGray70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  const Spacer(),
                  // Skills if available
                  if (certification.skills != null &&
                      certification.skills!.isNotEmpty) ...[
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 4.w,
                      children: certification.skills!
                          .take(3)
                          .map(
                            (skill) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.jet,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                skill,
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
                  // Credential Link if available
                  if (certification.credentialLink != null) ...[
                    SizedBox(height: 12.w),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          if (certification.credentialLink!.url != '#') {
                            if (await canLaunchUrl(
                              Uri.parse(certification.credentialLink!.url),
                            )) {
                              await launchUrl(
                                Uri.parse(certification.credentialLink!.url),
                              );
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.w,
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
                              if (certification.credentialLink!.icon !=
                                  null) ...[
                                SmartImageWidget(
                                  source: certification.credentialLink!.icon!,
                                  width: 14,
                                  height: 14,
                                  color: AppColors.orangeYellowCrayola,
                                  errorWidget: const Icon(
                                    Icons.open_in_new,
                                    size: 14,
                                    color: AppColors.orangeYellowCrayola,
                                  ),
                                ),
                                const SizedBox(width: 6),
                              ],
                              Text(
                                certification.credentialLink!.name,
                                style: AppTextStyles.bodyText.copyWith(
                                  fontSize: 13,
                                  color: AppColors.orangeYellowCrayola,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.open_in_new,
                                size: 18,
                                color: AppColors.orangeYellowCrayola,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
