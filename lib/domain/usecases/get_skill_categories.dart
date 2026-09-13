import '../entities/skill.dart';
import '../repositories/portfolio_repository.dart';

class GetSkillCategories {
  const GetSkillCategories(this.repository);

  final PortfolioRepository repository;

  List<SkillCategory> call() => repository.getSkillCategories();
}