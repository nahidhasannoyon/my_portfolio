import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/enums.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/common_widgets.dart';
import 'package:nahid_hasan_noyon/core/widgets/common/smart_image_widget.dart';
import 'package:nahid_hasan_noyon/core/widgets/miscellaneous/experience_pill_widget.dart';
import 'package:nahid_hasan_noyon/core/widgets/miscellaneous/scrolling_text_widget.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:url_launcher/url_launcher.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isLargeDesktop = Responsive.isLargeDesktop(context);
    const PersonInfo person = PortfolioContent.person;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      constraints: BoxConstraints(
        maxHeight: isLargeDesktop ? double.infinity : (_isExpanded ? 600 : 112),
      ),
      decoration: BoxDecoration(
        color: AppColors.eerieBlack2,
        border: Border.all(color: AppColors.jet),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [AppShadows.shadow1],
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        physics: isLargeDesktop
            ? const NeverScrollableScrollPhysics()
            : const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            Responsive.getValue(context, mobile: 15, tablet: 30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSidebarInfo(context, person, isLargeDesktop),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isExpanded || isLargeDesktop ? 1 : 0,
                child: _buildSidebarMore(context, person),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarInfo(BuildContext context, person, bool isLargeDesktop) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: isLargeDesktop
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            if (isLargeDesktop)
              Expanded(
                child: Column(
                  children: [
                    _buildAvatar(context, person),
                    const SizedBox(height: 15),
                    _buildNameTitle(context, person, isLargeDesktop),
                  ],
                ),
              )
            else ...[
              _buildAvatar(context, person),
              const SizedBox(width: 15),
              Expanded(child: _buildNameTitle(context, person, isLargeDesktop)),
            ],
          ],
        ),
        if (!isLargeDesktop)
          Positioned(top: -15, right: -15, child: _buildMoreButton(context)),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, PersonInfo person) {
    final size = Responsive.getValue(
      context,
      mobile: 80.0,
      tablet: 120.0,
      largeDesktop: 150.0,
    );

    return SmartImageWidget(
      height: size,
      width: size,
      source: person.avatarUrl,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(
        Responsive.getValue(context, mobile: 20, tablet: 30),
      ),
      errorWidget: const Icon(Icons.person, size: 50, color: AppColors.white2),
    );
  }

  Widget _buildNameTitle(
    BuildContext context,
    PersonInfo person,
    bool isLargeDesktop,
  ) {
    return Column(
      crossAxisAlignment: isLargeDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          person.name,
          style: AppTextStyles.h3.copyWith(
            fontSize: Responsive.getValue(
              context,
              mobile: AppTextStyles.fs2,
              tablet: AppTextStyles.fs2,
            ),
          ),
          textAlign: isLargeDesktop ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.onyx,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            person.title,
            style: AppTextStyles.smallText.copyWith(color: AppColors.white1),
          ),
        ),
        const SizedBox(height: 15),
        const ExperiencePillWidget(),
      ],
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: Container(
          padding: EdgeInsets.all(
            Responsive.getValue(context, mobile: 10, tablet: 10),
          ),
          decoration: const BoxDecoration(
            gradient: AppColors.borderGradientOnyx,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [AppShadows.shadow2],
          ),
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isTabletOrLarger(context) ? 15 : 0,
            ),
            decoration: const BoxDecoration(
              gradient: AppColors.bgGradientJet,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (Responsive.isTabletOrLarger(context))
                  Text(
                    _isExpanded ? 'Hide Contacts' : 'Show Contacts',
                    style: const TextStyle(
                      color: AppColors.orangeYellowCrayola,
                      fontSize: 12,
                    ),
                  )
                else
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.orangeYellowCrayola,
                    size: 25,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarMore(BuildContext context, person) {
    return Column(
      children: [
        const Separator(),
        _buildContactsList(context, person),
        const Separator(),
        _buildSocialList(person),
        const SizedBox(height: 20),
        _buildDownloadResumeButton(),
      ],
    );
  }

  Widget _buildDownloadResumeButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _launchUrl('assets/docs/Nahid Hasan Noyon Resume.pdf');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: AppColors.bgGradientJet,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.orangeYellowCrayola.withValues(alpha: 0.5),
            ),
            boxShadow: const [AppShadows.shadow1],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.download_rounded,
                color: AppColors.orangeYellowCrayola,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Download Resume',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.white1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactsList(BuildContext context, PersonInfo person) {
    final isLargeDesktop = Responsive.isLargeDesktop(context);

    final contacts = [
      ContactData(
        icon: Icons.email_outlined,
        title: 'Email',
        value: person.email,
        action: ContactAction.copyEmail,
      ),
      ContactData(
        icon: Icons.phone_android_outlined,
        title: 'Phone',
        value: person.phone,
        action: ContactAction.dialPhone,
      ),
      ContactData(
        icon: Icons.location_on_outlined,
        title: 'Location',
        value: person.location,
        action: ContactAction.openLocation,
      ),
    ];

    if (isLargeDesktop) {
      return Column(
        children: contacts
            .map(
              (contact) => Padding(
                padding: contact == contacts.last
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(bottom: 16),
                child: _buildContactItem(contact),
              ),
            )
            .toList(),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
      childAspectRatio: Responsive.getValue(
        context,
        mobile: 5,
        tablet: 6,
        desktop: 4,
      ),
      mainAxisSpacing: 16,
      crossAxisSpacing: 15,
      children: contacts.map((c) => _buildContactItem(c)).toList(),
    );
  }

  Widget _buildContactItem(ContactData contact) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: AppColors.borderGradientOnyx,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppShadows.shadow1],
          ),
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: AppColors.eerieBlack1,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              contact.icon,
              size: 18,
              color: AppColors.orangeYellowCrayola,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.title.toUpperCase(),
                style: AppTextStyles.smallText.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 2),
              _buildValueWidget(contact),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildValueWidget(ContactData contact) {
    final text = contact.value;
    final isLong = text.length > 20;

    Widget textWidget = Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.white2,
      ),
      // overflow: TextOverflow.ellipsis,
    );

    if (isLong) {
      textWidget = ScrollingTextWidget(text: text);
    }

    Widget interactiveWidget = textWidget;

    switch (contact.action) {
      case ContactAction.copyEmail:
        interactiveWidget = Tooltip(
          message: 'Click to copy: $text',
          child: GestureDetector(
            onTap: () => _copyToClipboard(context, text),
            child: textWidget,
          ),
        );
        break;
      case ContactAction.dialPhone:
        interactiveWidget = GestureDetector(
          onTap: () => _launchUrl('tel:$text'),
          child: textWidget,
        );
        break;
      case ContactAction.openLocation:
        interactiveWidget = GestureDetector(
          onTap: () => _launchUrl('https://maps.app.goo.gl/rToLgEViPPKs8Nmk6'),
          child: textWidget,
        );
        break;
      case ContactAction.none:
        // No action
        break;
    }

    return MouseRegion(
      cursor: contact.action != ContactAction.none
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: interactiveWidget,
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard: $text'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(Uri.encodeFull(url));
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildSocialList(PersonInfo person) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: person.socialLinks.map<Widget>((social) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () => _launchUrl(social.url),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SmartImageWidget(
                source: social.icon,
                width: 24,
                height: 24,
                errorWidget: const Icon(
                  Icons.link,
                  size: 24,
                  color: AppColors.white2,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
