import '../entities/achievement.dart';
import '../repositories/portfolio_repository.dart';

class GetAchievements {
  const GetAchievements(this.repository);

  final PortfolioRepository repository;

  List<Achievement> call() => repository.getAchievements();
}