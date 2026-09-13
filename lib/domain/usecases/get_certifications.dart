import '../entities/certification.dart';
import '../repositories/portfolio_repository.dart';

class GetCertifications {
  const GetCertifications(this.repository);

  final PortfolioRepository repository;

  List<Certification> call() => repository.getCertifications();
}