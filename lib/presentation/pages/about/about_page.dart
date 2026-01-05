import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/smart_image_widget.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:styled_text/styled_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'About me'),
          SizedBox(
            height: Responsive.getValue(context, mobile: 15, tablet: 20),
          ),
          _buildAboutText(),
          SizedBox(
            height: Responsive.getValue(context, mobile: 20, tablet: 40),
          ),
          _buildServices(context),
          const SizedBox(height: 50),
          _buildLanguages(context),
          const SizedBox(height: 50),
          _buildGitHubActivity(context),
          const SizedBox(height: 35),
          // buildTestimonials(context),
          const SizedBox(height: 30),
          // const _ClientsSection(),
        ],
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      children: PortfolioContent.aboutText.map((text) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: StyledText(
            text: text,
            textAlign: TextAlign.justify,
            style: AppTextStyles.bodyText,
            tags: {
              'b': StyledTextTag(
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.white1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What I'm doing", style: AppTextStyles.h3),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            if (isWide) {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2.3,
                crossAxisSpacing: 25.w.clamp(10, 25),
                mainAxisSpacing: 20.w.clamp(10, 20),
                children: PortfolioContent.services
                    .map((s) => _ServiceCard(service: s))
                    .toList(),
              );
            }
            return Column(
              children: PortfolioContent.services
                  .map(
                    (s) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _ServiceCard(service: s),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLanguages(BuildContext context) {
    final languages = PortfolioContent.person.languages;
    if (languages == null || languages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Languages', style: AppTextStyles.h3),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: languages
              .map((lang) => _LanguageCard(language: lang))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildGitHubActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Activity', style: AppTextStyles.h3),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // Year heatmap contribution graph
                GradientBox(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contribution Overview',
                        style: AppTextStyles.h4.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 15),
                      SmartImageWidget(
                        padding: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: AppColors.white1,
                        source:
                            'assets/images/gifs/wakatime-frequency-of-days.gif',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Weekly activity graph
                GradientBox(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weekly Activity',
                        style: AppTextStyles.h4.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 15),
                      SmartImageWidget(
                        padding: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: AppColors.white1,
                        source: 'assets/images/gifs/wakatime-weekdays.gif',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildTestimonials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Testimonials', style: AppTextStyles.h3),
        const SizedBox(height: 20),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 25),
            itemCount: PortfolioContent.testimonials.length,
            itemBuilder: (context, index) {
              final testimonial = PortfolioContent.testimonials[index];
              return Container(
                width: Responsive.getValue(
                  context,
                  mobile: MediaQuery.of(context).size.width - 60,
                  tablet: 350,
                  desktop: 400,
                ),
                margin: EdgeInsets.only(right: 15, left: index == 0 ? 0 : 0),
                child: _TestimonialCard(testimonial: testimonial),
              );
            },
          ),
        ),
        // Add Testimonials section slider
      ],
    );
  }

  @Deprecated('Use _ClientsSection instead')
  @pragma('vm:entry-point')
  Widget _buildClients(BuildContext context) {
    // Deprecated: use _ClientsSection instead
    return const SizedBox.shrink();
  }
}

class _ClientsSection extends StatefulWidget {
  const _ClientsSection();

  @override
  State<_ClientsSection> createState() => _ClientsSectionState();
}

class _ClientsSectionState extends State<_ClientsSection> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final clientCount = PortfolioContent.clients.length;

    // Show scrollbar only on desktop when more than 3 clients
    final showScrollbar = isDesktop && clientCount > 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Clients', style: AppTextStyles.h3),
        const SizedBox(height: 20),
        if (showScrollbar)
          RawScrollbar(
            controller: _scrollController,
            thickness: 8,
            radius: const Radius.circular(4),
            thumbColor: AppColors.orangeYellowCrayola,
            thumbVisibility: true,
            child: _buildClientsList(context),
          )
        else
          _buildClientsList(context),
      ],
    );
  }

  Widget _buildClientsList(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: PortfolioContent.clients.length,
        itemBuilder: (context, index) {
          return Container(
            width: Responsive.getValue(
              context,
              mobile: 120,
              tablet: 150,
              desktop: 180,
            ),
            margin: const EdgeInsets.only(right: 15),
            child: _ClientLogo(client: PortfolioContent.clients[index]),
          );
        },
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});
  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    final isTabletOrLarger = Responsive.isTabletOrLarger(context);

    return GradientBox(
      padding: EdgeInsets.all(
        isTabletOrLarger ? 20.r.clamp(15, 25) : 10.r.clamp(8, 15),
      ),
      child: isTabletOrLarger
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIcon(),
                SizedBox(width: 18.w),
                Expanded(child: _buildContent(isTabletOrLarger)),
              ],
            )
          : Column(
              children: [
                _buildIcon(),
                const SizedBox(height: 10),
                _buildContent(isTabletOrLarger),
              ],
            ),
    );
  }

  Widget _buildIcon() {
    return SmartImageWidget(
      source: service.iconPath,
      width: 40.w.clamp(35, 50),
      height: 40.w.clamp(35, 50),
      padding: EdgeInsets.all(8.w.clamp(5, 10)),
      borderRadius: BorderRadius.circular(8.r),
      backgroundColor: AppColors.orangeYellowCrayola.withValues(alpha: .1),

      errorWidget: Icon(
        Icons.design_services,
        color: AppColors.orangeYellowCrayola,
        size: 24.w.clamp(20, 30),
      ),
    );
  }

  Widget _buildContent(bool isTabletOrLarger) {
    return Column(
      crossAxisAlignment: isTabletOrLarger
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          service.title,
          style: AppTextStyles.h4,
          textAlign: isTabletOrLarger ? TextAlign.start : TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          service.description,
          style: AppTextStyles.bodyText.copyWith(height: 1.4),
          textAlign: isTabletOrLarger ? TextAlign.justify : TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.testimonial});
  final TestimonialItem testimonial;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GradientBox(
          padding: const EdgeInsets.all(15).copyWith(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(width: 70),
                  Expanded(
                    child: Text(testimonial.name, style: AppTextStyles.h4),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Flexible(
                child: Text(
                  testimonial.text,
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -25,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.bgGradientOnyx,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [AppShadows.shadow1],
            ),
            child: SmartImageWidget(
              source: testimonial.avatarUrl,
              width: 60,
              height: 60,
              borderRadius: BorderRadius.circular(14),
              errorWidget: Container(
                width: 60,
                height: 60,
                color: AppColors.jet,
                child: const Icon(Icons.person, color: AppColors.lightGray),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ClientLogo extends StatefulWidget {
  const _ClientLogo({required this.client});
  final ClientItem client;

  @override
  State<_ClientLogo> createState() => _ClientLogoState();
}

class _ClientLogoState extends State<_ClientLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.jet : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(10),
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.saturation,
            ),
            child: SmartImageWidget(
              source: widget.client.logoUrl,
              borderRadius: BorderRadius.circular(8),
              errorWidget: Container(
                color: AppColors.jet,
                child: const Icon(Icons.business, color: AppColors.lightGray),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({required this.language});
  final LanguageItem language;

  @override
  Widget build(BuildContext context) {
    return GradientBox(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  gradient: AppColors.textGradientYellow,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                language.name,
                style: AppTextStyles.h4.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              language.proficiency,
              style: AppTextStyles.bodyText.copyWith(
                fontSize: 13,
                color: AppColors.lightGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
