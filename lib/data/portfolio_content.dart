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
        url: 'https://github.com/nahidhasannoyon',
        icon: 'assets/icons/github.svg',
      ),
      SocialLink(
        name: 'LinkedIn',
        url: 'https://linkedin.com/in/nahidhasannoyon',
        icon: 'assets/icons/linkedIn.svg',
      ),
      SocialLink(
        name: 'WhatsApp',
        url: 'https://wa.me/8801533019893',
        icon: 'assets/icons/whatsapp.svg',
      ),
    ],
    languages: [
      LanguageItem(
        name: 'Bengali',
        proficiency: 'Native/bilingual proficiency',
      ),
      LanguageItem(
        name: 'English',
        proficiency: 'Professional working proficiency',
      ),
      LanguageItem(name: 'Hindi', proficiency: 'Elementary proficiency'),
    ],
  );

  static const List<String> aboutText = [
    'Passionate and detail-oriented <b>Flutter Developer</b> with <b>3+ years of experience</b> building high-performance, cross-platform mobile applications for <b>Android, iOS, and web</b>. Skilled in <b>GetX</b>, <b>Clean Architecture</b>, <b>REST API integration</b>, and <b>responsive UI design</b>. Shipped <b>4+ scalable, production-ready apps</b> globally. Strong believer in writing <b>clean, maintainable, and testable code</b> that aligns with business goals.',
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      title: 'Flutter App Development',
      description:
          'Building high-performance, cross-platform mobile applications for Android, iOS, and web.',
      iconPath: 'assets/icons/pub-dev-logo.svg',
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

  static const List<ExperienceTimelineItem> professional = [
    ExperienceTimelineItem(
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
    ExperienceTimelineItem(
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
    ExperienceTimelineItem(
      role: 'Flutter Developer',
      company: 'Cloud Tecnico',
      dateRange: 'October 2024 – January 2025 (4 Months)',
      location: 'Remote (India)',
      description: [
        'Developed Leadvala, a Flutter-based lead generation app with features like call recording, lead assignment, and management.',
      ],
    ),
    ExperienceTimelineItem(
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

  static const List<ExperienceTimelineItem> interns = [
    ExperienceTimelineItem(
      role: 'Intern',
      company: 'ICT Wing & Archive',
      dateRange: 'September 2022 – April 2023 (8 Months)',
      location: 'Cumilla, Bangladesh',
      description: [
        'Designed and developed the BAIUST Transport Schedule App using Flutter, featuring a digital verification system for authorized bus travel, enhancing convenience and security for teacher, student, and staff.',
      ],
    ),
  ];

  static const List<ExperienceTimelineItem> volunteer = [
    ExperienceTimelineItem(
      role: 'Executive Member',
      company: 'BAIUST Computer Club',
      dateRange: 'July 2019 – January 2023 (3 Years 7 Months)',
      location: 'Cumilla, Bangladesh',
      description: [
        'Organized coding workshops, hackathons, and tech talks to foster a culture of learning and innovation among members.',
        'Led a team of 5 members to develop and maintain the club\'s website and mobile app, enhancing member engagement and communication.',
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
    ProjectItem(
      title: 'Smart State Handler',
      category: 'Packages',

      imageUrls: [
        'https://images.unsplash.com/photo-1576092160562-40f96b0fbbf0?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1464207687429-7505649dae38?w=600&h=400&fit=crop',
        'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=600&h=400&fit=crop',
      ],
      description:
          'A fully customizable Flutter UI state-management package designed to handle loading, error,   success, empty, and offline states with smooth animations, overlay mode, and pagination support. Includes configurable components for text, widgets, snackbars, and transitions, making it ideal for scalable and clean UI-state workflows.',
      keywords: [
        'State Management',
        'UI',
        'Widget',
        'Animation',
        'Overlay',
        'Pagination',
      ],
      links: [
        ProjectLink(
          name: 'Pub.dev',
          url: 'https://pub.dev/packages/smart_state_handler',
          icon: 'assets/icons/pub-dev-logo.svg',
        ),
        ProjectLink(
          name: 'GitHub',
          url: 'https://github.com/nahidhasannoyon/smart_state_handler',
          icon: 'assets/icons/github.svg',
        ),
      ],
    ),
  ];

  static const List<String> certificationCategories = [
    'All',
    'Dart & Flutter',
    'Version Control',
    'AI & Tools',
  ];

  static const List<CertificationItem> certifications = [
    CertificationItem(
      title: 'Introduction to Git and GitHub',
      issuer: 'Google',
      issuerLogo: 'assets/images/google.png',
      category: 'Version Control',
      imageUrl:
          'assets/images/certificates/Courses/Git/Introduction to Git and GitHub Certificate.jpg',
      issueDate: 'Oct 2024',
      skills: ['Git', 'GitHub'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.coursera.org/account/accomplishments/records/WLI4XD6XBYZE',
      ),
    ),
    CertificationItem(
      title: 'ChatGPT Plugins: The Complete Guide',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'AI & Tools',
      imageUrl:
          'assets/images/certificates/Courses/ChatGPT/ChatGPT Plugins - The Complete Guide.jpg',
      issueDate: 'Oct 2023',
      skills: ['ChatGPT', 'AI', 'Prompt Engineering', 'API Integration'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-cfbf48aa-a01b-4a4f-b803-7f762cc3e65a/',
      ),
    ),
    CertificationItem(
      title: 'Learn Flutter GetX Course 2023',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Dart & Flutter',
      imageUrl:
          'assets/images/certificates/Courses/Flutter/Learn Flutter GetX Course 2023.jpg',
      issueDate: 'Oct 2023',
      skills: [
        'Dart',
        'Dependency Injection',
        'GetX',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-c319b14e-de38-432d-9fc7-49117bb86692/',
      ),
    ),
    CertificationItem(
      title: 'Mastering the Fundamentals of ChatGPT and AI Tools',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'AI & Tools',
      imageUrl:
          'assets/images/certificates/Courses/ChatGPT/Mastering the Fundamentals of ChatGPT and AI Tools.jpg',
      issueDate: 'Oct 2023',
      skills: ['ChatGPT', 'AI Tools', 'Prompt Engineering', 'Productivity'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-83486d73-81d2-4951-bc98-8c24ba5cc68c/',
      ),
    ),
    CertificationItem(
      title: 'GetX Flutter App Development',
      issuer: 'MindLuster',
      issuerLogo: 'assets/images/mind_luster.png',
      category: 'Dart & Flutter',
      issueDate: 'May 2023',
      imageUrl:
          'assets/images/certificates/Courses/Flutter/GetX Flutter App Development.jpg',
      skills: [
        'Dart',
        'Dependency Injection',
        'GetX',
        'Flutter',
        'State Management',
      ],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url: 'https://www.mindluster.com/certified/check/2692793577',
      ),
    ),
    CertificationItem(
      title: 'Flutter & Dart - The Complete Flutter App Development Course',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Dart & Flutter',
      imageUrl:
          'assets/images/certificates/Courses/Flutter/Flutter & Dart - The Complete Flutter App Development Course.jpg',
      issueDate: 'Dec 2022',
      skills: ['Dart', 'Flutter', 'State Management'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-42e3ba4c-7e61-4ee2-9156-5d331ec11cd8/',
      ),
    ),
    CertificationItem(
      title: 'Dart and Flutter: The Complete Developer\'s Guide',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Dart & Flutter',
      imageUrl:
          "assets/images/certificates/Courses/Flutter/Dart and Flutter - The Complete Developer's Guide.jpg",
      issueDate: 'Nov 2022',
      skills: ['Dart', 'Flutter', 'State Management'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-efcd343c-df68-4a4e-acec-240a52e3e62b/',
      ),
    ),
    CertificationItem(
      title: 'Flutter - Firebase - MySQL Multi-store App (Full - Deep)',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Dart & Flutter',
      imageUrl:
          'assets/images/certificates/Courses/Flutter/Flutter - Firebase - MySQL Multi-store App (Full - Deep).jpg',
      issueDate: 'Nov 2022',
      skills: ['Dart', 'Firebase', 'Flutter', 'State Management'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-139b11e1-2a94-4671-8eaf-c5721b57a477/',
      ),
    ),
    CertificationItem(
      title: 'The Complete 2021 Flutter Development Bootcamp with Dart',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Dart & Flutter',
      imageUrl:
          'assets/images/certificates/Courses/Flutter/The Complete Flutter Development Bootcamp with Dart.jpg',
      issueDate: 'Oct 2022',
      skills: ['Dart', 'Flutter', 'State Management'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-a5d0fcff-29e6-45ff-92a0-454fc03509c7/',
      ),
    ),
    CertificationItem(
      title: 'The Git & GitHub Bootcamp',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Version Control',
      imageUrl:
          'assets/images/certificates/Courses/Git/The Git & GitHub Bootcamp.jpg',
      issueDate: 'Oct 2022',
      skills: ['Git', 'GitHub'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-a29331dd-9144-4e6f-b75d-c31b82bd5516/',
      ),
    ),
    CertificationItem(
      title: 'Git Going Fast One Hour Git Crash Course Certificate',
      issuer: 'Udemy',
      issuerLogo: 'assets/images/udemy.png',
      category: 'Version Control',
      issueDate: 'July 2022',
      imageUrl:
          'assets/images/certificates/Courses/Git/Git Going Fast One Hour Git Crash Course Certificate.jpg',
      skills: ['Git', 'GitHub'],
      credentialLink: ProjectLink(
        name: 'Show credential',
        url:
            'https://www.udemy.com/certificate/UC-9ce99ead-30bd-47ff-8b10-725ef76ccbbe/',
      ),
    ),
  ];
}
