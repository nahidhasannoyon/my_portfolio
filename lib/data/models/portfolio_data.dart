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

class ProfessionalTimelineItem {
  const ProfessionalTimelineItem({
    required this.company,
    required this.location,
    required this.role,
    required this.dateRange,
    required this.description,
  });
  final String company;
  final String location;
  final String role;
  final String dateRange;
  final List<String> description;
}

class EducationTimelineItem {
  const EducationTimelineItem({
    required this.course,
    required this.dateRange,
    required this.institution,
    required this.location,
  });
  final String course;
  final String dateRange;
  final String institution;
  final String location;
}

class SkillItem {
  const SkillItem({required this.name, required this.percentage});
  final String name;
  final int percentage;
}

class ProjectLink {
  const ProjectLink({required this.name, required this.url, this.icon});
  final String name;
  final String url;
  final String? icon;
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
    this.imageUrls,
    this.description,
    this.keywords,
    this.links,
  });
  final String title;
  final String category;
  final List<String>? imageUrls;
  final String? description;
  final List<String>? keywords;
  final List<ProjectLink>? links;
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

class CertificationItem {
  const CertificationItem({
    required this.title,
    required this.issuer,
    required this.issuerLogo,
    required this.category,
    this.imageUrl,
    this.issueDate,
    this.credentialLink,
    this.skills,
  });
  final String title;
  final String issuer;
  final String issuerLogo;
  final String category;
  final String? imageUrl;
  final String? issueDate;
  final ProjectLink? credentialLink;
  final List<String>? skills;
}
