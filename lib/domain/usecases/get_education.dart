import '../entities/education_item.dart';
import '../repositories/portfolio_repository.dart';

class GetEducation {
  const GetEducation(this.repository);

  final PortfolioRepository repository;

  List<EducationItem> call() => repository.getEducation();
}