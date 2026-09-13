import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_achievements.dart';
import '../../../domain/usecases/get_certificate_gallery.dart';
import '../../../domain/usecases/get_certifications.dart';
import 'certifications_event.dart';
import 'certifications_state.dart';

class CertificationsBloc extends Bloc<CertificationsEvent, CertificationsState> {
  CertificationsBloc({
    required GetCertifications getCertifications,
    required GetAchievements getAchievements,
    required GetCertificateGallery getCertificateGallery,
  }) : super(CertificationsState(
          certifications: getCertifications(),
          achievements: getAchievements(),
          certificateGallery: getCertificateGallery(),
        )) {
    on<LoadCertifications>((event, emit) {
      emit(CertificationsState(
        certifications: getCertifications(),
        achievements: getAchievements(),
        certificateGallery: getCertificateGallery(),
      ));
    });
  }
}