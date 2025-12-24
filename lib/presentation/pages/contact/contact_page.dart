import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _messageController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid =
          _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _emailController.text.contains('@') &&
          _messageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
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
          const ArticleTitle(title: 'Contact'),
          const SizedBox(height: 30),
          _buildMap(context),
          const SizedBox(height: 30),
          _buildContactForm(context),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return Container(
      height: Responsive.getValue(context, mobile: 250, tablet: 380),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.jet),
        borderRadius: BorderRadius.circular(
          Responsive.getValue(context, mobile: 16, tablet: 18),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          -1, 0, 0, 0, 255, //
          0, -1, 0, 0, 255, //
          0, 0, -1, 0, 255, //
          0, 0, 0, 1, 0, //
        ]),
        child: Container(
          color: AppColors.jet,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.eerieBlack1, AppColors.jet],
                    ),
                  ),
                ),
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 50,
                      color: AppColors.orangeYellowCrayola,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sacramento, California, USA',
                      style: AppTextStyles.bodyText,
                    ),
                    SizedBox(height: 5),
                    Text('Map view', style: AppTextStyles.smallText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact Form', style: AppTextStyles.h3),
          const SizedBox(height: 20),
          if (isDesktop)
            Row(
              children: [
                Expanded(
                  child: _FormInput(
                    controller: _nameController,
                    hintText: 'Full name',
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _FormInput(
                    controller: _emailController,
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _FormInput(
                  controller: _nameController,
                  hintText: 'Full name',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 25),
                _FormInput(
                  controller: _emailController,
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          const SizedBox(height: 25),
          _FormInput(
            controller: _messageController,
            hintText: 'Your Message',
            maxLines: 5,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 25),
          Align(
            alignment: isDesktop ? Alignment.centerRight : Alignment.center,
            child: _SubmitButton(
              isEnabled: _isFormValid,
              isFullWidth: !isDesktop,
              onPressed: _isFormValid
                  ? () {
                      // Handle form submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Message sent successfully!'),
                          backgroundColor: AppColors.orangeYellowCrayola,
                        ),
                      );
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _FormInput extends StatefulWidget {
  const _FormInput({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  State<_FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<_FormInput> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        fontSize: 14,
        color: AppColors.white2,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: AppTextStyles.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGray70,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: Responsive.getValue(context, mobile: 13, tablet: 15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.jet),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.orangeYellowCrayola),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  const _SubmitButton({
    required this.isEnabled,
    required this.isFullWidth,
    this.onPressed,
  });
  final bool isEnabled;
  final bool isFullWidth;
  final VoidCallback? onPressed;

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.isEnabled
          ? (_) => setState(() => _isHovered = true)
          : null,
      onExit: widget.isEnabled
          ? (_) => setState(() => _isHovered = false)
          : null,
      cursor: widget.isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: widget.isEnabled ? 1 : 0.7,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: widget.isFullWidth ? double.infinity : null,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: Responsive.getValue(context, mobile: 13, tablet: 16),
            ),
            decoration: BoxDecoration(
              gradient: _isHovered && widget.isEnabled
                  ? AppColors.bgGradientYellow1
                  : AppColors.borderGradientOnyx,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [AppShadows.shadow3],
            ),
            child: Row(
              mainAxisSize: widget.isFullWidth
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.send,
                  size: Responsive.getValue(context, mobile: 16, tablet: 18),
                  color: AppColors.orangeYellowCrayola,
                ),
                const SizedBox(width: 10),
                Text(
                  'Send Message',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: Responsive.getValue(
                      context,
                      mobile: 14,
                      tablet: 16,
                    ),
                    color: AppColors.orangeYellowCrayola,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
