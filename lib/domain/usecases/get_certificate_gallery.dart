import '../entities/certificate_gallery_item.dart';
import '../repositories/portfolio_repository.dart';

class GetCertificateGallery {
  const GetCertificateGallery(this.repository);

  final PortfolioRepository repository;

  List<CertificateGalleryItem> call() => repository.getCertificateGallery();
}