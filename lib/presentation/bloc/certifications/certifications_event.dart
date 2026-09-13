import 'package:equatable/equatable.dart';

sealed class CertificationsEvent extends Equatable {
  const CertificationsEvent();

  @override
  List<Object?> get props => [];
}

/// Fired to (re)load certifications, achievements and the certificate gallery.
final class LoadCertifications extends CertificationsEvent {
  const LoadCertifications();
}