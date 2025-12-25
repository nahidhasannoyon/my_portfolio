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
        icon: 'assets/icons/github.svg',
      ),
      SocialLink(
        name: 'LinkedIn',
        url: 'https://linkedin.com/in/NahidHasanNoyon',
        icon: 'assets/icons/linkedIn.svg',
      ),
      SocialLink(
        name: 'WhatsApp',
        url: 'https://wa.me/8801533019893',
        icon: 'assets/icons/whatsapp.svg',
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

  static const List<EducationTimelineItem> universityEducation = [
    EducationTimelineItem(
      course: 'Masters in Information Systems Security (MISS)',
      dateRange: 'Jan 2024 - Present (Weekend Program)',
      institution: 'Bangladesh University of Professionals',
      location: 'Mirpur-12, Dhaka, Bangladesh',
    ),
    EducationTimelineItem(
      course: 'Bachelor of Science in Computer Science & Engineering (CSE)',
      dateRange: 'April 2019 - April 2023',
      institution:
          'Bangladesh Army International University of Science and Technology',
      location: 'Cumilla, Bangladesh',
    ),
  ];

  static const List<EducationTimelineItem> collegeEducation = [
    EducationTimelineItem(
      course: 'Higher Secondary Certificate (HSC) - Science',
      dateRange: '2016 - 2018',
      institution: 'Uttara High School and College',
      location: 'Uttara, Dhaka, Bangladesh',
    ),
  ];

  static const List<EducationTimelineItem> schoolEducation = [
    EducationTimelineItem(
      course: 'Secondary School Certificate (SSC) - Science',
      dateRange: '2014 - 2016',
      institution: 'Rajdhani Ideal School and College',
      location: 'Rampura, Dhaka, Bangladesh',
    ),
  ];

  static const List<ProfessionalTimelineItem> experience = [
    ProfessionalTimelineItem(
      role: 'Flutter Developer',
      company: 'Inflack Limited',
      dateRange: 'May 2025 – Present (8 Months)',
      location: 'Baridhara, Dhaka',
      description: [
        'Developed and maintained 2 cross-platform apps using Flutter and GetX.',
        'Collaborated with UI/UX teams to deliver pixel-perfect, responsive interfaces.',
        'Integrated RESTful APIs, WebSockets, and Firebase services to build real-time and data-driven apps.',
        'Improved app performance by optimizing state management, reducing widget rebuilds, and implementing efficient caching strategies.',
      ],
    ),
    ProfessionalTimelineItem(
      role: 'Quality Checker (Flutter)',
      company: 'SuperAnnotate',
      dateRange: 'February 2025 – April 2025 (3 Months)',
      location: 'Contract',
      description: [
        'Checked and corrected AI-generated Flutter/Dart responses for accuracy and best practices.',
        'Fixed logical and structural issues in code and UI components.',
        'Ensured clarity, correctness, and clean code standards in all reviewed outputs.',
        'Provided feedback to enhance AI response quality.',
      ],
    ),
    ProfessionalTimelineItem(
      role: 'Flutter Developer',
      company: 'Cloud Tecnico',
      dateRange: 'October 2024 – January 2025 (4 Months)',
      location: 'Remote (India)',
      description: [
        'Developed Leadvala, a Flutter-based lead generation app with features like call recording, lead assignment, and management.',
      ],
    ),
    ProfessionalTimelineItem(
      role: 'Assistant Engineer',
      company: 'ePolli Technologies',
      dateRange: 'May 2023 – September 2024 (1 Year 5 Month)',
      location: 'Mirpur DOHS, Dhaka',
      description: [
        'Mentored 2 junior Flutter developers on best practices, code quality, and clean architecture',
        'Integrated REST APIs, Firebase Authentication, Firestore, push notifications, and multi-language support across multiple apps.',
      ],
    ),
  ];

  static const List<ProfessionalTimelineItem> interns = [
    ProfessionalTimelineItem(
      role: 'Intern',
      company: 'ICT Wing & Archive',
      dateRange: 'September 2022 – April 2023 (8 Months)',
      location: 'Cumilla',
      description: [
        'Designed and developed the BAIUST Transport Schedule App using Flutter, featuring a digital verification system for authorized bus travel, enhancing convenience and security for Internals.',
      ],
    ),
  ];

  static const List<TechnicalSkillCategory> technicalSkills = [
    TechnicalSkillCategory(category: 'Languages', skills: 'Dart'),
    TechnicalSkillCategory(category: 'Frameworks', skills: 'Flutter'),
    TechnicalSkillCategory(
      category: 'State Management',
      skills: 'GetX, Provider',
    ),
    TechnicalSkillCategory(
      category: 'Architecture',
      skills:
          'Clean Architecture/, MVVM/, MVC/, Modular Architecture/, SOLID Principles',
    ),
    TechnicalSkillCategory(
      category: 'Local Storage',
      skills:
          'Hive (NoSQL)/, Shared Preferences/, Flutter Secure Storage/, GetStorage',
    ),
    TechnicalSkillCategory(
      category: 'Cloud & Backend Services',
      skills:
          'Firebase Ecosystem (Auth, Firestore, Realtime DB, Cloud Messaging(FCM), Crashlytics)',
    ),
    TechnicalSkillCategory(
      category: 'Networking',
      skills: 'REST APIs (Dio, Getx)/, WebSockets (Socket.IO)',
    ),
    TechnicalSkillCategory(
      category: 'Performance, Security & Observability',
      skills:
          'App Size Reduction/, Memory Leak Detection/, Image Caching/, Lazy Loading/, Obfuscation/, Error Handling & Logging',
    ),
    TechnicalSkillCategory(
      category: 'Native & Platform Integration',
      skills:
          'Google Maps SDK/, Payment Gateways (Bkash, Stripe)/, Google Sign-In (SSO)',
    ),
    TechnicalSkillCategory(
      category: 'Testing',
      skills:
          'Unit Testing/, Widget Testing/, Integration Testing/, Mocking (Mockito, Mocktail)/, Error Handling & Logging',
    ),
    TechnicalSkillCategory(
      category: 'UI / UX Engineering',
      skills:
          'Animations/, Reusable Component Libraries/, Responsive & Adaptive Layouts/, Multi-theme Support',
    ),
    TechnicalSkillCategory(
      category: 'DevOps, CI/CD & Tooling',
      skills:
          'Git & GitHub/, GitHub Actions (CI/CD)/, Play Console/, Android Studio/, VS Code/, Postman/, Figma/, Flutter DevTools',
    ),
    TechnicalSkillCategory(
      category: 'Project & Workflow Management',
      skills: 'Trello/, ClickUp/, Slack',
    ),
    TechnicalSkillCategory(
      category: 'Advanced Features',
      skills:
          'Deep Linking/, Localization & Internationalization (i18n)/, Push Notifications (FCM)',
    ),
  ];

  static const List<String> softSkills = [
    'Technical Leadership',
    'Strategic Communication',
    'Architectural Decision-Making',
    'Problem-Solving & Debugging',
    'Product Ownership',
    'Collaborative Design',
    'Time & Resource Management',
    'Adaptability & Continuous Learning',
    'Team Collaboration',
    'Attention to Detail',
    'Critical Thinking',
    'Time Management',
    'Clean Code Mindset',
  ];

  static const List<String> projectCategories = [
    'All',
    'Applications',
    'Web development',
    'Packages',
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'CareConnect App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1579154204601-01d82b27ebcc?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=600&h=400&fit=crop',
      ],
      description:
          'A comprehensive healthcare application connecting patients with medical professionals and enabling appointment scheduling, medical record management, and telemedicine consultations.',
      keywords: ['Flutter', 'Healthcare', 'Firebase', 'REST API'],
      links: [
        ProjectLink(
          name: 'GitHub',
          url: 'https://github.com/nahidhasannoyon/careconnect',
          icon: 'assets/icons/github.svg',
        ),
      ],
    ),
    ProjectItem(
      title: 'SmartAttendance Mobile App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552664730-d307ca884978?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552965736-5a6370d0d17b?w=600&h=400&fit=crop',
      ],
      description:
          'An intelligent attendance tracking system using biometric recognition and real-time synchronization for schools and organizations with comprehensive reporting features.',
      keywords: ['Flutter', 'Biometrics', 'Real-time Sync', 'Analytics'],
    ),
    ProjectItem(
      title: 'ePolli App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?w=600&h=400&fit=crop',
      ],
      description:
          'A multi-vendor e-commerce platform enabling seamless shopping experience with product catalog, cart management, secure payment integration, and order tracking.',
      keywords: ['Flutter', 'E-commerce', 'Payment Gateway', 'GetX'],
    ),
    ProjectItem(
      title: 'ePolli Shohoz Khamari App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1555939594-58d7cb561231?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1484488167118-3a23c0b7b8a3?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=600&h=400&fit=crop',
      ],
      description:
          'A specialized e-commerce application for groceries and daily essentials with real-time inventory management, fast delivery integration, and consumer-friendly interface.',
      keywords: ['Flutter', 'E-commerce', 'Grocery', 'Delivery Integration'],
    ),
    ProjectItem(
      title: 'GrowBook App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=600&h=400&fit=crop',
      ],
      description:
          'An agricultural technology platform designed to help farmers track crops, manage resources, access market prices, and connect with agricultural experts for better yields.',
      keywords: ['Flutter', 'AgriTech', 'Data Analytics', 'IoT Integration'],
    ),
    ProjectItem(
      title: 'ekDeal APP',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1552288049-bebda541e8ee?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1556740722-97cbbba6db3b?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1564684853211-8db1bdf9c5f4?w=600&h=400&fit=crop',
      ],
      description:
          'A dynamic deals and discounts marketplace featuring real-time offers, vendor collaboration, user-friendly deal discovery, and secure transaction management.',
      keywords: ['Flutter', 'E-commerce', 'Offers', 'Provider'],
    ),
    ProjectItem(
      title: 'ePolli Multi-vendor App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=600&h=400&fit=crop',
      ],
      description:
          'A scalable multi-vendor platform supporting hundreds of sellers with individual stores, inventory management, commission handling, and comprehensive admin dashboard.',
      keywords: ['Flutter', 'Multi-vendor', 'Firestore', 'Clean Architecture'],
    ),
    ProjectItem(
      title: 'Leadvala',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1552664730-d307ca884978?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1556740722-97cbbba6db3b?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1552965736-5a6370d0d17b?w=600&h=400&fit=crop',
      ],
      description:
          'A lead generation and management platform featuring call recording, automatic lead assignment, analytics dashboard, and CRM integration for sales teams.',
      keywords: ['Flutter', 'CRM', 'Call Recording', 'Lead Management'],
    ),
    ProjectItem(
      title: 'BAIUST Transport Schedule App',
      category: 'Applications',

      imageUrls: [
        'https://images.unsplash.com/photo-1576092160562-40f96b0fbbf0?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1464207687429-7505649dae38?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=600&h=400&fit=crop',
      ],
      description:
          'A university transport management system with digital verification for bus travel, real-time tracking, schedule management, and attendance integration for students.',
      keywords: ['Flutter', 'Transportation', 'Digital Verification', 'IoT'],
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

  static const List<String> certificationCategories = [
    'All',
    'Development',
    'Version Control',
    'AI & Tools',
  ];

  static const List<CertificationItem> certifications = [
    CertificationItem(
      title: 'Introduction to Git and GitHub',
      issuer: 'Google',
      issuerLogo: 'assets/icons/google.svg',
      category: 'Version Control',
      imageUrl:
          'https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?w=600&h=400&fit=crop',
      issueDate: 'Oct 2024',
      skills: ['Version Control (Git, GitHub)'],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'ChatGPT Plugins: The Complete Guide',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'AI & Tools',
      imageUrl:
          'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=600&h=400&fit=crop',
      issueDate: 'Oct 2023',
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Learn Flutter GetX Course 2023',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=600&h=400&fit=crop',
      issueDate: 'Oct 2023',
      skills: [
        'Dart',
        'Dependency Injection',
        'Cross-platform Development',
        'GetX',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Mastering the Fundamentals of ChatGPT and AI Tools',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'AI & Tools',
      imageUrl:
          'https://images.unsplash.com/photo-1655720406770-12ea329b5b61?w=600&h=400&fit=crop',
      issueDate: 'Oct 2023',
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Flutter & Dart - The Complete Flutter App Development Course',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=600&h=400&fit=crop',
      issueDate: 'Dec 2022',
      skills: [
        'Dart',
        'Cross-platform Development',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Dart and Flutter: The Complete Developer\'s Guide',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&h=400&fit=crop',
      issueDate: 'Nov 2022',
      skills: [
        'Dart',
        'Cross-platform Development',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Flutter - Firebase - MySQL Multi-store App (Full - Deep)',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1484417894907-623942c8ee29?w=600&h=400&fit=crop',
      issueDate: 'Nov 2022',
      skills: [
        'Dart',
        'Cross-platform Development',
        'Firebase',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'The Complete 2021 Flutter Development Bootcamp with Dart',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=600&h=400&fit=crop',
      issueDate: 'Oct 2022',
      skills: [
        'Dart',
        'Cross-platform Development',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'The Git & GitHub Bootcamp',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Version Control',
      imageUrl:
          'https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=600&h=400&fit=crop',
      issueDate: 'Oct 2022',
      skills: ['Version Control (Git, GitHub)'],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'GetX Flutter App Development',
      issuer: 'MindLuster',
      issuerLogo: 'assets/icons/mindluster.svg',
      category: 'Development',
      imageUrl:
          'https://images.unsplash.com/photo-1504639725590-34d0984388bd?w=600&h=400&fit=crop',
      skills: [
        'Dart',
        'Dependency Injection',
        'Cross-platform Development',
        'GetX',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
    CertificationItem(
      title: 'Git Going Fast One Hour Git Crash Course Certificate',
      issuer: 'Udemy',
      issuerLogo: 'assets/icons/udemy.svg',
      category: 'Version Control',
      imageUrl:
          'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=600&h=400&fit=crop',
      skills: ['Version Control (Git, GitHub)'],
      credentialLink: ProjectLink(name: 'Show credential', url: '#'),
    ),
  ];
}
