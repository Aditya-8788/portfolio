import '../entities/achievement.dart';
import '../entities/app_links.dart';
import '../entities/certificate_gallery_item.dart';
import '../entities/certification.dart';
import '../entities/contact_link.dart';
import '../entities/education_item.dart';
import '../entities/experience_item.dart';
import '../entities/project.dart';
import '../entities/skill.dart';
import '../entities/summary_info.dart';
import '../entities/top_skill.dart';

/// Contract for every data source that provides portfolio content.
abstract interface class PortfolioRepository {
  SummaryInfo getSummary();
  List<EducationItem> getEducation();
  List<ExperienceItem> getExperience();
  List<SkillCategory> getSkillCategories();
  List<TopSkill> getTopSkills();
  List<Project> getProjects();
  List<Certification> getCertifications();
  List<Achievement> getAchievements();
  List<CertificateGalleryItem> getCertificateGallery();
  List<ContactLink> getContactLinks();
  AppLinks getAppLinks();
}
