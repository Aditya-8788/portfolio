import '../../domain/entities/achievement.dart';
import '../../domain/entities/app_links.dart';
import '../../domain/entities/certificate_gallery_item.dart';
import '../../domain/entities/certification.dart';
import '../../domain/entities/contact_link.dart';
import '../../domain/entities/education_item.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/top_skill.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

/// Bridges the [PortfolioLocalDataSource] to the domain [PortfolioRepository].
class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl({
    this.dataSource = const PortfolioLocalDataSource(),
  });

  final PortfolioLocalDataSource dataSource;

  @override
  AppLinks getAppLinks() => dataSource.appLinks;

  @override
  List<EducationItem> getEducation() => dataSource.educationItems;

  @override
  List<SkillCategory> getSkillCategories() => dataSource.skillCategories;

  @override
  List<TopSkill> getTopSkills() => dataSource.topSkills;

  @override
  List<Project> getProjects() => dataSource.projects;

  @override
  List<Certification> getCertifications() => dataSource.certifications;

  @override
  List<Achievement> getAchievements() => dataSource.achievements;

  @override
  List<CertificateGalleryItem> getCertificateGallery() =>
      dataSource.certificateGallery;

  @override
  List<ContactLink> getContactLinks() => dataSource.contactLinks;
}