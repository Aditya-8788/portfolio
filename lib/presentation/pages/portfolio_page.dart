import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/anchors.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/usecases/get_achievements.dart';
import '../../domain/usecases/get_app_links.dart';
import '../../domain/usecases/get_certificate_gallery.dart';
import '../../domain/usecases/get_certifications.dart';
import '../../domain/usecases/get_contact_links.dart';
import '../../domain/usecases/get_education.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_skill_categories.dart';
import '../../domain/usecases/get_top_skills.dart';
import '../bloc/bloc.dart';
import '../scroll_util.dart';
import '../sections/certifications_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/footer.dart';
import '../sections/hero_section.dart';
import '../sections/navbar.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../theme/app_theme.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.repository});

  final PortfolioRepository repository;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final Anchors _anchors = Anchors();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavigate(String id) {
    scrollToAnchor(_anchors, id, _scrollController);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final repository = widget.repository;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(
          create: (_) => HeroBloc(getAppLinks: GetAppLinks(repository)),
        ),
        BlocProvider(
          create: (_) => SkillsBloc(
            getSkillCategories: GetSkillCategories(repository),
            getTopSkills: GetTopSkills(repository),
          ),
        ),
        BlocProvider(
          create: (_) => ProjectsBloc(getProjects: GetProjects(repository)),
        ),
        BlocProvider(
          create: (_) =>
              EducationBloc(getEducation: GetEducation(repository)),
        ),
        BlocProvider(
          create: (_) => CertificationsBloc(
            getCertifications: GetCertifications(repository),
            getAchievements: GetAchievements(repository),
            getCertificateGallery: GetCertificateGallery(repository),
          ),
        ),
        BlocProvider(
          create: (_) =>
              ContactBloc(getContactLinks: GetContactLinks(repository)),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            // Main scrolling content.
            SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  HeroSection(anchors: _anchors, controller: _scrollController),
                  EducationSection(controller: _scrollController),
                  SkillsSection(
                      anchors: _anchors, controller: _scrollController),
                  ProjectsSection(
                      anchors: _anchors, controller: _scrollController),
                  CertificationsSection(
                      anchors: _anchors, controller: _scrollController),
                  ContactSection(
                      anchors: _anchors, controller: _scrollController),
                  Footer(scrollToTop: _scrollToTop),
                ],
              ),
            ),
            // Sticky navbar overlay.
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavBar(
                controller: _scrollController,
                anchors: _anchors,
                onNavigate: _onNavigate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}