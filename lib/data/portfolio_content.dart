import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';

class PortfolioContent {
  static const PersonInfo person = PersonInfo(
    name: 'Nahid Hasan Noyon',
    title: 'Software Engineer (Flutter)',
    avatarUrl: 'assets/images/nahid_hasan_noyon.jpeg',
    email: 'nahidhasannoyon20@gmail.com',
    phone: '+8801533019893',
    location: 'Dhaka, Bangladesh',
    socialLinks: [
      SocialLink(
        name: 'GitHub',
        url: 'https://github.com/NahidHasanNoyon',
        icon: 'github',
      ),
      SocialLink(
        name: 'LinkedIn',
        url: 'https://linkedin.com/in/NahidHasanNoyon',
        icon: 'linkedin',
      ),
      SocialLink(
        name: 'WhatsApp',
        url: 'https://wa.me/8801533019893',
        icon: 'whatsapp',
      ),
    ],
  );

  static const List<String> aboutText = [
    'Passionate and detail-oriented Flutter Developer with 3+ years of experience building high-performance, cross-platform mobile applications for Android, iOS, and web. Skilled in GetX, Clean Architecture, REST API integration, and responsive UI design. Shipped 4+ scalable, production-ready apps globally. Strong believer in writing clean, maintainable, and testable code that aligns with business goals.',
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      title: 'Flutter App Development',
      description:
          'Building high-performance, cross-platform mobile applications for Android, iOS, and web.',
      iconPath: 'assets/images/icon-app.svg',
    ),
    ServiceItem(
      title: 'REST API Integration',
      description:
          'Integrating RESTful APIs, WebSockets, and Firebase services for real-time and data-driven apps.',
      iconPath: 'assets/images/icon-dev.svg',
    ),
    ServiceItem(
      title: 'UI/UX Design',
      description:
          'Collaborating with UI/UX teams to deliver pixel-perfect, responsive interfaces.',
      iconPath: 'assets/images/icon-design.svg',
    ),
    ServiceItem(
      title: 'App Optimization',
      description:
          'Optimizing app performance, state management, and implementing efficient caching strategies.',
      iconPath: 'assets/images/icon-photo.svg',
    ),
  ];

  static const List<TestimonialItem> testimonials = [
    TestimonialItem(
      name: 'Daniel lewis',
      avatarUrl: 'assets/images/avatar-1.png',
      text:
          'Richard was hired to create a corporate identity. We were very pleased with the work done. She has a lot of experience and is very concerned about the needs of client. Lorem ipsum dolor sit amet, ullamcous cididt consectetur adipiscing elit, seds do et eiusmod tempor incididunt ut laborels dolore magnarels alia.',
      date: '14 June, 2021',
    ),
    TestimonialItem(
      name: 'Jessica miller',
      avatarUrl: 'assets/images/avatar-2.png',
      text:
          'Richard was hired to create a corporate identity. We were very pleased with the work done. She has a lot of experience and is very concerned about the needs of client. Lorem ipsum dolor sit amet, ullamcous cididt consectetur adipiscing elit, seds do et eiusmod tempor incididunt ut laborels dolore magnarels alia.',
      date: '14 June, 2021',
    ),
    TestimonialItem(
      name: 'Emily evans',
      avatarUrl: 'assets/images/avatar-3.png',
      text:
          'Richard was hired to create a corporate identity. We were very pleased with the work done. She has a lot of experience and is very concerned about the needs of client. Lorem ipsum dolor sit amet, ullamcous cididt consectetur adipiscing elit, seds do et eiusmod tempor incididunt ut laborels dolore magnarels alia.',
      date: '14 June, 2021',
    ),
    TestimonialItem(
      name: 'Henry william',
      avatarUrl: 'assets/images/avatar-4.png',
      text:
          'Richard was hired to create a corporate identity. We were very pleased with the work done. She has a lot of experience and is very concerned about the needs of client. Lorem ipsum dolor sit amet, ullamcous cididt consectetur adipiscing elit, seds do et eiusmod tempor incididunt ut laborels dolore magnarels alia.',
      date: '14 June, 2021',
    ),
  ];

  static const List<ClientItem> clients = [
    ClientItem(
      name: 'Client 1',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
    ClientItem(
      name: 'Client 2',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
    ClientItem(
      name: 'Client 3',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
    ClientItem(
      name: 'Client 4',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
    ClientItem(
      name: 'Client 5',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
    ClientItem(
      name: 'Client 6',
      logoUrl: 'assets/images/client-1.png',
      url: '#',
    ),
  ];

  static const List<TimelineItem> education = [
    TimelineItem(
      title: 'Masters in Information Systems Security (MISS)',
      dateRange: 'Jan 2024 - Present',
      description:
          'Weekend classes at Bangladesh University of Professionals, Mirpur-12, Dhaka, Bangladesh.',
    ),
    TimelineItem(
      title: 'Bachelor of Science in Computer Science & Engineering (CSE)',
      dateRange: 'April 2019 - April 2023',
      description:
          'Bangladesh Army International University of Science and Technology, Cumilla, Bangladesh.',
    ),
  ];

  static const List<TimelineItem> experience = [
    TimelineItem(
      title: 'Flutter Developer at Inflack Limited',
      dateRange: 'May 2025 – Present',
      description:
          'Developed and maintained 2 cross-platform apps using Flutter and GetX. Collaborated with UI/UX teams to deliver pixel-perfect, responsive interfaces. Integrated RESTful APIs, WebSockets, and Firebase services to build real-time and data-driven apps. Improved app performance by optimizing state management, reducing widget rebuilds, and implementing efficient caching strategies.',
    ),
    TimelineItem(
      title: 'Quality Checker (Flutter) at SuperAnnotate',
      dateRange: 'February 2025 – April 2025',
      description:
          'Checked and corrected AI-generated Flutter/Dart responses for accuracy and best practices. Fixed logical and structural issues in code and UI components. Ensured clarity, correctness, and clean code standards in all reviewed outputs. Provided feedback to enhance AI response quality.',
    ),
    TimelineItem(
      title: 'Flutter Developer at Cloud Tecnico',
      dateRange: 'October 2024 – January 2025',
      description:
          'Developed Leadvala, a Flutter-based lead generation app with features like call recording, lead assignment, and management.',
    ),
    TimelineItem(
      title: 'Assistant Engineer at ePolli Technologies',
      dateRange: 'May 2023 – September 2024',
      description:
          'Mentored 2 junior Flutter developers on best practices, code quality, and clean architecture. Integrated REST APIs, Firebase Authentication, Firestore, push notifications, and multi-language support across multiple apps.',
    ),
    TimelineItem(
      title: 'Intern at ICT Wing & Archive',
      dateRange: 'September 2022 – April 2023',
      description:
          'Designed and developed the BAIUST Transport Schedule App using Flutter, featuring a digital verification system for authorized bus travel, enhancing convenience and security for Internals.',
    ),
  ];

  static const List<SkillItem> skills = [
    SkillItem(name: 'Dart', percentage: 90),
    SkillItem(name: 'Flutter', percentage: 90),
    SkillItem(name: 'GetX', percentage: 85),
    SkillItem(name: 'Clean Architecture', percentage: 80),
    SkillItem(name: 'REST API', percentage: 85),
    SkillItem(name: 'Firebase', percentage: 80),
    SkillItem(name: 'Testing', percentage: 70),
  ];

  static const List<String> projectCategories = [
    'All',
    'Web design',
    'Applications',
    'Web development',
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'CareConnect App',
      category: 'Applications',
      imageUrl: 'assets/images/project-1.jpg',
    ),
    ProjectItem(
      title: 'SmartAttendance Mobile App',
      category: 'Applications',
      imageUrl: 'assets/images/project-2.png',
    ),
    ProjectItem(
      title: 'ePolli App',
      category: 'Applications',
      imageUrl: 'assets/images/project-3.jpg',
    ),
    ProjectItem(
      title: 'ePolli Shohoz Khamari App',
      category: 'Applications',
      imageUrl: 'assets/images/project-4.png',
    ),
    ProjectItem(
      title: 'GrowBook App',
      category: 'Applications',
      imageUrl: 'assets/images/project-5.png',
    ),
    ProjectItem(
      title: 'ekDeal APP',
      category: 'Applications',
      imageUrl: 'assets/images/project-6.png',
    ),
    ProjectItem(
      title: 'ePolli Multi-vendor App',
      category: 'Applications',
      imageUrl: 'assets/images/project-7.png',
    ),
    ProjectItem(
      title: 'Leadvala',
      category: 'Applications',
      imageUrl: 'assets/images/project-8.jpg',
    ),
    ProjectItem(
      title: 'BAIUST Transport Schedule App',
      category: 'Applications',
      imageUrl: 'assets/images/project-9.png',
    ),
  ];

  static const List<BlogPost> blogPosts = [
    BlogPost(
      title: 'Design conferences in 2022',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-1.jpg',
      excerpt:
          'Veritatis et quasi architecto beatae vitae dicta sunt, explicabo.',
    ),
    BlogPost(
      title: 'Best fonts every designer',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-2.jpg',
      excerpt:
          'Sed ut perspiciatis, nam libero tempore, cum soluta nobis est eligendi.',
    ),
    BlogPost(
      title: 'Design digest #80',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-3.jpg',
      excerpt:
          'Excepteur sint occaecat cupidatat no proident, quis nostrum exercitationem ullam corporis suscipit.',
    ),
    BlogPost(
      title: 'UI interactions of the week',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-4.jpg',
      excerpt:
          'Enim ad minim veniam, consectetur adipiscing elit, quis nostrud exercitation ullamco laboris nisi.',
    ),
    BlogPost(
      title: 'The forgotten art of spacing',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-5.jpg',
      excerpt:
          'Maxime placeat, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    BlogPost(
      title: 'Design digest #79',
      category: 'Design',
      date: 'Feb 23, 2022',
      imageUrl: 'assets/images/blog-6.jpg',
      excerpt:
          'Optio cumque nihil impedit uo minus quod maxime placeat, velit esse cillum.',
    ),
  ];

  static const String mapEmbedUrl =
      'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.9022!2d90.4125!3d23.8103!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c64c6e5c77db%3A0x3b97e7e2e6e6e6e6!2sDhaka%2C%20Bangladesh!5e0!3m2!1sen!2sbd!4v1647608789441!5m2!1sen!2sbd';
}
