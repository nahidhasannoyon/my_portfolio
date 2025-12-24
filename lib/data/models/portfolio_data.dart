class PersonInfo {
  const PersonInfo({
    required this.name,
    required this.title,
    required this.avatarUrl,
    required this.email,
    required this.phone,
    required this.location,
    required this.socialLinks,
  });
  final String name;
  final String title;
  final String avatarUrl;
  final String email;
  final String phone;
  final String location;
  final List<SocialLink> socialLinks;
}

class SocialLink {
  const SocialLink({required this.name, required this.url, required this.icon});
  final String name;
  final String url;
  final String icon;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.description,
    required this.iconPath,
  });
  final String title;
  final String description;
  final String iconPath;
}

class TestimonialItem {
  const TestimonialItem({
    required this.name,
    required this.avatarUrl,
    required this.text,
    required this.date,
  });
  final String name;
  final String avatarUrl;
  final String text;
  final String date;
}

class ClientItem {
  const ClientItem({
    required this.name,
    required this.logoUrl,
    required this.url,
  });
  final String name;
  final String logoUrl;
  final String url;
}

class TimelineItem {
  const TimelineItem({
    required this.title,
    required this.dateRange,
    required this.description,
  });
  final String title;
  final String dateRange;
  final String description;
}

class SkillItem {
  const SkillItem({required this.name, required this.percentage});
  final String name;
  final int percentage;
}

class TechnicalSkillCategory {
  const TechnicalSkillCategory({required this.category, required this.skills});
  final String category;
  final String skills;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.category,
    required this.imageUrl,
    this.url,
  });
  final String title;
  final String category;
  final String imageUrl;
  final String? url;
}

class BlogPost {
  const BlogPost({
    required this.title,
    required this.category,
    required this.date,
    required this.imageUrl,
    required this.excerpt,
    this.url,
  });
  final String title;
  final String category;
  final String date;
  final String imageUrl;
  final String excerpt;
  final String? url;
}
