import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/cursor_service.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/footer/footer.dart';
import 'package:nahid_hasan_noyon/core/widgets/navbar/navbar.dart';
import 'package:nahid_hasan_noyon/core/widgets/sidebar/sidebar.dart';
import 'package:nahid_hasan_noyon/presentation/pages/about/about_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/contact/contact_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/education/education_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/experience/experience_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/licenses_certifications/licenses_certifications_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/projects/projects_page.dart';
import 'package:nahid_hasan_noyon/presentation/pages/skills/skills_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = const [
    AboutPage(),
    ExperiencePage(),
    ProjectsPage(),
    SkillsPage(),
    EducationPage(),
    LicensesCertificationsPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: AppColors.smokyBlack,
      body: SafeArea(
        child: isDesktop
            ? _buildDesktopLayout()
            : _buildMobileTabletLayout(isDesktop),
      ),
      bottomNavigationBar: isDesktop ? null : _buildNavBar(),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child: Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => disableCursor(),
                      onExit: (_) => enableCursor(),
                      child: _buildNavBar(),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sidebar
                          MouseRegion(
                            onEnter: (_) => disableCursor(),
                            onExit: (_) => enableCursor(),
                            child: const SizedBox(width: 280, child: Sidebar()),
                          ),
                          const SizedBox(width: 25),
                          // Main content
                          Expanded(
                            child: MouseRegion(
                              onEnter: (_) => disableCursor(),
                              onExit: (_) => enableCursor(),
                              child: Stack(children: [_buildMainContent()]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }

  Widget _buildMobileTabletLayout(bool isDesktop) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: Responsive.getValue(context, mobile: 15, tablet: 60),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Responsive.getValue(
                      context,
                      mobile: double.infinity,
                      tablet: 520,
                      desktop: 950,
                    ),
                  ),
                  child: Column(
                    children: [
                      MouseRegion(
                        onEnter: (_) => disableCursor(),
                        onExit: (_) => enableCursor(),
                        child: const Sidebar(),
                      ),
                      SizedBox(
                        height: Responsive.getValue(
                          context,
                          mobile: 15,
                          tablet: 30,
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => disableCursor(),
                        onExit: (_) => enableCursor(),
                        child: Stack(
                          children: [
                            _buildMainContent(),
                            if (isDesktop) _buildNavBar(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Footer(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Container(
      constraints: const BoxConstraints(minHeight: 500),
      decoration: BoxDecoration(
        color: AppColors.eerieBlack2,
        border: Border.all(color: AppColors.jet),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [AppShadows.shadow1],
      ),
      clipBehavior: Clip.antiAlias,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          final offsetAnimation =
              Tween<Offset>(
                begin: const Offset(0.1, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );

          final fadeAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          );

          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(position: offsetAnimation, child: child),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(_selectedPageIndex),
          child: _pages[_selectedPageIndex],
        ),
      ),
    );
  }

  Widget _buildNavBar() {
    return NavBar(
      selectedIndex: _selectedPageIndex,
      onItemSelected: (index) {
        setState(() => _selectedPageIndex = index);
      },
    );
  }
}
