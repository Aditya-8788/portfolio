import 'package:equatable/equatable.dart';

import '../../../domain/entities/achievement.dart';
import '../../../domain/entities/certificate_gallery_item.dart';
import '../../../domain/entities/certification.dart';

class CertificationsState extends Equatable {
  const CertificationsState({
    this.certifications = const [],
    this.achievements = const [],
    this.certificateGallery = const [],
  });

  final List<Certification> certifications;
  final List<Achievement> achievements;
  final List<CertificateGalleryItem> certificateGallery;

  @override
  List<Object?> get props =>
      [certifications, achievements, certificateGallery];
}