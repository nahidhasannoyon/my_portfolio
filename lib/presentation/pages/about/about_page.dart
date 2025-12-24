import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

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
          const SizedBox(height: 35),
          // TODO: later add testimonials
          // buildTestimonials(context),
          const SizedBox(height: 30),
          const _ClientsSection(),
        ],
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      children: PortfolioContent.aboutText.map((text) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(text, style: AppTextStyles.bodyText),
        );
      }).toList(),
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("What I'm doing", style: AppTextStyles.h3),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            if (isWide) {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20,
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

  Widget buildTestimonials(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Testimonials', style: AppTextStyles.h3),
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
    final isDesktop =
        Responsive.isDesktop(context) || Responsive.isLargeDesktop(context);
    final clientCount = PortfolioContent.clients.length;

    // Show scrollbar only on desktop when more than 3 clients
    final showScrollbar = isDesktop && clientCount > 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Clients', style: AppTextStyles.h3),
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
              largeDesktop: 200,
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
      padding: EdgeInsets.all(isTabletOrLarger ? 30 : 20),
      child: isTabletOrLarger
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIcon(),
                const SizedBox(width: 18),
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
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.orangeYellowCrayola.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.design_services,
        color: AppColors.orangeYellowCrayola,
        size: 24,
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
        ),
        const SizedBox(height: 7),
        Text(
          service.description,
          style: AppTextStyles.bodyText,
          textAlign: isTabletOrLarger ? TextAlign.start : TextAlign.center,
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
          padding: const EdgeInsets.all(15).copyWith(top: 45),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=60&h=60&fit=crop',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 60,
                  height: 60,
                  color: AppColors.jet,
                  child: const Icon(Icons.person, color: AppColors.lightGray),
                ),
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
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Image.asset(widget.client.logoUrl, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
