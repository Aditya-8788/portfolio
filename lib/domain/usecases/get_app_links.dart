import '../entities/app_links.dart';
import '../repositories/portfolio_repository.dart';

class GetAppLinks {
  const GetAppLinks(this.repository);

  final PortfolioRepository repository;

  AppLinks call() => repository.getAppLinks();
}