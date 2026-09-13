import '../entities/contact_link.dart';
import '../repositories/portfolio_repository.dart';

class GetContactLinks {
  const GetContactLinks(this.repository);

  final PortfolioRepository repository;

  List<ContactLink> call() => repository.getContactLinks();
}