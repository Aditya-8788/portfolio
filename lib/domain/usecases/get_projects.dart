import '../entities/project.dart';
import '../repositories/portfolio_repository.dart';

class GetProjects {
  const GetProjects(this.repository);

  final PortfolioRepository repository;

  List<Project> call() => repository.getProjects();
}