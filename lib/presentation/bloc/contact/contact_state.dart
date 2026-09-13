import 'package:equatable/equatable.dart';

import '../../../domain/entities/contact_link.dart';

class ContactState extends Equatable {
  const ContactState({
    this.contactLinks = const [],
    this.submitting = false,
    this.submitted = false,
  });

  final List<ContactLink> contactLinks;
  final bool submitting;
  final bool submitted;

  ContactState copyWith({
    List<ContactLink>? contactLinks,
    bool? submitting,
    bool? submitted,
  }) {
    return ContactState(
      contactLinks: contactLinks ?? this.contactLinks,
      submitting: submitting ?? this.submitting,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  List<Object?> get props => [contactLinks, submitting, submitted];
}