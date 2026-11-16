import '../entities/experience_item.dart';
import '../repositories/portfolio_repository.dart';

class GetExperience {
  const GetExperience(this.repository);

  final PortfolioRepository repository;

  List<ExperienceItem> call() => repository.getExperience();
}
