import '../entities/summary_info.dart';
import '../repositories/portfolio_repository.dart';

class GetSummary {
  const GetSummary(this.repository);

  final PortfolioRepository repository;

  SummaryInfo call() => repository.getSummary();
}
