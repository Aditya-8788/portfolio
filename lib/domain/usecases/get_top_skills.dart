import '../entities/top_skill.dart';
import '../repositories/portfolio_repository.dart';

class GetTopSkills {
  const GetTopSkills(this.repository);

  final PortfolioRepository repository;

  List<TopSkill> call() => repository.getTopSkills();
}