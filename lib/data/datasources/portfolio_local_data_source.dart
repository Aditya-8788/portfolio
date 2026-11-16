import 'package:flutter/material.dart';

import '../../domain/entities/achievement.dart';
import '../../domain/entities/app_links.dart';
import '../../domain/entities/certificate_gallery_item.dart';
import '../../domain/entities/certification.dart';
import '../../domain/entities/contact_link.dart';
import '../../domain/entities/education_item.dart';
import '../../domain/entities/experience_item.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/summary_info.dart';
import '../../domain/entities/top_skill.dart';

/// Static, in-memory source of truth for every piece of portfolio content.
class PortfolioLocalDataSource {
  const PortfolioLocalDataSource();

  static const AppLinks _appLinks = AppLinks(
    github: 'https://github.com/Aditya-8788',
    linkedin: 'https://www.linkedin.com/in/aditya-khochikar/',
    leetcode: 'https://leetcode.com/u/Aditya_khochikar115/',
    resume: 'resume.pdf',
    mailto: 'mailto:adityakhochikar@gmail.com',
    location: 'Kolhapur, Maharashtra, India',
    email: 'adityakhochikar@gmail.com',
  );

  static const List<EducationItem> _educationItems = [
    EducationItem(
      degree: 'B.Tech — Computer Science and Engineering',
      institute:
          'Ashokrao Mane Group of Institutions, Vathar Kolhapur, Maharashtra',
      period: 'July 2022 – June 2026',
      tag: 'CGPA 6.9',
      icon: Icons.school_rounded,
    ),
    EducationItem(
      degree: 'HSC (Science — PCM)',
      institute: 'Hanumantrao Chate Jr College of Science, Shahuwadi, Kolhapur',
      period: '2020 – 2022',
      tag: '71.33%',
      icon: Icons.science_rounded,
    ),
  ];

  static const SummaryInfo _summary = SummaryInfo(
    headline:
        'Flutter Developer building scalable, production-ready mobile apps',
    paragraphs: [
      'Flutter Developer at WhatBytes and B.Tech Computer Science & Engineering student at Ashokrao Mane Group of Institutions (2022 – 2026, CGPA 6.9). I build cross-platform apps with Flutter & Dart using BLoC state management, Clean Architecture, the Repository Pattern and Dependency Injection (GetIt).',
      'Hands-on with Firebase Authentication (Email/Password, Google Sign-In, role-based access), Cloud Firestore, REST API integration, JSON parsing, asynchronous programming and CRUD operations — delivered through responsive Material UIs with reusable widgets and smooth Flutter animations.',
      'A strong problem solver: 90+ DSA problems solved on LeetCode & GFG, ranked in the Top 100 of 1800+ students at DBATU, and 3rd place at the Code Carnival secure coding competition (REFLEX 2K25).',
    ],
    stats: [
      SummaryStat(value: 'WhatBytes', label: 'Flutter Developer'),
      SummaryStat(value: '90+', label: 'DSA problems solved'),
      SummaryStat(value: 'Top 100', label: 'of 1800+ at DBATU'),
      SummaryStat(value: '6.9', label: 'B.Tech CSE CGPA'),
    ],
  );

  static const List<ExperienceItem> _experienceItems = [
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'WhatBytes',
      location: 'Bengaluru, Karnataka · Remote',
      period: 'Sep 2026 – Present',
      icon: Icons.work_rounded,
      current: true,
      projects: ['Bodhi', 'Cloud Closet', 'Skadoosh'],
      highlights: [
        'Redesigned the Home screen of Bodhi, a meditation and spiritual-learning Flutter app (Jump Back In, Explore by Path/Masters, Recommended For You, gallery, side drawer)',
        'Built Path and Master detail screens, a journey timeline with level progress, and a story-style slide viewer with audio, bookmark and share',
        'Integrated REST APIs for masters, learning paths and level progress; built a paginated history screen with search and date grouping',
        'Implemented save-to-collection with bottom sheets to create, edit and delete collections, plus a multi-select item picker',
        'Contributed to the Cloud Closet and Skadoosh Flutter apps on REST API integration and feature development',
        'Used ngrok to test API integration against the local backend and Flutter DevTools to debug layout and performance; followed BLoC and Clean Architecture',
      ],
      tags: [
        'Flutter',
        'Dart',
        'BLoC',
        'Clean Architecture',
        'REST API',
        'Pagination',
        'Flutter DevTools',
        'ngrok',
      ],
    ),
  ];

  static const List<TopSkill> _topSkills = [
    TopSkill(name: 'BLoC State Management', fraction: 0.90),
    TopSkill(name: 'Clean Architecture', fraction: 0.88),
    TopSkill(name: 'Firebase Integration', fraction: 0.85),
  ];

  static const List<SkillCategory> _skillCategories = [
    SkillCategory(
      label: 'Languages',
      icon: Icons.code_rounded,
      skills: [
        Skill(name: 'Dart', core: true),
        Skill(name: 'Java'),
        Skill(name: 'JavaScript'),
        Skill(name: 'HTML'),
        Skill(name: 'CSS'),
      ],
    ),
    SkillCategory(
      label: 'Mobile App Development',
      icon: Icons.smartphone_rounded,
      skills: [
        Skill(name: 'Flutter', core: true),
        Skill(name: 'Material Design'),
        Skill(name: 'Responsive UI'),
        Skill(name: 'Flutter Animations'),
        Skill(name: 'Navigation'),
        Skill(name: 'Reusable Widgets'),
      ],
    ),
    SkillCategory(
      label: 'State Management & Architecture',
      icon: Icons.account_tree_rounded,
      skills: [
        Skill(name: 'BLoC', core: true),
        Skill(name: 'Clean Architecture', core: true),
        Skill(name: 'Repository Pattern'),
        Skill(name: 'Dependency Injection (GetIt)'),
        Skill(name: 'Feature-based Architecture'),
      ],
    ),
    SkillCategory(
      label: 'Backend & Database',
      icon: Icons.cloud_rounded,
      skills: [
        Skill(name: 'Firebase Authentication', core: true),
        Skill(name: 'Cloud Firestore', core: true),
        Skill(name: 'REST API Integration', core: true),
        Skill(name: 'JSON Parsing'),
        Skill(name: 'CRUD Operations'),
        Skill(name: 'Role-based Authentication'),
        Skill(name: 'Asynchronous Programming'),
        Skill(name: 'Pagination'),
      ],
    ),
    SkillCategory(
      label: 'Tools',
      icon: Icons.terminal_rounded,
      skills: [
        Skill(name: 'Git', core: true),
        Skill(name: 'GitHub', core: true),
        Skill(name: 'VS Code'),
        Skill(name: 'IntelliJ'),
        Skill(name: 'Firebase Console'),
        Skill(name: 'Flutter DevTools'),
        Skill(name: 'ngrok'),
      ],
    ),
  ];

  static const List<Project> _projects = [
    Project(
      title: 'Gym Exercise Guide App',
      subtitle: 'Flutter fitness app with a REST-backed exercise catalog',
      icon: Icons.fitness_center_rounded,
      tags: [
        'Flutter',
        'Dart',
        'BLoC',
        'Clean Architecture',
        'Firebase Auth',
        'Cloud Firestore',
        'REST API',
      ],
      bullets: [
        'Developed a Flutter fitness application using Clean Architecture & BLoC for scalable state management',
        'Integrated Firebase Authentication (Email/Password & Google Sign-In) for secure user authentication',
        'Consumed exercise data from a REST API & implemented asynchronous data loading with loading & error states',
        'Built responsive UI with reusable widgets, smooth navigation & Flutter animations',
        'Implemented feature-based architecture with Repository Pattern & Dependency Injection',
      ],
      categories: ['Flutter & Firebase', 'Architecture-focused'],
      githubUrl: 'https://github.com/Aditya-8788/gym',
      codeAvailable: true,
    ),
    Project(
      title: 'Food Delivery App',
      subtitle: 'Role-based Customer & Hotel Owner Flutter application',
      icon: Icons.fastfood_rounded,
      tags: [
        'Flutter',
        'Dart',
        'BLoC',
        'Clean Architecture',
        'Firebase Auth',
        'Cloud Firestore',
      ],
      bullets: [
        'Developed a role-based application supporting Customer & Hotel Owner profiles within a single Flutter application',
        'Implemented Firebase Authentication with Email/Password login & secure role-based navigation',
        'Integrated Cloud Firestore for storing user profiles, hotel information & food data with real-time retrieval',
        'Developed complete CRUD operations allowing hotel owners to add, update, delete & manage food items',
        'Displayed food details including price, category, calories, protein, carbohydrates & fat for customers',
        'Applied BLoC, Clean Architecture, Repository Pattern & Dependency Injection for maintainable code',
        'Designed responsive UI with reusable widgets, smooth animations & modern Material Design',
      ],
      categories: ['Flutter & Firebase', 'Architecture-focused'],
      githubUrl: 'https://github.com/Aditya-8788/food-list-app',
      codeAvailable: true,
    ),
  ];

  static const List<Certification> _certifications = [
    Certification(
      title: 'PHP and MySQL Training',
      issuer: 'Ashokrao Mane Group of Institutions, Kolhapur',
      icon: Icons.storage_rounded,
    ),
    Certification(
      title: 'Data Structures and Algorithms using Java',
      issuer: 'NPTEL',
      icon: Icons.account_tree_rounded,
    ),
  ];

  static const List<Achievement> _achievements = [
    Achievement(
      title:
          'Solved 90+ DSA problems on LeetCode and GFG; ranked Top 100 out of 1800+ students at DBATU, Lonere',
      icon: Icons.emoji_events_rounded,
    ),
    Achievement(
      title:
          '3rd Place — Code Carnival Secure Coding Competition (REFLEX 2K25), Ashokrao Mane Group of Institutions',
      icon: Icons.military_tech_rounded,
    ),
    Achievement(
      title:
          'Participated in CodeKaze June \'23 (Round 1), organized by Coding Ninjas',
      icon: Icons.code_rounded,
    ),
    Achievement(
      title:
          'Participated in CodeVenture coding competition, demonstrating strong logical and problem-solving skills',
      icon: Icons.terminal_rounded,
    ),
  ];

  static final List<ContactLink> _contactLinks = [
    ContactLink(
      label: 'Email',
      value: _appLinks.email,
      icon: Icons.mail_rounded,
      url: _appLinks.mailto,
    ),
    const ContactLink(
      label: 'Phone',
      value: '+91 87883 79225',
      icon: Icons.phone_rounded,
      url: 'tel:+918788379225',
    ),
    ContactLink(
      label: 'LinkedIn',
      value: 'linkedin.com/in/aditya-khochikar',
      icon: Icons.business_center_rounded,
      url: _appLinks.linkedin,
    ),
    ContactLink(
      label: 'GitHub',
      value: 'github.com/Aditya-8788',
      icon: Icons.code_rounded,
      url: _appLinks.github,
    ),
    ContactLink(
      label: 'LeetCode',
      value: 'leetcode.com/u/Aditya_khochikar115',
      icon: Icons.terminal_rounded,
      url: _appLinks.leetcode,
    ),
    ContactLink(
      label: 'Location',
      value: _appLinks.location,
      icon: Icons.location_on_rounded,
    ),
  ];

  static const List<CertificateGalleryItem> _certificateGallery = [
    CertificateGalleryItem(
      imagePath: 'assets/images/certificates/php_mysql_training.jpg',
      title: 'PHP and MySQL Training',
      category: 'Course Completion',
    ),
    CertificateGalleryItem(
      imagePath: 'assets/images/certificates/nptel_dsa_java.jpg',
      title: 'Data Structures and Algorithms using Java (NPTEL)',
      category: 'Course Completion',
    ),
    CertificateGalleryItem(
      imagePath: 'assets/images/certificates/code_carnival_3rd_place.jpg',
      title: '3rd Place — Code Carnival (REFLEX 2K25)',
      category: 'Achievement',
    ),
    CertificateGalleryItem(
      imagePath: 'assets/images/certificates/techfest.jpg',
      title: 'Coding Competition — TECHFEST 2K24',
      category: 'Participation',
    ),
    CertificateGalleryItem(
      imagePath: 'assets/images/certificates/codeventure.jpg',
      title: 'CodeVenture Coding Competition',
      category: 'Participation',
    ),
    CertificateGalleryItem(
      imagePath:
          'assets/images/certificates/WhatsApp Image 2026-09-02 at 12.28.15 PM.jpeg',
      title: 'Volunteer — CODEHUNT 2K25, Programming Club',
      category: 'Volunteering',
    ),
  ];

  AppLinks get appLinks => _appLinks;
  SummaryInfo get summary => _summary;
  List<EducationItem> get educationItems => _educationItems;
  List<ExperienceItem> get experienceItems => _experienceItems;
  List<TopSkill> get topSkills => _topSkills;
  List<SkillCategory> get skillCategories => _skillCategories;
  List<Project> get projects => _projects;
  List<Certification> get certifications => _certifications;
  List<Achievement> get achievements => _achievements;
  List<ContactLink> get contactLinks => _contactLinks;
  List<CertificateGalleryItem> get certificateGallery => _certificateGallery;
}
