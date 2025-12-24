import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Blog'),
          const SizedBox(height: 30),
          _buildBlogGrid(context),
        ],
      ),
    );
  }

  Widget _buildBlogGrid(BuildContext context) {
    final crossAxisCount = Responsive.getValue(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 2,
    ).toInt();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: crossAxisCount == 1 ? 1.1 : 0.75,
      ),
      itemCount: PortfolioContent.blogPosts.length,
      itemBuilder: (context, index) {
        return _BlogCard(post: PortfolioContent.blogPosts[index]);
      },
    );
  }
}

class _BlogCard extends StatefulWidget {
  const _BlogCard({required this.post});
  final BlogPost post;

  @override
  State<_BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<_BlogCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.borderGradientOnyx,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [AppShadows.shadow4],
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: AppColors.eerieBlack1,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: SizedBox(
                  height: Responsive.getValue(
                    context,
                    mobile: 200,
                    tablet: 180,
                    desktop: 230,
                  ),
                  width: double.infinity,
                  child: AnimatedScale(
                    scale: _isHovered ? 1.1 : 1,
                    duration: const Duration(milliseconds: 250),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=400&h=250&fit=crop',
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: AppColors.jet,
                        child: const Icon(
                          Icons.image,
                          color: AppColors.lightGray,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  Responsive.getValue(context, mobile: 15, tablet: 25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.post.category,
                          style: AppTextStyles.bodyText.copyWith(
                            color: AppColors.lightGray70,
                          ),
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          decoration: const BoxDecoration(
                            color: AppColors.lightGray70,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          widget.post.date,
                          style: AppTextStyles.bodyText.copyWith(
                            color: AppColors.lightGray70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style: AppTextStyles.h3.copyWith(
                        fontSize: 18,
                        height: 1.3,
                        color: _isHovered
                            ? AppColors.orangeYellowCrayola
                            : AppColors.white2,
                      ),
                      child: Text(
                        widget.post.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.post.excerpt,
                      style: AppTextStyles.bodyText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
